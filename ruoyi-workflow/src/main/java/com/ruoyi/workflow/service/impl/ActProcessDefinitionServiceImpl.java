package com.ruoyi.workflow.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.codec.Base64;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StreamUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.workflow.common.constant.FlowConstant;
import com.ruoyi.workflow.domain.ActCategory;
import com.ruoyi.workflow.domain.bo.DefinitionBo;
import com.ruoyi.workflow.domain.vo.*;
import com.ruoyi.workflow.mapper.ActProcessDefinitionMapper;
import com.ruoyi.workflow.service.*;
import com.ruoyi.workflow.utils.ProcessRunningPathUtils;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.flowable.bpmn.model.*;
import org.flowable.bpmn.model.Process;
import org.flowable.engine.HistoryService;
import org.flowable.engine.ProcessMigrationService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.repository.ProcessDefinitionQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;
import java.util.zip.ZipInputStream;


/**
 * @description: 流程定义服务层
 * @author: gssong
 * @date: 2021/10/07 11:14
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class ActProcessDefinitionServiceImpl implements IActProcessDefinitionService {

    private final IActNodeAssigneeService iActNodeAssigneeService;

    private final ActProcessDefinitionMapper processDefinitionMapper;

    private final IActProcessDefSettingService iActProcessDefSettingService;

    private final IActCategoryService iActCategoryService;

    private final IActGatewayConditionRelateService iActGatewayConditionRelateService;

    private final IActGatewayConditionService iActGatewayConditionService;

    private final IActVariableConditionService iActVariableConditionService;

    @Qualifier("threadPoolTaskExecutor")
    private final ThreadPoolTaskExecutor threadPoolTaskExecutor;

    private final RepositoryService repositoryService;

    private final ProcessMigrationService processMigrationService;

    private final HistoryService historyService;

    /**
     * @description: 查询流程定义列表
     * @param: definitionBo
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.ProcessDefinitionVo>
     * @author: gssong
     * @date: 2021/10/7
     */
    @Override
    public TableDataInfo<ProcessDefinitionVo> getByPage(DefinitionBo definitionBo) {
        ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
        if (StringUtils.isNotEmpty(definitionBo.getKey())) {
            query.processDefinitionKeyLike("%" + definitionBo.getKey() + "%");
        }
        if (StringUtils.isNotEmpty(definitionBo.getName())) {
            query.processDefinitionNameLike("%" + definitionBo.getName() + "%");
        }
        if (StringUtils.isNotEmpty(definitionBo.getCategoryCode())) {
            query.processDefinitionCategory(definitionBo.getCategoryCode());
        }
        // 分页查询
        List<ProcessDefinitionVo> processDefinitionVoList = new ArrayList<>();
        List<ProcessDefinition> definitionList = query.latestVersion().listPage(definitionBo.getPageNum(), definitionBo.getPageSize());
        List<String> deploymentIds = definitionList.stream().map(ProcessDefinition::getDeploymentId).collect(Collectors.toList());
        List<Deployment> deploymentList = repositoryService.createDeploymentQuery().deploymentIds(deploymentIds).list();
        List<ActProcessDefSettingVo> processDefSettingList = null;
        if (CollectionUtil.isNotEmpty(definitionList)) {
            List<String> defIds = definitionList.stream().map(ProcessDefinition::getId).collect(Collectors.toList());
            processDefSettingList = iActProcessDefSettingService.getProcessDefSettingByDefIds(defIds);
        }
        for (ProcessDefinition processDefinition : definitionList) {
            // 部署时间
            Deployment deployment = deploymentList.stream().filter(e -> e.getId().equals(processDefinition.getDeploymentId())).findFirst().orElse(null);
            ProcessDefinitionVo processDefinitionVo = BeanUtil.toBean(processDefinition, ProcessDefinitionVo.class);
            if (deployment != null && deployment.getDeploymentTime() != null) {
                processDefinitionVo.setDeploymentTime(deployment.getDeploymentTime());
            }
            // 流程定义设置
            if (CollectionUtil.isNotEmpty(processDefSettingList)) {
                StreamUtils.filter(processDefSettingList, e -> processDefinition.getId().equals(e.getProcessDefinitionId())).stream().findFirst().ifPresent(processDefinitionVo::setActProcessDefSettingVo);
            }
            processDefinitionVoList.add(processDefinitionVo);
        }
        // 总记录数
        long total = query.count();

        return new TableDataInfo<>(processDefinitionVoList, total);
    }

    /**
     * @description: 查询历史流程定义列表
     * @param: definitionBo
     * @return: java.util.List<com.ruoyi.workflow.domain.vo.ProcessDefinitionVo>
     * @author: gssong
     * @date: 2021/10/7
     */
    @Override
    public List<ProcessDefinitionVo> getHistByPage(DefinitionBo definitionBo) {
        ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
        if (StringUtils.isNotBlank(definitionBo.getKey())) {
            query.processDefinitionKey(definitionBo.getKey());
        }

        // 分页查询
        List<ProcessDefinitionVo> processDefinitionVoList = new ArrayList<>();
        List<ProcessDefinition> definitionList = query.list();
        for (ProcessDefinition processDefinition : definitionList) {
            if (!processDefinition.getId().equals(definitionBo.getId())) {
                // 部署时间
                Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(processDefinition.getDeploymentId()).singleResult();
                ProcessDefinitionVo processDefinitionVo = BeanUtil.toBean(processDefinition, ProcessDefinitionVo.class);
                processDefinitionVo.setDeploymentTime(deployment.getDeploymentTime());
                processDefinitionVoList.add(processDefinitionVo);
            }
        }
        return CollectionUtil.reverse(processDefinitionVoList);
    }

    /**
     * @description: 删除流程定义
     * @param: deploymentId
     * @param: definitionId
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/7
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteDeployment(String deploymentId, String definitionId, String definitionKey) {
        try {
            List<HistoricTaskInstance> taskInstanceList = historyService.createHistoricTaskInstanceQuery().processDefinitionId(definitionId).list();
            if (CollectionUtil.isNotEmpty(taskInstanceList)) {
                throw new ServiceException("当前流程定义已被使用不可删除！");
            }
            //删除流程定义
            repositoryService.deleteDeployment(deploymentId);
            //删除流程节点设置人员
            iActNodeAssigneeService.delByDefinitionId(definitionId);
            //删除流程定义设置
            iActProcessDefSettingService.deleteByDefinitionIds(Collections.singletonList(definitionId));
            //删除网关条件关联关系
            iActGatewayConditionRelateService.deleteByProcessDefinitionId(definitionId);
            //删除网关条件，变量等
            List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().processDefinitionKey(definitionKey).list();
            if (!CollUtil.isNotEmpty(list)) {
                iActGatewayConditionService.deleteByDefinitionKey(definitionKey);
                iActVariableConditionService.deleteByDefinitionKey(definitionKey);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 通过zip或xml部署流程定义
     * @param: file
     * @return: boolean
     * @author: gssong
     * @date: 2022/4/12 13:32
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deployByFile(MultipartFile file, String categoryCode) {
        try {
            ActCategory wfCategory = iActCategoryService.queryByCategoryCode(categoryCode);
            if (wfCategory == null) {
                throw new ServiceException("流程分类不存在");
            }
            // 文件名 = 流程名称-流程key
            String filename = file.getOriginalFilename();
            assert filename != null;
            String[] splitFilename = filename.substring(0, filename.lastIndexOf(".")).split("-");
            if (splitFilename.length < 2) {
                throw new ServiceException("流程分类不能为空(文件名 = 流程名称-流程key)");
            }
            //流程名称
            String processName = splitFilename[0];
            //流程key
            String processKey = splitFilename[1];
            // 文件后缀名
            String suffix = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
            InputStream inputStream = file.getInputStream();
            Deployment deployment;
            if (FlowConstant.ZIP.equals(suffix)) {
                // zip
                deployment = repositoryService.createDeployment()
                    .addZipInputStream(new ZipInputStream(inputStream)).name(processName).key(processKey).category(categoryCode).deploy();
            } else {
                // xml 或 bpmn
                deployment = repositoryService.createDeployment()
                    .addInputStream(filename, inputStream).name(processName).key(processKey).category(categoryCode).deploy();
            }
            // 更新分类
            ProcessDefinition definition = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).singleResult();
            repositoryService.setProcessDefinitionCategory(definition.getId(), categoryCode);

            return true;
        } catch (IOException e) {
            e.printStackTrace();
            throw new ServiceException("部署失败" + e.getMessage());
        }
    }

    /**
     * @description: 查看xml文件
     * @param: definitionId
     * @return: java.lang.String
     * @author: gssong
     * @date: 2022/5/3 19:34
     */
    @Override
    public String getXml(String definitionId) {
        StringBuilder xml = new StringBuilder();
        ProcessDefinition processDefinition = repositoryService.getProcessDefinition(definitionId);
        InputStream inputStream;
        try {
            inputStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), processDefinition.getResourceName());
            xml.append(IOUtils.toString(inputStream, String.valueOf(StandardCharsets.UTF_8)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return xml.toString();
    }

    /**
     * @description: 激活或者挂起流程定义
     * @param: data 参数
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/10
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateProcDefState(Map<String, Object> data) {
        try {
            String definitionId = data.get("definitionId").toString();
            String description = data.get("description").toString();
            //更新原因
            processDefinitionMapper.updateDescriptionById(definitionId, description);
            ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(definitionId).singleResult();
            //将当前为挂起状态更新为激活状态
            //参数说明：参数1：流程定义id,参数2：是否激活（true是否级联对应流程实例，激活了则对应流程实例都可以审批），
            //参数3：什么时候激活，如果为null则立即激活，如果为具体时间则到达此时间后激活
            if (processDefinition.isSuspended()) {
                repositoryService.activateProcessDefinitionById(definitionId, true, null);
            } else {
                repositoryService.suspendProcessDefinitionById(definitionId, true, null);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            log.error("操作失败：{}", e.getMessage());
            throw new ServiceException("操作失败");
        }
    }

    /**
     * @description: 迁移流程定义
     * @param: currentProcessDefinitionId 当前流程定义id
     * @param: fromProcessDefinitionId 需要迁移到的流程定义id
     * @return: boolean
     * @author: gssong
     * @date: 2022/8/22 13:11
     */
    @Override
    public boolean migrationProcessDefinition(String currentProcessDefinitionId, String fromProcessDefinitionId) {
        try {
            // 迁移验证
            boolean migrationValid = processMigrationService.createProcessInstanceMigrationBuilder().migrateToProcessDefinition(currentProcessDefinitionId).validateMigrationOfProcessInstances(fromProcessDefinitionId).isMigrationValid();
            if (!migrationValid) {
                throw new ServiceException("流程定义差异过大无法迁移，请修改流程图");
            }
            // 已结束的流程实例不会迁移
            processMigrationService.createProcessInstanceMigrationBuilder().migrateToProcessDefinition(currentProcessDefinitionId).migrateProcessInstances(fromProcessDefinitionId);
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
        return true;
    }

    /**
     * @description: 流程模拟执行
     * @param: definitionBo
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     * @author: gssong
     * @date: 2023/2/2 18:32
     */
    @Override
    public Map<String, Object> simulationExecution(DefinitionBo definitionBo) {
        if (!CollUtil.isEmpty(definitionBo.getVariables())) {
            for (VariableVo variable : definitionBo.getVariables()) {
                if (StringUtils.isBlank(variable.getKey()) || StringUtils.isBlank(variable.getValue())) {
                    throw new ServiceException("流程变量参数或变量值不能为空");
                }
            }
        }

        List<VariableVo> variableVoList = definitionBo.getVariables();
        Map<String, Object> variables = new HashMap<>();

        if (variableVoList != null) {
            boolean flag = false;
            Map<String, Object> objectMap = new HashMap<>();
            for (VariableVo vo : variableVoList) {
                if (vo.getKey().contains("entity.")) {
                    String key = StringUtils.substringAfterLast(vo.getKey(), "entity.");
                    objectMap.put(key, vo.getValue());
                    flag = true;
                } else {
                    variables.put(vo.getKey(), vo.getValue());
                }
            }
            if (flag) {
                variables.put("entity", objectMap);
            }
        }
        Map<String, Object> map = new HashMap<>();
        List<Map<String, Object>> taskList = new ArrayList<>();
        StringBuilder xml = new StringBuilder();
        String processDefinitionId = definitionBo.getId();
        //查询流程定义
        CompletableFuture<ProcessDefinition> processDefinitionFuture = CompletableFuture.supplyAsync(() -> {
            return repositoryService.getProcessDefinition(processDefinitionId);
        }, threadPoolTaskExecutor);
        //查询节点路径
        CompletableFuture<Void> processNodeListFuture = CompletableFuture.runAsync(() -> {
            List<ProcessNodePath> processNodeList = ProcessRunningPathUtils.getSimulationExecutionProcessNodeList(processDefinitionId, variables);
            for (ProcessNodePath processNodePath : processNodeList) {
                Map<String, Object> task = new HashMap<>();
                task.put("key", processNodePath.getNodeId());
                task.put("completed", true);
                taskList.add(task);
            }
            map.put("taskList", taskList);
        }, threadPoolTaskExecutor);
        //查询模型xml
        CompletableFuture<Void> xmlFuture = processDefinitionFuture.thenAccept(processDefinition -> {
            InputStream inputStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), processDefinition.getResourceName());
            try {
                xml.append(IOUtils.toString(inputStream, String.valueOf(StandardCharsets.UTF_8)));
            } catch (IOException e) {
                e.printStackTrace();
            }
            map.put("xml", xml.toString());
        });
        CompletableFuture.allOf(processDefinitionFuture, processNodeListFuture, xmlFuture).join();
        return map;
    }

    /**
     * @description: 获取流程变量
     * @param: processDefinitionId
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     * @author: gssong
     * @date: 2023/2/2 19:32
     */
    @Override
    public Map<String, Object> getProcessVariables(String processDefinitionId) {
        Map<String, Object> map = new HashMap<>();
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
        //网关变量
        List<ActVariableConditionVo> actVariableConditionVos = iActVariableConditionService.queryListByKey(processDefinition.getKey());
        //网关条件
        List<ActGatewayConditionRelateVo> conditionRelateVos = iActGatewayConditionRelateService.getInfoByProcessDefinitionId(processDefinitionId);
        Set<VariableVo> variableVos = new HashSet<>();
        Set<VariableVo> variable = new HashSet<>();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
        List<Process> processes = bpmnModel.getProcesses();
        Collection<FlowElement> elements = processes.get(0).getFlowElements();
        List<ActGatewayConditionVo> actGatewayConditionVoList = new ArrayList<>();
        for (FlowElement element : elements) {
            if (element instanceof SequenceFlow) {
                String conditionExpression = ((SequenceFlow) element).getConditionExpression();
                if (StringUtils.isNotBlank(conditionExpression)) {
                    if (conditionExpression.contains("conditionVerify.verifyExpression")) {
                        conditionRelateVos.stream().filter(e -> e.getProcessDefinitionId().equals(processDefinitionId) && e.getSequenceId().equals(element.getId())).findFirst().ifPresent(actGatewayConditionRelateVo -> actGatewayConditionVoList.add(actGatewayConditionRelateVo.getActGatewayConditionVo()));
                    } else {
                        VariableVo variableVo = new VariableVo();
                        variableVo.setKey(conditionExpression);
                        variableVo.setValue(StringUtils.isNotBlank(element.getName()) ? element.getName() : "");
                        variableVos.add(variableVo);
                    }
                }
            }
            if (element instanceof SubProcess) {
                Collection<FlowElement> subFlowElements = ((SubProcess) element).getFlowElements();
                for (FlowElement subElement : subFlowElements) {
                    if (subElement instanceof SequenceFlow) {
                        String conditionExpression = ((SequenceFlow) subElement).getConditionExpression();
                        if (StringUtils.isNotBlank(conditionExpression)) {
                            if (conditionExpression.contains("conditionVerify.verifyExpression")) {
                                conditionRelateVos.stream().filter(e -> e.getProcessDefinitionId().equals(processDefinitionId) && e.getSequenceId().equals(subElement.getId())).findFirst().ifPresent(actGatewayConditionRelateVo -> actGatewayConditionVoList.add(actGatewayConditionRelateVo.getActGatewayConditionVo()));
                            } else {
                                VariableVo variableVo = new VariableVo();
                                variableVo.setKey(conditionExpression);
                                variableVo.setValue(StringUtils.isNotBlank(subElement.getName()) ? subElement.getName() : "");
                                variableVos.add(variableVo);
                            }
                        }
                    }
                }
            }
        }
        if (CollUtil.isNotEmpty(actGatewayConditionVoList)) {
            for (ActGatewayConditionVo actGatewayConditionVo : actGatewayConditionVoList) {
                List<ActGatewayConditionVo.ConditionList> gatewayConditionList = actGatewayConditionVo.getGatewayConditionList();
                for (ActGatewayConditionVo.ConditionList conditionList : gatewayConditionList) {
                    List<ActGatewayConditionVo.RuleList> ruleList = conditionList.getRuleList();
                    for (ActGatewayConditionVo.RuleList rule : ruleList) {
                        actVariableConditionVos.stream().filter(e -> e.getVariable().equals(rule.getVariable())).findFirst().ifPresent(e -> {
                            VariableVo variableVo = new VariableVo();
                            variableVo.setKey(e.getVariable());
                            variableVo.setValue(e.getVariableName());
                            variable.add(variableVo);
                            variableVos.add(variableVo);
                        });
                    }
                }
            }
        }
        map.put("variableVos", variableVos);
        map.put("variable", variable);
        return map;
    }

    /**
     * @description: 查看流程定义图片
     * @param: processDefinitionId 流程定义id
     * @return: java.lang.String
     * @author: gssong
     * @date: 2023/8/13 11:54
     */
    @SneakyThrows
    @Override
    public String processDefinitionImage(String processDefinitionId) {
        InputStream inputStream = repositoryService.getProcessDiagram(processDefinitionId);
        return Base64.encode(IOUtils.toByteArray(inputStream));
    }
}

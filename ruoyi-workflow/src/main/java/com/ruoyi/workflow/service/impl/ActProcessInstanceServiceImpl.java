package com.ruoyi.workflow.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.BeanCopyUtils;
import com.ruoyi.common.utils.StreamUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.workflow.common.enums.TaskStatusEnum;
import com.ruoyi.workflow.domain.ActNodeAssignee;
import com.ruoyi.workflow.domain.bo.*;
import com.ruoyi.workflow.domain.vo.*;
import com.ruoyi.workflow.flowable.config.CustomDefaultProcessDiagramGenerator;
import com.ruoyi.workflow.common.constant.FlowConstant;
import com.ruoyi.workflow.common.enums.BusinessStatusEnum;
import com.ruoyi.workflow.domain.ActBusinessStatus;
import com.ruoyi.workflow.domain.ActTaskNode;
import com.ruoyi.workflow.listener.AbstractExecuteProcessHandler;
import com.ruoyi.workflow.service.*;
import com.ruoyi.workflow.utils.ProcessRunningPathUtils;
import com.ruoyi.workflow.utils.WorkflowUtils;
import liquibase.pro.packaged.S;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.history.HistoricProcessInstanceQuery;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.runtime.ProcessInstanceQuery;
import org.flowable.engine.task.Attachment;
import org.flowable.engine.task.Comment;
import org.flowable.identitylink.api.history.HistoricIdentityLink;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @description: 流程实例业务层
 * @author: gssong
 * @date: 2021/10/10 18:38
 */
@Service
@RequiredArgsConstructor
public class ActProcessInstanceServiceImpl implements IActProcessInstanceService {

    private final IActBusinessStatusService iActBusinessStatusService;
    private final IWorkflowUserService iWorkflowUserService;
    private final IActTaskNodeService iActTaskNodeService;
    private final IActNodeAssigneeService iActNodeAssigneeService;
    private final IActBusinessRuleService iActBusinessRuleService;
    private final IActProcessDefSettingService iActProcessDefSettingService;
    private final RuntimeService runtimeService;
    private final HistoryService historyService;
    private final TaskService taskService;
    private final RepositoryService repositoryService;

    @Value("${flowable.activity-font-name}")
    private String activityFontName;

    @Value("${flowable.label-font-name}")
    private String labelFontName;

    @Value("${flowable.annotation-font-name}")
    private String annotationFontName;

    /**
     * @description: 提交申请，启动流程实例
     * @param: startProcessBo
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     * @author: gssong
     * @date: 2021/10/10
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> startWorkFlow(StartProcessBo startProcessBo) {
        Map<String, Object> map = new HashMap<>(16);
        if (StringUtils.isBlank(startProcessBo.getBusinessKey())) {
            throw new ServiceException("启动工作流时必须包含业务ID");
        }
        // 判断当前业务是否启动过流程
        List<HistoricProcessInstance> instanceList = historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey(startProcessBo.getBusinessKey()).list();
        TaskQuery taskQuery = taskService.createTaskQuery();
        List<Task> taskResult = taskQuery.processInstanceBusinessKey(startProcessBo.getBusinessKey()).list();
        if (CollUtil.isNotEmpty(instanceList)) {
            ActBusinessStatus info = iActBusinessStatusService.getInfoByBusinessKey(startProcessBo.getBusinessKey());
            if (ObjectUtil.isNotEmpty(info)) {
                BusinessStatusEnum.checkStartStatus(info.getStatus());
            }
            map.put("processInstanceId", taskResult.get(0).getProcessInstanceId());
            map.put("taskId", taskResult.get(0).getId());
            return map;
        }
        // 设置启动人
        Authentication.setAuthenticatedUserId(String.valueOf(LoginHelper.getUserId()));
        // 启动流程实例（提交申请）
        Map<String, Object> variables = startProcessBo.getVariables();
        // 启动跳过表达式
        variables.put("_FLOWABLE_SKIP_EXPRESSION_ENABLED", true);
        ProcessInstance pi;
        if (CollUtil.isNotEmpty(variables)) {
            pi = runtimeService.startProcessInstanceByKey(startProcessBo.getProcessKey(), startProcessBo.getBusinessKey(), variables);
        } else {
            pi = runtimeService.startProcessInstanceByKey(startProcessBo.getProcessKey(), startProcessBo.getBusinessKey());
        }
        // 将流程定义名称 作为 流程实例名称
        runtimeService.setProcessInstanceName(pi.getProcessInstanceId(), pi.getProcessDefinitionName());
        // 申请人执行流程
        List<Task> taskList = taskService.createTaskQuery().processInstanceId(pi.getId()).list();
        if (taskList.size() > 1) {
            throw new ServiceException("请检查流程第一个环节是否为申请人！");
        }
        taskService.setAssignee(taskList.get(0).getId(), String.valueOf(LoginHelper.getUserId()));
        taskService.setVariable(taskList.get(0).getId(), "processInstanceId", pi.getProcessInstanceId());
        // 更新业务状态
        iActBusinessStatusService.updateState(startProcessBo.getBusinessKey(), BusinessStatusEnum.DRAFT, taskList.get(0).getProcessInstanceId(), startProcessBo.getTableName());

        map.put("processInstanceId", pi.getProcessInstanceId());
        map.put("taskId", taskList.get(0).getId());
        return map;
    }

    /**
     * @description: 通过流程实例id查询流程审批记录
     * @param: processInstanceId
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     * @author: gssong
     * @date: 2021/10/16
     */
    @Override
    public Map<String, Object> getHistoryInfoList(String processInstanceId) {
        Map<String, Object> map = new HashMap<>();
        //查询任务办理记录
        List<HistoricTaskInstance> list = historyService.createHistoricTaskInstanceQuery().processInstanceId(processInstanceId).orderByHistoricTaskInstanceEndTime().desc().list();
        list = StreamUtils.sorted(list, Comparator.comparing(HistoricTaskInstance::getEndTime, Comparator.nullsFirst(Date::compareTo)).reversed());
        list = StreamUtils.filter(list, e -> StringUtils.isBlank(e.getParentTaskId()));
        List<ActHistoryInfoVo> actHistoryInfoVoList = new ArrayList<>();
        List<Comment> processInstanceComments = taskService.getProcessInstanceComments(processInstanceId);
        for (HistoricTaskInstance historicTaskInstance : list) {
            ActHistoryInfoVo actHistoryInfoVo = new ActHistoryInfoVo();
            BeanUtils.copyProperties(historicTaskInstance, actHistoryInfoVo);
            if (actHistoryInfoVo.getEndTime() == null) {
                actHistoryInfoVo.setStatus(TaskStatusEnum.WAITING.getStatus());
                actHistoryInfoVo.setStatusName(TaskStatusEnum.WAITING.getDesc());
            }
            if (CollUtil.isNotEmpty(processInstanceComments)) {
                processInstanceComments.stream().filter(e -> e.getTaskId().equals(historicTaskInstance.getId())).findFirst().ifPresent(e -> {
                    actHistoryInfoVo.setCommentId(e.getId());
                    actHistoryInfoVo.setComment(e.getFullMessage());
                    actHistoryInfoVo.setStatus(e.getType());
                    actHistoryInfoVo.setStatusName(TaskStatusEnum.getEnumsByStatus(e.getType()));
                });
            }
            List<Attachment> taskAttachments = taskService.getTaskAttachments(historicTaskInstance.getId());
            actHistoryInfoVo.setFileList(taskAttachments);
            if (ObjectUtil.isNotEmpty(historicTaskInstance.getDurationInMillis())) {
                actHistoryInfoVo.setRunDuration(getDuration(historicTaskInstance.getDurationInMillis()));
            }
            actHistoryInfoVoList.add(actHistoryInfoVo);
        }
        //翻译人员名称
        if (CollUtil.isNotEmpty(actHistoryInfoVoList)) {
            List<Long> assigneeList = actHistoryInfoVoList.stream().filter(e -> StringUtils.isNotBlank(e.getAssignee())).map(e -> Long.valueOf(e.getAssignee())).collect(Collectors.toList());
            if (CollUtil.isNotEmpty(assigneeList)) {
                List<SysUser> sysUsers = iWorkflowUserService.selectListUserByIds(assigneeList);
                actHistoryInfoVoList.forEach(e -> {
                    sysUsers.stream().filter(u -> u.getUserId().toString().equals(e.getAssignee())).findFirst().ifPresent(u -> {
                        e.setNickName(u.getNickName());
                    });
                });
            }
        }
        List<ActHistoryInfoVo> collect = new ArrayList<>();
        //待办理
        List<ActHistoryInfoVo> waitingTask = actHistoryInfoVoList.stream().filter(e -> e.getEndTime() == null).collect(Collectors.toList());
        //已办理
        List<ActHistoryInfoVo> finishTask = actHistoryInfoVoList.stream().filter(e -> e.getEndTime() != null).collect(Collectors.toList());
        collect.addAll(waitingTask);
        collect.addAll(finishTask);
        List<ActHistoryInfoVo> actHistoryInfoVos = collect.stream().filter(e -> StringUtils.isBlank(e.getAssignee())).collect(Collectors.toList());
        for (ActHistoryInfoVo vo : actHistoryInfoVos) {
            List<HistoricIdentityLink> linkList = WorkflowUtils.getCurrentTaskApprover(vo.getId());
            if (CollUtil.isNotEmpty(linkList)) {
                List<Long> userIds = linkList.stream().map(e -> Long.valueOf(e.getUserId())).collect(Collectors.toList());
                List<SysUser> sysUsers = iWorkflowUserService.selectListUserByIds(userIds);
                vo.setNickName(sysUsers.stream().map(SysUser::getNickName).collect(Collectors.joining(",")));
            }

        }
        //可驳回节点
        List<ActTaskNode> actTaskNodeList = iActTaskNodeService.getListByInstanceId(processInstanceId);
        map.put("historyRecordList", collect);
        map.put("actTaskNodeList", actTaskNodeList);
        return map;
    }

    /**
     * @description: 通过流程实例id获取历史流程图
     * @param: processInstId
     * @param: response
     * @return: void
     * @author: gssong
     * @date: 2021/10/16
     */
    @Override
    public void getHistoryProcessImage(String processInstanceId, HttpServletResponse response) {
        // 设置页面不缓存
        response.setHeader("Pragma", "no-cache");
        response.addHeader("Cache-Control", "must-revalidate");
        response.addHeader("Cache-Control", "no-cache");
        response.addHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
        InputStream inputStream = null;
        try {
            String processDefinitionId;
            // 获取当前的流程实例
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
            // 如果流程已经结束，则得到结束节点
            if (Objects.isNull(processInstance)) {
                HistoricProcessInstance pi = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
                processDefinitionId = pi.getProcessDefinitionId();
            } else {
                // 根据流程实例ID获得当前处于活动状态的ActivityId合集
                ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
                processDefinitionId = pi.getProcessDefinitionId();
            }

            // 获得活动的节点
            List<HistoricActivityInstance> highLightedFlowList = historyService.createHistoricActivityInstanceQuery().processInstanceId(processInstanceId).orderByHistoricActivityInstanceStartTime().asc().list();

            List<String> highLightedFlows = new ArrayList<>();
            List<String> highLightedNodes = new ArrayList<>();
            //高亮
            for (HistoricActivityInstance tempActivity : highLightedFlowList) {
                if (FlowConstant.SEQUENCE_FLOW.equals(tempActivity.getActivityType())) {
                    //高亮线
                    highLightedFlows.add(tempActivity.getActivityId());
                } else {
                    //高亮节点
                    if (tempActivity.getEndTime() == null) {
                        highLightedNodes.add(Color.RED.toString() + tempActivity.getActivityId());
                    } else {
                        highLightedNodes.add(tempActivity.getActivityId());
                    }
                }
            }
            List<String> highLightedNodeList = new ArrayList<>();
            //运行中的节点
            List<String> redNodeCollect = highLightedNodes.stream().filter(e -> e.contains(Color.RED.toString())).collect(Collectors.toList());
            //排除与运行中相同的节点
            for (String nodeId : highLightedNodes) {
                if (!nodeId.contains(Color.RED.toString()) && !redNodeCollect.contains(Color.RED + nodeId)) {
                    highLightedNodeList.add(nodeId);
                }
            }
            highLightedNodeList.addAll(redNodeCollect);
            BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
            CustomDefaultProcessDiagramGenerator diagramGenerator = new CustomDefaultProcessDiagramGenerator();
            inputStream = diagramGenerator.generateDiagram(bpmnModel, "png", highLightedNodeList, highLightedFlows, activityFontName, labelFontName, annotationFontName, null, 1.0, true);
            // 响应相关图片
            response.setContentType("image/png");

            byte[] bytes = IOUtils.toByteArray(inputStream);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes);
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * @description: 查询正在运行的流程实例
     * @param: processInstRunningBo
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.ProcessInstRunningVo>
     * @author: gssong
     * @date: 2021/10/16
     */
    @Override
    public TableDataInfo<ProcessInstRunningVo> getProcessInstRunningByPage(ProcessInstRunningBo processInstRunningBo) {
        List<ProcessInstRunningVo> list = null;
        ProcessInstanceQuery query = runtimeService.createProcessInstanceQuery();
        if (StringUtils.isNotBlank(processInstRunningBo.getName())) {
            query.processInstanceNameLikeIgnoreCase("%" + processInstRunningBo.getName() + "%");
        }
        if (StringUtils.isNotBlank(processInstRunningBo.getStartUserName())) {
            SysUser sysUser = iWorkflowUserService.selectUserByNickName(processInstRunningBo.getStartUserName());
            if (sysUser != null) {
                query.startedBy(sysUser.getUserId().toString());
            } else {
                query.startedBy("");
            }
        }
        if (StringUtils.isNotBlank(processInstRunningBo.getBusinessKey())) {
            query.processInstanceBusinessKey(processInstRunningBo.getBusinessKey());
        }
        if (StringUtils.isNotBlank(processInstRunningBo.getCategory())) {
            query.processDefinitionCategory(processInstRunningBo.getCategory());
        }
        List<ProcessInstance> processInstances = query.listPage(processInstRunningBo.getPageNum(), processInstRunningBo.getPageSize());
        List<ProcessInstRunningVo> processInstRunningVoList = new ArrayList<>();
        long total = query.count();
        //任务办理人
        List<SysUser> sysUserList = null;
        //流程实例id
        List<String> processInstanceIds = null;
        //任务集合
        List<Task> taskList = null;
        if (CollUtil.isNotEmpty(processInstances)) {
            processInstanceIds = processInstances.stream().map(ProcessInstance::getProcessInstanceId).collect(Collectors.toList());
            taskList = taskService.createTaskQuery().processInstanceIdIn(processInstanceIds).list().stream().filter(e -> StringUtils.isBlank(e.getParentTaskId())).collect(Collectors.toList());
            if (CollUtil.isNotEmpty(taskList)) {
                List<Long> userIds = taskList.stream().filter(e -> StringUtils.isNotEmpty(e.getAssignee())).map(e -> Long.valueOf(e.getAssignee())).collect(Collectors.toList());
                if (CollUtil.isNotEmpty(userIds)) {
                    sysUserList = iWorkflowUserService.selectListUserByIds(userIds);
                }
            }
        }
        for (ProcessInstance pi : processInstances) {
            ProcessInstRunningVo processInstRunningVo = new ProcessInstRunningVo();
            BeanUtils.copyProperties(pi, processInstRunningVo);
            SysUser sysUser = iWorkflowUserService.selectUserById(Long.valueOf(pi.getStartUserId()));
            if (ObjectUtil.isNotEmpty(sysUser)) {
                processInstRunningVo.setStartUserNickName(sysUser.getNickName());
            }
            processInstRunningVo.setIsSuspended(pi.isSuspended() ? "挂起" : "激活");
            //办理人
            StringBuilder currentNickName = new StringBuilder();
            //办理人id
            StringBuilder currentUserId = new StringBuilder();
            //办理人名称
            assert taskList != null;
            for (Task task : taskList) {
                String[] nickName = {null};
                if (StringUtils.isNotBlank(task.getAssignee()) && sysUserList != null) {
                    sysUserList.stream().filter(e -> e.getUserId().toString().equals(task.getAssignee()) && task.getProcessInstanceId().equals(pi.getProcessInstanceId())).findFirst().ifPresent(e -> nickName[0] = e.getNickName());
                }
                currentNickName.append("【任务名(").append(task.getName()).append(")->办理人(").append(nickName[0]).append(")】").append(StringUtils.SEPARATOR);
                currentUserId.append(task.getAssignee()).append(StringUtils.SEPARATOR);
            }
            if (StringUtils.isNotBlank(currentUserId)) {
                processInstRunningVo.setCurrentNickName(currentNickName.substring(0, currentNickName.toString().length() - 1));
                processInstRunningVo.setCurrentUserId(currentUserId.substring(0, currentUserId.toString().length() - 1));
            }
            processInstRunningVoList.add(processInstRunningVo);
        }
        if (CollUtil.isNotEmpty(processInstRunningVoList) && processInstanceIds != null) {
            //设置流程状态
            List<ActBusinessStatus> businessStatusList = iActBusinessStatusService.getInfoByProcessInstIds(new ArrayList<>(processInstanceIds));
            processInstRunningVoList.forEach(e -> businessStatusList.stream().filter(t -> t.getProcessInstanceId().equals(e.getProcessInstanceId())).findFirst().ifPresent(e::setActBusinessStatus));
            //设置流程发起人
            List<Long> userIds = processInstRunningVoList.stream().map(e -> Long.valueOf(e.getStartUserId())).collect(Collectors.toList());
            List<SysUser> sysUsers = iWorkflowUserService.selectListUserByIds(userIds);
            if (CollUtil.isNotEmpty(sysUsers)) {
                processInstRunningVoList.forEach(e -> sysUsers.stream().filter(t -> t.getUserId().toString().equals(e.getStartUserId())).findFirst().ifPresent(t -> e.setStartUserNickName(t.getNickName())));
            }
            list = processInstRunningVoList.stream().sorted(Comparator.comparing(ProcessInstRunningVo::getStartTime).reversed()).collect(Collectors.toList());
        }
        return new TableDataInfo<>(list, total);
    }

    /**
     * @description: 挂起或激活流程实例
     * @param: data
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/16
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateProcInstState(Map<String, Object> data) {
        try {
            String processInstId = data.get("processInstId").toString();
            String reason = data.get("reason").toString();
            // 1. 查询指定流程实例的数据
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstId).singleResult();
            // 2. 判断当前流程实例的状态
            if (processInstance.isSuspended()) {
                // 如果是已挂起，则更新为激活状态
                runtimeService.activateProcessInstanceById(processInstId);
            } else {
                // 如果是已激活，则更新为挂起状态
                runtimeService.suspendProcessInstanceById(processInstId);
            }
            ActBusinessStatus businessStatus = iActBusinessStatusService.getInfoByBusinessKey(processInstance.getBusinessKey());
            if (ObjectUtil.isEmpty(businessStatus)) {
                throw new ServiceException("当前流程异常，未生成act_business_status对象");
            }
            businessStatus.setSuspendedReason(reason);
            return iActBusinessStatusService.updateById(businessStatus);
        } catch (ServiceException e) {
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 作废流程实例，不会删除历史记录
     * @param: processInvalidBo
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/16
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteRuntimeProcessInst(ProcessInvalidBo processInvalidBo) {
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInvalidBo.getProcessInstId()).singleResult();
        try {
            List<Task> list = taskService.createTaskQuery().processInstanceId(processInvalidBo.getProcessInstId()).list();
            List<Task> subTasks = list.stream().filter(e -> StringUtils.isNotBlank(e.getParentTaskId())).collect(Collectors.toList());
            if (CollUtil.isNotEmpty(subTasks)) {
                subTasks.forEach(e -> taskService.deleteTask(e.getId()));
            }
            String deleteReason = LoginHelper.getNickname() + "作废了当前申请！";
            if (StringUtils.isNotBlank(processInvalidBo.getDeleteReason())) {
                deleteReason = LoginHelper.getNickname() + "作废理由:" + processInvalidBo.getDeleteReason();
            }
            for (Task task : StreamUtils.filter(list, e -> StringUtils.isBlank(e.getParentTaskId()))) {
                taskService.addComment(task.getId(), task.getProcessInstanceId(), TaskStatusEnum.INVALID.getStatus(), deleteReason);
            }
            ActProcessDefSettingVo processDefSettingVo = iActProcessDefSettingService.getProcessDefSettingByDefId(list.get(0).getProcessDefinitionId());
            new AbstractExecuteProcessHandler() {
                @Override
                protected void executeHandler() {
                    String deleteReason = LoginHelper.getNickname() + "作废了当前申请！";
                    if (StringUtils.isNotBlank(processInvalidBo.getDeleteReason())) {
                        deleteReason = LoginHelper.getNickname() + "作废理由:" + processInvalidBo.getDeleteReason();
                    }
                    //1. 删除流程实例
                    runtimeService.deleteProcessInstance(processInvalidBo.getProcessInstId(), deleteReason);
                    ActBusinessStatus actBusinessStatus = iActBusinessStatusService.getInfoByBusinessKey(processInstance.getBusinessKey());
                    //2. 更新业务状态
                    iActBusinessStatusService.updateState(actBusinessStatus.getBusinessKey(), BusinessStatusEnum.INVALID, processInvalidBo.getProcessInstId());
                }
            }.execute(processDefSettingVo, processInvalidBo.getProcessInstId(), BusinessStatusEnum.INVALID.getStatus());
            return true;

        } catch (Exception e) {
            iActBusinessStatusService.deleteCacheByBusinessKey(processInstance.getBusinessKey());
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 运行中的实例 删除程实例，删除历史记录，删除业务与流程关联信息
     * @param: processInstId
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/16
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteRuntimeProcessAndHisInst(String processInstId) {
        try {
            //1.删除运行中流程实例
            List<Task> list = taskService.createTaskQuery().processInstanceId(processInstId).list();
            List<Task> subTasks = list.stream().filter(e -> StringUtils.isNotBlank(e.getParentTaskId())).collect(Collectors.toList());
            if (CollUtil.isNotEmpty(subTasks)) {
                subTasks.forEach(e -> taskService.deleteTask(e.getId()));
            }
            runtimeService.deleteProcessInstance(processInstId, LoginHelper.getUserId() + "删除了当前流程申请");
            //2.删除历史记录
            HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstId).singleResult();
            if (ObjectUtil.isNotEmpty(historicProcessInstance)) {
                historyService.deleteHistoricProcessInstance(processInstId);
            }
            //3.删除业务状态
            iActBusinessStatusService.deleteStateByBusinessKey(historicProcessInstance.getBusinessKey());
            iActBusinessStatusService.deleteCacheByBusinessKey(historicProcessInstance.getBusinessKey());
            //4.删除保存的任务节点
            return iActTaskNodeService.deleteByInstanceId(processInstId);
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 已完成的实例 删除程实例，删除历史记录，删除业务与流程关联信息
     * @param: processInstId
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/16
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteFinishProcessAndHisInst(String processInstId) {
        try {
            HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstId).singleResult();
            //1.删除历史记录
            historyService.deleteHistoricProcessInstance(processInstId);
            //2.删除业务状态
            iActBusinessStatusService.deleteStateByBusinessKey(historicProcessInstance.getBusinessKey());
            //3.删除保存的任务节点
            return iActTaskNodeService.deleteByInstanceId(processInstId);
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 查询已结束的流程实例
     * @param: req
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.ProcessInstFinishVo>
     * @author: gssong
     * @date: 2021/10/23
     */
    @Override
    public TableDataInfo<ProcessInstFinishVo> getProcessInstFinishByPage(ProcessInstFinishBo req) {
        HistoricProcessInstanceQuery query = historyService.createHistoricProcessInstanceQuery().finished()
            .orderByProcessInstanceEndTime().desc();
        if (StringUtils.isNotEmpty(req.getName())) {
            query.processInstanceNameLike("%" + req.getName() + "%");
        }
        if (StringUtils.isNotEmpty(req.getStartUserId())) {
            query.startedBy(req.getStartUserId());
        }
        if (StringUtils.isNotBlank(req.getBusinessKey())) {
            query.processInstanceBusinessKey(req.getBusinessKey());
        }
        if (StringUtils.isNotBlank(req.getCategory())) {
            query.processDefinitionCategory(req.getCategory());
        }
        List<HistoricProcessInstance> list = query.listPage(req.getPageNum(), req.getPageSize());
        long total = query.count();
        List<ProcessInstFinishVo> processInstFinishVoList = new ArrayList<>();
        for (HistoricProcessInstance hpi : list) {
            ProcessInstFinishVo processInstFinishVo = new ProcessInstFinishVo();
            BeanUtils.copyProperties(hpi, processInstFinishVo);
            SysUser sysUser = iWorkflowUserService.selectUserById(Long.valueOf(hpi.getStartUserId()));
            if (ObjectUtil.isNotEmpty(sysUser)) {
                processInstFinishVo.setStartUserNickName(sysUser.getNickName());
            }
            //业务状态
            ActBusinessStatus actBusinessStatus = iActBusinessStatusService.getInfoByBusinessKey(hpi.getBusinessKey());
            if (ObjectUtil.isNotNull(actBusinessStatus)) {
                processInstFinishVo.setStatus(Objects.requireNonNull(BusinessStatusEnum.getEnumsByStatus(actBusinessStatus.getStatus())).getDesc());
            }
            processInstFinishVoList.add(processInstFinishVo);
        }
        return new TableDataInfo<>(processInstFinishVoList, total);
    }

    /**
     * 获取流程实例id
     *
     * @param businessKey 业务id
     */
    @Override
    public String getProcessInstanceId(String businessKey) {
        String processInstanceId;
        ActBusinessStatus infoByBusinessKey = iActBusinessStatusService.getInfoByBusinessKey(businessKey);
        if (ObjectUtil.isNotEmpty(infoByBusinessKey) && (infoByBusinessKey.getStatus().equals(BusinessStatusEnum.FINISH.getStatus()) || infoByBusinessKey.getStatus().equals(BusinessStatusEnum.INVALID.getStatus()))) {
            HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();
            processInstanceId = ObjectUtil.isNotEmpty(historicProcessInstance) ? historicProcessInstance.getId() : StrUtil.EMPTY;
        } else {
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();
            processInstanceId = ObjectUtil.isNotEmpty(processInstance) ? processInstance.getProcessInstanceId() : StrUtil.EMPTY;
        }
        return processInstanceId;
    }

    /**
     * @description: 撤销申请
     * @param: processInstanceId
     * @return: boolean
     * @author: gssong
     * @date: 2022/1/21
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean cancelProcessApply(String processInstanceId) {

        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).startedBy(String.valueOf(LoginHelper.getUserId())).singleResult();
        if (ObjectUtil.isNull(processInstance)) {
            throw new ServiceException("流程不是该审批人提交,撤销失败!");
        }
        //校验流程状态
        ActBusinessStatus actBusinessStatus = iActBusinessStatusService.getInfoByBusinessKey(processInstance.getBusinessKey());
        if (ObjectUtil.isEmpty(actBusinessStatus)) {
            throw new ServiceException("流程异常");
        }
        BusinessStatusEnum.checkStatus(actBusinessStatus.getStatus());
        List<ActTaskNode> listActTaskNode = iActTaskNodeService.getListByInstanceId(processInstanceId);
        if (CollUtil.isEmpty(listActTaskNode)) {
            throw new ServiceException("未查询到撤回节点信息");
        }
        ActTaskNode actTaskNode = listActTaskNode.stream().filter(e -> e.getOrderNo() == 0).findFirst().orElse(null);
        if (ObjectUtil.isNull(actTaskNode)) {
            throw new ServiceException("未查询到撤回节点信息");
        }
        List<Task> taskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        for (Task task : taskList) {
            if (task.isSuspended()) {
                throw new ServiceException("【" + task.getName() + "】任务已被挂起");
            }
            taskService.addComment(task.getId(), processInstanceId, TaskStatusEnum.CANCEL.getStatus(), "申请人撤销申请");
        }
        try {
            ActProcessDefSettingVo processDefSettingVo = iActProcessDefSettingService.getProcessDefSettingByDefId(processInstance.getProcessDefinitionId());
            new AbstractExecuteProcessHandler() {
                @Override
                protected void executeHandler() {
                    runtimeService.createChangeActivityStateBuilder().processInstanceId(processInstanceId).moveActivityIdsToSingleActivityId(taskList.stream().map(Task::getTaskDefinitionKey).collect(Collectors.toList()), actTaskNode.getNodeId()).changeState();
                    List<Task> newTaskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
                    //处理并行会签环节重复节点
                    if (CollUtil.isNotEmpty(newTaskList)) {
                        List<Task> taskCollect = newTaskList.stream().filter(e -> e.getTaskDefinitionKey().equals(actTaskNode.getNodeId())).collect(Collectors.toList());
                        if (taskCollect.size() > 1) {
                            taskCollect.remove(0);
                            taskCollect.forEach(WorkflowUtils::deleteRuntimeTask);
                        }
                    }
                    List<Task> cancelTaskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
                    if (CollUtil.isNotEmpty(cancelTaskList)) {
                        for (Task task : cancelTaskList) {
                            taskService.setAssignee(task.getId(), String.valueOf(LoginHelper.getUserId()));
                        }
                        iActTaskNodeService.deleteByInstanceId(processInstanceId);
                    }
                    iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.CANCEL, processInstanceId);
                    SendMessage sendMessage = new SendMessage();
                    sendMessage.setTitle("单据撤销提醒");
                    sendMessage.setType(Collections.singletonList("1"));
                    sendMessage.setMessageContent("单据【" + processInstance.getName() + "】被申请人撤销。");
                    sendMessage(sendMessage, cancelTaskList, processInstance.getName());
                }
            }.execute(processDefSettingVo, processInstance.getProcessInstanceId(), BusinessStatusEnum.CANCEL.getStatus());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            iActBusinessStatusService.deleteCacheByBusinessKey(processInstance.getBusinessKey());
            throw new ServiceException("撤销失败:" + e.getMessage());
        }
    }

    /**
     * @description: 获取xml
     * @param: processInstanceId
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     * @author: gssong
     * @date: 2022/10/25 22:07
     */
    @Override
    public Map<String, Object> getXml(String processInstanceId) {
        Map<String, Object> map = new HashMap<>();
        List<Map<String, Object>> taskList = new ArrayList<>();
        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        StringBuilder xml = new StringBuilder();
        ProcessDefinition processDefinition = repositoryService.getProcessDefinition(historicProcessInstance.getProcessDefinitionId());
        // 获得活动的节点
        List<HistoricActivityInstance> highLightedFlowList = historyService.createHistoricActivityInstanceQuery().processInstanceId(processInstanceId).orderByHistoricActivityInstanceStartTime().asc().list();
        for (HistoricActivityInstance tempActivity : highLightedFlowList) {
            Map<String, Object> task = new HashMap<>();
            if (!FlowConstant.SEQUENCE_FLOW.equals(tempActivity.getActivityType()) &&
                !FlowConstant.PARALLEL_GATEWAY.equals(tempActivity.getActivityType()) &&
                !FlowConstant.EXCLUSIVE_GATEWAY.equals(tempActivity.getActivityType()) &&
                !FlowConstant.INCLUSIVE_GATEWAY.equals(tempActivity.getActivityType())
            ) {
                task.put("key", tempActivity.getActivityId());
                task.put("completed", tempActivity.getEndTime() != null);
                task.put("activityType", tempActivity.getActivityType());
                taskList.add(task);
            }
        }
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        if (processInstance != null) {
            taskList = taskList.stream().filter(e -> !e.get("activityType").equals(FlowConstant.END_EVENT)).collect(Collectors.toList());
        }
        //查询出运行中节点
        List<Map<String, Object>> runtimeNodeList = taskList.stream().filter(e -> !(Boolean) e.get("completed")).collect(Collectors.toList());
        if (CollUtil.isNotEmpty(runtimeNodeList)) {
            Iterator<Map<String, Object>> iterator = taskList.iterator();
            while (iterator.hasNext()) {
                Map<String, Object> next = iterator.next();
                runtimeNodeList.stream().filter(t -> t.get("key").equals(next.get("key")) && (Boolean) next.get("completed")).findFirst().ifPresent(t -> iterator.remove());
            }
        }
        map.put("taskList", taskList);
        List<ActHistoryInfoVo> historyList = getHistory(processInstanceId);
        map.put("historyList", historyList);
        InputStream inputStream;
        try {
            inputStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), processDefinition.getResourceName());
            xml.append(IOUtils.toString(inputStream, String.valueOf(StandardCharsets.UTF_8)));
            map.put("xml", xml.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 获取节点信息
     *
     * @param processInstanceId 流程实例id
     */
    private List<ActHistoryInfoVo> getHistory(String processInstanceId) {
        //查询任务办理记录
        List<HistoricTaskInstance> list = historyService.createHistoricTaskInstanceQuery().processInstanceId(processInstanceId).orderByHistoricTaskInstanceEndTime().desc().list();
        list = StreamUtils.sorted(list, Comparator.comparing(HistoricTaskInstance::getEndTime, Comparator.nullsFirst(Date::compareTo)).reversed());
        List<ActHistoryInfoVo> actHistoryInfoVoList = new ArrayList<>();
        for (HistoricTaskInstance historicTaskInstance : list) {
            ActHistoryInfoVo actHistoryInfoVo = new ActHistoryInfoVo();
            BeanUtils.copyProperties(historicTaskInstance, actHistoryInfoVo);
            actHistoryInfoVo.setStatus(actHistoryInfoVo.getEndTime() == null ? "待处理" : "已处理");
            if (ObjectUtil.isNotEmpty(historicTaskInstance.getDurationInMillis())) {
                actHistoryInfoVo.setRunDuration(getDuration(historicTaskInstance.getDurationInMillis()));
            }
            actHistoryInfoVoList.add(actHistoryInfoVo);
        }
        //翻译人员名称
        if (CollUtil.isNotEmpty(actHistoryInfoVoList)) {
            List<Long> assigneeList = actHistoryInfoVoList.stream().filter(e -> StringUtils.isNotBlank(e.getAssignee())).map(e -> Long.valueOf(e.getAssignee())).collect(Collectors.toList());
            if (CollUtil.isNotEmpty(assigneeList)) {
                List<SysUser> sysUsers = iWorkflowUserService.selectListUserByIds(assigneeList);
                actHistoryInfoVoList.forEach(e -> {
                    sysUsers.stream().filter(u -> u.getUserId().toString().equals(e.getAssignee())).findFirst().ifPresent(u -> {
                        e.setNickName(u.getNickName() + (ObjectUtil.isNotEmpty(u.getDept()) ? "(" + u.getDept().getDeptName() + ")" : ""));
                    });
                });
            }
        }
        List<ActHistoryInfoVo> historyInfoVoList = new ArrayList<>();
        Map<String, List<ActHistoryInfoVo>> groupByKey = StreamUtils.groupByKey(actHistoryInfoVoList, ActHistoryInfoVo::getTaskDefinitionKey);
        for (Map.Entry<String, List<ActHistoryInfoVo>> entry : groupByKey.entrySet()) {
            ActHistoryInfoVo historyInfoVo = new ActHistoryInfoVo();
            BeanCopyUtils.copy(entry.getValue().get(0), historyInfoVo);
            String nickName = entry.getValue().stream().filter(e -> StringUtils.isNotBlank(e.getNickName()) && e.getEndTime() == null).map(ActHistoryInfoVo::getNickName)
                .collect(Collectors.toList()).stream().distinct().collect(Collectors.joining(StringUtils.SEPARATOR));
            if (StringUtils.isNotBlank(nickName)) {
                historyInfoVo.setNickName(nickName);
            }
            actHistoryInfoVoList.stream().filter(e -> e.getTaskDefinitionKey().equals(entry.getKey()) && e.getEndTime() == null).findFirst()
                .ifPresent(e -> {
                    historyInfoVo.setStatus("待处理");
                    historyInfoVo.setStartTime(e.getStartTime());
                    historyInfoVo.setEndTime(null);
                    historyInfoVo.setRunDuration(null);
                });
            historyInfoVoList.add(historyInfoVo);
        }
        return historyInfoVoList;
    }

    /**
     * @description: 获取可执行流程节点
     * @param: processInstanceId
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     * @author: gssong
     * @date: 2022/12/4 18:02
     */
    @Override
    public Map<String, Object> getExecutableNode(String processInstanceId) {
        Map<String, Object> map = new HashMap<>();
        List<Map<String, Object>> taskList = new ArrayList<>();
        StringBuilder xml = new StringBuilder();
        HistoricProcessInstance processInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        ProcessDefinition processDefinition = repositoryService.getProcessDefinition(processInstance.getProcessDefinitionId());
        List<ProcessNodePath> processNodeList = ProcessRunningPathUtils.getProcessNodeList(processInstanceId);

        List<ActNodeAssignee> actNodeAssignees = iActNodeAssigneeService.getInfoByProcessDefinitionId(processDefinition.getId());

        for (ProcessNodePath processNodePath : processNodeList.stream().filter(e -> FlowConstant.USER_TASK.equals(e.getNodeType())).collect(Collectors.toList())) {
            Map<String, Object> task = new HashMap<>();
            task.put("key", processNodePath.getNodeId());
            task.put("completed", true);
            taskList.add(task);
        }
        List<Task> list = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        Map<String, Object> variables = runtimeService.getVariables(list.get(0).getExecutionId());
        List<ProcessNodePath> processNodePaths = new ArrayList<>();
        if (CollUtil.isNotEmpty(actNodeAssignees)) {
            for (ProcessNodePath processNodePath : processNodeList.stream().distinct().collect(Collectors.toList())) {
                actNodeAssignees.stream().filter(e -> e.getNodeId().equals(processNodePath.getNodeId())).findFirst()
                    .ifPresent(e -> {
                        ProcessNodePath node = new ProcessNodePath();
                        BeanCopyUtils.copy(e, node);
                        if (processNodePath.getFirst()) {
                            SysUser sysUser = iWorkflowUserService.selectUserById(Long.valueOf(processInstance.getStartUserId()));
                            node.setAssignee(sysUser.getNickName());
                            node.setAssigneeId(sysUser.getUserId().toString());
                            node.setChooseWay(FlowConstant.WORKFLOW_PERSON);
                            node.setTransactor(sysUser.getNickName());
                            node.setTransactorId(sysUser.getUserId().toString());
                        }
                        if (e.getIsShow()) {
                            node.setTransactor(StrUtil.EMPTY);
                            node.setTransactorId(StrUtil.EMPTY);
                        }
                        //人员选人
                        if (FlowConstant.WORKFLOW_PERSON.equals(e.getChooseWay()) && !processNodePath.getFirst()) {
                            if (e.getAssigneeId() == null) {
                                throw new ServiceException("【" + e.getNodeName() + "】节点人员不存在");
                            }
                            List<Long> userIdList = Arrays.stream(e.getAssigneeId().split(StringUtils.SEPARATOR)).map(Long::valueOf).collect(Collectors.toList());
                            List<SysUser> userList = iWorkflowUserService.selectListUserByIds(userIdList);
                            settingAssignee(node, userList, e.getIsShow());
                        }

                        //业务规则
                        if (FlowConstant.WORKFLOW_RULE.equals(e.getChooseWay()) && !processNodePath.getFirst()) {
                            node.setChooseWay(FlowConstant.WORKFLOW_PERSON);
                            ActBusinessRuleVo actBusinessRuleVo = iActBusinessRuleService.queryById(e.getBusinessRuleId());
                            if (actBusinessRuleVo == null) {
                                throw new ServiceException("【" + e.getNodeName() + "】节点规则不存在");
                            }
                            List<String> assignList = WorkflowUtils.ruleAssignList(actBusinessRuleVo, processNodePath.getNodeName(), variables);
                            List<Long> userIdList = assignList.stream().map(Long::valueOf).collect(Collectors.toList());
                            List<SysUser> userList = iWorkflowUserService.selectListUserByIds(userIdList);
                            settingAssignee(node, userList, e.getIsShow());
                        }
                        //角色选人或部门选人
                        if ((FlowConstant.WORKFLOW_ROLE.equals(e.getChooseWay()) || FlowConstant.WORKFLOW_DEPT.equals(e.getChooseWay())) && !processNodePath.getFirst()) {
                            node.setTransactor(StrUtil.EMPTY);
                            node.setTransactorId(StrUtil.EMPTY);
                            node.setChooseWay(FlowConstant.WORKFLOW_PERSON);
                            if (FlowConstant.WORKFLOW_ROLE.equals(e.getChooseWay())) {
                                List<Long> roleIds = Arrays.stream(e.getAssigneeId().split(StringUtils.SEPARATOR)).map(Long::valueOf).collect(Collectors.toList());
                                List<SysUser> userList = iWorkflowUserService.getUserListByRoleIds(roleIds);
                                settingAssignee(node, userList, e.getIsShow());
                            }
                            if (FlowConstant.WORKFLOW_DEPT.equals(e.getChooseWay())) {
                                List<Long> deptIds = Arrays.stream(e.getAssigneeId().split(StringUtils.SEPARATOR)).map(Long::valueOf).collect(Collectors.toList());
                                List<SysUser> userList = iWorkflowUserService.getUserListByDeptIds(deptIds);
                                settingAssignee(node, userList, e.getIsShow());
                            }
                        }
                        node.setDisabled(e.getIsShow());
                        processNodePaths.add(node);
                    });
            }
        }
        map.put("processNodeList", processNodePaths);
        map.put("taskList", taskList);
        InputStream inputStream;
        try {
            inputStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), processDefinition.getResourceName());
            xml.append(IOUtils.toString(inputStream, String.valueOf(StandardCharsets.UTF_8)));
            map.put("xml", xml.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * @description: 设置审批人员
     * @param: node 节点信息
     * @param: userList 人员信息
     * @param: isShow 是否弹窗
     * @return: void
     * @author: gssong
     * @date: 2023/1/9 23:49
     */
    private void settingAssignee(ProcessNodePath node, List<SysUser> userList, Boolean isShow) {
        if (CollUtil.isEmpty(userList)) {
            throw new ServiceException("【" + node.getNodeName() + "】环节审批人员不存在");
        }
        String userIds = userList.stream().map(u -> u.getUserId().toString()).collect(Collectors.joining(StringUtils.SEPARATOR));
        String nickNames = userList.stream().map(SysUser::getNickName).collect(Collectors.joining(StringUtils.SEPARATOR));
        node.setAssigneeId(userIds);
        node.setAssignee(nickNames);
        node.setTransactorId(StrUtil.EMPTY);
        node.setTransactor(StrUtil.EMPTY);
        if (!isShow) {
            node.setTransactorId(userIds);
            node.setTransactor(nickNames);
        }
    }

    /**
     * 任务完成时间处理
     *
     * @param time 时间
     */
    private String getDuration(long time) {

        long day = time / (24 * 60 * 60 * 1000);
        long hour = (time / (60 * 60 * 1000) - day * 24);
        long minute = ((time / (60 * 1000)) - day * 24 * 60 - hour * 60);
        long second = (time / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - minute * 60);

        if (day > 0) {
            return day + "天" + hour + "小时" + minute + "分钟";
        }
        if (hour > 0) {
            return hour + "小时" + minute + "分钟";
        }
        if (minute > 0) {
            return minute + "分钟";
        }
        if (second > 0) {
            return second + "秒";
        } else {
            return 0 + "秒";
        }
    }

    /**
     * 发送消息
     *
     * @param sendMessage 消息
     * @param taskList    任务
     * @param name        流程定义名称
     */
    @Async
    public void sendMessage(SendMessage sendMessage, List<Task> taskList, String name) {
        WorkflowUtils.sendMessage(sendMessage, taskList, name);
    }
}

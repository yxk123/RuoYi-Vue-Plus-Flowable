package com.ruoyi.workflow.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.workflow.common.constant.FlowConstant;
import com.ruoyi.workflow.common.enums.BusinessStatusEnum;
import com.ruoyi.workflow.common.enums.TaskStatusEnum;
import com.ruoyi.workflow.domain.ActBusinessStatus;
import com.ruoyi.workflow.domain.ActNodeAssignee;
import com.ruoyi.workflow.domain.ActTaskNode;
import com.ruoyi.workflow.domain.bo.*;
import com.ruoyi.workflow.domain.vo.*;
import com.ruoyi.workflow.flowable.cmd.*;
import com.ruoyi.workflow.listener.AbstractExecuteProcessHandler;
import com.ruoyi.workflow.listener.AbstractExecuteTaskHandler;
import com.ruoyi.workflow.mapper.ActTaskMapper;
import com.ruoyi.workflow.service.*;
import com.ruoyi.workflow.utils.CompleteTaskUtils;
import com.ruoyi.workflow.utils.WorkflowUtils;
import lombok.RequiredArgsConstructor;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowElement;
import org.flowable.engine.*;
import org.flowable.engine.impl.bpmn.behavior.ParallelMultiInstanceBehavior;
import org.flowable.engine.impl.bpmn.behavior.SequentialMultiInstanceBehavior;
import org.flowable.engine.impl.persistence.entity.ExecutionEntity;
import org.flowable.engine.impl.persistence.entity.ExecutionEntityImpl;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Attachment;
import org.flowable.identitylink.api.history.HistoricIdentityLink;
import org.flowable.task.api.Task;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;
import org.flowable.variable.api.persistence.entity.VariableInstance;
import org.springframework.beans.BeanUtils;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

import static com.ruoyi.common.helper.LoginHelper.getUserId;


/**
 * @description: 任务业务层
 * @author: gssong
 * @date: 2021/10/17 14:57
 */
@Service
@RequiredArgsConstructor
public class ActTaskServiceImpl implements IActTaskService {

    private final IWorkflowUserService iWorkflowUserService;

    private final IActBusinessStatusService iActBusinessStatusService;

    private final IActTaskNodeService iActTaskNodeService;

    private final IActNodeAssigneeService iActNodeAssigneeService;

    private final IActBusinessRuleService iActBusinessRuleService;

    private final ManagementService managementService;

    private final ActTaskMapper actTaskMapper;

    private final IActProcessDefSettingService iActProcessDefSettingService;

    private final IActProcessInstanceService iActProcessInstanceService;

    private final TaskService taskService;

    private final RuntimeService runtimeService;

    private final RepositoryService repositoryService;

    private final HistoryService historyService;

    /**
     * @description: 办理任务
     * @param: taskCompleteBo
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/21
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean completeTask(TaskCompleteBo taskCompleteBo) {
        // 1.查询任务
        Task task = taskService.createTaskQuery().taskId(taskCompleteBo.getTaskId()).taskAssignee(String.valueOf(LoginHelper.getUserId())).singleResult();

        if (ObjectUtil.isEmpty(task)) {
            throw new ServiceException(FlowConstant.MESSAGE_CURRENT_TASK_IS_NULL);
        }
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
        try {
            //办理委托任务
            if (ObjectUtil.isNotEmpty(task.getDelegationState()) && FlowConstant.PENDING.equals(task.getDelegationState().name())) {
                taskService.resolveTask(taskCompleteBo.getTaskId());
                TaskEntity newTask = WorkflowUtils.createNewTask(task, true);
                taskService.addComment(newTask.getId(), task.getProcessInstanceId(), TaskStatusEnum.PASS.getStatus(), taskCompleteBo.getMessage());
                taskService.complete(newTask.getId());
                return true;
            }
            //附件上传
            AttachmentCmd attachmentCmd = new AttachmentCmd(taskCompleteBo.getFileId(), task.getId(), task.getProcessInstanceId());
            managementService.executeCommand(attachmentCmd);
            //流程定义设置
            ActProcessDefSettingVo setting = iActProcessDefSettingService.getProcessDefSettingByDefId(task.getProcessDefinitionId());
            if (setting != null && !setting.getDefaultProcess()) {
                return CompleteTaskUtils.execute(taskCompleteBo);
            }

            // 2. 判断下一节点是否是会签 如果是会签 将选择的人员放到会签变量
            List<ActNodeAssignee> actNodeAssignees = iActNodeAssigneeService.getInfoByProcessDefinitionId(task.getProcessDefinitionId());
            for (ActNodeAssignee actNodeAssignee : actNodeAssignees) {
                String column = actNodeAssignee.getMultipleColumn();
                String assigneeId = actNodeAssignee.getAssigneeId();
                if (actNodeAssignee.getMultiple() && actNodeAssignee.getIsShow()) {
                    List<Long> userIdList = taskCompleteBo.getAssignees(actNodeAssignee.getMultipleColumn());
                    if (CollectionUtil.isNotEmpty(userIdList)) {
                        taskService.setVariable(task.getId(), column, userIdList);
                    }
                }
                //判断是否有会签并且不需要弹窗选人的节点
                if (Boolean.TRUE.equals(actNodeAssignee.getMultiple() && Boolean.FALSE.equals(actNodeAssignee.getIsShow())) && (StringUtils.isBlank(column) || StringUtils.isBlank(assigneeId))) {
                    throw new ServiceException("请检查【" + processInstance.getProcessDefinitionKey() + "】配置 ");
                }
                if (Boolean.TRUE.equals(actNodeAssignee.getMultiple()) && Boolean.FALSE.equals(actNodeAssignee.getIsShow())) {
                    WorkflowUtils.settingAssignee(task, actNodeAssignee, actNodeAssignee.getMultiple());
                }
            }
            // 3. 指定任务审批意见
            taskService.addComment(taskCompleteBo.getTaskId(), task.getProcessInstanceId(), TaskStatusEnum.PASS.getStatus(), taskCompleteBo.getMessage());
            // 设置变量
            if (CollectionUtil.isNotEmpty(taskCompleteBo.getVariables())) {
                taskService.setVariables(taskCompleteBo.getTaskId(), taskCompleteBo.getVariables());
            }

            ActNodeAssignee actNodeAssignee = actNodeAssignees.stream().filter(e -> e.getNodeId().equals(task.getTaskDefinitionKey())).findFirst().orElse(null);
            if (ObjectUtil.isNull(actNodeAssignee)) {
                throw new ServiceException("请检查【" + task.getName() + "】节点配置");
            }
            //办理任务
            new AbstractExecuteTaskHandler() {
                @Override
                protected void executeHandler() {
                    // 4. 完成任务
                    taskService.complete(taskCompleteBo.getTaskId());
                    // 5. 记录执行过的流程任务节点
                    WorkflowUtils.recordExecuteNode(task, actNodeAssignee);
                    // 更新业务状态为：办理中
                    iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.WAITING, task.getProcessInstanceId());
                    // 6. 判断流程是否结束
                    ProcessInstance instance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
                    // 7. 如果为空 办结任务
                    if (instance == null) {
                        // 更新业务状态已完成 办结流程
                        iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.FINISH, processInstance.getProcessInstanceId());
                    }
                }
            }.execute(actNodeAssignee, task);
            ProcessInstance instance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
            if (instance == null) {
                return true;
            }
            // 抄送
            if (Boolean.TRUE.equals(taskCompleteBo.getIsCopy())) {
                if (StringUtils.isBlank(taskCompleteBo.getAssigneeIds())) {
                    throw new ServiceException("抄送人不能为空 ");
                }
                TaskEntity newTask = WorkflowUtils.createNewTask(task, false);
                taskService.addComment(newTask.getId(), task.getProcessInstanceId(), TaskStatusEnum.COPY.getStatus(),
                    LoginHelper.getNickname() + "【抄送】给" + taskCompleteBo.getAssigneeNames());
                taskService.complete(newTask.getId());
                List<Task> taskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
                WorkflowUtils.createSubTask(taskList, taskCompleteBo.getAssigneeIds());
            }
            // 8. 如果不为空 指定办理人
            List<Task> nextTaskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
            if (CollectionUtil.isEmpty(nextTaskList)) {
                // 更新业务状态已完成 办结流程
                return iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.FINISH, processInstance.getProcessInstanceId()) != null;
            }
            for (Task t : nextTaskList) {
                ActNodeAssignee nodeAssignee = actNodeAssignees.stream().filter(e -> t.getTaskDefinitionKey().equals(e.getNodeId())).findFirst().orElse(null);
                if (ObjectUtil.isNull(nodeAssignee)) {
                    throw new ServiceException("请检查【" + t.getName() + "】节点配置");
                }
                // 不需要弹窗选人
                if (Boolean.FALSE.equals(nodeAssignee.getIsShow()) && StringUtils.isBlank(t.getAssignee()) && Boolean.FALSE.equals(nodeAssignee.getMultiple())) {
                    // 设置人员
                    WorkflowUtils.settingAssignee(t, nodeAssignee, false);
                } else if (Boolean.TRUE.equals(nodeAssignee.getIsShow()) && StringUtils.isBlank(t.getAssignee()) && Boolean.FALSE.equals(nodeAssignee.getMultiple())) {
                    // 弹窗选人 根据当前任务节点id获取办理人
                    List<Long> assignees = taskCompleteBo.getAssignees(t.getTaskDefinitionKey());
                    if (CollectionUtil.isEmpty(assignees)) {
                        throw new ServiceException("【" + t.getName() + "】任务环节未配置审批人");
                    }
                    // 设置选人
                    WorkflowUtils.setAssignee(t, assignees);
                }
            }
            // 自动办理
            WorkflowUtils.autoComplete(processInstance.getProcessInstanceId(), actNodeAssignees);
            List<Task> taskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
            if (CollectionUtil.isEmpty(taskList)) {
                iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.FINISH, task.getProcessInstanceId());
            }
            // 发送站内信
            sendMessage(taskCompleteBo.getSendMessage(), nextTaskList, processInstance.getName());

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            iActBusinessStatusService.deleteCacheByBusinessKey(processInstance.getBusinessKey());
            throw new ServiceException("办理失败:" + e.getMessage());
        }
    }

    /**
     * @description: 获取目标节点（下一个节点）
     * @param: nextNodeBo
     * @return: java.util.Map<java.lang.String, java.lang.Object>
     * @author: gssong
     * @date: 2021/10/23
     */
    @Override
    public Map<String, Object> getNextNodeInfo(NextNodeBo nextNodeBo) {
        Map<String, Object> map = new HashMap<>(16);
        TaskEntity task = (TaskEntity) taskService.createTaskQuery().taskId(nextNodeBo.getTaskId()).singleResult();
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        ActNodeAssignee nodeAssignee = iActNodeAssigneeService.getInfo(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
        //可驳回的节点
        List<ActTaskNode> taskNodeList = iActTaskNodeService.getListByInstanceId(task.getProcessInstanceId()).stream().filter(ActTaskNode::getIsBack).collect(Collectors.toList());
        map.put("backNodeList", taskNodeList);
        //当前流程实例状态
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
        map.put("processDefinitionKey", processInstance.getProcessDefinitionKey());

        ActBusinessStatus actBusinessStatus = iActBusinessStatusService.getInfoByBusinessKey(processInstance.getBusinessKey());
        if (!ObjectUtil.isEmpty(actBusinessStatus)) {
            map.put("businessStatus", actBusinessStatus);
        }
        //委托流程
        if (ObjectUtil.isNotEmpty(task.getDelegationState()) && FlowConstant.PENDING.equals(task.getDelegationState().name())) {
            ActNodeAssignee actNodeAssignee = new ActNodeAssignee();
            actNodeAssignee.setIsDelegate(false);
            actNodeAssignee.setIsTransmit(false);
            actNodeAssignee.setIsCopy(false);
            actNodeAssignee.setAddMultiInstance(false);
            actNodeAssignee.setDeleteMultiInstance(false);
            map.put("setting", actNodeAssignee);
            map.put("list", new ArrayList<>());
            map.put("isMultiInstance", false);
            return map;
        }
        //流程定义设置
        if (ObjectUtil.isNotEmpty(nodeAssignee)) {
            map.put("setting", nodeAssignee);
        } else {
            ActNodeAssignee actNodeAssignee = new ActNodeAssignee();
            actNodeAssignee.setIsDelegate(false);
            actNodeAssignee.setIsTransmit(false);
            actNodeAssignee.setIsCopy(false);
            actNodeAssignee.setAddMultiInstance(false);
            actNodeAssignee.setDeleteMultiInstance(false);
            map.put("setting", actNodeAssignee);
        }

        //判断当前是否为会签
        MultiInstanceVo isMultiInstance = WorkflowUtils.isMultiInstance(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
        map.put("isMultiInstance", ObjectUtil.isNotEmpty(isMultiInstance));
        //查询任务
        List<Task> taskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
        //可以减签的人员
        if (ObjectUtil.isNotEmpty(isMultiInstance)) {
            if (isMultiInstance.getType() instanceof ParallelMultiInstanceBehavior) {
                map.put("multiList", multiList(task, taskList, isMultiInstance.getType(), null));
            } else if (isMultiInstance.getType() instanceof SequentialMultiInstanceBehavior) {
                List<Long> assigneeList = (List<Long>) runtimeService.getVariable(task.getExecutionId(), isMultiInstance.getAssigneeList());
                map.put("multiList", multiList(task, taskList, isMultiInstance.getType(), assigneeList));
            }
        } else {
            map.put("multiList", new ArrayList<>());
        }
        //如果是会签最后一个人员审批选人
        if (CollectionUtil.isNotEmpty(taskList) && taskList.size() > 1) {
            //return null;
        }

        if (CollectionUtil.isNotEmpty(nextNodeBo.getVariables())) {
            taskService.setVariables(task.getId(), nextNodeBo.getVariables());
        }
        //流程定义
        String processDefinitionId = task.getProcessDefinitionId();
        //查询bpmn信息
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
        //通过任务节点id，来获取当前节点信息
        FlowElement flowElement = bpmnModel.getFlowElement(task.getTaskDefinitionKey());
        //全部节点
        Collection<FlowElement> flowElements = bpmnModel.getProcesses().get(0).getFlowElements();
        //封装下一个用户任务节点信息
        List<ProcessNode> nextNodeList = new ArrayList<>();
        //保存没有表达式的节点
        List<ProcessNode> tempNodeList = new ArrayList<>();
        ExecutionEntityImpl executionEntity = (ExecutionEntityImpl) runtimeService.createExecutionQuery()
            .executionId(task.getExecutionId()).singleResult();
        WorkflowUtils.getNextNodeList(flowElements, flowElement, executionEntity, nextNodeList, tempNodeList, task.getId(), null);
        if (CollectionUtil.isNotEmpty(nextNodeList)) {
            nextNodeList.removeIf(node -> !node.getExpression());
        }
        if (CollectionUtil.isNotEmpty(nextNodeList) && CollectionUtil.isNotEmpty(nextNodeList.stream().filter(e -> e.getExpression() != null && e.getExpression()).collect(Collectors.toList()))) {
            List<ProcessNode> nodeList = nextNodeList.stream().filter(e -> e.getExpression() != null && e.getExpression()).collect(Collectors.toList());
            List<ProcessNode> processNodeList = getProcessNodeAssigneeList(nodeList, task.getProcessDefinitionId());
            map.put("list", processNodeList);
        } else if (CollectionUtil.isNotEmpty(tempNodeList)) {
            List<ProcessNode> processNodeList = getProcessNodeAssigneeList(tempNodeList, task.getProcessDefinitionId());
            map.put("list", processNodeList);
        } else {
            map.put("list", nextNodeList);
        }
        map.put("processInstanceId", task.getProcessInstanceId());
        //流程定义设置
        ActProcessDefSettingVo setting = iActProcessDefSettingService.getProcessDefSettingByDefId(task.getProcessDefinitionId());
        if (setting != null && !setting.getDefaultProcess()) {
            Map<String, Object> executableNode = iActProcessInstanceService.getExecutableNode(task.getProcessInstanceId());
            map.putAll(executableNode);
            map.put("defaultProcess", true);
            map.put("list", Collections.emptyList());
            if (BusinessStatusEnum.WAITING.getStatus().equals(actBusinessStatus.getStatus())) {
                map.put("processNodeList", Collections.emptyList());
            }
        } else {
            map.put("defaultProcess", false);
            map.put("processNodeList", Collections.emptyList());
        }
        return map;
    }


    /**
     * @description: 可减签人员集合
     * @param: task  当前任务
     * @param: taskList  当前实例所有任务
     * @param: type  会签类型
     * @param: assigneeList 串行会签人员
     * @return: java.util.List<com.ruoyi.workflow.domain.vo.TaskVo>
     * @author: gssong
     * @date: 2022/4/24 11:17
     */
    private List<TaskVo> multiList(TaskEntity task, List<Task> taskList, Object type, List<Long> assigneeList) {
        List<TaskVo> taskListVo = new ArrayList<>();
        if (type instanceof SequentialMultiInstanceBehavior) {
            List<Long> userIds = assigneeList.stream().filter(userId -> !userId.toString().equals(task.getAssignee())).collect(Collectors.toList());
            List<SysUser> sysUsers = null;
            if (CollectionUtil.isNotEmpty(userIds)) {
                sysUsers = iWorkflowUserService.selectListUserByIds(userIds);
            }
            for (Long userId : userIds) {
                TaskVo taskVo = new TaskVo();
                taskVo.setId("串行会签");
                taskVo.setExecutionId("串行会签");
                taskVo.setProcessInstanceId(task.getProcessInstanceId());
                taskVo.setName(task.getName());
                taskVo.setAssigneeId(String.valueOf(userId));
                if (CollectionUtil.isNotEmpty(sysUsers) && sysUsers != null) {
                    sysUsers.stream().filter(u -> u.getUserId().toString().equals(userId.toString())).findFirst().ifPresent(user -> taskVo.setAssignee(user.getNickName()));
                }
                taskListVo.add(taskVo);
            }
            return taskListVo;
        } else if (type instanceof ParallelMultiInstanceBehavior) {
            List<Task> tasks = taskList.stream().filter(e -> StringUtils.isBlank(e.getParentTaskId()) && !e.getExecutionId().equals(task.getExecutionId())
                && e.getTaskDefinitionKey().equals(task.getTaskDefinitionKey())).collect(Collectors.toList());
            if (CollectionUtil.isNotEmpty(tasks)) {
                List<Long> userIds = tasks.stream().map(e -> Long.valueOf(e.getAssignee())).collect(Collectors.toList());
                List<SysUser> sysUsers = null;
                if (CollectionUtil.isNotEmpty(userIds)) {
                    sysUsers = iWorkflowUserService.selectListUserByIds(userIds);
                }
                for (Task t : tasks) {
                    TaskVo taskVo = new TaskVo();
                    taskVo.setId(t.getId());
                    taskVo.setExecutionId(t.getExecutionId());
                    taskVo.setProcessInstanceId(t.getProcessInstanceId());
                    taskVo.setName(t.getName());
                    taskVo.setAssigneeId(t.getAssignee());
                    if (CollectionUtil.isNotEmpty(sysUsers)) {
                        sysUsers.stream().filter(u -> u.getUserId().toString().equals(t.getAssignee())).findFirst().ifPresent(e -> {
                            taskVo.setAssignee(e.getNickName());
                        });
                    }
                    taskListVo.add(taskVo);
                }
                return taskListVo;
            }
        }
        return Collections.emptyList();
    }

    /**
     * @description: 设置节点审批人员
     * @param: nodeList节点列表
     * @param: definitionId 流程定义id
     * @return: java.util.List<com.ruoyi.workflow.domain.vo.ProcessNode>
     * @author: gssong
     * @date: 2021/10/23
     */
    private List<ProcessNode> getProcessNodeAssigneeList(List<ProcessNode> nodeList, String definitionId) {
        List<ActNodeAssignee> actNodeAssignees = iActNodeAssigneeService.getInfoByProcessDefinitionId(definitionId);
        if (CollUtil.isEmpty(actNodeAssignees)) {
            throw new ServiceException("当前流程定义未配置审批人，请联系管理员！");
        }
        for (ProcessNode processNode : nodeList) {
            if (CollectionUtil.isEmpty(actNodeAssignees)) {
                throw new ServiceException("该流程定义未配置，请联系管理员！");
            }
            ActNodeAssignee nodeAssignee = actNodeAssignees.stream().filter(e -> e.getNodeId().equals(processNode.getNodeId())).findFirst().orElse(null);

            //按角色 部门 人员id 等设置查询人员信息
            if (ObjectUtil.isNotNull(nodeAssignee) && StringUtils.isNotBlank(nodeAssignee.getAssigneeId())
                && nodeAssignee.getBusinessRuleId() == null && StringUtils.isNotBlank(nodeAssignee.getAssignee())) {
                processNode.setChooseWay(nodeAssignee.getChooseWay());
                processNode.setAssignee(nodeAssignee.getAssignee());
                processNode.setAssigneeId(nodeAssignee.getAssigneeId());
                processNode.setIsShow(nodeAssignee.getIsShow());
                if (nodeAssignee.getMultiple()) {
                    processNode.setNodeId(nodeAssignee.getMultipleColumn());
                }
                processNode.setMultiple(nodeAssignee.getMultiple());
                processNode.setMultipleColumn(nodeAssignee.getMultipleColumn());
                //按照业务规则设置查询人员信息
            } else if (ObjectUtil.isNotNull(nodeAssignee) && nodeAssignee.getBusinessRuleId() != null) {
                ActBusinessRuleVo actBusinessRuleVo = iActBusinessRuleService.queryById(nodeAssignee.getBusinessRuleId());
                List<String> ruleAssignList = WorkflowUtils.ruleAssignList(actBusinessRuleVo, processNode.getTaskId(), processNode.getNodeName());
                processNode.setChooseWay(nodeAssignee.getChooseWay());
                processNode.setAssignee(StrUtil.EMPTY);
                processNode.setAssigneeId(String.join(StringUtils.SEPARATOR, ruleAssignList));
                processNode.setIsShow(nodeAssignee.getIsShow());
                processNode.setBusinessRuleId(nodeAssignee.getBusinessRuleId());
                if (Boolean.TRUE.equals(nodeAssignee.getMultiple())) {
                    processNode.setNodeId(nodeAssignee.getMultipleColumn());
                }
                processNode.setMultiple(nodeAssignee.getMultiple());
                processNode.setMultipleColumn(nodeAssignee.getMultipleColumn());
            } else {
                throw new ServiceException(processNode.getNodeName() + "未配置审批人，请联系管理员！");
            }
        }
        if (CollectionUtil.isNotEmpty(nodeList)) {
            // 去除不需要弹窗选人的节点
            nodeList.removeIf(node -> !node.getIsShow());
        }
        return nodeList;
    }


    /**
     * @description: 查询待办任务
     * @param: taskBo
     * @param: pageQuery
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.TaskWaitingVo>
     * @author: gssong
     * @date: 2021/10/17
     */
    @Override
    public TableDataInfo<TaskWaitingVo> getTaskWaitByPage(TaskBo taskBo, PageQuery pageQuery) {
        Page<TaskWaitingVo> page;
        QueryWrapper<TaskWaitingVo> wrapper = Wrappers.query();
        wrapper.eq("status", BusinessStatusEnum.WAITING.getStatus());
        if (StringUtils.isNotEmpty(taskBo.getBusinessKey())) {
            wrapper.eq("business_key", taskBo.getBusinessKey());
        }
        if (StringUtils.isNotEmpty(taskBo.getTaskName())) {
            wrapper.like("name_", taskBo.getTaskName());
        }
        if (StringUtils.isNotEmpty(taskBo.getProcessDefinitionKey())) {
            wrapper.eq("key_", taskBo.getProcessDefinitionKey());
        }
        if (StringUtils.isNotEmpty(taskBo.getProcessDefinitionName())) {
            wrapper.like("process_definition_name", taskBo.getProcessDefinitionName());
        }

        wrapper.orderByAsc("create_time_");
        if (StringUtils.isBlank(taskBo.getAssignee())) {
            page = actTaskMapper.getTaskWaitByPage(pageQuery.build(), wrapper, null);
        } else {
            page = actTaskMapper.getTaskWaitByPage(pageQuery.build(), wrapper, taskBo.getAssignee());
        }
        if (CollectionUtil.isEmpty(page.getRecords())) {
            return new TableDataInfo<>();
        }
        long total = page.getTotal();
        List<TaskWaitingVo> taskList = page.getRecords();
        //流程实例id
        Set<String> processInstanceIds = taskList.stream().map(TaskWaitingVo::getProcessInstanceId).collect(Collectors.toSet());
        //流程定义id
        List<String> processDefinitionIds = taskList.stream().map(TaskWaitingVo::getProcessDefinitionId).collect(Collectors.toList());
        //查询流程实例
        List<ProcessInstance> processInstanceList = runtimeService.createProcessInstanceQuery().processInstanceIds(processInstanceIds).list();
        //查询流程定义设置
        List<ActProcessDefSettingVo> processDefSettingLists = iActProcessDefSettingService.getProcessDefSettingByDefIds(processDefinitionIds);
        //办理人
        List<Long> assignees = taskList.stream().filter(e -> StringUtils.isNotBlank(e.getAssignee())).map(e -> Long.valueOf(e.getAssignee())).filter(ObjectUtil::isNotEmpty).collect(Collectors.toList());
        //流程发起人
        List<Long> userIds = processInstanceList.stream().map(e -> Long.valueOf(e.getStartUserId())).collect(Collectors.toList());
        if (CollUtil.isNotEmpty(assignees)) {
            userIds.addAll(assignees);
        }
        List<SysUser> userList = iWorkflowUserService.selectListUserByIds(userIds);
        //查询任务
        List<Task> taskCollect = taskService.createTaskQuery().processInstanceIdIn(processInstanceIds).list();
        for (TaskWaitingVo task : taskList) {
            task.setAssigneeId(StringUtils.isNotBlank(task.getAssignee()) ? Long.valueOf(task.getAssignee()) : null);
            processInstanceList.stream().filter(e -> e.getProcessInstanceId().equals(task.getProcessInstanceId())).findFirst()
                .ifPresent(e -> {
                    //流程发起人
                    String startUserId = e.getStartUserId();
                    task.setStartUserId(startUserId);
                    if (StringUtils.isNotBlank(startUserId)) {
                        userList.stream().filter(u -> u.getUserId().toString().equals(startUserId)).findFirst().ifPresent(u -> {
                            task.setStartUserNickName(u.getNickName());
                        });
                    }
                    task.setBusinessKey(e.getBusinessKey());
                });
            // 查询流程定义设置
            processDefSettingLists.stream().filter(e -> e.getProcessDefinitionId().equals(task.getProcessDefinitionId())).findFirst()
                .ifPresent(task::setActProcessDefSetting);
            //是否会签
            MultiInstanceVo multiInstance = WorkflowUtils.isMultiInstance(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            task.setMultiInstance(ObjectUtil.isNotEmpty(multiInstance));
            //查询任务
            List<Task> tasks = taskCollect.stream().filter(e -> e.getProcessInstanceId().equals(task.getProcessInstanceId())).collect(Collectors.toList());
            //可以减签的人员
            if (ObjectUtil.isNotEmpty(multiInstance)) {
                TaskEntity taskEntity = (TaskEntity) tasks.stream().filter(e -> e.getId().equals(task.getId())).findFirst().orElse(null);
                if (multiInstance.getType() instanceof ParallelMultiInstanceBehavior) {
                    task.setTaskVoList(multiList(taskEntity, tasks, multiInstance.getType(), null));
                } else if (multiInstance.getType() instanceof SequentialMultiInstanceBehavior && StringUtils.isNotBlank(task.getExecutionId())) {
                    List<Long> assigneeList = (List<Long>) runtimeService.getVariable(task.getExecutionId(), multiInstance.getAssigneeList());
                    task.setTaskVoList(multiList(taskEntity, tasks, multiInstance.getType(), assigneeList));
                }
            }
        }
        if (CollectionUtil.isNotEmpty(taskList)) {
            //认领与归还标识
            taskList.forEach(e -> {
                List<HistoricIdentityLink> identityLinkList = WorkflowUtils.getCurrentTaskApprover(e.getId());
                if (CollectionUtil.isNotEmpty(identityLinkList)) {
                    List<String> collectType = identityLinkList.stream().map(HistoricIdentityLink::getType).collect(Collectors.toList());
                    if (StringUtils.isBlank(e.getAssignee()) && collectType.size() > 1 && collectType.contains(FlowConstant.CANDIDATE)) {
                        e.setIsClaim(false);
                    } else if (StringUtils.isNotBlank(e.getAssignee()) && collectType.size() > 1 && collectType.contains(FlowConstant.CANDIDATE)) {
                        e.setIsClaim(true);
                    }
                }
            });
            //办理人集合
            if (CollectionUtil.isNotEmpty(userList)) {
                taskList.forEach(e -> userList.stream().filter(t -> StringUtils.isNotBlank(e.getAssignee()) && t.getUserId().toString().equals(e.getAssigneeId().toString()))
                    .findFirst().ifPresent(t -> {
                        e.setAssignee(t.getNickName());
                        e.setAssigneeId(t.getUserId());
                    }));
            }
        }
        return new TableDataInfo<>(taskList, total);
    }

    /**
     * @description: 获取各个流程key待办数量 assignee为空时默认查询全部
     * @param: assignee 办理人
     * @param: status 状态
     * @return: java.util.List<java.util.Map < java.lang.String, java.lang.Object>>
     * @author: gssong
     * @date: 2023/4/21 12:21
     */
    @Override
    public List<Map<String, Object>> getTaskWaitCount(String status, String assignee) {
        return actTaskMapper.getTaskWaitCount(status, assignee);
    }

    /**
     * @description: 查询当前用户的已办任务
     * @param: taskBo
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.TaskFinishVo>
     * @author: gssong
     * @date: 2021/10/23
     */
    @Override
    public TableDataInfo<TaskFinishVo> getTaskFinishByPage(TaskBo taskBo) {
        HistoricTaskInstanceQuery query;
        if (StringUtils.isBlank(taskBo.getAssignee())) {
            query = historyService.createHistoricTaskInstanceQuery().finished().orderByHistoricTaskInstanceStartTime().asc();
        } else {
            query = historyService.createHistoricTaskInstanceQuery()
                .taskAssignee(taskBo.getAssignee()).finished().orderByHistoricTaskInstanceStartTime().asc();
        }
        if (StringUtils.isNotBlank(taskBo.getTaskName())) {
            query.taskNameLike(taskBo.getTaskName());
        }
        List<HistoricTaskInstance> list = query.listPage(taskBo.getPageNum(), taskBo.getPageSize());
        long total = query.count();
        List<TaskFinishVo> taskFinishVoList = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(list)) {
            //流程定义id集合
            Set<String> processDefinitionIds = list.stream().map(HistoricTaskInstance::getProcessDefinitionId).collect(Collectors.toSet());
            //办理人id集合
            List<Long> assigneeList = list.stream().filter(e -> StringUtils.isNotBlank(e.getAssignee())).map(e -> Long.valueOf(e.getAssignee())).collect(Collectors.toList());
            List<SysUser> userList = null;
            if (CollectionUtil.isNotEmpty(assigneeList)) {
                userList = iWorkflowUserService.selectListUserByIds(assigneeList);
            }
            //流程定义
            List<ProcessDefinition> processDefinitionList = repositoryService.createProcessDefinitionQuery().processDefinitionIds(processDefinitionIds).list();
            for (HistoricTaskInstance hti : list) {
                TaskFinishVo taskFinishVo = new TaskFinishVo();
                BeanUtils.copyProperties(hti, taskFinishVo);
                processDefinitionList.stream().filter(e -> e.getId().equals(hti.getProcessDefinitionId())).findFirst().ifPresent(e -> {
                    taskFinishVo.setProcessDefinitionName(e.getName());
                    taskFinishVo.setProcessDefinitionKey(e.getKey());
                    taskFinishVo.setVersion(e.getVersion());
                });
                if (CollUtil.isNotEmpty(userList)) {
                    userList.stream().filter(e -> e.getUserId().toString().equals(hti.getAssignee())).findFirst().ifPresent(e -> {
                        taskFinishVo.setAssignee(e.getNickName());
                        taskFinishVo.setAssigneeId(e.getUserId());
                    });
                }
                taskFinishVoList.add(taskFinishVo);
            }
        }
        return new TableDataInfo<>(taskFinishVoList, total);
    }

    /**
     * @description: 驳回审批
     * @param: backProcessBo
     * @return: java.lang.String
     * @author: gssong
     * @date: 2021/11/6
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public String backProcess(BackProcessBo backProcessBo) {

        Task task = taskService.createTaskQuery().taskId(backProcessBo.getTaskId()).taskAssignee(getUserId().toString()).singleResult();
        if (ObjectUtil.isEmpty(task)) {
            throw new ServiceException(FlowConstant.MESSAGE_CURRENT_TASK_IS_NULL);
        }
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        String processInstanceId = task.getProcessInstanceId();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
        ActBusinessStatus actBusinessStatus = iActBusinessStatusService.getInfoByBusinessKey(processInstance.getBusinessKey());
        //校验单据
        BusinessStatusEnum.checkStatus(actBusinessStatus.getStatus());
        //校验当前环节是否配置驳回
        ActNodeAssignee actNodeAssignee = iActNodeAssigneeService.getInfo(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
        if (actNodeAssignee != null && Boolean.FALSE.equals(actNodeAssignee.getShowBack())) {
            throw new ServiceException("当前环节设置不可驳回");
        }
        try {
            //获取并行网关执行后保留的执行实例数据
            ExecutionChildByExecutionIdCmd childByExecutionIdCmd = new ExecutionChildByExecutionIdCmd(task.getExecutionId());
            List<ExecutionEntity> executionEntities = managementService.executeCommand(childByExecutionIdCmd);

            //判断是否有多个任务
            List<Task> taskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
            List<String> gatewayNode = WorkflowUtils.getGatewayNode(task, backProcessBo.getTargetActivityId());
            ActTaskNode actTaskNode = iActTaskNodeService.getListByInstanceIdAndNodeId(task.getProcessInstanceId(), backProcessBo.getTargetActivityId());
            ActProcessDefSettingVo processDefSettingVo = iActProcessDefSettingService.getProcessDefSettingByDefId(task.getProcessDefinitionId());
            new AbstractExecuteProcessHandler() {
                @Override
                protected void executeHandler() {

                    //当前单个任务驳回到并行(包含)网关
                    taskService.addComment(task.getId(), processInstanceId, TaskStatusEnum.BACK.getStatus(), StringUtils.isNotBlank(backProcessBo.getComment()) ? backProcessBo.getComment() : "驳回");
                    if (CollectionUtil.isNotEmpty(gatewayNode) && taskList.size() == 1) {
                        runtimeService.createChangeActivityStateBuilder().processInstanceId(processInstanceId)
                            .moveSingleActivityIdToActivityIds(taskList.get(0).getTaskDefinitionKey(), gatewayNode)
                            .changeState();
                        //当前多个任务驳回到单个节点
                    } else if (taskList.size() > 1 && CollectionUtil.isEmpty(gatewayNode)) {
                        runtimeService.createChangeActivityStateBuilder().processInstanceId(processInstanceId)
                            .moveActivityIdsToSingleActivityId(taskList.stream().map(Task::getTaskDefinitionKey).distinct().collect(Collectors.toList()), backProcessBo.getTargetActivityId())
                            .changeState();
                        //当前单个节点驳回单个节点
                    } else if (taskList.size() == 1 && CollectionUtil.isEmpty(gatewayNode)) {
                        runtimeService.createChangeActivityStateBuilder().processInstanceId(processInstanceId)
                            .moveActivityIdTo(taskList.get(0).getTaskDefinitionKey(), backProcessBo.getTargetActivityId())
                            .changeState();
                        //当前多个节点驳回到并行(包含)网关
                    } else if (taskList.size() > 1 && CollectionUtil.isNotEmpty(gatewayNode)) {
                        taskList.forEach(e -> {
                            if (e.getId().equals(backProcessBo.getTaskId())) {
                                runtimeService.createChangeActivityStateBuilder().processInstanceId(processInstanceId)
                                    .moveSingleActivityIdToActivityIds(e.getTaskDefinitionKey(), gatewayNode)
                                    .changeState();
                            } else {
                                WorkflowUtils.deleteRuntimeTask(e);
                            }
                        });
                    } else {
                        throw new ServiceException("驳回失败");
                    }
                    List<Task> otherTasks = null;
                    if (taskList.size() > 1) {
                        otherTasks = taskList.stream().filter(e -> !e.getId().equals(backProcessBo.getTaskId())).collect(Collectors.toList());
                    }
                    if (CollectionUtil.isNotEmpty(otherTasks)) {
                        otherTasks.forEach(e -> historyService.deleteHistoricTaskInstance(e.getId()));
                    }

                    //删除流程实例垃圾数据
                    if (CollUtil.isNotEmpty(executionEntities)) {
                        for (ExecutionEntity executionEntity : executionEntities) {
                            DeleteExecutionCmd deleteExecutionCmd = new DeleteExecutionCmd(executionEntity.getId());
                            managementService.executeCommand(deleteExecutionCmd);
                        }
                    }

                    if (ObjectUtil.isNotEmpty(actTaskNode) && FlowConstant.USER_TASK.equals(actTaskNode.getTaskType())) {
                        List<Task> runTaskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
                        for (Task runTask : runTaskList) {
                            //取之前的历史办理人
                            List<HistoricTaskInstance> oldTargetTaskList = historyService.createHistoricTaskInstanceQuery()
                                // 节点id
                                .taskDefinitionKey(runTask.getTaskDefinitionKey())
                                .processInstanceId(processInstanceId)
                                //已经完成才是历史
                                .finished()
                                //最新办理的在最前面
                                .orderByTaskCreateTime().desc()
                                .list();
                            if (CollectionUtil.isNotEmpty(oldTargetTaskList)) {
                                HistoricTaskInstance oldTargetTask = oldTargetTaskList.get(0);
                                taskService.setAssignee(runTask.getId(), oldTargetTask.getAssignee());
                            }

                        }
                    }

                    //删除驳回后的流程节点
                    if (ObjectUtil.isNotNull(actTaskNode) && actTaskNode.getOrderNo() == 0) {
                        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
                        iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.BACK, processInstanceId);
                    }
                    iActTaskNodeService.deleteBackTaskNode(processInstanceId, backProcessBo.getTargetActivityId());
                }
            }.execute(processDefSettingVo, task.getProcessInstanceId(), actTaskNode.getOrderNo() == 0 ? BusinessStatusEnum.BACK.getStatus() : BusinessStatusEnum.WAITING.getStatus());
            //发送站内信
            SendMessage sendMessage = backProcessBo.getSendMessage();
            if (StringUtils.isBlank(sendMessage.getMessageContent())) {
                sendMessage.setMessageContent("有新的【" + processInstance.getName() + "】单据已经退回至您的待办，请您及时处理。");
            }
            sendMessage(sendMessage, taskService.createTaskQuery().processInstanceId(processInstanceId).list(), processInstance.getName());
            return processInstanceId;
        } catch (Exception e) {
            e.printStackTrace();
            iActBusinessStatusService.deleteCacheByBusinessKey(processInstance.getBusinessKey());
            throw new ServiceException("驳回失败:" + e.getMessage());
        }
    }

    /**
     * @description: 获取历史任务节点，用于驳回功能
     * @param: processInstId
     * @return: java.util.List<com.ruoyi.workflow.domain.ActTaskNode>
     * @author: gssong
     * @date: 2021/11/6
     */
    @Override
    public List<ActTaskNode> getBackNodes(String processInstId) {
        return iActTaskNodeService.getListByInstanceId(processInstId).stream().filter(ActTaskNode::getIsBack).collect(Collectors.toList());
    }

    /**
     * @description: 委派任务
     * @param: taskREQ
     * @return: boolean
     * @author: gssong
     * @date: 2022/3/4
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean delegateTask(DelegateBo delegateBo) {
        TaskEntity task = (TaskEntity) taskService.createTaskQuery().taskId(delegateBo.getTaskId())
            .taskCandidateOrAssigned(String.valueOf(LoginHelper.getUserId())).singleResult();
        if (ObjectUtil.isEmpty(task)) {
            throw new ServiceException(FlowConstant.MESSAGE_CURRENT_TASK_IS_NULL);
        }
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        try {
            TaskEntity newTask = WorkflowUtils.createNewTask(task, true);
            taskService.addComment(newTask.getId(), task.getProcessInstanceId(), TaskStatusEnum.PENDING.getStatus(), "【" + LoginHelper.getNickname() + "】委派给【" + delegateBo.getDelegateUserName() + "】");
            //委托任务
            taskService.delegateTask(delegateBo.getTaskId(), delegateBo.getDelegateUserId());
            //办理生成的任务记录
            taskService.complete(newTask.getId());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 转办任务
     * @param: transferBo
     * @return: boolean
     * @author: gssong
     * @date: 2022/3/13 13:18
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean transferTask(TransferBo transferBo) {
        Task task = taskService.createTaskQuery().taskId(transferBo.getTaskId())
            .taskCandidateOrAssigned(String.valueOf(LoginHelper.getUserId())).singleResult();
        if (ObjectUtil.isEmpty(task)) {
            throw new ServiceException(FlowConstant.MESSAGE_CURRENT_TASK_IS_NULL);
        }
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        try {
            TaskEntity newTask = WorkflowUtils.createNewTask(task, true);
            taskService.addComment(newTask.getId(), task.getProcessInstanceId(), TaskStatusEnum.TRANSFER.getStatus(),
                StringUtils.isNotBlank(transferBo.getComment()) ? transferBo.getComment() : LoginHelper.getNickname() + "转办了任务");
            taskService.complete(newTask.getId());
            taskService.setAssignee(task.getId(), transferBo.getTransmitUserId());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 会签任务加签
     * @param: addMultiBo
     * @return: boolean
     * @author: gssong
     * @date: 2022/4/15 13:06
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean addMultiInstanceExecution(AddMultiBo addMultiBo) {
        Task task;
        if (LoginHelper.isAdmin()) {
            task = taskService.createTaskQuery().taskId(addMultiBo.getTaskId()).singleResult();
        } else {
            task = taskService.createTaskQuery().taskId(addMultiBo.getTaskId())
                .taskCandidateOrAssigned(String.valueOf(LoginHelper.getUserId())).singleResult();
        }
        if (ObjectUtil.isEmpty(task) && !LoginHelper.isAdmin()) {
            throw new ServiceException(FlowConstant.MESSAGE_CURRENT_TASK_IS_NULL);
        }
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        String taskDefinitionKey = task.getTaskDefinitionKey();
        String processInstanceId = task.getProcessInstanceId();
        String processDefinitionId = task.getProcessDefinitionId();
        MultiInstanceVo multiInstanceVo = WorkflowUtils.isMultiInstance(processDefinitionId, taskDefinitionKey);
        if (ObjectUtil.isEmpty(multiInstanceVo)) {
            throw new ServiceException("当前环节不是会签节点");
        }
        try {
            if (multiInstanceVo.getType() instanceof ParallelMultiInstanceBehavior) {
                for (Long assignee : addMultiBo.getAssignees()) {
                    runtimeService.addMultiInstanceExecution(taskDefinitionKey, processInstanceId, Collections.singletonMap(multiInstanceVo.getAssignee(), assignee));
                }
            } else if (multiInstanceVo.getType() instanceof SequentialMultiInstanceBehavior) {
                AddSequenceMultiInstanceCmd addSequenceMultiInstanceCmd = new AddSequenceMultiInstanceCmd(task.getExecutionId(), multiInstanceVo.getAssigneeList(), addMultiBo.getAssignees());
                managementService.executeCommand(addSequenceMultiInstanceCmd);
            }
            List<String> assigneeNames = addMultiBo.getAssigneeNames();
            String nickname = LoginHelper.getNickname();
            TaskEntity newTask = WorkflowUtils.createNewTask(task, false);
            taskService.addComment(newTask.getId(), processInstanceId, TaskStatusEnum.SIGN.getStatus(), nickname + "加签【" + String.join(StringUtils.SEPARATOR, assigneeNames) + "】");
            taskService.complete(newTask.getId());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 会签任务减签
     * @param: deleteMultiBo
     * @return: boolean
     * @author: gssong
     * @date: 2022/4/16 10:59
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMultiInstanceExecution(DeleteMultiBo deleteMultiBo) {
        Task task;
        if (LoginHelper.isAdmin()) {
            task = taskService.createTaskQuery().taskId(deleteMultiBo.getTaskId()).singleResult();
        } else {
            task = taskService.createTaskQuery().taskId(deleteMultiBo.getTaskId())
                .taskCandidateOrAssigned(String.valueOf(LoginHelper.getUserId())).singleResult();
        }
        if (ObjectUtil.isEmpty(task) && !LoginHelper.isAdmin()) {
            throw new ServiceException(FlowConstant.MESSAGE_CURRENT_TASK_IS_NULL);
        }
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        String taskDefinitionKey = task.getTaskDefinitionKey();
        String processInstanceId = task.getProcessInstanceId();
        String processDefinitionId = task.getProcessDefinitionId();
        MultiInstanceVo multiInstanceVo = WorkflowUtils.isMultiInstance(processDefinitionId, taskDefinitionKey);
        if (multiInstanceVo == null) {
            throw new ServiceException("当前环节不是会签节点");
        }
        try {
            if (multiInstanceVo.getType() instanceof ParallelMultiInstanceBehavior) {
                for (String executionId : deleteMultiBo.getExecutionIds()) {
                    runtimeService.deleteMultiInstanceExecution(executionId, false);
                }
                for (String taskId : deleteMultiBo.getTaskIds()) {
                    historyService.deleteHistoricTaskInstance(taskId);
                }
            } else if (multiInstanceVo.getType() instanceof SequentialMultiInstanceBehavior) {
                DeleteSequenceMultiInstanceCmd deleteSequenceMultiInstanceCmd = new DeleteSequenceMultiInstanceCmd(task.getAssignee(), task.getExecutionId(), multiInstanceVo.getAssigneeList(), deleteMultiBo.getAssigneeIds());
                managementService.executeCommand(deleteSequenceMultiInstanceCmd);
            }
            List<String> assigneeNames = deleteMultiBo.getAssigneeNames();
            String nickname = LoginHelper.getNickname();
            TaskEntity newTask = WorkflowUtils.createNewTask(task, false);
            taskService.addComment(newTask.getId(), processInstanceId, TaskStatusEnum.SIGN.getStatus(), nickname + "减签【" + String.join(StringUtils.SEPARATOR, assigneeNames) + "】");
            taskService.complete(newTask.getId());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 修改办理人
     * @param: updateAssigneeBo
     * @return: boolean
     * @author: gssong
     * @date: 2022/7/17 13:35
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateAssignee(UpdateAssigneeBo updateAssigneeBo) {
        List<Task> list = taskService.createTaskQuery().taskIds(updateAssigneeBo.getTaskIdList()).list();
        if (CollectionUtil.isEmpty(list)) {
            throw new ServiceException("查询失败，任务不存在");
        }
        try {
            for (Task task : list) {
                taskService.setAssignee(task.getId(), updateAssigneeBo.getUserId());
            }
            return true;
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 查询流程变量
     * @param: taskId
     * @return: java.util.List<com.ruoyi.workflow.domain.vo.VariableVo>
     * @author: gssong
     * @date: 2022/7/23 14:33
     */
    @Override
    public List<VariableVo> getProcessInstVariable(String taskId) {
        List<VariableVo> variableVoList = new ArrayList<>();
        Map<String, VariableInstance> variableInstances = taskService.getVariableInstances(taskId);
        if (CollectionUtil.isNotEmpty(variableInstances)) {
            for (Map.Entry<String, VariableInstance> entry : variableInstances.entrySet()) {
                VariableVo variableVo = new VariableVo();
                variableVo.setKey(entry.getKey());
                variableVo.setValue(entry.getValue().getValue().toString());
                variableVoList.add(variableVo);
            }
        }
        return variableVoList;
    }

    /**
     * @description: 修改审批意见
     * @param: commentBo 参数
     * @return: boolean
     * @author: gssong
     * @date: 2022/7/24 13:28
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean editComment(CommentBo commentBo) {
        AttachmentCmd attachmentCmd = new AttachmentCmd(commentBo.getFileIds(), commentBo.getTaskId(), commentBo.getProcessInstanceId());
        managementService.executeCommand(attachmentCmd);
        return actTaskMapper.editComment(commentBo.getCommentId(), commentBo.getComment()) > 0;
    }

    /**
     * @description: 删除附件
     * @param: contentId
     * @return: boolean
     * @author: gssong
     * @date: 2022/9/26 13:11
     */
    @Override
    public boolean deleteAttachment(String contentId) {
        try {
            actTaskMapper.deleteContentId(contentId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 按照任务id删除附件
     * @param: taskId
     * @return: boolean
     * @author: gssong
     * @date: 2023/5/17 18:11
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteAttachmentByTaskId(String taskId) {
        try {
            List<Attachment> taskAttachments = taskService.getTaskAttachments(taskId);
            if (CollectionUtil.isNotEmpty(taskAttachments)) {
                for (Attachment taskAttachment : taskAttachments) {
                    taskService.deleteAttachment(taskAttachment.getId());
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 终止任务
     * @param: terminationBo
     * @return: boolean
     * @author: gssong
     * @date: 2022/10/27 20:32
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean terminationTask(TerminationBo terminationBo) {
        Task task = taskService.createTaskQuery().taskId(terminationBo.getTaskId()).singleResult();

        if (ObjectUtil.isEmpty(task)) {
            throw new ServiceException(FlowConstant.MESSAGE_CURRENT_TASK_IS_NULL);
        }
        if (task.isSuspended()) {
            throw new ServiceException(FlowConstant.MESSAGE_SUSPENDED);
        }
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
        ActBusinessStatus actBusinessStatus = iActBusinessStatusService.getInfoByBusinessKey(processInstance.getBusinessKey());
        if (actBusinessStatus == null) {
            throw new ServiceException("当前流程异常，未生成act_business_status对象");
        }
        try {
            //校验单据
            BusinessStatusEnum.checkStatus(actBusinessStatus.getStatus());
            if (StringUtils.isBlank(terminationBo.getComment())) {
                terminationBo.setComment(LoginHelper.getNickname() + "终止了申请");
            } else {
                terminationBo.setComment(LoginHelper.getNickname() + "终止了申请：" + terminationBo.getComment());
            }

            ActNodeAssigneeVo actNodeAssignee = iActNodeAssigneeService.getInfoSetting(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
            if (actNodeAssignee == null) {
                throw new ServiceException("【" + task.getName() + "】人员设置为空");
            }
            ActProcessDefSettingVo processDefSettingVo = iActProcessDefSettingService.getProcessDefSettingByDefId(task.getProcessDefinitionId());
            new AbstractExecuteProcessHandler() {
                @Override
                protected void executeHandler() {
                    taskService.addComment(task.getId(), task.getProcessInstanceId(), TaskStatusEnum.TERMINATION.getStatus(), terminationBo.getComment());
                    List<Task> list = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
                    if (CollectionUtil.isNotEmpty(list)) {
                        List<Task> subTasks = list.stream().filter(e -> StringUtils.isNotBlank(e.getParentTaskId())).collect(Collectors.toList());
                        if (CollectionUtil.isNotEmpty(subTasks)) {
                            subTasks.forEach(e -> taskService.deleteTask(e.getId()));
                        }
                        runtimeService.deleteProcessInstance(task.getProcessInstanceId(), StrUtil.EMPTY);
                    }
                    iActBusinessStatusService.updateState(actBusinessStatus.getBusinessKey(), BusinessStatusEnum.TERMINATION, task.getProcessInstanceId());
                }
            }.execute(processDefSettingVo, task.getProcessInstanceId(), BusinessStatusEnum.TERMINATION.getStatus());
            return true;
        } catch (Exception e) {
            iActBusinessStatusService.deleteCacheByBusinessKey(processInstance.getBusinessKey());
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * @description: 通用待办任务分页
     * @param: wrapper   查询条件
     * @param: pageQuery 分页
     * @param: assignee  办理人
     * @param: tableName 业务表名
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.CommonTaskWaitingVo>
     * @author: gssong
     * @date: 2023/3/14 21:37
     */
    @Override
    public TableDataInfo<CommonTaskWaitingVo> getCommonTaskWaitByPage(QueryWrapper<Map<String, Object>> wrapper, PageQuery pageQuery, String assignee, String tableName) {
        if (StringUtils.isBlank(assignee)) {
            assignee = Objects.requireNonNull(getUserId()).toString();
        }
        wrapper.eq("status", BusinessStatusEnum.WAITING.getStatus());
        Page<Map<String, Object>> page = actTaskMapper.getCommonTaskWaitByPage(pageQuery.build(), wrapper, assignee, tableName);
        List<CommonTaskWaitingVo> commonTaskWaitingVoList = CommonTaskWaitingVo.convertToEntity(page.getRecords());
        if (CollUtil.isNotEmpty(commonTaskWaitingVoList)) {
            //流程实例id
            Set<String> processInstanceIds = commonTaskWaitingVoList.stream().map(CommonTaskWaitingVo::getProcInstId).collect(Collectors.toSet());
            //流程定义id
            List<String> processDefinitionIds = commonTaskWaitingVoList.stream().map(CommonTaskWaitingVo::getProcDefId).collect(Collectors.toList());
            //查询流程实例
            List<ProcessInstance> processInstanceList = runtimeService.createProcessInstanceQuery().processInstanceIds(processInstanceIds).list();
            //查询流程定义设置
            List<ActProcessDefSettingVo> processDefSettingLists = iActProcessDefSettingService.getProcessDefSettingByDefIds(processDefinitionIds);
            //办理人
            List<Long> assignees = commonTaskWaitingVoList.stream().filter(e -> StringUtils.isNotBlank(e.getAssignee())).map(e -> Long.valueOf(e.getAssignee())).collect(Collectors.toList());
            //流程发起人
            List<Long> userIds = processInstanceList.stream().map(e -> Long.valueOf(e.getStartUserId())).collect(Collectors.toList());
            if (CollUtil.isNotEmpty(assignees)) {
                userIds.addAll(assignees);
            }
            List<SysUser> userList = iWorkflowUserService.selectListUserByIds(userIds);
            for (CommonTaskWaitingVo commonTaskWaitingVo : commonTaskWaitingVoList) {
                commonTaskWaitingVo.setSuspensionStateName(commonTaskWaitingVo.getSuspensionState() == 1 ? "激活" : "挂起");
                processInstanceList.stream().filter(e -> e.getProcessInstanceId().equals(commonTaskWaitingVo.getProcInstId())).findFirst()
                    .ifPresent(e -> {
                        //流程发起人
                        String startUserId = e.getStartUserId();
                        commonTaskWaitingVo.setStartUserId(startUserId);
                        if (StringUtils.isNotBlank(startUserId) && CollUtil.isNotEmpty(userList)) {
                            userList.stream().filter(u -> u.getUserId().toString().equals(startUserId)).findFirst().ifPresent(u -> {
                                commonTaskWaitingVo.setStartUserNickName(u.getNickName());
                            });
                        }
                        commonTaskWaitingVo.setProcessDefinitionVersion(e.getProcessDefinitionVersion());
                        commonTaskWaitingVo.setProcessDefinitionName(e.getProcessDefinitionName());
                        commonTaskWaitingVo.setProcessDefinitionKey(e.getProcessDefinitionKey());
                    });
                // 查询流程定义设置
                processDefSettingLists.stream().filter(e -> e.getProcessDefinitionId().equals(commonTaskWaitingVo.getProcDefId())).findFirst()
                    .ifPresent(commonTaskWaitingVo::setActProcessDefSetting);

                //认领与归还标识
                List<HistoricIdentityLink> identityLinkList = WorkflowUtils.getCurrentTaskApprover(commonTaskWaitingVo.getId());
                if (CollectionUtil.isNotEmpty(identityLinkList)) {
                    List<String> collectType = identityLinkList.stream().map(HistoricIdentityLink::getType).collect(Collectors.toList());
                    if (StringUtils.isBlank(commonTaskWaitingVo.getAssignee()) && collectType.size() > 1 && collectType.contains(FlowConstant.CANDIDATE)) {
                        commonTaskWaitingVo.setIsClaim(false);
                    } else if (StringUtils.isNotBlank(commonTaskWaitingVo.getAssignee()) && collectType.size() > 1 && collectType.contains(FlowConstant.CANDIDATE)) {
                        commonTaskWaitingVo.setIsClaim(true);
                    }
                }
                //办理人
                if (CollUtil.isNotEmpty(userList)) {
                    userList.stream().filter(t -> StringUtils.isNotBlank(commonTaskWaitingVo.getAssignee()))
                        .findFirst().ifPresent(t -> {
                            commonTaskWaitingVo.setAssignee(t.getNickName());
                            commonTaskWaitingVo.setAssigneeId(t.getUserId());
                        });
                }

            }

        }

        return TableDataInfo.build(commonTaskWaitingVoList, page.getTotal());
    }

    /**
     * @description: 通用已办任务分页
     * @param: wrapper   查询条件
     * @param: pageQuery 分页
     * @param: assignee  办理人
     * @param: tableName 业务表名
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.CommonTaskFinishVo>
     * @author: gssong
     * @date: 2023/3/15 21:36
     */
    @Override
    public TableDataInfo<CommonTaskFinishVo> getCommonTaskFinishByPage(QueryWrapper<Map<String, Object>> wrapper, PageQuery pageQuery, String assignee, String tableName) {
        if (StringUtils.isBlank(assignee)) {
            assignee = Objects.requireNonNull(getUserId()).toString();
        }
        Page<Map<String, Object>> page = actTaskMapper.getCommonTaskFinishByPage(pageQuery.build(), wrapper, assignee, tableName);
        List<CommonTaskFinishVo> commonTaskFinishVoList = CommonTaskFinishVo.convertToEntity(page.getRecords());
        if (CollectionUtil.isNotEmpty(commonTaskFinishVoList)) {
            //办理人id集合
            List<Long> assigneeList = commonTaskFinishVoList.stream().filter(e -> StringUtils.isNotBlank(e.getAssignee())).map(e -> Long.valueOf(e.getAssignee())).collect(Collectors.toList());
            //流程定义id集合
            Set<String> processDefinitionIds = commonTaskFinishVoList.stream().map(CommonTaskFinishVo::getProcDefId).collect(Collectors.toSet());
            //流程定义
            List<ProcessDefinition> processDefinitions = repositoryService.createProcessDefinitionQuery().processDefinitionIds(processDefinitionIds).list();
            //办理人
            List<SysUser> userList = iWorkflowUserService.selectListUserByIds(assigneeList);

            if (CollectionUtil.isNotEmpty(commonTaskFinishVoList)) {
                for (CommonTaskFinishVo commonTaskFinishVo : commonTaskFinishVoList) {
                    processDefinitions.stream().filter(e -> e.getId().equals(commonTaskFinishVo.getProcDefId())).findFirst().ifPresent(e -> {
                        commonTaskFinishVo.setProcessDefinitionName(e.getName());
                        commonTaskFinishVo.setProcessDefinitionKey(e.getKey());
                        commonTaskFinishVo.setProcessDefinitionVersion(e.getVersion());
                    });
                    userList.stream().filter(e -> e.getUserId().toString().equals(commonTaskFinishVo.getAssignee())).findFirst().ifPresent(e -> {
                        commonTaskFinishVo.setAssignee(e.getNickName());
                        commonTaskFinishVo.setAssigneeId(e.getUserId());
                    });
                }
            }
        }
        return TableDataInfo.build(commonTaskFinishVoList, page.getTotal());
    }

    /**
     * 催办-给当前待办人员发送站内信，邮件，短信等
     *
     * @param processInstanceId 流程实例id
     * @param sendMessage       消息内容
     */
    @Override
    public boolean urgentHandle(String processInstanceId, SendMessage sendMessage) {
        try {
            List<Task> list = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
            sendMessage(sendMessage, list, processInstance.getName());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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

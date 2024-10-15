package com.ruoyi.workflow.utils;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.workflow.common.enums.BusinessStatusEnum;
import com.ruoyi.workflow.common.enums.TaskStatusEnum;
import com.ruoyi.workflow.domain.ActNodeAssignee;
import com.ruoyi.workflow.domain.ActProcessNodeAssignee;
import com.ruoyi.workflow.domain.ActTaskNode;
import com.ruoyi.workflow.domain.bo.TaskCompleteBo;
import com.ruoyi.workflow.domain.vo.ProcessNodePath;
import com.ruoyi.workflow.listener.AbstractExecuteTaskHandler;
import com.ruoyi.workflow.service.IActBusinessStatusService;
import com.ruoyi.workflow.service.IActNodeAssigneeService;
import com.ruoyi.workflow.service.IActProcessNodeAssigneeService;
import com.ruoyi.workflow.service.IActTaskNodeService;
import com.ruoyi.workflow.service.impl.ActBusinessStatusServiceImpl;
import com.ruoyi.workflow.service.impl.ActNodeAssigneeServiceImpl;
import com.ruoyi.workflow.service.impl.ActProcessNodeAssigneeServiceImpl;
import com.ruoyi.workflow.service.impl.ActTaskNodeServiceImpl;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.task.api.Task;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static com.ruoyi.common.helper.LoginHelper.getUserId;

/**
 * @description: 办理任务(申请人选择全部办理人后续审批人不再选择审批人)
 * @author: gssong
 * @date: 2022/12/20
 */
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class CompleteTaskUtils {

    private static final TaskService taskService = SpringUtils.getBean(TaskService.class);
    private static final RuntimeService runtimeService = SpringUtils.getBean(RuntimeService.class);
    private static final IActProcessNodeAssigneeService iActProcessNodeAssigneeService = SpringUtils.getBean(ActProcessNodeAssigneeServiceImpl.class);
    private static final IActTaskNodeService iActTaskNodeService = SpringUtils.getBean(ActTaskNodeServiceImpl.class);
    private static final IActNodeAssigneeService iActNodeAssigneeService = SpringUtils.getBean(ActNodeAssigneeServiceImpl.class);
    private static final IActBusinessStatusService iActBusinessStatusService = SpringUtils.getBean(ActBusinessStatusServiceImpl.class);

    /**
     * @description: 办理任务
     * @param: taskCompleteBo
     * @return: boolean
     * @author: gssong
     * @date: 2022/12/20
     */
    public static boolean execute(TaskCompleteBo taskCompleteBo) {
        // 1.查询任务
        Task task = taskService.createTaskQuery().taskId(taskCompleteBo.getTaskId()).taskAssignee(getUserId().toString()).singleResult();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
        List<ActNodeAssignee> actNodeAssignees = iActNodeAssigneeService.getInfoByProcessDefinitionId(task.getProcessDefinitionId());

        if (CollUtil.isNotEmpty(taskCompleteBo.getProcessNodeList()) && taskCompleteBo.getDefaultProcess()) {
            iActProcessNodeAssigneeService.deleteByProcessInstanceId(task.getProcessInstanceId());
            List<ActProcessNodeAssignee> processNodeAssigneeList = new ArrayList<>();
            for (ProcessNodePath processNodePath : taskCompleteBo.getProcessNodeList()) {
                ActProcessNodeAssignee actProcessNodeAssignee = new ActProcessNodeAssignee();
                actProcessNodeAssignee.setProcessDefinitionId(task.getProcessDefinitionId());
                actProcessNodeAssignee.setProcessInstanceId(task.getProcessInstanceId());
                actProcessNodeAssignee.setNodeId(processNodePath.getNodeId());
                actProcessNodeAssignee.setAssigneeId(processNodePath.getTransactorId());
                actProcessNodeAssignee.setAssignee(processNodePath.getTransactor());
                actProcessNodeAssignee.setNodeName(processNodePath.getNodeName());
                actProcessNodeAssignee.setMultiple(processNodePath.getMultiple());
                if (Boolean.TRUE.equals(processNodePath.getMultiple())) {
                    actProcessNodeAssignee.setMultipleColumn(processNodePath.getMultipleColumn());
                }
                processNodeAssigneeList.add(actProcessNodeAssignee);
            }
            String nodeNames = processNodeAssigneeList.stream().filter(e -> StringUtils.isBlank(e.getAssigneeId())).map(ActProcessNodeAssignee::getNodeName).collect(Collectors.joining(StringUtils.SEPARATOR));
            if (StringUtils.isNotBlank(nodeNames)) {
                throw new ServiceException(nodeNames + "审批环节未设置审批人");
            }
            iActProcessNodeAssigneeService.insertBatch(processNodeAssigneeList);
        }
        List<ActTaskNode> taskNodes = iActTaskNodeService.getListByInstanceId(task.getProcessInstanceId());
        if (CollUtil.isNotEmpty(taskCompleteBo.getProcessNodeList()) && CollUtil.isEmpty(taskNodes)) {
            List<ActProcessNodeAssignee> processNodeAssignees = iActProcessNodeAssigneeService.queryByProcessInstanceId(task.getProcessInstanceId());
            List<ActProcessNodeAssignee> assigneeList = processNodeAssignees.stream().filter(ActProcessNodeAssignee::getMultiple).collect(Collectors.toList());
            if (CollUtil.isNotEmpty(assigneeList)) {
                assigneeList.forEach(e -> {
                    taskService.setVariable(task.getId(), e.getMultipleColumn(), Arrays.asList(e.getAssigneeId().split(",")));
                });
            }
            ActNodeAssignee actNodeAssignee = actNodeAssignees.stream().filter(e -> e.getNodeId().equals(task.getTaskDefinitionKey())).findFirst().orElse(null);
            if (ObjectUtil.isNull(actNodeAssignee)) {
                throw new ServiceException("请检查【" + task.getName() + "】节点配置");
            }
            //办理任务
            new AbstractExecuteTaskHandler() {
                @Override
                protected void executeHandler() {
                    taskService.setAssignee(task.getId(), LoginHelper.getUserId().toString());
                    taskService.addComment(taskCompleteBo.getTaskId(), task.getProcessInstanceId(), TaskStatusEnum.PASS.getStatus(), taskCompleteBo.getMessage());
                    taskService.complete(task.getId());
                    iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.WAITING, task.getProcessInstanceId());
                    WorkflowUtils.recordExecuteNode(task, actNodeAssignee);
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
                }
            }.execute(actNodeAssignee, task);
            List<Task> taskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
            if (CollUtil.isNotEmpty(taskList)) {
                setAssignee(processNodeAssignees, taskList);
            }
            autoComplete(task.getProcessInstanceId(), processInstance.getBusinessKey(), processNodeAssignees, actNodeAssignees);
            return true;
        } else {
            List<ActProcessNodeAssignee> processNodeAssignees = iActProcessNodeAssigneeService.queryByProcessInstanceId(task.getProcessInstanceId());
            ActNodeAssignee actNodeAssignee = actNodeAssignees.stream().filter(e -> e.getNodeId().equals(task.getTaskDefinitionKey())).findFirst().orElse(null);
            if (ObjectUtil.isNull(actNodeAssignee)) {
                throw new ServiceException("请检查【" + task.getName() + "】节点配置");
            }
            //办理任务
            new AbstractExecuteTaskHandler() {
                @Override
                protected void executeHandler() {
                    taskService.addComment(taskCompleteBo.getTaskId(), task.getProcessInstanceId(), TaskStatusEnum.PASS.getStatus(), taskCompleteBo.getMessage());
                    taskService.complete(task.getId());
                    WorkflowUtils.recordExecuteNode(task, actNodeAssignee);
                    List<Task> taskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
                    // 抄送
                    if (Boolean.TRUE.equals(taskCompleteBo.getIsCopy())) {
                        if (StringUtils.isBlank(taskCompleteBo.getAssigneeIds())) {
                            throw new ServiceException("抄送人不能为空 ");
                        }
                        TaskEntity newTask = WorkflowUtils.createNewTask(task, false);
                        taskService.addComment(newTask.getId(), task.getProcessInstanceId(), TaskStatusEnum.COPY.getStatus(),
                            LoginHelper.getNickname() + "【抄送】给" + taskCompleteBo.getAssigneeNames());
                        taskService.complete(newTask.getId());
                        WorkflowUtils.createSubTask(taskList, taskCompleteBo.getAssigneeIds());
                    }
                    if (!CollUtil.isNotEmpty(taskList)) {
                        iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.FINISH, task.getProcessInstanceId());
                    }
                }
            }.execute(actNodeAssignee, task);

            List<Task> taskList = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
            if (CollUtil.isNotEmpty(taskList)) {
                setAssignee(processNodeAssignees, taskList);
                autoComplete(task.getProcessInstanceId(), processInstance.getBusinessKey(), processNodeAssignees, actNodeAssignees);
                return true;
            } else {
                return iActBusinessStatusService.updateState(processInstance.getBusinessKey(), BusinessStatusEnum.FINISH, task.getProcessInstanceId()) != null;
            }
        }
    }

    /**
     * @description: 自动办理
     * @param: processInstanceId
     * @param: businessKey
     * @param: processNodeAssigneeList
     * @param: actNodeAssignees
     * @return: void
     * @author: gssong
     * @date: 2023/2/12 17:12
     */
    private static void autoComplete(String processInstanceId, String businessKey, List<ActProcessNodeAssignee> processNodeAssigneeList, List<ActNodeAssignee> actNodeAssignees) {
        List<Task> taskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        if (CollectionUtil.isEmpty(taskList)) {
            iActBusinessStatusService.updateState(businessKey, BusinessStatusEnum.FINISH, processInstanceId);
        }
        List<Task> list = taskService.createTaskQuery().processInstanceId(processInstanceId).taskCandidateOrAssigned(String.valueOf(LoginHelper.getUserId())).list();
        if (CollectionUtil.isEmpty(list)) {
            return;
        }
        for (Task task : list) {
            ActNodeAssignee actNodeAssignee = actNodeAssignees.stream().filter(e -> e.getNodeId().equals(task.getTaskDefinitionKey())).findFirst().orElse(null);
            if (ObjectUtil.isNull(actNodeAssignee)) {
                throw new ServiceException("请检查【" + task.getName() + "】节点配置");
            }
            if (Boolean.FALSE.equals(actNodeAssignee.getAutoComplete())) {
                return;
            }
            if (StringUtils.isBlank(task.getAssignee())) {
                taskService.claim(task.getId(), LoginHelper.getUserId().toString());
                task.setAssignee(LoginHelper.getUserId().toString());
            }
            //办理任务
            new AbstractExecuteTaskHandler() {
                @Override
                protected void executeHandler() {
                    taskService.addComment(task.getId(), task.getProcessInstanceId(), TaskStatusEnum.PASS.getStatus(), "流程引擎满足条件自动办理");
                    taskService.complete(task.getId());
                    WorkflowUtils.recordExecuteNode(task, actNodeAssignee);
                    List<Task> taskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
                    if (CollectionUtil.isEmpty(taskList)) {
                        iActBusinessStatusService.updateState(businessKey, BusinessStatusEnum.FINISH, processInstanceId);
                    }
                }
            }.execute(actNodeAssignee, task);
        }
        List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        if (CollUtil.isNotEmpty(tasks)) {
            setAssignee(processNodeAssigneeList, tasks);
        }
        autoComplete(processInstanceId, businessKey, processNodeAssigneeList, actNodeAssignees);
    }


    /**
     * @description: 设置人员
     * @param: processNodeAssignees
     * @param: taskList
     * @return: void
     * @author: gssong
     * @date: 2022/12/20
     */
    private static void setAssignee(List<ActProcessNodeAssignee> processNodeAssignees, List<Task> taskList) {
        for (Task t : taskList) {
            processNodeAssignees.stream().filter(e -> e.getNodeId().equals(t.getTaskDefinitionKey()) && !e.getMultiple()).findFirst().ifPresent(e -> {
                String[] userIds = e.getAssigneeId().split(StringUtils.SEPARATOR);
                if (userIds.length == 1) {
                    taskService.setAssignee(t.getId(), userIds[0]);
                } else {
                    for (String userId : userIds) {
                        taskService.addCandidateUser(t.getId(), userId);
                    }
                }
            });
        }
    }
}

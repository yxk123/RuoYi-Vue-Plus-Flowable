package com.ruoyi.workflow.listener;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.common.utils.JsonUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.workflow.common.constant.FlowConstant;
import com.ruoyi.workflow.domain.ActNodeAssignee;
import com.ruoyi.workflow.domain.vo.TaskListenerVo;
import com.ruoyi.workflow.utils.WorkflowUtils;
import org.flowable.task.api.Task;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @description: 执行节点任务
 * @author: gssong
 * @date: 2023/02/12 16:29
 */
public abstract class AbstractExecuteTaskHandler {

    /**
     * 执行方法
     */
    protected abstract void executeHandler();

    public void execute(ActNodeAssignee actNodeAssignee, Task task) {
        // 任务前执行集合
        List<TaskListenerVo> handleBeforeList = null;
        // 任务后执行集合
        List<TaskListenerVo> handleAfterList = null;
        if (ObjectUtil.isNotEmpty(actNodeAssignee) && StringUtils.isNotBlank(actNodeAssignee.getTaskListener())) {
            List<TaskListenerVo> taskListenerVos = JsonUtils.parseArray(actNodeAssignee.getTaskListener(), TaskListenerVo.class);
            handleBeforeList = taskListenerVos.stream().filter(e -> FlowConstant.HANDLE_BEFORE.equals(e.getEventType())).collect(Collectors.toList());
            handleAfterList = taskListenerVos.stream().filter(e -> FlowConstant.HANDLE_AFTER.equals(e.getEventType())).collect(Collectors.toList());
        }
        // 任务前执行
        if (CollUtil.isNotEmpty(handleBeforeList)) {
            for (TaskListenerVo taskListenerVo : handleBeforeList) {
                WorkflowUtils.springInvokeMethod(taskListenerVo.getBeanName(), FlowConstant.HANDLE_BEFORE_PROCESS
                    , task.getProcessInstanceId(), task.getId());
            }
        }
        // 执行方法
        executeHandler();
        // 任务后执行
        if (CollUtil.isNotEmpty(handleAfterList)) {
            for (TaskListenerVo taskListenerVo : handleAfterList) {
                WorkflowUtils.springInvokeMethod(taskListenerVo.getBeanName(), FlowConstant.HANDLE_AFTER_PROCESS
                    , task.getProcessInstanceId());
            }
        }
    }
}

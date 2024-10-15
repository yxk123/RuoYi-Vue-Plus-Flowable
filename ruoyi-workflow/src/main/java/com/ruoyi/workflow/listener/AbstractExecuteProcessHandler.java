package com.ruoyi.workflow.listener;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.common.utils.JsonUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.workflow.common.constant.FlowConstant;
import com.ruoyi.workflow.domain.vo.ActProcessDefSettingVo;
import com.ruoyi.workflow.utils.WorkflowUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @description: 执行节点任务
 * @author: gssong
 * @date: 2023/02/12 16:29
 */
public abstract class AbstractExecuteProcessHandler {

    /**
     * 执行方法
     */
    protected abstract void executeHandler();

    public void execute(ActProcessDefSettingVo actProcessDefSettingVo, String processInstanceId, String status) {
        // 任务前执行集合
        List<ActProcessDefSettingVo.TaskListener> handleBeforeList = null;
        // 任务后执行集合
        List<ActProcessDefSettingVo.TaskListener> handleAfterList = null;
        if (ObjectUtil.isNotEmpty(actProcessDefSettingVo) && StringUtils.isNotBlank(actProcessDefSettingVo.getTaskListener())) {
            List<ActProcessDefSettingVo.TaskListener> taskListeners = JsonUtils.parseArray(actProcessDefSettingVo.getTaskListener(), ActProcessDefSettingVo.TaskListener.class);
            handleBeforeList = taskListeners.stream().filter(e -> FlowConstant.HANDLE_BEFORE.equals(e.getEventType())).collect(Collectors.toList());
            handleAfterList = taskListeners.stream().filter(e -> FlowConstant.HANDLE_AFTER.equals(e.getEventType())).collect(Collectors.toList());
        }
        // 任务前执行
        if (CollUtil.isNotEmpty(handleBeforeList)) {
            for (ActProcessDefSettingVo.TaskListener taskListenerVo : handleBeforeList) {
                // 在驳回中 当前审批人驳回的不是当前流程的第一个节点（申请人节点） 任务不会执行
                if (taskListenerVo.getStatus().contains(status)) {
                    WorkflowUtils.springInvokeMethod(taskListenerVo.getBeanName(), FlowConstant.HANDLE_PROCESS, processInstanceId, status);
                }
            }
        }
        // 执行方法
        executeHandler();
        // 任务后执行
        if (CollUtil.isNotEmpty(handleAfterList)) {
            for (ActProcessDefSettingVo.TaskListener taskListenerVo : handleAfterList) {
                // 在驳回中 当前审批人驳回的不是当前流程的第一个节点（申请人节点） 任务不会执行
                if (taskListenerVo.getStatus().contains(status)) {
                    WorkflowUtils.springInvokeMethod(taskListenerVo.getBeanName(), FlowConstant.HANDLE_PROCESS, processInstanceId, status);
                }
            }
        }
    }
}

package com.ruoyi.workflow.flowable.cmd;

import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.task.service.TaskService;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * @description: 修改待办任务创建时间
 * @author: gssong
 * @date: 2023/07/08 21:26
 */
public class SetCreateTimeTaskCmd implements Command<Boolean>, Serializable {

    private final String taskId;

    public SetCreateTimeTaskCmd(String taskId) {
        this.taskId = taskId;
    }

    @Override
    public Boolean execute(CommandContext commandContext) {
        ProcessEngineConfigurationImpl processEngineConfiguration = CommandContextUtil.getProcessEngineConfiguration(commandContext);
        TaskService taskService = processEngineConfiguration.getTaskServiceConfiguration().getTaskService();
        TaskEntity task = taskService.getTask(taskId);
        task.setCreateTime(new Date());
        taskService.updateTask(task, true);
        return true;
    }
}

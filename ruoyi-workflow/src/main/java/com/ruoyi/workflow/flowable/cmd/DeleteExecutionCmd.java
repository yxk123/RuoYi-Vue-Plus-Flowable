package com.ruoyi.workflow.flowable.cmd;

import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.impl.persistence.entity.ExecutionEntity;
import org.flowable.engine.impl.persistence.entity.ExecutionEntityManager;
import org.flowable.engine.impl.util.CommandContextUtil;

import java.io.Serializable;

/**
 * @description: 删除执行数据
 * @author: gssong
 * @date: 2022/4/15 20:30
 */
public class DeleteExecutionCmd implements Command<Void>, Serializable {

    /**
     * 执行id
     */
    private final String executionId;

    public DeleteExecutionCmd(String executionId) {
        this.executionId = executionId;
    }

    @Override
    public Void execute(CommandContext commandContext) {
        ExecutionEntityManager executionEntityManager = CommandContextUtil.getExecutionEntityManager();
        ExecutionEntity entity = executionEntityManager.findById(executionId);
        if (entity != null) {
            executionEntityManager.deleteExecutionAndRelatedData(entity, "", false, false);
        }
        return null;
    }
}

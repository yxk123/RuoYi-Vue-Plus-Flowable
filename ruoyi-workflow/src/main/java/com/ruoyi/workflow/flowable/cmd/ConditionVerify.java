package com.ruoyi.workflow.flowable.cmd;

import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import com.ruoyi.workflow.service.IActGatewayConditionService;
import com.ruoyi.workflow.service.impl.ActGatewayConditionServiceImpl;
import com.ruoyi.workflow.utils.ConditionBuildUtils;
import org.flowable.common.engine.api.delegate.Expression;
import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.ManagementService;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.ManagementServiceImpl;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * @description: 网关校验
 * @author: gssong
 * @date: 2023/03/28 18:36
 */
@Component
public class ConditionVerify {


    public Boolean verifyExpression(DelegateExecution execution, String sequenceId) {
        IActGatewayConditionService iActGatewayConditionService = SpringUtils.getBean(ActGatewayConditionServiceImpl.class);
        ManagementService managementService = SpringUtils.getBean(ManagementServiceImpl.class);
        ActGatewayConditionVo actGatewayConditionVo = iActGatewayConditionService.queryByProcessDefinitionIdAndSequenceId(execution.getProcessDefinitionId(), sequenceId);
        if (actGatewayConditionVo == null) {
            throw new SecurityException("网关条件为空，请检查配置");
        }
        List<ActGatewayConditionVo.ConditionList> gatewayConditionList = actGatewayConditionVo.getGatewayConditionList();
        StringBuilder builder = ConditionBuildUtils.conditionBuild(gatewayConditionList);
        ExpressVerify expressVerify = new ExpressVerify(Objects.requireNonNull(builder).toString(), execution);
        return managementService.executeCommand(expressVerify);
    }

    /**
     * 校验条件
     */
    public static class ExpressVerify implements Command<Boolean>, Serializable {

        private final String conditionExpression;

        private final DelegateExecution delegateExecution;

        public ExpressVerify(String conditionExpression, DelegateExecution delegateExecution) {
            this.conditionExpression = conditionExpression;
            this.delegateExecution = delegateExecution;
        }

        @Override
        public Boolean execute(CommandContext commandContext) {
            ProcessEngineConfigurationImpl processEngineConfiguration = SpringUtils.getBean(ProcessEngineConfigurationImpl.class);
            Expression expression = processEngineConfiguration.getExpressionManager().createExpression(this.conditionExpression);
            Object result = expression.getValue(delegateExecution);
            return (Boolean) result;
        }

    }
}

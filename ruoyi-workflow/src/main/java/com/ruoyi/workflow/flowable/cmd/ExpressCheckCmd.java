package com.ruoyi.workflow.flowable.cmd;

import cn.hutool.core.collection.CollUtil;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import com.ruoyi.workflow.service.IActGatewayConditionService;
import com.ruoyi.workflow.service.impl.ActGatewayConditionServiceImpl;
import com.ruoyi.workflow.utils.ConditionBuildUtils;
import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.ManagementService;
import org.flowable.engine.impl.ManagementServiceImpl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @description: 校验流程变量
 * @author: gssong
 * @date: 2022/8/22 18:26
 */
public class ExpressCheckCmd implements Command<Boolean>, Serializable {

    private final String conditionExpression;

    private final Map<String, Object> variableMap;

    private final String sequenceFlowId;

    private final String processDefinitionId;

    public ExpressCheckCmd(String conditionExpression, Map<String, Object> variableMap, String sequenceFlowId, String processDefinitionId) {
        this.conditionExpression = conditionExpression;
        this.variableMap = variableMap;
        this.sequenceFlowId = sequenceFlowId;
        this.processDefinitionId = processDefinitionId;
    }

    @Override
    public Boolean execute(CommandContext commandContext) {
        if (CollUtil.isEmpty(variableMap)) {
            return false;
        }
        ManagementService managementService = SpringUtils.getBean(ManagementServiceImpl.class);
        if (conditionExpression.contains("conditionVerify.verifyExpression")) {
            IActGatewayConditionService iActGatewayConditionService = SpringUtils.getBean(ActGatewayConditionServiceImpl.class);
            ActGatewayConditionVo actGatewayConditionVo = iActGatewayConditionService.queryByProcessDefinitionIdAndSequenceId(processDefinitionId, sequenceFlowId);
            if (actGatewayConditionVo == null) {
                throw new SecurityException("网关条件为空，请检查配置");
            }
            List<ActGatewayConditionVo.ConditionList> gatewayConditionList = actGatewayConditionVo.getGatewayConditionList();
            StringBuilder builder = ConditionBuildUtils.conditionBuild(gatewayConditionList);
            ExpressVariableCmd expressVerify = new ExpressVariableCmd(builder.toString(), variableMap);
            return managementService.executeCommand(expressVerify);
        } else {
            ExpressVariableCmd expressVerify = new ExpressVariableCmd(conditionExpression, variableMap);
            return managementService.executeCommand(expressVerify);
        }
    }

}

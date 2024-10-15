package com.ruoyi.workflow.utils;

import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

import static com.ruoyi.workflow.common.constant.FlowConstant.*;

/**
 * @description: 网关条件组装
 * @author: gssong
 * @date: 2023/04/07 18:10
 */
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ConditionBuildUtils {

    /**
     * 条件构建
     *
     * @param gatewayConditionList 条件
     */
    public static StringBuilder conditionBuild(List<ActGatewayConditionVo.ConditionList> gatewayConditionList) {
        StringBuilder builder = new StringBuilder();
        builder.append("${");
        int i = 0;
        for (ActGatewayConditionVo.ConditionList conditionList : gatewayConditionList) {
            i ++;
            List<ActGatewayConditionVo.RuleList> ruleList = conditionList.getRuleList();
            if (gatewayConditionList.size() > 1) {
                builder.append("(");
            }
            for (ActGatewayConditionVo.RuleList rule : ruleList) {
                if (CONTAINS.equals(rule.getSymbol())) {
                    String format = String.format(STR_CONTAINS, rule.getVariable(), rule.getVariableValue());
                    builder.append(format).append("||");
                } else if (NOT_CONTAINS.equals(rule.getSymbol())) {
                    String format = String.format(STR_NOT_CONTAINS, rule.getVariable(), rule.getVariableValue());
                    builder.append(format).append("||");
                } else {
                    builder.append(rule.getVariable()).append(rule.getSymbol()).append(Boolean.TRUE.equals(rule.getIsStr()) ? String.format(STR_EQUALS, rule.getVariableValue()) : new BigDecimal(rule.getVariableValue())).append("||");
                }
            }
            builder = new StringBuilder(builder.substring(0, builder.length() - 2));
            if (gatewayConditionList.size() > 1) {
                builder.append(")&&");
                if(gatewayConditionList.size() == i){
                    builder = new StringBuilder(builder.substring(0, builder.length() - 2));
                }
            }
        }
        builder.append("}");
        return builder;
    }
}

package com.ruoyi.workflow.domain.vo;

import cn.hutool.core.lang.Dict;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;


/**
 * 网关条件视图对象 act_gateway_condition
 *
 * @author gssong
 * @date 2023-03-25
 */
@Data
@ExcelIgnoreUnannotated
public class ActGatewayConditionVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 条件
     */
    @ExcelProperty(value = "条件")
    private String conditionJson;

    /**
     * 流程定义key
     */
    @ExcelProperty(value = "流程定义key")
    private String processDefinitionKey;


    /**
     * 条件
     */
    private List<ConditionList> gatewayConditionList;


    @Data
    public static class ConditionList implements Serializable {

        private static final long serialVersionUID = 1L;

        /**
         * 规则名称
         */
        private String ruleName;

        /**
         * 规则
         */
        private List<RuleList> ruleList;
    }

    @Data
    public static class RuleList implements Serializable{

        private static final long serialVersionUID = 1L;

        /**
         * 变量
         */
        private String variable;

        /**
         * 操作符
         */
        private String symbol;

        /**
         * 可选择的操作符
         */
        private List<Dict> symbolList;

        /**
         * 变量值
         */
        private String variableValue;

        /**
         * 是否字符串
         */
        private Boolean isStr;
    }
}

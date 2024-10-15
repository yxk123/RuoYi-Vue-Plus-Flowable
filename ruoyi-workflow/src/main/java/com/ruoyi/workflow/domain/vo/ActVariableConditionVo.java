package com.ruoyi.workflow.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;



/**
 * 网关变量条件视图对象 act_variable_condition
 *
 * @author gssong
 * @date 2023-02-10
 */
@Data
@ExcelIgnoreUnannotated
public class ActVariableConditionVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 变量名称
     */
    @ExcelProperty(value = "变量名称")
    private String variableName;

    /**
     * 变量
     */
    @ExcelProperty(value = "变量")
    private String variable;

    /**
     * 操作符
     */
    @ExcelProperty(value = "条件")
    private String symbol;

    /**
     * 流程定义key
     */
    @ExcelProperty(value = "流程定义key")
    private String processDefinitionKey;

    /**
     * 是否字符串
     */
    @ExcelProperty(value = "是否字符串")
    private Boolean isStr;


}

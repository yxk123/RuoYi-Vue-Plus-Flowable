package com.ruoyi.workflow.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 网关变量条件对象 act_variable_condition
 *
 * @author gssong
 * @date 2023-02-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("act_variable_condition")
public class ActVariableCondition extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 变量名称
     */
    private String variableName;
    /**
     * 变量
     */
    private String variable;
    /**
     * 操作符
     */
    private String symbol;
    /**
     * 流程定义key
     */
    private String processDefinitionKey;
    /**
     * 是否字符串
     */
    private Boolean isStr;

}

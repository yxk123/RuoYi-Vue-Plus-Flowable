package com.ruoyi.workflow.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 网关条件对象 act_gateway_condition
 *
 * @author gssong
 * @date 2023-03-25
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("act_gateway_condition")
public class ActGatewayCondition extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 备注
     */
    private String remark;
    /**
     * 条件
     */
    private String conditionJson;
    /**
     * 流程定义key
     */
    private String processDefinitionKey;

}

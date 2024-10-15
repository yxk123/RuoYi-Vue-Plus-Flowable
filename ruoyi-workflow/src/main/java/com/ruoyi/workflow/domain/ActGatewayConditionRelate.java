package com.ruoyi.workflow.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 网关条件关联网关节点对象 act_gateway_condition_relate
 *
 * @author gssong
 * @date 2023-03-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("act_gateway_condition_relate")
public class ActGatewayConditionRelate extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 流程定义id
     */
    private String processDefinitionId;
    /**
     * 连线id
     */
    private String sequenceId;
    /**
     * 网关条件id
     */
    private Long gatewayConditionId;

}

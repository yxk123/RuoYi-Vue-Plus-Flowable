package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 网关条件关联网关节点业务对象 act_gateway_condition_relate
 *
 * @author gssong
 * @date 2023-03-30
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ActGatewayConditionRelateBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 流程定义id
     */
    @NotBlank(message = "流程定义id不能为空", groups = { AddGroup.class, EditGroup.class })
    private String processDefinitionId;

    /**
     * 连线id
     */
    @NotBlank(message = "连线id不能为空", groups = { AddGroup.class, EditGroup.class })
    private String sequenceId;

    /**
     * 网关条件id
     */
    @NotNull(message = "网关条件id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long gatewayConditionId;


}

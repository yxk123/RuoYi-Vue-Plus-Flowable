package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 网关条件业务对象 act_gateway_condition
 *
 * @author gssong
 * @date 2023-03-25
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ActGatewayConditionBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    /**
     * 条件
     */
    @NotNull(message = "条件不能为空", groups = { AddGroup.class, EditGroup.class })
    private List<ActGatewayConditionVo.ConditionList> gatewayConditionList;

    /**
     * 流程定义key
     */
    @NotBlank(message = "流程定义key不能为空", groups = { AddGroup.class, EditGroup.class })
    private String processDefinitionKey;


}

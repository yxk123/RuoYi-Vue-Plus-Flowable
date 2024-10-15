package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 网关变量条件业务对象 act_variable_condition
 *
 * @author gssong
 * @date 2023-02-10
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ActVariableConditionBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 变量名称
     */
    @NotBlank(message = "变量名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String variableName;

    /**
     * 变量
     */
    @NotBlank(message = "变量不能为空", groups = { AddGroup.class, EditGroup.class })
    private String variable;

    /**
     * 操作符
     */
    @NotBlank(message = "操作符不能为空", groups = { AddGroup.class, EditGroup.class })
    private String symbol;

    /**
     * 流程定义key
     */
    @NotBlank(message = "流程定义key", groups = { AddGroup.class, EditGroup.class })
    private String processDefinitionKey;

    /**
     * 是否字符串
     */
    @NotNull(message = "是否字符串", groups = { AddGroup.class, EditGroup.class })
    private Boolean isStr;


}

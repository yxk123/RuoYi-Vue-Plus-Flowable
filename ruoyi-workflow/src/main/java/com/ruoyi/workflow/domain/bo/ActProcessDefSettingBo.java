package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.workflow.domain.vo.ActProcessDefSettingVo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;


/**
 * 流程定义设置业务对象 act_process_def_Setting
 *
 * @author gssong
 * @date 2022-08-28
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ActProcessDefSettingBo extends BaseEntity {

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
     * 流程定义key
     */
    @NotBlank(message = "流程定义key不能为空", groups = { AddGroup.class, EditGroup.class })
    private String processDefinitionKey;

    /**
     * 流程定义名称
     */
    @NotBlank(message = "流程定义名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String processDefinitionName;

    /**
     * 表名
     */
    @NotBlank(message = "表名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String tableName;

    /**
     * 组件名称
     */
    @NotBlank(message = "组件名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String componentName;

    /**
     * 备注
     */
    private String remark;

    /**
     * 主键
     */
    private List<Long> settingIds;

    /**
     * true 为申请人选择全部人员  false为审批节点选人
     */
    private Boolean defaultProcess;

    /**
     * 任务监听
     */
    private String taskListener;

    /**
     * 任务监听
     */
    private List<ActProcessDefSettingVo.TaskListener> taskListenerList;


}

package com.ruoyi.workflow.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import java.util.Date;

/**
 * 任务历史对象 act_hi_taskinst
 *
 * @author gssong
 * @date 2023-07-05
 */
@Data
@TableName("act_hi_taskinst")
public class ActHiTaskinst{

    private static final long serialVersionUID=1L;

    /**
     *
     */
    @TableId(value = "ID_")
    private String id;
    /**
     *
     */
    @TableField(value = "REV_")
    private Long rev;
    /**
     *
     */
    @TableField(value = "PROC_DEF_ID_")
    private String procDefId;
    /**
     *
     */
    @TableField(value = "TASK_DEF_ID_")
    private String taskDefId;
    /**
     *
     */
    @TableField(value = "TASK_DEF_KEY_")
    private String taskDefKey;
    /**
     *
     */
    @TableField(value = "PROC_INST_ID_")
    private String procInstId;
    /**
     *
     */
    @TableField(value = "EXECUTION_ID_")
    private String executionId;
    /**
     *
     */
    @TableField(value = "SCOPE_ID_")
    private String scopeId;
    /**
     *
     */
    @TableField(value = "SUB_SCOPE_ID_")
    private String subScopeId;
    /**
     *
     */
    @TableField(value = "SCOPE_TYPE_")
    private String scopeType;
    /**
     *
     */
    @TableField(value = "SCOPE_DEFINITION_ID_")
    private String scopeDefinitionId;
    /**
     *
     */
    @TableField(value = "PROPAGATED_STAGE_INST_ID_")
    private String propagatedStageInstId;
    /**
     *
     */
    @TableField(value = "NAME_")
    private String name;
    /**
     *
     */
    @TableField(value = "PARENT_TASK_ID_")
    private String parentTaskId;
    /**
     *
     */
    @TableField(value = "DESCRIPTION_")
    private String description;
    /**
     *
     */
    @TableField(value = "OWNER_")
    private String owner;
    /**
     *
     */
    @TableField(value = "ASSIGNEE_")
    private String assignee;
    /**
     *
     */
    @TableField(value = "START_TIME_")
    private Date startTime;
    /**
     *
     */
    @TableField(value = "CLAIM_TIME_")
    private Date claimTime;
    /**
     *
     */
    @TableField(value = "END_TIME_")
    private Date endTime;
    /**
     *
     */
    @TableField(value = "DURATION_")
    private Long duration;
    /**
     *
     */
    @TableField(value = "DELETE_REASON_")
    private String deleteReason;
    /**
     *
     */
    @TableField(value = "PRIORITY_")
    private Long priority;
    /**
     *
     */
    @TableField(value = "DUE_DATE_")
    private Date dueDate;
    /**
     *
     */
    @TableField(value = "FORM_KEY_")
    private String formKey;
    /**
     *
     */
    @TableField(value = "CATEGORY_")
    private String category;
    /**
     *
     */
    @TableField(value = "TENANT_ID_")
    private String tenantId;
    /**
     *
     */
    @TableField(value = "LAST_UPDATED_TIME_")
    private Date lastUpdatedTime;

}

package com.ruoyi.workflow.domain.dto;

import lombok.Data;

import java.util.Date;
import java.util.Map;

/**
 * 通用已办视图
 *
 * @author gssong
 * @date 2023-03-15
 */
@Data
public class CommonTaskFinishDTO {
    //工作流已完成数据
    private String ID_;
    private Integer REV_;
    private String PROC_DEF_ID_;
    private String TASK_DEF_ID_;
    private String TASK_DEF_KEY_;
    private String PROC_INST_ID_;
    private String EXECUTION_ID_;
    private String SCOPE_ID_;
    private String SUB_SCOPE_ID_;
    private String SCOPE_TYPE_;
    private String SCOPE_DEFINITION_ID_;
    private String PROPAGATED_STAGE_INST_ID_;
    private String NAME_;
    private String PARENT_TASK_ID_;
    private String DESCRIPTION_;
    private String OWNER_;
    private String ASSIGNEE_;
    private Date START_TIME_;
    private Date CLAIM_TIME_;
    private Date END_TIME_;
    private Integer DURATION_;
    private String DELETE_REASON_;
    private Integer PRIORITY_;
    private Date DUE_DATE_;
    private String FORM_KEY_;
    private String CATEGORY_;
    private String TENANT_ID_;
    private Date LAST_UPDATED_TIME_;

    //单据状态
    private String business_key;
    private String act_business_status_id;
    private String process_instance_id;
    private String status;
    private String table_name;
    private String suspended_reason;

    //业务数据
    private Map<String, Object> businessColumn;
}
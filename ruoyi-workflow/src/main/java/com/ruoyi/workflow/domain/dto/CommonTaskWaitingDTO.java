package com.ruoyi.workflow.domain.dto;

import lombok.Data;

import java.util.*;

/**
 * 通用待办视图
 *
 * @author gssong
 * @date 2023-03-14
 */
@Data
public class CommonTaskWaitingDTO {
    //工作流运行中数据
    private String ID_;
    private Integer REV_;
    private String EXECUTION_ID_;
    private String PROC_INST_ID_;
    private String PROC_DEF_ID_;
    private String TASK_DEF_ID_;
    private String SCOPE_ID_;
    private String SUB_SCOPE_ID_;
    private String SCOPE_TYPE_;
    private String SCOPE_DEFINITION_ID_;
    private String PROPAGATED_STAGE_INST_ID_;
    private String NAME_;
    private String PARENT_TASK_ID_;
    private String DESCRIPTION_;
    private String TASK_DEF_KEY_;
    private String OWNER_;
    private String ASSIGNEE_;
    private String DELEGATION_;
    private Integer PRIORITY_;
    private Date CREATE_TIME_;
    private Date DUE_DATE_;
    private String CATEGORY_;
    private Integer SUSPENSION_STATE_;
    private String TENANT_ID_;
    private String FORM_KEY_;
    private Date CLAIM_TIME_;
    private Integer IS_COUNT_ENABLED_;
    private Integer VAR_COUNT_;
    private Integer ID_LINK_COUNT_;
    private Integer SUB_TASK_COUNT_;

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

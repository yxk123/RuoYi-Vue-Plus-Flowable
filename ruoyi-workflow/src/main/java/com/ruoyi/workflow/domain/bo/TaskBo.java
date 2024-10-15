package com.ruoyi.workflow.domain.bo;

import com.ruoyi.workflow.common.PageEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * @description: 任务请求
 * @author: gssong
 * @date: 2021/10/17 14:50
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class TaskBo extends PageEntity implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 任务名称
     */
    private String taskName;

    /**
     * 业务id
     */
    private String businessKey;

    /**
     * 办理人
     */
    private String assignee;

    /**
     * 流程定义key
     */
    private String processDefinitionKey;

    /**
     * 流程定义名称
     */
    private String processDefinitionName;

}

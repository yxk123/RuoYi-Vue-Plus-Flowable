package com.ruoyi.workflow.domain.bo;

import lombok.Data;

import java.io.Serializable;

/**
 * @description: 终止任务请求
 * @author: gssong
 * @date: 2023/03/17 13:10
 */
@Data
public class TerminationBo implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 任务id
     */
    private String taskId;

    /**
     * 审批意见
     */
    private String comment;
}

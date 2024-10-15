package com.ruoyi.workflow.domain.bo;

import lombok.Data;

/**
 * @description: 修改审批意见bo
 * @author: gssong
 * @date: 2023/03/06 21:22
 */
@Data
public class CommentBo {

    /**
     * 流程实例id
     */
    private String processInstanceId;

    /**
     * 任务id
     */
    private String taskId;

    /**
     * 附件id
     */
    private String fileIds;

    /**
     * 意见id
     */
    private String commentId;

    /**
     * 意见
     */
    private String comment;
}

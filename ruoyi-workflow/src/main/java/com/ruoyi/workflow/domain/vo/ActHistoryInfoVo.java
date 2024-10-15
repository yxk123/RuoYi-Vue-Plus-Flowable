package com.ruoyi.workflow.domain.vo;

import lombok.Data;
import org.flowable.engine.task.Attachment;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @description: 流程审批记录视图
 * @author: gssong
 * @date: 2021/10/16 15:36
 */
@Data
public class ActHistoryInfoVo implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 任务id
     */
    private String id;
    /**
     * 节点id
     */
    private String taskDefinitionKey;
    /**
     * 任务名称
     */
    private String name;
    /**
     * 流程实例id
     */
    private String processInstanceId;
    /**
     * 开始时间
     */
    private Date startTime;
    /**
     * 结束时间
     */
    private Date endTime;
    /**
     * 运行时长
     */
    private String runDuration;
    /**
     * 状态
     */
    private String status;
    /**
     * 状态信息
     */
    private String statusName;
    /**
     * 办理人id
     */
    private String assignee;

    /**
     * 办理人名称
     */
    private String nickName;
    /**
     * 办理人id
     */
    private String owner;
    /**
     * 审批信息id
     */
    private String commentId;
    /**
     * 审批信息
     */
    private String comment;
    /**
     * 审批附件
     */
    private List<Attachment> fileList;
}

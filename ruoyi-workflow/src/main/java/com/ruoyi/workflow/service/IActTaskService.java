package com.ruoyi.workflow.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.workflow.domain.ActTaskNode;
import com.ruoyi.workflow.domain.bo.*;
import com.ruoyi.workflow.domain.bo.BackProcessBo;
import com.ruoyi.workflow.domain.vo.*;

import java.util.List;
import java.util.Map;

/**
 * @description: 任务接口
 * @author: gssong
 * @date: 2021/10/17 14:57
 */
public interface IActTaskService {
    /**
     * 查询待办任务
     *
     * @param taskBo    参数
     * @param pageQuery 分页
     * @return 结果
     */
    TableDataInfo<TaskWaitingVo> getTaskWaitByPage(TaskBo taskBo, PageQuery pageQuery);

    /**
     * 获取各个流程key待办数量 assignee为空时默认查询全部
     *
     * @param assignee 办理人
     * @param status   状态
     * @return 返回每个流程的待办数量
     */
    List<Map<String, Object>> getTaskWaitCount(String status, String assignee);

    /**
     * 查询已办任务
     *
     * @param taskBo 参数
     * @return 结果
     */
    TableDataInfo<TaskFinishVo> getTaskFinishByPage(TaskBo taskBo);


    /**
     * 完成任务
     *
     * @param taskCompleteBo 参数
     * @return 结果
     */
    boolean completeTask(TaskCompleteBo taskCompleteBo);

    /**
     * 获取目标节点（下一个节点）
     *
     * @param nextNodeBo 参数
     * @return 结果
     */
    Map<String, Object> getNextNodeInfo(NextNodeBo nextNodeBo);

    /**
     * 驳回审批
     *
     * @param backProcessBo 参数
     * @return 结果
     */
    String backProcess(BackProcessBo backProcessBo);

    /**
     * 获取历史任务节点，用于驳回功能
     *
     * @param processInstId 流程实例id
     * @return 结果
     */
    List<ActTaskNode> getBackNodes(String processInstId);

    /**
     * 委托
     *
     * @param delegateBo 参数
     * @return 结果
     */
    boolean delegateTask(DelegateBo delegateBo);

    /**
     * 转办任务
     *
     * @param transferBo 参数
     * @return 结果
     */
    boolean transferTask(TransferBo transferBo);

    /**
     * 会签任务加签
     *
     * @param addMultiBo 参数
     * @return 结果
     */
    boolean addMultiInstanceExecution(AddMultiBo addMultiBo);

    /**
     * 会签任务减签
     *
     * @param deleteMultiBo 参数
     * @return 结果
     */
    boolean deleteMultiInstanceExecution(DeleteMultiBo deleteMultiBo);

    /**
     * 修改办理人
     *
     * @param updateAssigneeBo 参数
     * @return 结果
     */
    boolean updateAssignee(UpdateAssigneeBo updateAssigneeBo);


    /**
     * 查询流程变量
     *
     * @param taskId 任务id
     * @return 结果
     */
    List<VariableVo> getProcessInstVariable(String taskId);

    /**
     * 修改审批意见
     *
     * @param commentBo 参数
     * @return 结果
     */
    boolean editComment(CommentBo commentBo);

    /**
     * 删除附件
     *
     * @param contentId 附件id
     * @return 结果
     */
    boolean deleteAttachment(String contentId);

    /**
     * 按照任务id删除附件
     *
     * @param taskId 任务id
     * @return 结果
     */
    boolean deleteAttachmentByTaskId(String taskId);

    /**
     * 终止任务
     *
     * @param terminationBo 参数
     * @return 结果
     */
    boolean terminationTask(TerminationBo terminationBo);


    /**
     * 通用待办任务分页
     *
     * @param wrapper   查询条件
     * @param pageQuery 分页
     * @param assignee  办理人
     * @param tableName 业务表名
     * @return 结果
     */
    TableDataInfo<CommonTaskWaitingVo> getCommonTaskWaitByPage(QueryWrapper<Map<String, Object>> wrapper, PageQuery pageQuery, String assignee, String tableName);

    /**
     * 通用已办任务分页
     *
     * @param wrapper   查询条件
     * @param pageQuery 分页
     * @param assignee  办理人
     * @param tableName 业务表名
     * @return 结果
     */
    TableDataInfo<CommonTaskFinishVo> getCommonTaskFinishByPage(QueryWrapper<Map<String, Object>> wrapper, PageQuery pageQuery, String assignee, String tableName);

    /**
     * 催办-给当前待办人员发送站内信，邮件，短信等
     *
     * @param processInstanceId 流程实例id
     * @param sendMessage       消息内容
     * @return 结果
     */
    boolean urgentHandle(String processInstanceId, SendMessage sendMessage);
}

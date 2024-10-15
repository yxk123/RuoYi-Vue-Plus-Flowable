package com.ruoyi.workflow.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.workflow.domain.ActTaskNode;

import java.util.List;

/**
 * @description: 任务节点接口
 * @author: gssong
 * @date: 2021/11/06 16:27
 */
public interface IActTaskNodeService extends IService<ActTaskNode> {
    /**
     * 按流程实例id查询
     *
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    List<ActTaskNode> getListByInstanceId(String processInstanceId);

    /**
     * 按流程实例id与节点id查询
     *
     * @param processInstanceId 流程实例id
     * @param nodeId            节点id
     * @return 结果
     */
    ActTaskNode getListByInstanceIdAndNodeId(String processInstanceId, String nodeId);

    /**
     * 删除驳回后的节点
     *
     * @param processInstanceId 流程实例id
     * @param targetActivityId  节点id
     * @return 结果
     */
    Boolean deleteBackTaskNode(String processInstanceId, String targetActivityId);

    /**
     * 按流程实例id删除
     *
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    Boolean deleteByInstanceId(String processInstanceId);

    /**
     * 保存完成的节点
     *
     * @param actTaskNode 参数
     * @return 结果
     */
    Boolean saveTaskNode(ActTaskNode actTaskNode);

    /**
     * 启用是否驳回
     *
     * @param actTaskNode 参数
     * @return 结果
     */
    boolean enableStatus(ActTaskNode actTaskNode);
}

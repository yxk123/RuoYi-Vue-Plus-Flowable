package com.ruoyi.workflow.service;

import com.ruoyi.workflow.domain.bo.ActGatewayConditionRelateBo;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionRelateVo;

import java.util.List;


/**
 * 网关条件关联网关节点Service接口
 *
 * @author gssong
 * @date 2023-03-30
 */
public interface IActGatewayConditionRelateService {

    /**
     * 新增网关条件关联网关节点
     *
     * @param bo 参数
     * @return 结果
     */
    Boolean save(ActGatewayConditionRelateBo bo);

    /**
     * 删除网关条件
     *
     * @param processDefinitionId 流程定义id
     * @return 结果
     */
    Boolean deleteByProcessDefinitionId(String processDefinitionId);

    /**
     * 删除网关条件关联网关节点
     *
     * @param processDefinitionId 流程定义id
     * @param sequenceId          连接id
     * @return 结果
     */
    Boolean del(String processDefinitionId, String sequenceId);

    /**
     * 查询网关条件
     *
     * @param processDefinitionId 流程定义id
     * @return 结果
     */
    List<ActGatewayConditionRelateVo> getInfoByProcessDefinitionId(String processDefinitionId);
}

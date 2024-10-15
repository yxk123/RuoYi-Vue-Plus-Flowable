package com.ruoyi.workflow.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.workflow.domain.ActNodeAssignee;
import com.ruoyi.workflow.domain.bo.ActNodeAssigneeBo;
import com.ruoyi.workflow.domain.vo.ActNodeAssigneeVo;

import java.util.List;


/**
 * @description: 流程节点人员设置接口
 * @author: gssong
 * @date: 2021/11/21
 */
public interface IActNodeAssigneeService extends IService<ActNodeAssignee> {

    /**
     * 保存流程节点人员设置
     *
     * @param actNodeAssignee 参数
     * @return 结果
     */
    ActNodeAssigneeBo add(ActNodeAssigneeBo actNodeAssignee);

    /**
     * 按照流程定义id和流程节点id查询流程节点人员设置
     *
     * @param processDefinitionId 流程定义id
     * @param nodeId              节点id
     * @return 结果
     */
    ActNodeAssignee getInfo(String processDefinitionId, String nodeId);

    /**
     * 按照流程定义id和流程节点id查询流程节点人员设置
     *
     * @param processDefinitionId 流程定义id
     * @param nodeId              节点id
     * @return 结果
     */
    ActNodeAssigneeVo getInfoSetting(String processDefinitionId, String nodeId);

    /**
     * 按照流程定义id查询
     *
     * @param processDefinitionId 流程定义id
     * @return 结果
     */
    List<ActNodeAssignee> getInfoByProcessDefinitionId(String processDefinitionId);

    /**
     * 删除流程节点人员设置
     *
     * @param id 主键
     * @return 结果
     */
    Boolean del(String id);

    /**
     * 按照流程定义删除
     *
     * @param definitionId 流程定义id
     * @return 结果
     */
    Boolean delByDefinitionId(String definitionId);

    /**
     * 按照流程定义与节点删除删除
     *
     * @param definitionId 流程定义id
     * @param nodeId       节点id
     * @return 结果
     */
    Boolean delByDefinitionIdAndNodeId(String definitionId, String nodeId);

    /**
     * 复制给最新流程节点人员设置
     *
     * @param id  主键
     * @param key 流程定义key
     * @return 结果
     */
    Boolean copy(String id, String key);
}

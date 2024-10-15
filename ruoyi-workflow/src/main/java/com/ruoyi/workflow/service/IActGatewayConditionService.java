package com.ruoyi.workflow.service;

import com.ruoyi.workflow.domain.bo.ActGatewayConditionBo;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 网关条件Service接口
 *
 * @author gssong
 * @date 2023-03-25
 */
public interface IActGatewayConditionService {

    /**
     * 按照流程定义id与连线id查询
     *
     * @param processDefinitionId 流程定义id
     * @param gatewayId           网关id
     * @return 结果
     */
    ActGatewayConditionVo queryByProcessDefinitionIdAndSequenceId(String processDefinitionId, String gatewayId);

    /**
     * 查询网关条件
     *
     * @param id 主键
     * @return 结果
     */
    ActGatewayConditionVo queryById(Long id);

    /**
     * 查询网关条件列表
     *
     * @param bo        参数
     * @param pageQuery 分页
     * @return 结果
     */
    TableDataInfo<ActGatewayConditionVo> queryPageList(ActGatewayConditionBo bo, PageQuery pageQuery);

    /**
     * 查询网关条件列表
     *
     * @param bo 参数
     * @return 结果
     */
    List<ActGatewayConditionVo> queryList(ActGatewayConditionBo bo);

    /**
     * 新增网关条件
     *
     * @param bo 参数
     * @return 结果
     */
    Boolean insertByBo(ActGatewayConditionBo bo);

    /**
     * 修改网关条件
     *
     * @param bo 参数
     * @return 结果
     */
    Boolean updateByBo(ActGatewayConditionBo bo);

    /**
     * 校验并批量删除网关条件信息
     *
     * @param ids 参数
     * @return 结果
     */
    Boolean deleteByIds(Collection<Long> ids);

    /**
     * 查询网关条件
     *
     * @param processDefinitionId 流程定义id
     * @param sequenceId          连线id
     * @return 结果
     */
    ActGatewayConditionVo getInfo(String processDefinitionId, String sequenceId);

    /**
     * 按照流程定义key删除
     *
     * @param definitionKey 流程定义key
     * @return 结果
     */
    Boolean deleteByDefinitionKey(String definitionKey);
}

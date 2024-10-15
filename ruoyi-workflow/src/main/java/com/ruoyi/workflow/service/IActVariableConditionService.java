package com.ruoyi.workflow.service;

import com.ruoyi.workflow.domain.vo.ActVariableConditionVo;
import com.ruoyi.workflow.domain.bo.ActVariableConditionBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 网关变量条件Service接口
 *
 * @author gssong
 * @date 2023-02-10
 */
public interface IActVariableConditionService {

    /**
     * 查询网关变量条件
     *
     * @param id 主键
     * @return 结果
     */
    ActVariableConditionVo queryById(Long id);

    /**
     * 查询网关变量条件列表
     *
     * @param bo        参数
     * @param pageQuery 分页
     * @return 结果
     */
    TableDataInfo<ActVariableConditionVo> queryPageList(ActVariableConditionBo bo, PageQuery pageQuery);

    /**
     * 查询网关变量条件列表
     *
     * @param bo 参数
     * @return 结果
     */
    List<ActVariableConditionVo> queryList(ActVariableConditionBo bo);

    /**
     * 新增网关变量条件
     *
     * @param bo 参数
     * @return 结果
     */
    Boolean insertByBo(ActVariableConditionBo bo);

    /**
     * 修改网关变量条件
     *
     * @param bo 参数
     * @return 结果
     */
    Boolean updateByBo(ActVariableConditionBo bo);

    /**
     * 校验并批量删除网关变量条件信息
     *
     * @param ids 主键
     * @return 结果
     */
    Boolean deleteByIds(Collection<Long> ids);

    /**
     * 按照流程定义key查询
     *
     * @param key 流程定义key
     * @return 结果
     */
    List<ActVariableConditionVo> queryListByKey(String key);

    /**
     * 按照流程定义key删除
     *
     * @param definitionKey 流程定义key
     * @return 结果
     */
    Boolean deleteByDefinitionKey(String definitionKey);
}

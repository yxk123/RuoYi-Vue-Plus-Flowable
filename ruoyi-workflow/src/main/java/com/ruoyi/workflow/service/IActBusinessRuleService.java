package com.ruoyi.workflow.service;

import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.workflow.domain.vo.ActBusinessRuleVo;
import com.ruoyi.workflow.domain.bo.ActBusinessRuleBo;
import com.ruoyi.common.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 业务规则Service接口
 *
 * @author gssong
 * @date 2021-12-16
 */
public interface IActBusinessRuleService {
    /**
     * 查询单个
     *
     * @param id id
     * @return 结果
     */
    ActBusinessRuleVo queryById(Long id);

    /**
     * 查询列表
     *
     * @param bo        参数
     * @param pageQuery 分页
     * @return 结果
     */
    TableDataInfo<ActBusinessRuleVo> queryPageList(ActBusinessRuleBo bo, PageQuery pageQuery);

    /**
     * 查询列表
     *
     * @param bo 参数
     * @return 结果
     */
    List<ActBusinessRuleVo> queryList(ActBusinessRuleBo bo);

    /**
     * 根据新增业务对象插入业务规则
     *
     * @param bo 业务规则新增业务对象
     * @return 结果
     */
    Boolean insertByBo(ActBusinessRuleBo bo);

    /**
     * 根据编辑业务对象修改业务规则
     *
     * @param bo 业务规则编辑业务对象
     * @return 结果
     */
    Boolean updateByBo(ActBusinessRuleBo bo);

    /**
     * 校验并删除数据
     *
     * @param ids     主键集合
     * @param isValid 是否校验,true-删除前校验,false-不校验
     * @return 结果
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 校验是否被关联
     *
     * @param id 主键
     * @return 结果
     */
    String checkRelation(Long id);
}

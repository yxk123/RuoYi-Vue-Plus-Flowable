package com.ruoyi.workflow.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.workflow.domain.bo.ActVariableConditionBo;
import com.ruoyi.workflow.domain.vo.ActVariableConditionVo;
import com.ruoyi.workflow.domain.ActVariableCondition;
import com.ruoyi.workflow.mapper.ActVariableConditionMapper;
import com.ruoyi.workflow.service.IActVariableConditionService;

import java.util.List;
import java.util.Collection;

/**
 * 网关变量条件Service业务层处理
 *
 * @author gssong
 * @date 2023-02-10
 */
@RequiredArgsConstructor
@Service
public class ActVariableConditionServiceImpl implements IActVariableConditionService {

    private final ActVariableConditionMapper baseMapper;


    /**
     * 查询网关变量条件
     */
    @Override
    public ActVariableConditionVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询网关变量条件列表
     */
    @Override
    public TableDataInfo<ActVariableConditionVo> queryPageList(ActVariableConditionBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ActVariableCondition> lqw = buildQueryWrapper(bo);
        Page<ActVariableConditionVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询网关变量条件列表
     */
    @Override
    public List<ActVariableConditionVo> queryList(ActVariableConditionBo bo) {
        LambdaQueryWrapper<ActVariableCondition> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ActVariableCondition> buildQueryWrapper(ActVariableConditionBo bo) {
        LambdaQueryWrapper<ActVariableCondition> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getProcessDefinitionKey()), ActVariableCondition::getProcessDefinitionKey, bo.getProcessDefinitionKey());
        lqw.like(StringUtils.isNotBlank(bo.getVariableName()), ActVariableCondition::getVariableName, bo.getVariableName());
        lqw.like(StringUtils.isNotBlank(bo.getVariable()), ActVariableCondition::getVariable, bo.getVariable());
        return lqw;
    }

    /**
     * 新增网关变量条件
     */
    @Override
    public Boolean insertByBo(ActVariableConditionBo bo) {
        ActVariableCondition add = BeanUtil.toBean(bo, ActVariableCondition.class);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改网关变量条件
     */
    @Override
    public Boolean updateByBo(ActVariableConditionBo bo) {
        ActVariableCondition update = BeanUtil.toBean(bo, ActVariableCondition.class);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 批量删除网关变量条件
     */
    @Override
    public Boolean deleteByIds(Collection<Long> ids) {
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 按照流程定义key查询
     *
     * @param key 流程定义key
     */
    @Override
    public List<ActVariableConditionVo> queryListByKey(String key) {
        LambdaQueryWrapper<ActVariableCondition> lqw = Wrappers.lambdaQuery();
        lqw.eq(ActVariableCondition::getProcessDefinitionKey,key);
        return baseMapper.selectVoList(lqw);
    }

    /**
     * 按照流程定义key删除
     *
     * @param definitionKey 流程定义key
     */
    @Override
    public Boolean deleteByDefinitionKey(String definitionKey) {
        LambdaQueryWrapper<ActVariableCondition> lqw = Wrappers.lambdaQuery();
        lqw.eq(ActVariableCondition::getProcessDefinitionKey,definitionKey);
        return baseMapper.delete(lqw) > 0;
    }
}

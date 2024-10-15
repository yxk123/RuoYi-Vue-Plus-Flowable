package com.ruoyi.workflow.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.JsonUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.workflow.domain.ActGatewayConditionRelate;
import com.ruoyi.workflow.domain.bo.ActGatewayConditionBo;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionRelateVo;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import com.ruoyi.workflow.mapper.ActGatewayConditionRelateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.workflow.domain.ActGatewayCondition;
import com.ruoyi.workflow.mapper.ActGatewayConditionMapper;
import com.ruoyi.workflow.service.IActGatewayConditionService;

import java.util.List;
import java.util.Collection;

/**
 * 网关条件Service业务层处理
 *
 * @author gssong
 * @date 2023-03-25
 */
@RequiredArgsConstructor
@Service
public class ActGatewayConditionServiceImpl implements IActGatewayConditionService {

    private final ActGatewayConditionMapper baseMapper;
    private final ActGatewayConditionRelateMapper actGatewayConditionRelateMapper;

    @Override
    public ActGatewayConditionVo queryByProcessDefinitionIdAndSequenceId(String processDefinitionId, String sequenceId) {
        LambdaQueryWrapper<ActGatewayConditionRelate> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ActGatewayConditionRelate::getProcessDefinitionId, processDefinitionId);
        wrapper.eq(ActGatewayConditionRelate::getSequenceId, sequenceId);
        ActGatewayConditionRelateVo actGatewayConditionRelateVo = actGatewayConditionRelateMapper.selectVoOne(wrapper);
        if (actGatewayConditionRelateVo != null) {
            ActGatewayConditionVo actGatewayConditionVo = baseMapper.selectVoById(actGatewayConditionRelateVo.getGatewayConditionId());
            if (StringUtils.isNotBlank(actGatewayConditionVo.getConditionJson())) {
                actGatewayConditionVo.setGatewayConditionList(JsonUtils.parseArray(actGatewayConditionVo.getConditionJson(), ActGatewayConditionVo.ConditionList.class));
            }
            return actGatewayConditionVo;
        }
        return null;
    }

    /**
     * 查询网关条件
     */
    @Override
    public ActGatewayConditionVo queryById(Long id) {
        ActGatewayConditionVo conditionVo = baseMapper.selectVoById(id);
        if (StringUtils.isNotBlank(conditionVo.getConditionJson())) {
            conditionVo.setGatewayConditionList(JsonUtils.parseArray(conditionVo.getConditionJson(), ActGatewayConditionVo.ConditionList.class));
        }
        return conditionVo;
    }

    /**
     * 查询网关条件列表
     */
    @Override
    public TableDataInfo<ActGatewayConditionVo> queryPageList(ActGatewayConditionBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ActGatewayCondition> lqw = buildQueryWrapper(bo);
        Page<ActGatewayConditionVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        List<ActGatewayConditionVo> records = result.getRecords();
        for (ActGatewayConditionVo record : records) {
            if (StringUtils.isNotBlank(record.getConditionJson())) {
                record.setGatewayConditionList(JsonUtils.parseArray(record.getConditionJson(), ActGatewayConditionVo.ConditionList.class));
            }
        }
        return TableDataInfo.build(result);
    }

    /**
     * 查询网关条件列表
     */
    @Override
    public List<ActGatewayConditionVo> queryList(ActGatewayConditionBo bo) {
        LambdaQueryWrapper<ActGatewayCondition> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ActGatewayCondition> buildQueryWrapper(ActGatewayConditionBo bo) {
        LambdaQueryWrapper<ActGatewayCondition> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getProcessDefinitionKey()), ActGatewayCondition::getProcessDefinitionKey, bo.getProcessDefinitionKey());
        lqw.like(StringUtils.isNotBlank(bo.getRemark()), ActGatewayCondition::getRemark, bo.getRemark());
        return lqw;
    }

    /**
     * 新增网关条件
     */
    @Override
    public Boolean insertByBo(ActGatewayConditionBo bo) {
        ActGatewayCondition add = BeanUtil.toBean(bo, ActGatewayCondition.class);
        validEntityBeforeSave(add, bo);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改网关条件
     */
    @Override
    public Boolean updateByBo(ActGatewayConditionBo bo) {
        ActGatewayCondition update = BeanUtil.toBean(bo, ActGatewayCondition.class);
        validEntityBeforeSave(update, bo);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ActGatewayCondition entity, ActGatewayConditionBo bo) {
        List<ActGatewayConditionVo.ConditionList> gatewayConditionList = bo.getGatewayConditionList();
        if (CollUtil.isEmpty(gatewayConditionList)) {
            throw new ServiceException("条件不能为空");
        }
        for (ActGatewayConditionVo.ConditionList conditionList : gatewayConditionList) {
            if (StringUtils.isBlank(conditionList.getRuleName())) {
                throw new ServiceException("规则名称不能为空");
            }
            if (CollUtil.isEmpty(conditionList.getRuleList())) {
                throw new ServiceException("条件不能为空");
            }
            for (ActGatewayConditionVo.RuleList ruleList : conditionList.getRuleList()) {
                if (StringUtils.isBlank(ruleList.getVariable())) {
                    throw new ServiceException("参数不能为空");
                }
                if (StringUtils.isBlank(ruleList.getSymbol())) {
                    throw new ServiceException("操作符不能为空");
                }
                if (StringUtils.isBlank(ruleList.getVariableValue())) {
                    throw new ServiceException("变量值不能为空");
                }
            }
        }
        entity.setConditionJson(JsonUtils.toJsonString(bo.getGatewayConditionList()));
    }

    /**
     * 批量删除网关条件
     */
    @Override
    public Boolean deleteByIds(Collection<Long> ids) {
        LambdaQueryWrapper<ActGatewayConditionRelate> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(ActGatewayConditionRelate::getGatewayConditionId, ids);
        List<ActGatewayConditionRelate> relateVos = actGatewayConditionRelateMapper.selectList(wrapper);
        if (CollUtil.isNotEmpty(relateVos)) {
            throw new ServiceException("当前条件被使用中不可删除！");
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 查询网关条件
     *
     * @param processDefinitionId 流程定义id
     * @param sequenceId          连线id
     */
    @Override
    public ActGatewayConditionVo getInfo(String processDefinitionId, String sequenceId) {
        LambdaQueryWrapper<ActGatewayConditionRelate> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ActGatewayConditionRelate::getProcessDefinitionId, processDefinitionId);
        wrapper.eq(ActGatewayConditionRelate::getSequenceId, sequenceId);
        ActGatewayConditionRelate actGatewayConditionRelate = actGatewayConditionRelateMapper.selectOne(wrapper);
        if (actGatewayConditionRelate == null) {
            return null;
        }
        return queryById(actGatewayConditionRelate.getGatewayConditionId());
    }

    /**
     * 按照流程定义key删除
     *
     * @param definitionKey 流程定义ke
     */
    @Override
    public Boolean deleteByDefinitionKey(String definitionKey) {
        LambdaQueryWrapper<ActGatewayCondition> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(ActGatewayCondition::getProcessDefinitionKey, definitionKey);
        return baseMapper.delete(wrapper) > 0;
    }
}

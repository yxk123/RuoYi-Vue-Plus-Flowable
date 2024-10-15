package com.ruoyi.workflow.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.common.utils.JsonUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.workflow.domain.ActGatewayCondition;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionRelateVo;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import com.ruoyi.workflow.mapper.ActGatewayConditionMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.workflow.domain.bo.ActGatewayConditionRelateBo;
import com.ruoyi.workflow.domain.ActGatewayConditionRelate;
import com.ruoyi.workflow.mapper.ActGatewayConditionRelateMapper;
import com.ruoyi.workflow.service.IActGatewayConditionRelateService;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 网关条件关联网关节点Service业务层处理
 *
 * @author gssong
 * @date 2023-03-30
 */
@RequiredArgsConstructor
@Service
public class ActGatewayConditionRelateServiceImpl implements IActGatewayConditionRelateService {

    private final ActGatewayConditionRelateMapper baseMapper;

    private final ActGatewayConditionMapper actGatewayConditionMapper;

    /**
     * 新增网关条件关联网关节点
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean save(ActGatewayConditionRelateBo bo) {
        LambdaQueryWrapper<ActGatewayConditionRelate> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ActGatewayConditionRelate::getProcessDefinitionId, bo.getProcessDefinitionId());
        wrapper.eq(ActGatewayConditionRelate::getSequenceId, bo.getSequenceId());
        baseMapper.delete(wrapper);
        ActGatewayConditionRelate add = BeanUtil.toBean(bo, ActGatewayConditionRelate.class);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 删除网关条件
     *
     * @param processDefinitionId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteByProcessDefinitionId(String processDefinitionId) {
        LambdaQueryWrapper<ActGatewayConditionRelate> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ActGatewayConditionRelate::getProcessDefinitionId, processDefinitionId);
        return baseMapper.delete(wrapper) > 0;
    }

    /**
     * 删除网关条件关联网关节点
     *
     * @param processDefinitionId
     * @param sequenceId
     * @return
     */
    @Override
    public Boolean del(String processDefinitionId, String sequenceId) {
        LambdaQueryWrapper<ActGatewayConditionRelate> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ActGatewayConditionRelate::getProcessDefinitionId, processDefinitionId);
        wrapper.eq(ActGatewayConditionRelate::getSequenceId, sequenceId);
        return baseMapper.delete(wrapper) > 0;
    }


    /**
     * 查询网关条件
     *
     * @param processDefinitionId
     * @return
     */
    @Override
    public List<ActGatewayConditionRelateVo> getInfoByProcessDefinitionId(String processDefinitionId) {
        LambdaQueryWrapper<ActGatewayConditionRelate> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(ActGatewayConditionRelate::getProcessDefinitionId, processDefinitionId);
        List<ActGatewayConditionRelateVo> conditionRelateVos = baseMapper.selectVoList(wrapper);
        if (CollUtil.isEmpty(conditionRelateVos)) {
            return Collections.emptyList();
        }
        List<Long> collect = conditionRelateVos.stream().map(ActGatewayConditionRelateVo::getGatewayConditionId).collect(Collectors.toList());
        List<ActGatewayConditionVo> actGatewayConditionVos = actGatewayConditionMapper.selectVoList(new LambdaQueryWrapper<ActGatewayCondition>().in(ActGatewayCondition::getId, collect));
        if (CollUtil.isNotEmpty(actGatewayConditionVos)) {
            for (ActGatewayConditionVo conditionVo : actGatewayConditionVos) {
                if (StringUtils.isNotBlank(conditionVo.getConditionJson())) {
                    conditionVo.setGatewayConditionList(JsonUtils.parseArray(conditionVo.getConditionJson(), ActGatewayConditionVo.ConditionList.class));
                }
                conditionRelateVos.stream().filter(e -> e.getGatewayConditionId().toString().equals(conditionVo.getId().toString())).findFirst()
                    .ifPresent(e -> {
                        e.setActGatewayConditionVo(conditionVo);
                    });
            }
        }

        return conditionRelateVos;
    }
}

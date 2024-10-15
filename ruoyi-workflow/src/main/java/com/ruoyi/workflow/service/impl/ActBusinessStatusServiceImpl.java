package com.ruoyi.workflow.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.workflow.common.constant.FlowConstant;
import com.ruoyi.workflow.domain.ActBusinessStatus;
import com.ruoyi.workflow.common.enums.BusinessStatusEnum;
import com.ruoyi.workflow.mapper.ActBusinessStatusMapper;
import com.ruoyi.workflow.service.IActBusinessStatusService;
import com.ruoyi.workflow.service.IActProcessNodeAssigneeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * 业务状态实体Service业务层处理
 *
 * @author gssong
 * @date 2021-10-10
 */
@Service
public class ActBusinessStatusServiceImpl extends ServiceImpl<ActBusinessStatusMapper, ActBusinessStatus> implements IActBusinessStatusService {

    @Autowired
    private IActProcessNodeAssigneeService iActProcessNodeAssigneeService;

    /**
     * @description: 修改业务状态
     * @param: businessKey 业务id
     * @param: statusEnum 业务状态
     * @param: processInstanceId 流程实例id
     * @param: tableName 表名
     * @return: boolean
     * @author: gssong
     * @date: 2021/10/21
     */
    @Override
    @CachePut(cacheNames = FlowConstant.CACHE_ACT_BUSINESS_STATUS_KEY,key = "#businessKey")
    public ActBusinessStatus updateState(String businessKey, BusinessStatusEnum statusEnum, String processInstanceId, String tableName) {
        try {
            // 1. 查询当前数据
            ActBusinessStatus bs = baseMapper.selectOne(new LambdaQueryWrapper<ActBusinessStatus>().eq(ActBusinessStatus::getBusinessKey, businessKey));
            // 2. 新增操作
            if (ObjectUtil.isNull(bs)) {
                ActBusinessStatus actBusinessStatus = new ActBusinessStatus();
                // 设置状态值
                actBusinessStatus.setStatus(statusEnum.getStatus());
                actBusinessStatus.setBusinessKey(businessKey);
                actBusinessStatus.setTableName(tableName.toLowerCase());
                // 只要判断不为null,就更新
                if (processInstanceId != null) {
                    actBusinessStatus.setProcessInstanceId(processInstanceId);
                }
                baseMapper.insert(actBusinessStatus);
                return actBusinessStatus;
            } else {
                // 设置状态值
                bs.setStatus(statusEnum.getStatus());
                bs.setBusinessKey(businessKey);
                // 只要判断不为null,就更新
                if (processInstanceId != null) {
                    bs.setProcessInstanceId(processInstanceId);
                }
                baseMapper.updateById(bs);
                return bs;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("更新失败:" + e.getMessage());
        }
    }

    @Override
    @CachePut(cacheNames = FlowConstant.CACHE_ACT_BUSINESS_STATUS_KEY,key = "#businessKey")
    public ActBusinessStatus updateState(String businessKey, BusinessStatusEnum statusEnum, String procInstId) {
        return updateState(businessKey, statusEnum, procInstId, null);
    }

    @Override
    @Cacheable(cacheNames = FlowConstant.CACHE_ACT_BUSINESS_STATUS_KEY,key = "#businessKey")
    public ActBusinessStatus getInfoByBusinessKey(String businessKey) {
        return baseMapper.selectOne(new LambdaQueryWrapper<ActBusinessStatus>().eq(ActBusinessStatus::getBusinessKey, businessKey));
    }

    @Override
    public List<ActBusinessStatus> getListInfoByBusinessKey(List<String> businessKeys) {
        return baseMapper.selectList(new LambdaQueryWrapper<ActBusinessStatus>().in(ActBusinessStatus::getBusinessKey, businessKeys));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(cacheNames = FlowConstant.CACHE_ACT_BUSINESS_STATUS_KEY,key = "#businessKey")
    public boolean deleteStateByBusinessKey(String businessKey) {
        ActBusinessStatus actBusinessStatus = getInfoByBusinessKey(businessKey);
        int delete = baseMapper.delete(new LambdaQueryWrapper<ActBusinessStatus>().eq(ActBusinessStatus::getBusinessKey, businessKey));
        iActProcessNodeAssigneeService.deleteByProcessInstanceId(actBusinessStatus.getProcessInstanceId());
        return delete == 1;
    }

    @Override
    @CacheEvict(cacheNames = FlowConstant.CACHE_ACT_BUSINESS_STATUS_KEY,key = "#businessKey")
    public boolean deleteCacheByBusinessKey(String businessKey) {
        return true;
    }

    @Override
    public List<ActBusinessStatus> getInfoByProcessInstIds(List<String> processInstanceIds) {
        return baseMapper.selectList(new LambdaQueryWrapper<ActBusinessStatus>().in(ActBusinessStatus::getProcessInstanceId, processInstanceIds));
    }
}

package com.ruoyi.workflow.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.JsonUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.workflow.domain.ActProcessDefSetting;
import com.ruoyi.workflow.mapper.ActProcessDefSettingMapper;
import com.ruoyi.workflow.service.IActProcessDefSettingService;
import lombok.RequiredArgsConstructor;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Service;
import com.ruoyi.workflow.domain.bo.ActProcessDefSettingBo;
import com.ruoyi.workflow.domain.vo.ActProcessDefSettingVo;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Collection;
import java.util.stream.Collectors;

/**
 * 流程定义设置Service业务层处理
 *
 * @author gssong
 * @date 2022-08-28
 */
@RequiredArgsConstructor
@Service
public class ActProcessDefSettingServiceImpl implements IActProcessDefSettingService {

    private final ActProcessDefSettingMapper baseMapper;

    private final TaskService taskService;

    /**
     * 查询流程定义设置
     */
    @Override
    public ActProcessDefSettingVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    @Override
    public ActProcessDefSettingVo getProcessDefSettingByDefId(String defId) {
        LambdaQueryWrapper<ActProcessDefSetting> lqw = Wrappers.lambdaQuery();
        lqw.eq(ActProcessDefSetting::getProcessDefinitionId, defId);
        ActProcessDefSettingVo actProcessDefSettingVo = baseMapper.selectVoOne(lqw);
        if (ObjectUtil.isNotEmpty(actProcessDefSettingVo) && StringUtils.isNotBlank(actProcessDefSettingVo.getTaskListener())) {
            actProcessDefSettingVo.setTaskListenerList(JsonUtils.parseArray(actProcessDefSettingVo.getTaskListener(), ActProcessDefSettingVo.TaskListener.class));
        }
        return actProcessDefSettingVo;
    }

    @Override
    public List<ActProcessDefSettingVo> getProcessDefSettingByDefIds(List<String> defIds) {
        LambdaQueryWrapper<ActProcessDefSetting> lqw = Wrappers.lambdaQuery();
        lqw.in(ActProcessDefSetting::getProcessDefinitionId, defIds);
        return baseMapper.selectVoList(lqw);
    }

    @Override
    public R<List<Long>> checkProcessDefSetting(ActProcessDefSettingBo bo) {
        List<Task> taskList = taskService.createTaskQuery().processDefinitionId(bo.getProcessDefinitionId()).list();
        if (CollUtil.isNotEmpty(taskList)) {
            LambdaQueryWrapper<ActProcessDefSetting> lqw = Wrappers.lambdaQuery();
            lqw.eq(bo.getId() != null, ActProcessDefSetting::getId, bo.getId());
            lqw.eq(ActProcessDefSetting::getProcessDefinitionId, bo.getProcessDefinitionId());
            ActProcessDefSetting setting = baseMapper.selectOne(lqw);
            if (setting != null) {
                throw new ServiceException("当前表单有运行中的单据不可切换绑定！");
            }
        }
        //排除当前绑定流程定义
        LambdaQueryWrapper<ActProcessDefSetting> lqw = Wrappers.lambdaQuery();
        lqw.ne(bo.getId() != null, ActProcessDefSetting::getId, bo.getId());
        lqw.ne(ActProcessDefSetting::getProcessDefinitionKey, bo.getProcessDefinitionKey());
        lqw.eq(ActProcessDefSetting::getComponentName, bo.getComponentName());
        List<ActProcessDefSetting> actProcessDefSettings = baseMapper.selectList(lqw);
        if (CollUtil.isNotEmpty(actProcessDefSettings)) {
            List<Long> collect = actProcessDefSettings.stream().map(ActProcessDefSetting::getId).distinct().collect(Collectors.toList());
            return R.ok("组件已被流程【" + actProcessDefSettings.stream().map(ActProcessDefSetting::getProcessDefinitionName).distinct().collect(Collectors.joining(StringUtils.SEPARATOR)) + "】绑定，是否确认删除绑定，绑定当前选项？", collect);

        }
        return R.ok();
    }

    /**
     * 查询流程定义设置列表
     */
    @Override
    public TableDataInfo<ActProcessDefSettingVo> queryPageList(ActProcessDefSettingBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ActProcessDefSetting> lqw = buildQueryWrapper(bo);
        Page<ActProcessDefSettingVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询流程定义设置列表
     */
    @Override
    public List<ActProcessDefSettingVo> queryList(ActProcessDefSettingBo bo) {
        LambdaQueryWrapper<ActProcessDefSetting> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ActProcessDefSetting> buildQueryWrapper(ActProcessDefSettingBo bo) {
        LambdaQueryWrapper<ActProcessDefSetting> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getProcessDefinitionId()), ActProcessDefSetting::getProcessDefinitionId, bo.getProcessDefinitionId());
        lqw.eq(StringUtils.isNotBlank(bo.getProcessDefinitionKey()), ActProcessDefSetting::getProcessDefinitionKey, bo.getProcessDefinitionKey());
        lqw.like(StringUtils.isNotBlank(bo.getProcessDefinitionName()), ActProcessDefSetting::getProcessDefinitionName, bo.getProcessDefinitionName());
        return lqw;
    }

    /**
     * 新增流程定义设置
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ActProcessDefSettingVo insertByBo(ActProcessDefSettingBo bo) {
        ActProcessDefSetting add = BeanUtil.toBean(bo, ActProcessDefSetting.class);
        if (CollUtil.isNotEmpty(bo.getSettingIds())) {
            LambdaQueryWrapper<ActProcessDefSetting> wrapper = Wrappers.lambdaQuery();
            wrapper.in(ActProcessDefSetting::getId, bo.getSettingIds());
            List<ActProcessDefSetting> actProcessDefSettings = baseMapper.selectList(wrapper);
            actProcessDefSettings.forEach(e-> e.setComponentName(StrUtil.EMPTY));
            baseMapper.updateBatchById(actProcessDefSettings);

        }
        if (bo.getId() != null) {
            baseMapper.deleteById(bo.getId());
        }
        add.setTaskListener(StrUtil.EMPTY);
        if (CollectionUtil.isNotEmpty(bo.getTaskListenerList())) {
            List<ActProcessDefSettingVo.TaskListener> taskListenerList = new ArrayList<>();
            bo.getTaskListenerList().forEach(e -> {
                if (StringUtils.isNotBlank(e.getEventType()) && StringUtils.isNotBlank(e.getBeanName()) && CollUtil.isNotEmpty(e.getStatus())) {
                    taskListenerList.add(e);
                }
            });
            if (CollectionUtil.isNotEmpty(taskListenerList)) {
                String jsonString = JsonUtils.toJsonString(bo.getTaskListenerList());
                add.setTaskListener(jsonString);
            }
        }
        baseMapper.insert(add);
        ActProcessDefSettingVo actProcessDefSettingVo = BeanUtil.toBean(add, ActProcessDefSettingVo.class);
        if (StringUtils.isNotBlank(add.getTaskListener())) {
            actProcessDefSettingVo.setTaskListenerList(JsonUtils.parseArray(add.getTaskListener(), ActProcessDefSettingVo.TaskListener.class));
        }
        return actProcessDefSettingVo;
    }

    /**
     * 修改流程定义设置
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateByBo(ActProcessDefSettingBo bo) {
        ActProcessDefSetting update = BeanUtil.toBean(bo, ActProcessDefSetting.class);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 批量删除流程定义设置
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteWithValidByIds(Collection<Long> ids) {
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * @description: 按照流程定义id删除
     * @param: definitionIds
     * @return: java.lang.Boolean
     * @author: gssong
     * @date: 2022/10/16 19:48
     */
    @Override
    public Boolean deleteByDefinitionIds(List<String> definitionIds) {
        LambdaQueryWrapper<ActProcessDefSetting> wrapper = Wrappers.lambdaQuery();
        wrapper.in(ActProcessDefSetting::getProcessDefinitionId, definitionIds);
        return baseMapper.delete(wrapper) > 0;
    }
}

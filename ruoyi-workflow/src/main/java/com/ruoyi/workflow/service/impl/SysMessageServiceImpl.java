package com.ruoyi.workflow.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.workflow.common.enums.MessageTypeEnum;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.workflow.domain.bo.SysMessageBo;
import com.ruoyi.workflow.domain.vo.SysMessageVo;
import com.ruoyi.workflow.domain.SysMessage;
import com.ruoyi.workflow.mapper.SysMessageMapper;
import com.ruoyi.workflow.service.ISysMessageService;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 消息通知Service业务层处理
 *
 * @author gssong
 * @date 2022-06-17
 */
@RequiredArgsConstructor
@Service
public class SysMessageServiceImpl implements ISysMessageService {

    private final SysMessageMapper baseMapper;

    /**
     * 查询消息通知
     *
     * @param id 消息通知主键
     * @return 消息通知
     */
    @Override
    public SysMessageVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询消息通知列表
     *
     * @param bo 消息通知
     * @return 消息通知
     */
    @Override
    public TableDataInfo<SysMessageVo> queryPageList(SysMessageBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SysMessage> lqw = buildQueryWrapper(bo);
        Page<SysMessageVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询消息通知列表
     *
     * @param bo 消息通知
     * @return 消息通知
     */
    @Override
    public List<SysMessageVo> queryList(SysMessageBo bo) {
        LambdaQueryWrapper<SysMessage> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<SysMessage> buildQueryWrapper(SysMessageBo bo) {
        LambdaQueryWrapper<SysMessage> lqw = Wrappers.lambdaQuery();
        lqw.eq(SysMessage::getRecordId, LoginHelper.getUserId());
        if (StringUtils.isNotBlank(bo.getType())) {
            lqw.isNull(Objects.isNull(bo.getReadTime()), SysMessage::getReadTime);
            lqw.isNotNull(!Objects.isNull(bo.getReadTime()), SysMessage::getReadTime);
        }
        lqw.eq(SysMessage::getType, MessageTypeEnum.SYSTEM_MESSAGE.getCode());
        lqw.orderByDesc(SysMessage::getCreateTime);
        return lqw;
    }

    /**
     * 发送消息通知
     *
     * @param bo 消息通知
     * @return 结果
     */
    @Override
    public Boolean sendMessage(SysMessageBo bo) {
        SysMessage add = BeanUtil.toBean(bo, SysMessage.class);
        add.setStatus("0");
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
            bo.setCreateTime(add.getCreateTime());
        }
        return flag;
    }

    /**
     * 发送消息通知
     *
     * @param bo 消息通知
     * @return 结果
     */
    @Override
    public Boolean sendMessage(List<SysMessageBo> bo) {
        List<SysMessage> sysMessageList = new ArrayList<>();
        for (SysMessageBo sysMessageBo : bo) {
            SysMessage add = BeanUtil.toBean(sysMessageBo, SysMessage.class);
            add.setStatus("0");
            sysMessageList.add(add);
        }
        return baseMapper.insertBatch(sysMessageList);
    }

    /**
     * 修改消息通知
     *
     * @param bo 消息通知
     * @return 结果
     */
    @Override
    public Boolean updateMessage(SysMessageBo bo) {
        SysMessage update = BeanUtil.toBean(bo, SysMessage.class);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 阅读消息
     *
     * @param id 主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean readMessage(Long id) {
        SysMessage sysMessage = new SysMessage();
        sysMessage.setId(id);
        sysMessage.setReadTime(new Date());
        sysMessage.setStatus("1");
        return baseMapper.updateById(sysMessage) > 0;
    }

    /**
     * 阅读消息
     *
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean readAll() {
        try {
            SysMessage sysMessage = new SysMessage();
            sysMessage.setReadTime(new Date());
            sysMessage.setStatus("1");
            LambdaUpdateWrapper<SysMessage> wrapper = new LambdaUpdateWrapper<>();
            wrapper.eq(SysMessage::getRecordId, LoginHelper.getUserId());
            wrapper.isNull(SysMessage::getReadTime);
            baseMapper.update(sysMessage, wrapper);
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 批量删除消息通知
     *
     * @param ids 需要删除的消息通知主键
     * @return 结果
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}

package com.ruoyi.workflow.service;

import com.ruoyi.workflow.domain.vo.SysMessageVo;
import com.ruoyi.workflow.domain.bo.SysMessageBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 消息通知Service接口
 *
 * @author gssong
 * @date 2022-06-17
 */
public interface ISysMessageService {

    /**
     * 查询消息通知
     *
     * @param id 消息通知主键
     * @return 消息通知
     */
    SysMessageVo queryById(Long id);

    /**
     * 查询消息通知列表
     *
     * @param bo        消息通知
     * @param pageQuery 分页
     * @return 结果
     */
    TableDataInfo<SysMessageVo> queryPageList(SysMessageBo bo, PageQuery pageQuery);

    /**
     * 查询消息通知列表
     *
     * @param bo 消息通知
     * @return 消息通知集合
     */
    List<SysMessageVo> queryList(SysMessageBo bo);

    /**
     * 发送消息通知
     *
     * @param bo 消息通知
     * @return 结果
     */
    Boolean sendMessage(SysMessageBo bo);

    /**
     * 发送消息通知
     *
     * @param bo 消息通知
     * @return 结果
     */
    Boolean sendMessage(List<SysMessageBo> bo);

    /**
     * 修改消息通知
     *
     * @param bo 消息通知
     * @return 结果
     */
    Boolean updateMessage(SysMessageBo bo);

    /**
     * 阅读消息
     *
     * @param id 主键
     * @return 结果
     */
    Boolean readMessage(Long id);

    /**
     * 阅读消息
     *
     * @return 结果
     */
    Boolean readAll();

    /**
     * 校验并批量删除消息通知信息
     *
     * @param ids     需要删除的消息通知主键集合
     * @param isValid 是否校验,true-删除前校验,false-不校验
     * @return 结果
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}

package com.ruoyi.workflow.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.workflow.domain.vo.CommonTaskWaitingVo;
import com.ruoyi.workflow.domain.vo.TaskWaitingVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * 任务Mapper接口
 *
 * @author gssong
 * @date 2022-07-24
 */
public interface ActTaskMapper {

    /**
     * 修改审批信息
     *
     * @param commentId 批注id
     * @param comment   批注
     * @return
     */
    @Update("update act_hi_comment set message_=#{comment},full_msg_=#{comment} where id_ = #{commentId}")
    int editComment(@Param("commentId") String commentId, @Param("comment") String comment);

    /**
     * 任务待办
     *
     * @param page         分页
     * @param queryWrapper 查询条件
     * @param assignee     办理人
     * @return 任务集合
     */
    Page<TaskWaitingVo> getTaskWaitByPage(@Param("page") Page<TaskWaitingVo> page, @Param(Constants.WRAPPER) Wrapper<TaskWaitingVo> queryWrapper, @Param("assignee") String assignee);

    /**
     * 获取各个流程key待办数量 assignee为空时默认查询全部
     *
     * @param assignee 办理人
     * @param status   状态
     * @return 待办数量
     */
    List<Map<String, Object>> getTaskWaitCount(@Param("status") String status, @Param("assignee") String assignee);

    /**
     * 通用待办任务分页
     *
     * @param page         分页
     * @param queryWrapper 查询条件
     * @param assignee     办理人
     * @param tableName    业务表
     * @return 待办集合
     */
    Page<Map<String, Object>> getCommonTaskWaitByPage(@Param("page") Page<CommonTaskWaitingVo> page, @Param(Constants.WRAPPER) Wrapper<Map<String, Object>> queryWrapper, @Param("assignee") String assignee, @Param("tableName") String tableName);

    /**
     * 通用已办任务分页
     *
     * @param page         分页
     * @param queryWrapper 查询条件
     * @param assignee     办理人
     * @param tableName    业务表
     * @return 已办集合
     */
    Page<Map<String, Object>> getCommonTaskFinishByPage(@Param("page") Page<CommonTaskWaitingVo> page, @Param(Constants.WRAPPER) Wrapper<Map<String, Object>> queryWrapper, @Param("assignee") String assignee, @Param("tableName") String tableName);

    /**
     * 按照附件id删除
     *
     * @param contentId 附件id
     */
    @Delete("delete from act_hi_attachment where content_id_ = #{contentId}")
    void deleteContentId(@Param("contentId") String contentId);
}

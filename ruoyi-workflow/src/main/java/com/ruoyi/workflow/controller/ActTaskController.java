package com.ruoyi.workflow.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.workflow.common.enums.BusinessStatusEnum;
import com.ruoyi.workflow.domain.ActTaskNode;
import com.ruoyi.workflow.domain.bo.*;
import com.ruoyi.workflow.domain.bo.BackProcessBo;
import com.ruoyi.workflow.domain.vo.*;
import com.ruoyi.workflow.service.IActTaskService;
import lombok.RequiredArgsConstructor;
import org.flowable.engine.TaskService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * 任务管理
 *
 * @author gssong
 * @date 2021/10/17 14:46
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/workflow/task")
public class ActTaskController extends BaseController {

    private final IActTaskService iActTaskService;

    private final TaskService taskService;

    /**
     * 查询当前用户的待办任务
     *
     * @param: taskBo
     * @param: pageQuery
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.TaskWaitingVo>
     * @author: gssong
     * @date: 2021/10/17
     */
    @GetMapping("/getTaskWaitByPage")
    public TableDataInfo<TaskWaitingVo> getTaskWaitByPage(TaskBo taskBo, PageQuery pageQuery) {
        taskBo.setAssignee(LoginHelper.getUserId().toString());
        return iActTaskService.getTaskWaitByPage(taskBo, pageQuery);
    }

    /**
     * 获取各个流程key待办数量 assignee为空时默认查询全部
     *
     * @return: com.ruoyi.common.core.domain.R<java.util.List < java.util.Map < java.lang.String, java.lang.Object>>>
     * @author: gssong
     * @date: 2023/4/21 9:22
     */
    @GetMapping("/getTaskWaitCount")
    public R<List<Map<String, Object>>> getTaskWaitCount() {
        return R.ok(iActTaskService.getTaskWaitCount(BusinessStatusEnum.WAITING.getStatus(), LoginHelper.getUserId().toString()));
    }

    /**
     * 查询所有用户的待办任务
     *
     * @param: taskBo
     * @param: pageQuery
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.TaskWaitingVo>
     * @author: gssong
     * @date: 2021/10/17
     */
    @GetMapping("/getAllTaskWaitByPage")
    public TableDataInfo<TaskWaitingVo> getAllTaskWaitByPage(TaskBo taskBo, PageQuery pageQuery) {
        return iActTaskService.getTaskWaitByPage(taskBo, pageQuery);
    }

    /**
     * 查询当前用户的已办任务
     *
     * @param: taskBo
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.TaskWaitingVo>
     * @author: gssong
     * @date: 2021/10/23
     */
    @GetMapping("/getTaskFinishByPage")
    public TableDataInfo<TaskFinishVo> getTaskFinishByPage(TaskBo taskBo) {
        taskBo.setAssignee(LoginHelper.getUserId().toString());
        return iActTaskService.getTaskFinishByPage(taskBo);
    }

    /**
     * 查询所有用户的已办任务
     *
     * @param: taskBo
     * @return: com.ruoyi.common.core.page.TableDataInfo<com.ruoyi.workflow.domain.vo.TaskWaitingVo>
     * @author: gssong
     * @date: 2021/10/23
     */
    @GetMapping("/getAllTaskFinishByPage")
    public TableDataInfo<TaskFinishVo> getAllTaskFinishByPage(TaskBo taskBo) {
        return iActTaskService.getTaskFinishByPage(taskBo);
    }

    /**
     * 办理任务
     *
     * @param: taskCompleteBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/10/21 13:34
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/completeTask")
    public R<Void> completeTask(@RequestBody TaskCompleteBo taskCompleteBo) {
        return toAjax(iActTaskService.completeTask(taskCompleteBo));
    }

    /**
     * 获取目标节点（下一个节点）
     *
     * @param: nextNodeBo
     * @return: com.ruoyi.common.core.domain.R<java.util.Map < java.lang.String, java.lang.Object>>
     * @author: gssong
     * @date: 2021/10/23
     */
    @PostMapping("/getNextNodeInfo")
    public R<Map<String, Object>> getNextNodeInfo(@RequestBody NextNodeBo nextNodeBo) {
        return R.ok(iActTaskService.getNextNodeInfo(nextNodeBo));
    }

    /**
     * 驳回审批
     *
     * @param: backProcessBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.String>
     * @author: gssong
     * @date: 2021/11/6
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/backProcess")
    public R<String> backProcess(@RequestBody BackProcessBo backProcessBo) {
        return R.ok(iActTaskService.backProcess(backProcessBo));
    }

    /**
     * 获取历史任务节点，用于驳回功能
     *
     * @param: processInstId
     * @return: com.ruoyi.common.core.domain.R<java.util.List < com.ruoyi.workflow.domain.ActTaskNode>>
     * @author: gssong
     * @date: 2021/11/6
     */
    @GetMapping("/getBackNodes/{processInstId}")
    public R<List<ActTaskNode>> getBackNodes(@NotBlank(message = "流程实例id不能为空") @PathVariable String processInstId) {
        return R.ok(iActTaskService.getBackNodes(processInstId));
    }

    /**
     * 签收（拾取）任务
     *
     * @param: taskId
     * @return: @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/11/16
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/claim/{taskId}")
    public R<Void> claimTask(@NotBlank(message = "任务id不能为空") @PathVariable String taskId) {
        try {
            taskService.claim(taskId, LoginHelper.getUserId().toString());
            return R.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return R.fail("签收任务失败：" + e.getMessage());
        }
    }

    /**
     * 归还（拾取的）任务
     *
     * @param: taskId
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/01/01
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/returnTask/{taskId}")
    public R<Void> returnTask(@NotBlank(message = "任务id不能为空") @PathVariable String taskId) {
        try {
            taskService.setAssignee(taskId, null);
            return R.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return R.fail("归还任务失败：" + e.getMessage());
        }
    }

    /**
     * 委派任务
     *
     * @param: delegateBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/3/4 13:18
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/delegateTask")
    public R<Void> delegateTask(@Validated({AddGroup.class}) @RequestBody DelegateBo delegateBo) {
        return toAjax(iActTaskService.delegateTask(delegateBo));
    }

    /**
     * 转办任务
     *
     * @param: transmitBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/3/13 13:18
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/transferTask")
    public R<Void> transferTask(@Validated({AddGroup.class}) @RequestBody TransferBo transferBo) {
        return toAjax(iActTaskService.transferTask(transferBo));
    }

    /**
     * 会签任务加签
     *
     * @param: addMultiBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/4/15 13:06
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/addMultiInstanceExecution")
    public R<Void> addMultiInstanceExecution(@Validated({AddGroup.class}) @RequestBody AddMultiBo addMultiBo) {
        return toAjax(iActTaskService.addMultiInstanceExecution(addMultiBo));
    }

    /**
     * 会签任务减签
     *
     * @param: deleteMultiBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/4/16 10:59
     */
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping("/deleteMultiInstanceExecution")
    public R<Void> deleteMultiInstanceExecution(@Validated({AddGroup.class}) @RequestBody DeleteMultiBo deleteMultiBo) {
        return toAjax(iActTaskService.deleteMultiInstanceExecution(deleteMultiBo));
    }

    /**
     * 修改办理人
     *
     * @param: updateAssigneeBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/7/17 13:31
     */
    @Log(title = "任务管理", businessType = BusinessType.UPDATE)
    @PostMapping("/updateAssignee")
    public R<Void> updateAssignee(@Validated({AddGroup.class}) @RequestBody UpdateAssigneeBo updateAssigneeBo) {
        return toAjax(iActTaskService.updateAssignee(updateAssigneeBo));
    }

    /**
     * 查询流程变量
     *
     * @param: taskId
     * @return: com.ruoyi.common.core.domain.R<java.util.List < com.ruoyi.workflow.domain.vo.VariableVo>>
     * @author: gssong
     * @date: 2022/7/23 14:33
     */
    @GetMapping("/getProcessInstVariable/{taskId}")
    public R<List<VariableVo>> getProcessInstVariable(@PathVariable String taskId) {
        return R.ok(iActTaskService.getProcessInstVariable(taskId));
    }

    /**
     * 修改审批意见
     *
     * @param: commentBo 参数
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/7/24 13:38
     */
    @Log(title = "任务管理", businessType = BusinessType.UPDATE)
    @PutMapping("/editComment")
    public R<Void> editComment(@RequestBody CommentBo commentBo) {
        return toAjax(iActTaskService.editComment(commentBo));
    }

    /**
     * 删除附件
     *
     * @param: contentId
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/9/26 13:06
     */
    @Log(title = "任务管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/deleteAttachment/{contentId}")
    public R<Void> deleteAttachment(@PathVariable String contentId) {
        return toAjax(iActTaskService.deleteAttachment(contentId));
    }

    /**
     * 按照任务id删除附件
     *
     * @param: taskId
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/9/26 13:06
     */
    @Log(title = "任务管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/deleteAttachmentByTaskId/{taskId}")
    public R<Void> deleteAttachmentByTaskId(@PathVariable String taskId) {
        return toAjax(iActTaskService.deleteAttachmentByTaskId(taskId));
    }

    /**
     * 终止任务
     *
     * @param: terminationBo
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/10/27 20:31
     */
    @Log(title = "任务管理", businessType = BusinessType.DELETE)
    @PostMapping("/terminationTask")
    public R<Void> terminationTask(@RequestBody TerminationBo terminationBo) {
        return toAjax(iActTaskService.terminationTask(terminationBo));
    }

}





package com.ruoyi.workflow.service;

import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.workflow.domain.bo.ProcessInvalidBo;
import com.ruoyi.workflow.domain.bo.ProcessInstFinishBo;
import com.ruoyi.workflow.domain.bo.ProcessInstRunningBo;
import com.ruoyi.workflow.domain.bo.StartProcessBo;
import com.ruoyi.workflow.domain.vo.ActHistoryInfoVo;
import com.ruoyi.workflow.domain.vo.ProcessInstFinishVo;
import com.ruoyi.workflow.domain.vo.ProcessInstRunningVo;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * @description: 流程实例接口
 * @author: gssong
 * @date: 2021/10/10 18:38
 */
public interface IActProcessInstanceService {
    /**
     * 提交申请，启动流程实例
     *
     * @param startProcessBo 参数
     * @return 结果
     */
    Map<String, Object> startWorkFlow(StartProcessBo startProcessBo);

    /**
     * 通过流程实例id查询流程审批记录
     *
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    Map<String, Object> getHistoryInfoList(String processInstanceId);

    /**
     * 通过流程实例id获取历史流程图
     *
     * @param processInstanceId 流程实例id
     * @param response          响应
     */
    void getHistoryProcessImage(String processInstanceId, HttpServletResponse response);

    /**
     * 查询正在运行的流程实例
     *
     * @param processInstRunningBo 参数
     * @return 结果
     */
    TableDataInfo<ProcessInstRunningVo> getProcessInstRunningByPage(ProcessInstRunningBo processInstRunningBo);

    /**
     * 挂起或激活流程实例
     *
     * @param data 参数
     * @return 结果
     */
    boolean updateProcInstState(Map<String, Object> data);

    /**
     * 作废流程实例，不会删除历史记录
     *
     * @param processInvalidBo 参数
     * @return 结果
     */
    boolean deleteRuntimeProcessInst(ProcessInvalidBo processInvalidBo);

    /**
     * 删除运行中的实例，删除历史记录，删除业务与流程关联信息
     *
     * @param processInstId 流程实例id
     * @return 结果
     */
    boolean deleteRuntimeProcessAndHisInst(String processInstId);


    /**
     * 查询已结束的流程实例
     *
     * @param processInstFinishBo 参数
     * @return 结果
     */
    TableDataInfo<ProcessInstFinishVo> getProcessInstFinishByPage(ProcessInstFinishBo processInstFinishBo);

    /**
     * 删除已完成的实例，删除历史记录，删除业务与流程关联信息
     *
     * @param processInstId 流程实例id
     * @return 结果
     */
    boolean deleteFinishProcessAndHisInst(String processInstId);

    /**
     * 获取流程实例id
     *
     * @param businessKey 业务id
     * @return 流程实例id
     */
    String getProcessInstanceId(String businessKey);

    /**
     * 撤销申请
     *
     * @param processInstId 流程实例id
     * @return 结果
     */
    boolean cancelProcessApply(String processInstId);

    /**
     * 获取xml
     *
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    Map<String, Object> getXml(String processInstanceId);

    /**
     * 获取可执行流程节点
     *
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    Map<String, Object> getExecutableNode(String processInstanceId);
}

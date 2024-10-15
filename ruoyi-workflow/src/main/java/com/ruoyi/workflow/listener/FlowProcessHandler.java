package com.ruoyi.workflow.listener;

/**
 * 流程终止，退回申请人，作废，撤销 可实现该接口
 *
 * @author gssong
 * @date 2023 03-05
 */
public interface FlowProcessHandler {

    /**
     * 流程终止，退回申请人，作废，撤销 执行
     *
     * @param processInstanceId 流程实例id
     * @param status            状态
     */
    void handleProcess(String processInstanceId, String status);
}

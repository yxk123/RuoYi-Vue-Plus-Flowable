package com.ruoyi.workflow.service;

import com.ruoyi.workflow.domain.ActProcessNodeAssignee;
import java.util.List;

/**
 * 流程节点人员Service接口
 *
 * @author gssong
 * @date 2022-12-18
 */
public interface IActProcessNodeAssigneeService {

    /**
     * 查询流程节点人员
     *
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    List<ActProcessNodeAssignee> queryByProcessInstanceId(String processInstanceId);

    /**
     * 新增流程节点人员
     *
     * @param actProcessNodeAssigneeList 承诺书
     * @return 结果
     */
    Boolean insertBatch(List<ActProcessNodeAssignee> actProcessNodeAssigneeList);

    /**
     * 批量删除流程节点人员信息
     *
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    Boolean deleteByProcessInstanceId(String processInstanceId);
}

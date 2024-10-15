package com.ruoyi.workflow.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.workflow.domain.ActBusinessStatus;
import com.ruoyi.workflow.common.enums.BusinessStatusEnum;

import java.util.List;

/**
 * 业务状态实体Service接口
 *
 * @author gssong
 * @date 2021-10-10
 */
public interface IActBusinessStatusService extends IService<ActBusinessStatus> {
    /**
     * 更新业务状态
     *
     * @param businessKey       业务id
     * @param statusEnum        状态值
     * @param processInstanceId 流程实例id
     * @param tableName         表名
     * @return 结果
     */
    ActBusinessStatus updateState(String businessKey, BusinessStatusEnum statusEnum, String processInstanceId, String tableName);

    /**
     * 更新业务状态
     *
     * @param businessKey       业务id
     * @param statusEnum        状态值
     * @param processInstanceId 流程实例id
     * @return 结果
     */
    ActBusinessStatus updateState(String businessKey, BusinessStatusEnum statusEnum, String processInstanceId);

    /**
     * 根据业务id查询流程实例
     *
     * @param businessKey 业务id
     * @return 结果
     */
    ActBusinessStatus getInfoByBusinessKey(String businessKey);

    /**
     * 根据业务id集合查询流程实例
     *
     * @param businessKeys 业务id
     * @return 结果
     */
    List<ActBusinessStatus> getListInfoByBusinessKey(List<String> businessKeys);

    /**
     * 按照业务id删除业务状态
     *
     * @param businessKey 业务id
     * @return 结果
     */
    boolean deleteStateByBusinessKey(String businessKey);

    /**
     * 按照业务id删除缓存
     *
     * @param businessKey 业务id
     * @return 结果
     */
    boolean deleteCacheByBusinessKey(String businessKey);

    /**
     * 根据流程实例id集合查询流程实例
     *
     * @param processInstanceIds 流程实例id
     * @return 结果
     */
    List<ActBusinessStatus> getInfoByProcessInstIds(List<String> processInstanceIds);
}

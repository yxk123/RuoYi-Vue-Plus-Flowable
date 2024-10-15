package com.ruoyi.workflow.domain.vo;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.common.utils.reflect.ReflectUtils;
import com.ruoyi.workflow.domain.ActBusinessStatus;
import com.ruoyi.workflow.domain.dto.CommonTaskFinishDTO;
import lombok.Data;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.*;

/**
 * @description: 任务视图
 * @author: gssong
 * @date: 2023/03/14 14:54
 */
@Data
public class CommonTaskFinishVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 流程任务id
     */
    private String id;

    /**
     * 数据版本
     */
    private Integer rev;

    /**
     * 流程定义id
     */
    private String procDefId;
    private String taskDefId;

    /**
     * 节点id
     */
    private String taskDefKey;

    /**
     * 流程实例id
     */
    private String procInstId;

    /**
     * 流程执行id
     */
    private String executionId;

    private String scopeId;
    private String subScopeId;
    private String scopeType;
    private String scopeDefinitionId;
    private String propagatedStageInstId;

    /**
     * 任务名称
     */
    private String name;
    /**
     * 父级任务id
     */
    private String parentTaskId;

    /**
     * 描述
     */
    private String description;

    /**
     * 委托人id
     */
    private String owner;

    /**
     * 办理人
     */
    private String assignee;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 认领时间
     */
    private Date claimTime;

    /**
     * 结束时间
     */
    private Date endTime;
    private Integer duration;
    private String deleteReason;
    private Integer priority;

    /**
     * 到期时间
     */
    private Date dueDate;

    /**
     * 表单key
     */
    private String formKey;

    /**
     * 分类
     */
    private String category;

    /**
     * 租户id
     */
    private String tenantId;

    /**
     * 最后修改时间
     */
    private Date lastUpdatedTime;

    /**
     * 业务数据
     */
    private Map<String, Object> businessColumn;


    /**
     * 流程状态是否挂起
     */
    private String suspensionStateName;

    /**
     * 办理人或候选人 （ 任务办理人: 如果是候选人则没有值，办理人才有）
     */
    private Long assigneeId;

    /**
     * 流程定义名称
     */
    private String processDefinitionName;

    /**
     * 流程定义key
     */
    private String processDefinitionKey;

    /**
     * 流程定义版本
     */
    private Integer processDefinitionVersion;

    /**
     * 业务状态
     */
    private ActBusinessStatus actBusinessStatus;

    /**
     * 流程定义设置
     */
    private ActProcessDefSettingVo actProcessDefSetting;


    public static List<CommonTaskFinishVo> convertToEntity(List<Map<String, Object>> records) {
        List<CommonTaskFinishVo> commonTaskFinishVos = new ArrayList<>();
        List<CommonTaskFinishDTO> commonTaskFinishDTOList = new ArrayList<>();
        if (!CollUtil.isEmpty(records)) {
            Field[] fields = ReflectUtils.getFields(CommonTaskFinishDTO.class);
            for (Map<String, Object> e : records) {
                Map<String, Object> treeMap = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
                treeMap.putAll(e);
                CommonTaskFinishDTO commonTaskFinishDTO = new CommonTaskFinishDTO();
                Map<String, Object> fieldMap = new HashMap<>();
                for (Field field : fields) {
                    Object o = treeMap.get(field.getName());
                    ReflectUtils.invokeSetter(commonTaskFinishDTO, field.getName(), o);
                }
                for (Map.Entry<String, Object> entry : e.entrySet()) {
                    Field fd = Arrays.stream(fields).filter(f -> entry.getKey().equalsIgnoreCase(f.getName())).findFirst().orElse(null);
                    if (ObjectUtil.isNull(fd)) {
                        fieldMap.put(entry.getKey(), entry.getValue());
                    }
                }
                ReflectUtils.invokeSetter(commonTaskFinishDTO, "businessColumn", fieldMap);
                commonTaskFinishDTOList.add(commonTaskFinishDTO);
            }
        }

        if (CollUtil.isNotEmpty(commonTaskFinishDTOList)) {
            for (CommonTaskFinishDTO commonTaskFinishDTO : commonTaskFinishDTOList) {
                CommonTaskFinishVo commonTaskFinishVo = new CommonTaskFinishVo();
                ActBusinessStatus actBusinessStatus = new ActBusinessStatus();

                //流程数据
                commonTaskFinishVo.setId(commonTaskFinishDTO.getID_());
                commonTaskFinishVo.setRev(commonTaskFinishDTO.getREV_());
                commonTaskFinishVo.setProcDefId(commonTaskFinishDTO.getPROC_DEF_ID_());
                commonTaskFinishVo.setTaskDefId(commonTaskFinishDTO.getTASK_DEF_ID_());
                commonTaskFinishVo.setProcInstId(commonTaskFinishDTO.getPROC_INST_ID_());
                commonTaskFinishVo.setExecutionId(commonTaskFinishDTO.getEXECUTION_ID_());
                commonTaskFinishVo.setScopeId(commonTaskFinishDTO.getSCOPE_ID_());
                commonTaskFinishVo.setSubScopeId(commonTaskFinishDTO.getSUB_SCOPE_ID_());
                commonTaskFinishVo.setScopeType(commonTaskFinishDTO.getSCOPE_TYPE_());
                commonTaskFinishVo.setScopeDefinitionId(commonTaskFinishDTO.getSCOPE_DEFINITION_ID_());
                commonTaskFinishVo.setPropagatedStageInstId(commonTaskFinishDTO.getPROPAGATED_STAGE_INST_ID_());
                commonTaskFinishVo.setName(commonTaskFinishDTO.getNAME_());
                commonTaskFinishVo.setParentTaskId(commonTaskFinishDTO.getPARENT_TASK_ID_());
                commonTaskFinishVo.setDescription(commonTaskFinishDTO.getDESCRIPTION_());
                commonTaskFinishVo.setOwner(commonTaskFinishDTO.getOWNER_());
                commonTaskFinishVo.setAssignee(commonTaskFinishDTO.getASSIGNEE_());
                commonTaskFinishVo.setStartTime(commonTaskFinishDTO.getSTART_TIME_());
                commonTaskFinishVo.setClaimTime(commonTaskFinishDTO.getCLAIM_TIME_());
                commonTaskFinishVo.setEndTime(commonTaskFinishDTO.getEND_TIME_());
                commonTaskFinishVo.setDuration(commonTaskFinishDTO.getDURATION_());
                commonTaskFinishVo.setDeleteReason(commonTaskFinishDTO.getDELETE_REASON_());
                commonTaskFinishVo.setPriority(commonTaskFinishDTO.getPRIORITY_());
                commonTaskFinishVo.setDueDate(commonTaskFinishDTO.getDUE_DATE_());
                commonTaskFinishVo.setFormKey(commonTaskFinishDTO.getFORM_KEY_());
                commonTaskFinishVo.setCategory(commonTaskFinishDTO.getCATEGORY_());
                commonTaskFinishVo.setTenantId(commonTaskFinishDTO.getTENANT_ID_());
                commonTaskFinishVo.setLastUpdatedTime(commonTaskFinishDTO.getLAST_UPDATED_TIME_());

                //流程状态
                actBusinessStatus.setId(commonTaskFinishDTO.getAct_business_status_id());
                actBusinessStatus.setBusinessKey(commonTaskFinishDTO.getBusiness_key());
                actBusinessStatus.setProcessInstanceId(commonTaskFinishDTO.getProcess_instance_id());
                actBusinessStatus.setStatus(commonTaskFinishDTO.getStatus());
                actBusinessStatus.setTableName(commonTaskFinishDTO.getTable_name());
                actBusinessStatus.setSuspendedReason(commonTaskFinishDTO.getSuspended_reason());
                commonTaskFinishVo.setActBusinessStatus(actBusinessStatus);

                //业务数据
                commonTaskFinishVo.setBusinessColumn(commonTaskFinishDTO.getBusinessColumn());

                commonTaskFinishVos.add(commonTaskFinishVo);
            }
        }
        return commonTaskFinishVos;
    }

}

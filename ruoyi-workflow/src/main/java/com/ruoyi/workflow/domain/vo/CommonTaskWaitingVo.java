package com.ruoyi.workflow.domain.vo;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.common.utils.reflect.ReflectUtils;
import com.ruoyi.workflow.domain.ActBusinessStatus;
import com.ruoyi.workflow.domain.dto.CommonTaskWaitingDTO;
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
public class CommonTaskWaitingVo implements Serializable {

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
     * 流程执行id
     */
    private String executionId;

    /**
     * 流程实例id
     */
    private String procInstId;

    /**
     * 流程定义id
     */
    private String procDefId;

    private String taskDefId;
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
     * 节点id
     */
    private String taskDefKey;

    /**
     * 委托人id
     */
    private String owner;

    /**
     * 办理人
     */
    private String assignee;

    /**
     * 是否委托
     */
    private String delegation;


    private Integer priority;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 到期时间
     */
    private Date dueDate;

    /**
     * 分类
     */
    private String category;

    /**
     * 是否挂起
     */
    private Integer suspensionState;

    /**
     * 租户id
     */
    private String tenantId;

    /**
     * 表单key
     */
    private String formKey;

    /**
     * 认领时间
     */
    private Date claimTime;

    private Integer isCountEnabled;
    private Integer varCount;
    private Integer idLinkCount;
    private Integer subTaskCount;

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
     * 流程启动人
     */
    private String startUserNickName;

    /**
     * 流程启动人ID
     */
    private String startUserId;


    /**
     * 认领或归还 ture已认领，false未认领 ，空没有候选人
     */
    private Boolean isClaim;

    /**
     * 业务状态
     */
    private ActBusinessStatus actBusinessStatus;

    /**
     * 流程定义设置
     */
    private ActProcessDefSettingVo actProcessDefSetting;


    public static List<CommonTaskWaitingVo> convertToEntity(List<Map<String, Object>> records) {
        List<CommonTaskWaitingVo> commonTaskWaitingVos = new ArrayList<>();
        List<CommonTaskWaitingDTO> commonTaskWaitingDTOList = new ArrayList<>();
        if (!CollUtil.isEmpty(records)) {
            Field[] fields = ReflectUtils.getFields(CommonTaskWaitingDTO.class);
            for (Map<String, Object> e : records) {
                Map<String, Object> treeMap = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
                treeMap.putAll(e);
                CommonTaskWaitingDTO commonTaskWaitingDTO = new CommonTaskWaitingDTO();
                Map<String, Object> fieldMap = new HashMap<>();
                for (Field field : fields) {
                    Object o = treeMap.get(field.getName());
                    ReflectUtils.invokeSetter(commonTaskWaitingDTO, field.getName(), o);
                }
                for (Map.Entry<String, Object> entry : e.entrySet()) {
                    Field fd = Arrays.stream(fields).filter(f -> entry.getKey().equalsIgnoreCase(f.getName())).findFirst().orElse(null);
                    if (ObjectUtil.isNull(fd)) {
                        fieldMap.put(entry.getKey(), entry.getValue());
                    }
                }
                ReflectUtils.invokeSetter(commonTaskWaitingDTO, "businessColumn", fieldMap);
                commonTaskWaitingDTOList.add(commonTaskWaitingDTO);
            }
        }

        if (CollUtil.isNotEmpty(commonTaskWaitingDTOList)) {
            for (CommonTaskWaitingDTO commonTaskWaitingDTO : commonTaskWaitingDTOList) {
                CommonTaskWaitingVo commonTaskWaitingVo = new CommonTaskWaitingVo();
                ActBusinessStatus actBusinessStatus = new ActBusinessStatus();

                //流程数据
                commonTaskWaitingVo.setId(commonTaskWaitingDTO.getID_());
                commonTaskWaitingVo.setRev(commonTaskWaitingDTO.getREV_());
                commonTaskWaitingVo.setExecutionId(commonTaskWaitingDTO.getEXECUTION_ID_());
                commonTaskWaitingVo.setProcInstId(commonTaskWaitingDTO.getPROC_INST_ID_());
                commonTaskWaitingVo.setProcDefId(commonTaskWaitingDTO.getPROC_DEF_ID_());
                commonTaskWaitingVo.setTaskDefId(commonTaskWaitingDTO.getTASK_DEF_ID_());
                commonTaskWaitingVo.setScopeId(commonTaskWaitingDTO.getSCOPE_ID_());
                commonTaskWaitingVo.setScopeType(commonTaskWaitingDTO.getSCOPE_TYPE_());
                commonTaskWaitingVo.setScopeDefinitionId(commonTaskWaitingDTO.getSCOPE_DEFINITION_ID_());
                commonTaskWaitingVo.setPropagatedStageInstId(commonTaskWaitingDTO.getPROPAGATED_STAGE_INST_ID_());
                commonTaskWaitingVo.setName(commonTaskWaitingDTO.getNAME_());
                commonTaskWaitingVo.setParentTaskId(commonTaskWaitingDTO.getPARENT_TASK_ID_());
                commonTaskWaitingVo.setDescription(commonTaskWaitingDTO.getDESCRIPTION_());
                commonTaskWaitingVo.setTaskDefKey(commonTaskWaitingDTO.getTASK_DEF_KEY_());
                commonTaskWaitingVo.setOwner(commonTaskWaitingDTO.getOWNER_());
                commonTaskWaitingVo.setAssignee(commonTaskWaitingDTO.getASSIGNEE_());
                commonTaskWaitingVo.setDelegation(commonTaskWaitingDTO.getDELEGATION_());
                commonTaskWaitingVo.setPriority(commonTaskWaitingDTO.getPRIORITY_());
                commonTaskWaitingVo.setCreateTime(commonTaskWaitingDTO.getCREATE_TIME_());
                commonTaskWaitingVo.setDueDate(commonTaskWaitingDTO.getDUE_DATE_());
                commonTaskWaitingVo.setCategory(commonTaskWaitingDTO.getCATEGORY_());
                commonTaskWaitingVo.setSuspensionState(commonTaskWaitingDTO.getSUSPENSION_STATE_());
                commonTaskWaitingVo.setTenantId(commonTaskWaitingDTO.getTENANT_ID_());
                commonTaskWaitingVo.setFormKey(commonTaskWaitingDTO.getFORM_KEY_());
                commonTaskWaitingVo.setClaimTime(commonTaskWaitingDTO.getCLAIM_TIME_());
                commonTaskWaitingVo.setIsCountEnabled(commonTaskWaitingDTO.getIS_COUNT_ENABLED_());
                commonTaskWaitingVo.setVarCount(commonTaskWaitingDTO.getVAR_COUNT_());
                commonTaskWaitingVo.setIdLinkCount(commonTaskWaitingDTO.getID_LINK_COUNT_());
                commonTaskWaitingVo.setSubTaskCount(commonTaskWaitingDTO.getSUB_TASK_COUNT_());

                //流程状态
                actBusinessStatus.setId(commonTaskWaitingDTO.getAct_business_status_id());
                actBusinessStatus.setBusinessKey(commonTaskWaitingDTO.getBusiness_key());
                actBusinessStatus.setProcessInstanceId(commonTaskWaitingDTO.getProcess_instance_id());
                actBusinessStatus.setStatus(commonTaskWaitingDTO.getStatus());
                actBusinessStatus.setTableName(commonTaskWaitingDTO.getTable_name());
                actBusinessStatus.setSuspendedReason(commonTaskWaitingDTO.getSuspended_reason());
                commonTaskWaitingVo.setActBusinessStatus(actBusinessStatus);

                //业务数据
                commonTaskWaitingVo.setBusinessColumn(commonTaskWaitingDTO.getBusinessColumn());

                commonTaskWaitingVos.add(commonTaskWaitingVo);
            }
        }
        return commonTaskWaitingVos;
    }

}

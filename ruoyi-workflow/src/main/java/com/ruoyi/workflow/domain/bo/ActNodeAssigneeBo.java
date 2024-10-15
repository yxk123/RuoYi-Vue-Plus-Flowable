package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.workflow.domain.vo.FieldList;
import com.ruoyi.workflow.domain.vo.TaskListenerVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 流程节点人员设置对象 act_node_assignee
 *
 * @author gssong
 * @date 2021-11-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ActNodeAssigneeBo extends BaseEntity{

    private static final long serialVersionUID=1L;


    /**
     * id
     */
    private String id;

    /**
     * 流程定义id
     */
    private String processDefinitionId;

    /**
     * 选择方式  role按角色选人  dept按部门选人  person自定义选人
     */
    private String chooseWay;

    /**
     * 流程节点id
     */
    @NotBlank(message = "流程节点id不能为空", groups = { AddGroup.class})
    private String nodeId;

    /**
     * 流程节点名称
     */
    @NotBlank(message = "流程节点id不能为空", groups = { AddGroup.class})
    private String nodeName;

    /**
     * 审批人员
     */
    private String assignee;

    /**
     * 审批人员id
     */
    private String assigneeId;

    /**
     * 业务规则id
     */
    private Long businessRuleId;

    /**
     * 是否弹出选人
     */
    @NotNull(message = "是否弹出选人不能为空", groups = { AddGroup.class})
    private Boolean isShow;

    /**
     * 是否会签
     */
    @NotNull(message = "是否会签不能为空", groups = { AddGroup.class})
    private Boolean multiple;

    /**
     * 会签保存人员KEY值
     */
    private String multipleColumn;

    /**
     * 是否可退回到当前节点,0不可退回当前节点,1可退回当前节点
     */
    @NotNull(message = "是否能退回不能为空", groups = { AddGroup.class})
    private Boolean isBack;

    /**
     * 是否可委托
     */
    @NotNull(message = "是否能委托不能为空", groups = { AddGroup.class})
    private Boolean isDelegate;

    /**
     * 是否可转办
     */
    @NotNull(message = "是否能转办不能为空", groups = { AddGroup.class})
    private Boolean isTransmit;

    /**
     * 是否可抄送
     */
    @NotNull(message = "是否能抄送不能为空", groups = { AddGroup.class})
    private Boolean isCopy;

    /**
     * 是否可加签
     */
    private Boolean addMultiInstance;

    /**
     * 是否可减签
     */
    private Boolean deleteMultiInstance;

    /**
     * 任务监听
     */
    private String taskListener;

    /**
     * 自动审批,当前节点自动办理,下一节点不可弹窗选人
     */
    private Boolean autoComplete;

    /**
     * 字段
     */
    private String fieldListJson;

    /**
     * 当前节点是否显示驳回,0不显示驳回按钮,1显示驳回按钮
     */
    private Boolean showBack;

    /**
     * 任务监听
     */
    private List<TaskListenerVo> taskListenerList;

    /**
     * 字段属性集合
     */
    private List<FieldList> fieldList;

    /**
     * 下标 0为第一个节点
     */
    private Integer index = 1;

}

package com.ruoyi.workflow.domain.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 流程节点人员设置对象 act_node_assignee
 *
 * @author gssong
 * @date 2021-11-21
 */
@Data
public class ActNodeAssigneeVo implements Serializable {

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
    private String nodeId;

    /**
     * 流程节点名称
     */
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
    private Boolean isShow;

    /**
     * 是否会签
     */
    private Boolean multiple;

    /**
     * 会签保存人员KEY值
     */
    private String multipleColumn;

    /**
     * 是否可退回到当前节点,0不可退回当前节点,1可退回当前节点
     */
    private Boolean isBack;

    /**
     * 是否可委托
     */
    private Boolean isDelegate;

    /**
     * 是否可转办
     */
    private Boolean isTransmit;

    /**
     * 是否可抄送
     */
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
     * 字段属性
     */
    private Map<String, FieldList> fieldMap;

    /**
     * 下标 0为第一个节点
     */
    private Integer index = 1;

    /**
     * 是否最后一个节点
     */
    private Boolean end = false;

}

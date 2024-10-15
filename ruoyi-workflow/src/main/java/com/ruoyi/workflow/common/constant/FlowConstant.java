package com.ruoyi.workflow.common.constant;


/**
 * @description: 工作流常量
 * @author: gssong
 * @date: 2022-02-26
 */
public interface FlowConstant {

    String PNG = "png";

    String XML = "xml";

    String UTF_8 = "UTF-8";

    String ZIP = "ZIP";

    /**
     * bpmn2.0命名空间
     */
    String NAMESPACE = "http://b3mn.org/stencilset/bpmn2.0#";

    /**
     * 并行网关
     */
    String PARALLEL_GATEWAY = "parallelGateway";

    /**
     * 排它网关
     */
    String EXCLUSIVE_GATEWAY = "exclusiveGateway";

    /**
     * 包含网关
     */
    String INCLUSIVE_GATEWAY = "inclusiveGateway";

    /**
     * 子流程
     */
    String SUB_PROCESS = "SubProcess";

    /**
     * 结束节点
     */
    String END_EVENT = "endEvent";

    /**
     * 连线
     */
    String SEQUENCE_FLOW = "sequenceFlow";

    /**
     * 用户任务
     */
    String USER_TASK = "userTask";

    /**
     * 会签
     */
    String MULTI_INSTANCE = "multiInstance";

    /**
     * 会签任务总数
     */
    String NUMBER_OF_INSTANCES = "nrOfInstances";

    /**
     * 正在执行的会签总数
     */
    String NUMBER_OF_ACTIVE_INSTANCES = "nrOfActiveInstances";

    /**
     * 已完成的会签任务总数
     */
    String NUMBER_OF_COMPLETED_INSTANCES = "nrOfCompletedInstances";

    /**
     * 循环的索引值，可以使用elementIndexVariable属性修改loopCounter的变量名
     */
    String LOOP_COUNTER = "loopCounter";

    /**
     * 流程自定义人员
     */
    String WORKFLOW_ASSIGNEE = "workflowAssignee";

    /**
     * 角色
     */
    String WORKFLOW_ROLE = "role";

    /**
     * 部门
     */
    String WORKFLOW_DEPT = "dept";

    /**
     * 人员id
     */
    String WORKFLOW_PERSON = "person";

    /**
     * 业务规则
     */
    String WORKFLOW_RULE = "rule";

    /**
     * 流程状态对象
     */
    String ACT_BUSINESS_STATUS = "actBusinessStatus";

    /**
     * 流程节点对象
     */
    String ACT_NODE_ASSIGNEE_VO = "actNodeAssigneeVo";

    /**
     * 流程委派标识
     */
    String PENDING = "PENDING";

    /**
     * 候选标识
     */
    String CANDIDATE = "candidate";

    /**
     * 任务执行前
     */
    String HANDLE_BEFORE = "before";

    /**
     * 任务执行后
     */
    String HANDLE_AFTER = "after";

    /**
     * 任务执行前方法
     */
    String HANDLE_BEFORE_PROCESS = "handleBeforeProcess";

    /**
     * 任务执行后方法
     */
    String HANDLE_AFTER_PROCESS = "handleAfterProcess";

    /**
     * 流程终止，退回申请人，作废，撤销 执行
     */
    String HANDLE_PROCESS = "handleProcess";

    String PARAM_STRING = "String";

    String PARAM_SHORT = "Short";

    String PARAM_INTEGER = "Integer";

    String PARAM_LONG = "Long";

    String PARAM_FLOAT = "Float";

    String PARAM_DOUBLE = "Double";

    String PARAM_BOOLEAN = "Boolean";

    String MESSAGE_SUSPENDED = "当前任务已被挂起";

    String MESSAGE_CURRENT_TASK_IS_NULL = "当前任务不存在或你不是任务办理人";

    /**
     * 缓存名称
     */
    String CACHE_NAMES = "workflowCache:";

    /**
     * 流程业务状态管理 cache key
     */
    String CACHE_ACT_BUSINESS_STATUS_KEY = CACHE_NAMES + "act_business_status";

    /**
     * 包含
     */
    String CONTAINS = "contains";

    /**
     * 不包含
     */
    String NOT_CONTAINS = "notContains";

    /**
     * 包含字符拼接
     */
    String STR_CONTAINS = "%s.contains(" + "\"" + "%s" + "\"" + ")";

    /**
     * 不包含字符拼接
     */
    String STR_NOT_CONTAINS = "!(%s.contains(" + "\"" + "%s" + "\"" + "))";

    /**
     * 等于
     */
    String STR_EQUALS = "\"" + "%s" + "\"";



}

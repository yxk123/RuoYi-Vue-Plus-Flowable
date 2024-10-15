package com.ruoyi.workflow.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.workflow.domain.ActProcessDefSetting;
import lombok.Data;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;


/**
 * 流程定义设置视图对象 act_process_def_Setting
 *
 * @author gssong
 * @date 2022-08-28
 */
@Data
@ExcelIgnoreUnannotated
public class ActProcessDefSettingVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 流程定义id
     */
    @ExcelProperty(value = "流程定义id")
    private String processDefinitionId;

    /**
     * 流程定义key
     */
    @ExcelProperty(value = "流程定义key")
    private String processDefinitionKey;

    /**
     * 表名
     */
    @ExcelProperty(value = "表名")
    private String tableName;

    /**
     * 流程定义名称
     */
    @ExcelProperty(value = "流程定义名称")
    private String processDefinitionName;

    /**
     * 组件名称
     */
    @ExcelProperty(value = "组件名称")
    private String componentName;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * true 为审批节点选人 false 为申请人选择全部人员
     */
    @ExcelProperty(value = "true 为审批节点选人 false 为申请人选择全部人员 ")
    private Boolean defaultProcess;

    /**
     * 任务监听
     */
    @ExcelProperty(value = "任务监听 ")
    private String taskListener;

    /**
     * 任务监听
     */
    private List<TaskListener> taskListenerList = Collections.emptyList();



    @Data
    public static class TaskListener implements Serializable {

        private static final long serialVersionUID = 1L;

        /**
         * 事件前后  after,before
         */
        private String eventType;

        /**
         * 状态
         */
        private List<String> status;

        /**
         * bean名称
         */
        private String beanName;

    }

}

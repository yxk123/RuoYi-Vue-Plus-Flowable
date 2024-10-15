package com.ruoyi.workflow.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;



/**
 * 网关条件关联网关节点视图对象 act_gateway_condition_relate
 *
 * @author gssong
 * @date 2023-03-30
 */
@Data
@ExcelIgnoreUnannotated
public class ActGatewayConditionRelateVo {

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
     * 连线id
     */
    @ExcelProperty(value = "连线id")
    private String sequenceId;

    /**
     * 网关条件id
     */
    @ExcelProperty(value = "网关条件id")
    private Long gatewayConditionId;

    /**
     * 网关条件
     */
    @ExcelProperty(value = "网关条件")
    private ActGatewayConditionVo actGatewayConditionVo;


}

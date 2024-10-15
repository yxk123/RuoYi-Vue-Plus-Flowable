package com.ruoyi.workflow.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.workflow.domain.bo.ActGatewayConditionRelateBo;
import com.ruoyi.workflow.service.IActGatewayConditionRelateService;

/**
 * 网关条件关联网关节点
 *
 * @author gssong
 * @date 2023-03-30
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/workflow/gatewayConditionRelate")
public class ActGatewayConditionRelateController extends BaseController {

    private final IActGatewayConditionRelateService iActGatewayConditionRelateService;

    /**
     * 新增网关条件关联网关节点
     */
    @Log(title = "网关条件关联网关节点", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ActGatewayConditionRelateBo bo) {
        return toAjax(iActGatewayConditionRelateService.save(bo));
    }

    /**
     * 删除网关条件关联网关节点
     *
     * @param processDefinitionId
     * @param sequenceId
     * @return
     */
    @Log(title = "网关条件关联网关节点", businessType = BusinessType.DELETE)
    @RepeatSubmit()
    @DeleteMapping("/{processDefinitionId}/{sequenceId}")
    public R<Void> del(@PathVariable String processDefinitionId, @PathVariable String sequenceId) {
        return toAjax(iActGatewayConditionRelateService.del(processDefinitionId,sequenceId));
    }
}

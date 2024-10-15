package com.ruoyi.workflow.controller;

import java.util.List;
import java.util.Arrays;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.ruoyi.workflow.domain.bo.ActGatewayConditionBo;
import com.ruoyi.workflow.service.IActGatewayConditionService;
import lombok.RequiredArgsConstructor;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;

import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.PageQuery;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.workflow.domain.vo.ActGatewayConditionVo;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 网关条件
 *
 * @author gssong
 * @date 2023-03-25
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/workflow/gatewayCondition")
public class ActGatewayConditionController extends BaseController {

    private final IActGatewayConditionService iActGatewayConditionService;

    /**
     * 查询网关条件列表
     */
    @SaCheckPermission("workflow:gatewayCondition:list")
    @GetMapping("/list")
    public TableDataInfo<ActGatewayConditionVo> list(ActGatewayConditionBo bo, PageQuery pageQuery) {
        return iActGatewayConditionService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出网关条件列表
     */
    @Log(title = "网关条件", businessType = BusinessType.EXPORT)
    @SaCheckPermission("workflow:gatewayCondition:export")
    @PostMapping("/export")
    public void export(ActGatewayConditionBo bo, HttpServletResponse response) {
        List<ActGatewayConditionVo> list = iActGatewayConditionService.queryList(bo);
        ExcelUtil.exportExcel(list, "网关条件", ActGatewayConditionVo.class, response);
    }

    /**
     * 获取网关条件详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("workflow:gatewayCondition:query")
    @GetMapping("/{id}")
    public R<ActGatewayConditionVo> getInfo(@NotNull(message = "主键不能为空")
                                            @PathVariable Long id) {
        return R.ok(iActGatewayConditionService.queryById(id));
    }

    /**
     * 新增网关条件
     */
    @Log(title = "网关条件", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @SaCheckPermission("workflow:gatewayCondition:add")
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ActGatewayConditionBo bo) {
        return toAjax(iActGatewayConditionService.insertByBo(bo));
    }

    /**
     * 修改网关条件
     */
    @Log(title = "网关条件", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @SaCheckPermission("workflow:gatewayCondition:edit")
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ActGatewayConditionBo bo) {
        return toAjax(iActGatewayConditionService.updateByBo(bo));
    }

    /**
     * 删除网关条件
     *
     * @param ids 主键串
     */
    @Log(title = "网关条件", businessType = BusinessType.DELETE)
    @SaCheckPermission("workflow:gatewayCondition:remove")
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iActGatewayConditionService.deleteByIds(Arrays.asList(ids)));
    }


    /**
     * 查询网关条件
     *
     * @param processDefinitionId
     * @param sequenceId
     * @return
     */
    @GetMapping("/{processDefinitionId}/{sequenceId}")
    public R<ActGatewayConditionVo> getInfo(@PathVariable String processDefinitionId, @PathVariable String sequenceId) {
        return R.ok(iActGatewayConditionService.getInfo(processDefinitionId, sequenceId));
    }
}

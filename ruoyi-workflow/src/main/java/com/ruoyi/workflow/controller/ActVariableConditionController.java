package com.ruoyi.workflow.controller;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import lombok.RequiredArgsConstructor;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;

import cn.dev33.satoken.annotation.SaCheckPermission;
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
import com.ruoyi.workflow.domain.vo.ActVariableConditionVo;
import com.ruoyi.workflow.domain.bo.ActVariableConditionBo;
import com.ruoyi.workflow.service.IActVariableConditionService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 网关变量条件
 *
 * @author gssong
 * @date 2023-02-10
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/workflow/variableCondition")
public class ActVariableConditionController extends BaseController {

    private final IActVariableConditionService iActVariableConditionService;

    /**
     * 查询网关变量条件列表
     */
    @SaCheckPermission("workflow:variableCondition:list")
    @GetMapping("/list")
    public TableDataInfo<ActVariableConditionVo> list(ActVariableConditionBo bo, PageQuery pageQuery) {
        return iActVariableConditionService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出网关变量条件列表
     */
    @SaCheckPermission("workflow:variableCondition:export")
    @Log(title = "网关变量条件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ActVariableConditionBo bo, HttpServletResponse response) {
        List<ActVariableConditionVo> list = iActVariableConditionService.queryList(bo);
        ExcelUtil.exportExcel(list, "网关变量条件", ActVariableConditionVo.class, response);
    }

    /**
     * 获取网关变量条件详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("workflow:variableCondition:query")
    @GetMapping("/{id}")
    public R<ActVariableConditionVo> getInfo(@NotNull(message = "主键不能为空")
                                             @PathVariable Long id) {
        return R.ok(iActVariableConditionService.queryById(id));
    }

    /**
     * 新增网关变量条件
     */
    @SaCheckPermission("workflow:variableCondition:add")
    @Log(title = "网关变量条件", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ActVariableConditionBo bo) {
        return toAjax(iActVariableConditionService.insertByBo(bo));
    }

    /**
     * 修改网关变量条件
     */
    @SaCheckPermission("workflow:variableCondition:edit")
    @Log(title = "网关变量条件", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ActVariableConditionBo bo) {
        return toAjax(iActVariableConditionService.updateByBo(bo));
    }

    /**
     * 删除网关变量条件
     *
     * @param ids 主键串
     */
    @SaCheckPermission("workflow:variableCondition:remove")
    @Log(title = "网关变量条件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iActVariableConditionService.deleteByIds(Arrays.asList(ids)));
    }

    /**
     * 按照流程定义key查询
     *
     * @param key
     * @return
     */
    @GetMapping("/queryListByKey/{key}")
    public R<List<ActVariableConditionVo>> queryListByKey(@PathVariable String key) {
        return R.ok(iActVariableConditionService.queryListByKey(key));
    }
}

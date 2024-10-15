package com.ruoyi.web.controller.system;

import java.util.List;

import lombok.RequiredArgsConstructor;

import javax.validation.constraints.*;

import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.vo.SysSocialUserVo;
import com.ruoyi.system.domain.bo.SysSocialUserBo;
import com.ruoyi.system.service.ISysSocialUserService;

/**
 * 社会化用户
 *
 * @author gssong
 * @date 2023-06-20
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/socialUser")
public class SysSocialUserController extends BaseController {

    private final ISysSocialUserService iSysSocialUserService;

    /**
     * 查询社会化用户列表
     */
    @GetMapping("/list")
    public R<List<SysSocialUserVo>> list(SysSocialUserBo bo) {
        return R.ok(iSysSocialUserService.queryList(bo));
    }

    /**
     * 删除社会化用户
     *
     * @param id 主键
     */
    @Log(title = "社会化用户", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public R<Void> remove(@NotNull(message = "主键不能为空")
                          @PathVariable Long id) {
        return toAjax(iSysSocialUserService.deleteById(id));
    }
}

package com.ruoyi.workflow.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.annotation.RepeatSubmit;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.workflow.domain.bo.ModelBo;
import com.ruoyi.workflow.service.IActModelService;
import lombok.RequiredArgsConstructor;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Model;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.Map;

/**
 * 模型管理
 *
 * @author gssong
 * @date 2022-02-26
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/workflow/model")
public class ActModelController extends BaseController {

    private final IActModelService iActModelService;

    private final RepositoryService repositoryService;


    /**
     * 新建模型
     *
     * @param: data
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/10/3
     */
    @Log(title = "模型管理", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class)  @RequestBody ModelBo data) {
        return toAjax(iActModelService.add(data));
    }

    /**
     * 编辑模型
     *
     * @param: data
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/5/22 13:47
     */
    @Log(title = "模型管理", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping("/update")
    public R<Void> edit(@RequestBody ModelBo data) {
        return toAjax(iActModelService.edit(data));
    }

    /**
     * 保存模型
     *
     * @param: data
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/5/22 13:47
     */
    @Log(title = "模型管理", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> update(@Validated(EditGroup.class) @RequestBody ModelBo data) {
        return toAjax(iActModelService.update(data));
    }

    /**
     * 查询模型信息
     *
     * @param: modelId 模型id
     * @return: com.ruoyi.common.core.domain.R<java.util.Map < java.lang.String, java.lang.Object>>
     * @author: gssong
     * @date: 2022/5/22 13:42
     */
    @GetMapping("/getInfo/{modelId}/xml")
    public R<Map<String, Object>> getEditorXml(@NotBlank(message = "模型id不能为空") @PathVariable String modelId) {
        return R.ok(iActModelService.getEditorXml(modelId));
    }

    /**
     * 查询模型列表
     *
     * @param: modelBo 请求参数
     * @return: com.ruoyi.common.core.page.TableDataInfo<org.flowable.engine.repository.Model>
     * @author: gssong
     * @date: 2021/10/3
     */
    @GetMapping("/list")
    public TableDataInfo<Model> getByPage(ModelBo modelBo) {
        return iActModelService.getByPage(modelBo);
    }

    /**
     * 通过流程定义模型id部署流程定义
     *
     * @param: id 模型id
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/10/3
     */
    @Log(title = "模型管理", businessType = BusinessType.INSERT)
    @PostMapping("/deploy/{id}")
    public R<Void> deploy(@NotBlank(message = "流程部署id不能为空") @PathVariable("id") String id) {
        return toAjax(iActModelService.deploy(id));
    }

    /**
     * 删除流程定义模型
     *
     * @param: id 模型id
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/10/3
     */
    @Log(title = "模型管理", businessType = BusinessType.DELETE)
    @RepeatSubmit()
    @DeleteMapping("/{ids}")
    @Transactional(rollbackFor = Exception.class)
    public R<Void> add(@NotEmpty(message = "主键不能为空") @PathVariable String[] ids) {
        for (String id : ids) {
            repositoryService.deleteModel(id);
        }
        return R.ok();
    }

    /**
     * 导出流程定义模型zip压缩包
     *
     * @param: modelId
     * @param: response
     * @return: void
     * @author: gssong
     * @date: 2021/10/7
     */
    @GetMapping("/export/zip/{modelId}")
    public void exportZip(@NotEmpty(message = "模型id不能为空") @PathVariable String modelId,
                          HttpServletResponse response) {
        iActModelService.exportZip(modelId, response);
    }

    /**
     * 将流程定义转换为模型
     *
     * @param: processDefinitionId 流程定义id
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/11/6
     */
    @Log(title = "模型管理", businessType = BusinessType.UPDATE)
    @PutMapping("/convertToModel/{processDefinitionId}")
    public R<Void> convertToModel(@NotEmpty(message = "流程定义id不能为空") @PathVariable String processDefinitionId) {
        Boolean convertToModel = iActModelService.convertToModel(processDefinitionId);
        return toAjax(convertToModel);
    }

}

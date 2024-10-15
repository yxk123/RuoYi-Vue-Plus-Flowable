package com.ruoyi.workflow.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.workflow.domain.bo.DefinitionBo;
import com.ruoyi.workflow.domain.vo.ProcessDefinitionVo;
import com.ruoyi.workflow.service.IActProcessDefinitionService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.util.*;

/**
 * 流程定义
 *
 * @author gssong
 * @date 2021/10/07 11:12
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/workflow/definition")
public class ActProcessDefinitionController extends BaseController {

    private final IActProcessDefinitionService iActProcessDefinitionService;

    /**
     * 查询流程定义列表
     *
     * @param: DefinitionBo
     * @return: com.ruoyi.common.core.domain.R<java.util.List < com.ruoyi.workflow.domain.vo.ProcessDefinitionVo>>
     * @author: gssong
     * @date: 2021/10/7
     */
    @GetMapping("/list")
    public TableDataInfo<ProcessDefinitionVo> getByPage(DefinitionBo definitionBo) {
        return iActProcessDefinitionService.getByPage(definitionBo);
    }

    /**
     * 查询历史流程定义列表
     *
     * @param: definitionBo
     * @return: com.ruoyi.common.core.domain.R<java.util.List < com.ruoyi.workflow.domain.vo.ProcessDefinitionVo>>
     * @author: gssong
     * @date: 2021/10/7
     */
    @GetMapping("/getHistByPage")
    public R<List<ProcessDefinitionVo>> getHistByPage(DefinitionBo definitionBo) {
        List<ProcessDefinitionVo> definitionVoList = iActProcessDefinitionService.getHistByPage(definitionBo);
        return R.ok(definitionVoList);
    }


    /**
     * 删除流程定义
     *
     * @param: deploymentId 流程部署id
     * @param: definitionId 流程定义id
     * @param: definitionKey 流程定义key
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/10/7
     */
    @Log(title = "流程定义管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deploymentId}/{definitionId}/{definitionKey}")
    public R<Void> deleteDeployment(@NotBlank(message = "流程部署id不能为空") @PathVariable String deploymentId,
                                    @NotBlank(message = "流程定义id不能为空") @PathVariable String definitionId,
                                    @NotBlank(message = "流程定义key不能为空") @PathVariable String definitionKey) {
        return toAjax(iActProcessDefinitionService.deleteDeployment(deploymentId, definitionId, definitionKey));
    }


    /**
     * 通过zip或xml部署流程定义
     *
     * @param: file
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2022/4/12 13:32
     */
    @Log(title = "流程定义管理", businessType = BusinessType.INSERT)
    @PostMapping("/deployByFile")
    public R<Void> deployByFile(@RequestParam("file") MultipartFile file, @RequestParam("categoryCode") String categoryCode) {
        return toAjax(iActProcessDefinitionService.deployByFile(file, categoryCode));
    }

    /**
     * 查看xml文件
     *
     * @param: definitionId
     * @return: com.ruoyi.common.core.domain.R<java.lang.Object>
     * @author: gssong
     * @date: 2022/5/3 19:25
     */
    @GetMapping("/getXml/{definitionId}")
    public R<Map<String, Object>> getXml(@NotBlank(message = "流程定义id不能为空") @PathVariable String definitionId) {
        Map<String, Object> map = new HashMap<>();
        String xmlStr = iActProcessDefinitionService.getXml(definitionId);
        List<String> xml = new ArrayList<>(Arrays.asList(xmlStr.split("\n")));
        map.put("xml", xml);
        map.put("xmlStr", xmlStr);
        return R.ok(map);
    }

    /**
     * 激活或者挂起流程定义
     *
     * @param: data 参数
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2021/10/10
     */
    @Log(title = "流程定义管理", businessType = BusinessType.UPDATE)
    @PutMapping("/updateProcDefState")
    public R<Void> updateProcDefState(@RequestBody Map<String, Object> data) {
        return toAjax(iActProcessDefinitionService.updateProcDefState(data));
    }

    /**
     * 迁移流程定义
     *
     * @param: currentProcessDefinitionId
     * @param: fromProcessDefinitionId
     * @return: com.ruoyi.common.core.domain.R<java.lang.Boolean>
     * @author: gssong
     * @date: 2022/11/1 12:49
     */
    @Log(title = "流程定义管理", businessType = BusinessType.UPDATE)
    @PutMapping("/migrationProcessDefinition/{currentProcessDefinitionId}/{fromProcessDefinitionId}")
    public R<Boolean> migrationProcessDefinition(@PathVariable String currentProcessDefinitionId, @PathVariable String fromProcessDefinitionId) {
        return R.ok(iActProcessDefinitionService.migrationProcessDefinition(currentProcessDefinitionId, fromProcessDefinitionId));
    }

    /**
     * @description: 流程模拟执行
     * @param: definitionBo
     * @return: com.ruoyi.common.core.domain.R<java.util.Map < java.lang.String, java.lang.Object>>
     * @author: gssong
     * @date: 2023/2/2 18:59
     */
    @PostMapping("/simulationExecution")
    public R<Map<String, Object>> simulationExecution(@RequestBody DefinitionBo definitionBo) {
        return R.ok(iActProcessDefinitionService.simulationExecution(definitionBo));
    }

    /**
     * @description: 获取流程变量
     * @param: processDefinitionId
     * @return: com.ruoyi.common.core.domain.R<java.util.Map < java.lang.String, java.lang.Object>>
     * @author: gssong
     * @date: 2023/2/2 18:59
     */
    @GetMapping("/getProcessVariables/{processDefinitionId}")
    public R<Map<String, Object>> getProcessVariables(@PathVariable String processDefinitionId) {
        return R.ok(iActProcessDefinitionService.getProcessVariables(processDefinitionId));
    }

    /**
     * 查看流程定义图片
     *
     * @param processDefinitionId 流程定义id
     */
    @GetMapping("/processDefinitionImage/{processDefinitionId}")
    public R<String> processDefinitionImage(@PathVariable String processDefinitionId) {
        return R.ok("操作成功", iActProcessDefinitionService.processDefinitionImage(processDefinitionId));
    }

}

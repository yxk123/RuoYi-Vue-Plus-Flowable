package com.ruoyi.workflow.service;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.workflow.domain.bo.DefinitionBo;
import com.ruoyi.workflow.domain.vo.ProcessDefinitionVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @author gssong
 */
public interface IActProcessDefinitionService {
    /**
     * 查询流程定义列表
     *
     * @param definitionBo 参数
     * @return 结果
     */
    TableDataInfo<ProcessDefinitionVo> getByPage(DefinitionBo definitionBo);

    /**
     * 删除流程定义
     *
     * @param deploymentId  部署id
     * @param definitionId  流程定义id
     * @param definitionKey 流程定义key
     * @return 结果
     */
    boolean deleteDeployment(String deploymentId, String definitionId, String definitionKey);

    /**
     * 通过zip或xml部署流程定义
     *
     * @param file         文件
     * @param categoryCode 分类
     * @return 结果
     */
    boolean deployByFile(MultipartFile file, String categoryCode);

    /**
     * 查看xml文件
     *
     * @param definitionId 流程定义id
     * @return 结果
     */
    String getXml(String definitionId);

    /**
     * 查询历史流程定义列表
     *
     * @param definitionBo 参数
     * @return 结果
     */
    List<ProcessDefinitionVo> getHistByPage(DefinitionBo definitionBo);

    /**
     * 激活或者挂起流程定义
     *
     * @param data 参数
     * @return 结果
     */
    boolean updateProcDefState(Map<String, Object> data);

    /**
     * 迁移流程定义
     *
     * @param currentProcessDefinitionId 当前流程定义id
     * @param fromProcessDefinitionId    需要迁移到的流程定义id
     * @return 结果
     */
    boolean migrationProcessDefinition(String currentProcessDefinitionId, String fromProcessDefinitionId);

    /**
     * 流程模拟执行
     *
     * @param definitionBo 参数
     * @return 结果
     */
    Map<String, Object> simulationExecution(DefinitionBo definitionBo);

    /**
     * 获取流程变量
     *
     * @param processDefinitionId 流程定义id
     * @return 结果
     */
    Map<String, Object> getProcessVariables(String processDefinitionId);

    /**
     * 查看流程定义图片
     *
     * @param processDefinitionId 流程定义id
     * @return 结果
     */
    String processDefinitionImage(String processDefinitionId);
}

package com.ruoyi.workflow.service;

import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.workflow.domain.bo.ModelBo;
import org.flowable.engine.repository.Model;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @description: 模型接口
 * @author: gssong
 * @date: 2022-02-26
 */
public interface IActModelService {


    /**
     * 新增模型对象
     *
     * @param data 参数
     * @return 结果
     */
    Boolean add(ModelBo data);

    /**
     * 编辑模型对象
     *
     * @param data 参数
     * @return 结果
     */
    Boolean edit(ModelBo data);


    /**
     * 保存模型
     *
     * @param data 参数
     * @return 结果
     */
    Boolean update(ModelBo data);

    /**
     * 查询模型信息
     *
     * @param modelId 模型id
     * @return 结果
     */
    Map<String, Object> getEditorXml(String modelId);

    /**
     * 分页查询模型
     *
     * @param modelBo 参数
     * @return 结果
     */
    TableDataInfo<Model> getByPage(ModelBo modelBo);

    /**
     * 通过流程定义模型id部署流程定义
     *
     * @param id 模型id
     * @return 结果
     */
    Boolean deploy(String id);

    /**
     * 导出流程定义模型zip压缩包
     *
     * @param modelId  模型id
     * @param response 响应
     */
    void exportZip(String modelId, HttpServletResponse response);

    /**
     * 将流程定义转换为模型
     *
     * @param processDefinitionId 流程定义id
     * @return 结果
     */
    Boolean convertToModel(String processDefinitionId);
}

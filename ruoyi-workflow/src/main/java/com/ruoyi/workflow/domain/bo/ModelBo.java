package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import com.ruoyi.workflow.common.PageEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @description: 模型请求对象
 * @author: gssong
 * @date: 2022年7月3日16:01:36
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ModelBo extends PageEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 模型id
     */
    @NotBlank(message = "模型id不能为空", groups = {EditGroup.class})
    private String modelId;

    /**
     * 模型xml
     */
    @NotBlank(message = "模型xml不能为空", groups = {AddGroup.class, EditGroup.class})
    private String xml;

    /**
     * 模型图片
     */
    @NotBlank(message = "模型图片不能为空", groups = {EditGroup.class})
    private String svg;

    /**
     * 模型名称
     */
    @NotBlank(message = "模型名称不能为空", groups = {AddGroup.class, EditGroup.class})
    private String modelName;

    /**
     * 模型标识key
     */
    @NotBlank(message = "流程KEY不能为空", groups = {AddGroup.class, EditGroup.class})
    private String modelKey;

    /**
     * 流程分类
     */
    @NotBlank(message = "流程分类不能为空", groups = {AddGroup.class})
    private String categoryCode;

    /**
     * 备注
     */
    private String remark;

}

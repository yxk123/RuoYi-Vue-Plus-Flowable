package com.ruoyi.workflow.service;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.workflow.domain.vo.ActProcessDefSettingVo;
import com.ruoyi.workflow.domain.bo.ActProcessDefSettingBo;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 流程定义设置Service接口
 *
 * @author gssong
 * @date 2022-08-28
 */
public interface IActProcessDefSettingService {

    /**
     * 查询流程定义设置
     *
     * @param id 主键
     * @return 结果
     */
    ActProcessDefSettingVo queryById(Long id);

    /**
     * 按流程定义id查询流程定义设置详细
     *
     * @param defId 流程定义id
     * @return 结果
     */
    ActProcessDefSettingVo getProcessDefSettingByDefId(String defId);

    /**
     * 按流程定义id集合查询流程定义设置详细集合
     *
     * @param defIds 流程定义id
     * @return 结果
     */
    List<ActProcessDefSettingVo> getProcessDefSettingByDefIds(List<String> defIds);

    /**
     * 校验表单是否关联
     *
     * @param bo 参数
     * @return 结果
     */
    R<List<Long>> checkProcessDefSetting(ActProcessDefSettingBo bo);

    /**
     * 查询流程定义设置列表
     *
     * @param bo        参数
     * @param pageQuery 分页
     * @return 结果
     */
    TableDataInfo<ActProcessDefSettingVo> queryPageList(ActProcessDefSettingBo bo, PageQuery pageQuery);

    /**
     * 查询流程定义设置列表
     *
     * @param bo 参数
     * @return 结果
     */
    List<ActProcessDefSettingVo> queryList(ActProcessDefSettingBo bo);

    /**
     * 修改流程定义设置
     *
     * @param bo 参数
     * @return 结果
     */
    ActProcessDefSettingVo insertByBo(ActProcessDefSettingBo bo);

    /**
     * 修改流程定义设置
     *
     * @param bo 参数
     * @return 结果
     */
    Boolean updateByBo(ActProcessDefSettingBo bo);

    /**
     * 校验并批量删除流程定义设置信息
     *
     * @param ids 主键
     * @return 结果
     */
    Boolean deleteWithValidByIds(Collection<Long> ids);

    /**
     * 按照流程定义id删除
     *
     * @param definitionIds 流程定义id
     * @return 结果
     */
    Boolean deleteByDefinitionIds(List<String> definitionIds);
}

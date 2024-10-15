package com.ruoyi.workflow.flowable.cmd;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.StreamUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.system.domain.vo.SysOssVo;
import com.ruoyi.system.service.ISysOssService;
import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.impl.persistence.entity.AttachmentEntity;
import org.flowable.engine.impl.persistence.entity.AttachmentEntityManager;
import org.flowable.engine.impl.util.CommandContextUtil;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 附件上传
 *
 * @author gssong
 */
public class AttachmentCmd implements Command<Boolean> {

    private final String fileId;

    private final String taskId;

    private final String processInstanceId;

    public AttachmentCmd(String fileId, String taskId, String processInstanceId) {
        this.fileId = fileId;
        this.taskId = taskId;
        this.processInstanceId = processInstanceId;
    }

    @Override
    public Boolean execute(CommandContext commandContext) {
        try {
            if (StringUtils.isNotBlank(fileId)) {
                List<Long> fileIds = StreamUtils.toList(Arrays.asList(fileId.split(StrUtil.COMMA)), Long::valueOf);
                List<SysOssVo> sysOssVos = SpringUtils.getBean(ISysOssService.class).listByIds(fileIds);
                if (CollUtil.isNotEmpty(sysOssVos)) {
                    for (SysOssVo sysOssVo : sysOssVos) {
                        AttachmentEntityManager attachmentEntityManager = CommandContextUtil.getAttachmentEntityManager();
                        AttachmentEntity attachmentEntity = attachmentEntityManager.create();
                        attachmentEntity.setRevision(1);
                        attachmentEntity.setUserId(LoginHelper.getUserId().toString());
                        attachmentEntity.setName(sysOssVo.getOriginalName());
                        attachmentEntity.setDescription(sysOssVo.getOriginalName());
                        attachmentEntity.setType(sysOssVo.getFileSuffix());
                        attachmentEntity.setTaskId(taskId);
                        attachmentEntity.setProcessInstanceId(processInstanceId);
                        attachmentEntity.setContentId(sysOssVo.getOssId().toString());
                        attachmentEntity.setTime(new Date());
                        attachmentEntityManager.insert(attachmentEntity);
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return true;
    }
}

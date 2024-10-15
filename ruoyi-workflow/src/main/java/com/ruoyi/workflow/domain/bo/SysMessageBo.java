package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import com.ruoyi.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.*;

import java.util.Date;

import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 消息通知业务对象 sys_message
 *
 * @author gssong
 * @date 2022-06-17
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class SysMessageBo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = {EditGroup.class})
    private Long id;

    /**
     * 消息发送者id
     */
    @NotNull(message = "消息发送者id不能为空", groups = {AddGroup.class, EditGroup.class})
    private Long sendId;

    /**
     * 消息接收者id
     */
    @NotNull(message = "消息接收者id不能为空", groups = {AddGroup.class, EditGroup.class})
    private Long recordId;

    /**
     * 消息类型1：站内信，2：邮件，3：短信
     */
    @NotNull(message = "消息类型不能为空", groups = {AddGroup.class, EditGroup.class})
    private String type;

    /**
     * 阅读时间
     */

    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private Date readTime;

    /**
     * 标题
     */
    private String title;

    /**
     * 消息内容
     */
    private String messageContent;


}

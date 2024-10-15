package com.ruoyi.workflow.domain.vo;

import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.ruoyi.common.annotation.ExcelDictFormat;
import com.ruoyi.common.annotation.Translation;
import com.ruoyi.common.constant.TransConstant;
import com.ruoyi.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 消息通知视图对象 sys_message
 *
 * @author gssong
 * @date 2022-06-17
 */
@Data
@ExcelIgnoreUnannotated
public class SysMessageVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 消息发送者id
     */
    @ExcelProperty(value = "消息发送者id")
    private Long sendId;

    /**
     * 消息接收者
     */
    @Translation(type = TransConstant.USER_ID_TO_NICKNAME, mapper = "sendId")
    private String sendName;

    /**
     * 消息接收者id
     */
    @ExcelProperty(value = "消息接收者id")
    private Long recordId;

    /**
     * 消息接收者
     */
    @Translation(type = TransConstant.USER_ID_TO_NICKNAME, mapper = "recordId")
    private String recordName;

    /**
     * 标题
     */
    @ExcelProperty(value = "标题")
    private String title;

    /**
     * 阅读时间
     */
    @ExcelProperty(value = "阅读时间")
    private Date readTime;

    /**
     * 消息类型1：站内信，2：邮件，3：短信
     */
    @ExcelProperty(value = "消息类型1：站内信，2：邮件，3：短信", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_message")
    private String type;

    /**
     * 消息内容
     */
    @ExcelProperty(value = "消息内容")
    private String messageContent;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

    /**
     * 创建人
     */
    @ExcelProperty(value = "创建人")
    private String createBy;

    /**
     * 更新时间
     */
    @ExcelProperty(value = "更新时间")
    private Date updateTime;

    /**
     * 更新人
     */
    @ExcelProperty(value = "更新人")
    private String updateBy;


}

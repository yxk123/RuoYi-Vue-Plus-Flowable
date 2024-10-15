package com.ruoyi.system.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.util.Date;


/**
 * 社会化用户视图对象 sys_social_user
 *
 * @author gssong
 * @date 2023-06-20
 */
@Data
@ExcelIgnoreUnannotated
public class SysSocialUserVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long id;

    /**
     * 第三方系统的唯一ID
     */
    @ExcelProperty(value = "第三方系统的唯一ID")
    private String uuid;

    /**
     * 第三方用户来源
     */
    @ExcelProperty(value = "第三方用户来源")
    private String source;

    /**
     * 用户的授权令牌
     */
    @ExcelProperty(value = "用户的授权令牌")
    private String accessToken;

    /**
     * 第三方用户的授权令牌的有效期
     */
    @ExcelProperty(value = "第三方用户的授权令牌的有效期")
    private Long expireIn;

    /**
     * 刷新令牌
     */
    @ExcelProperty(value = "刷新令牌")
    private String refreshToken;

    /**
     * 第三方用户的 open id
     */
    @ExcelProperty(value = "第三方用户的 open id")
    private String openId;

    /**
     * 第三方用户的 ID
     */
    @ExcelProperty(value = "第三方用户的 ID")
    private String uid;

    /**
     * 个别平台的授权信息
     */
    @ExcelProperty(value = "个别平台的授权信息")
    private String accessCode;

    /**
     * 第三方用户的 union id
     */
    @ExcelProperty(value = "第三方用户的 union id")
    private String unionId;

    /**
     * 第三方用户授予的权限
     */
    @ExcelProperty(value = "第三方用户授予的权限")
    private String scope;

    /**
     * 个别平台的授权信息
     */
    @ExcelProperty(value = "个别平台的授权信息")
    private String tokenType;

    /**
     * id token
     */
    @ExcelProperty(value = "id token")
    private String idToken;

    /**
     * 小米平台用户的附带属性
     */
    @ExcelProperty(value = "小米平台用户的附带属性")
    private String macAlgorithm;

    /**
     * 小米平台用户的附带属性
     */
    @ExcelProperty(value = "小米平台用户的附带属性")
    private String macKey;

    /**
     * 用户的授权code
     */
    @ExcelProperty(value = "用户的授权code")
    private String code;

    /**
     * Twitter平台用户的附带属性
     */
    @ExcelProperty(value = "Twitter平台用户的附带属性")
    private String oauthToken;

    /**
     * Twitter平台用户的附带属性
     */
    @ExcelProperty(value = "Twitter平台用户的附带属性")
    private String oauthTokenSecret;

    /**
     * 系统用户id
     */
    @ExcelProperty(value = "系统用户id")
    private Long sysUserId;

    /**
     * 用户名
     */
    @ExcelProperty(value = "用户名")
    private String username;

    /**
     * 用户昵称
     */
    @ExcelProperty(value = "用户昵称")
    private String nickname;

    /**
     * 用户头像
     */
    @ExcelProperty(value = "用户头像")
    private String avatar;

    /**
     * 用户网址
     */
    @ExcelProperty(value = "用户网址")
    private String blog;

    /**
     * 所在公司
     */
    @ExcelProperty(value = "所在公司")
    private String company;

    /**
     * 位置
     */
    @ExcelProperty(value = "位置")
    private String location;

    /**
     * 用户邮箱
     */
    @ExcelProperty(value = "用户邮箱")
    private String email;

    /**
     * 用户备注（各平台中的用户个人介绍）
     */
    @ExcelProperty(value = "用户备注（各平台中的用户个人介绍）")
    private String remark;

    /**
     * 性别
     */
    @ExcelProperty(value = "性别")
    private String gender;

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

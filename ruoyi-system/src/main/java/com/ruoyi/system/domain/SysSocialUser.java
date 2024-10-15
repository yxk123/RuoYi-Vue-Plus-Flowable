package com.ruoyi.system.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 社会化用户对象 sys_social_user
 *
 * @author gssong
 * @date 2023-06-20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_social_user")
public class SysSocialUser extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 第三方系统的唯一ID
     */
    private String uuid;
    /**
     * 第三方用户来源
     */
    private String source;
    /**
     * 用户的授权令牌
     */
    private String accessToken;
    /**
     * 第三方用户的授权令牌的有效期
     */
    private Long expireIn;
    /**
     * 刷新令牌
     */
    private String refreshToken;
    /**
     * 第三方用户的 open id
     */
    private String openId;
    /**
     * 第三方用户的 ID
     */
    private String uid;
    /**
     * 个别平台的授权信息
     */
    private String accessCode;
    /**
     * 第三方用户的 union id
     */
    private String unionId;
    /**
     * 第三方用户授予的权限
     */
    private String scope;
    /**
     * 个别平台的授权信息
     */
    private String tokenType;
    /**
     * id token
     */
    private String idToken;
    /**
     * 小米平台用户的附带属性
     */
    private String macAlgorithm;
    /**
     * 小米平台用户的附带属性
     */
    private String macKey;
    /**
     * 用户的授权code
     */
    private String code;
    /**
     * Twitter平台用户的附带属性
     */
    private String oauthToken;
    /**
     * Twitter平台用户的附带属性
     */
    private String oauthTokenSecret;
    /**
     * 系统用户id
     */
    private Long sysUserId;
    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @TableLogic
    private String delFlag;

    /**
     * 用户名
     */
    private String username;
    /**
     * 用户昵称
     */
    private String nickname;
    /**
     * 用户头像
     */
    private String avatar;
    /**
     * 用户网址
     */
    private String blog;
    /**
     * 所在公司
     */
    private String company;
    /**
     * 位置
     */
    private String location;
    /**
     * 用户邮箱
     */
    private String email;
    /**
     * 用户备注（各平台中的用户个人介绍）
     */
    private String remark;
    /**
     * 性别
     */
    private String gender;

}

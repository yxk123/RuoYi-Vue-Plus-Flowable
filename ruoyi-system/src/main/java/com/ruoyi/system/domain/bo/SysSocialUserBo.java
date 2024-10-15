package com.ruoyi.system.domain.bo;

import com.ruoyi.common.core.validate.AddGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.*;


import com.ruoyi.common.core.domain.BaseEntity;
import me.zhyd.oauth.enums.AuthUserGender;

/**
 * 社会化用户业务对象 sys_social_user
 *
 * @author gssong
 * @date 2023-06-20
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class SysSocialUserBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空")
    private Long id;

    /**
     * 第三方系统的唯一ID
     */
    @NotBlank(message = "第三方系统的唯一ID不能为空", groups = {AddGroup.class})
    private String uuid;

    /**
     * 第三方用户来源
     */
    @NotBlank(message = "第三方用户来源不能为空", groups = {AddGroup.class})
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
    @NotNull(message = "系统用户id不能为空", groups = {AddGroup.class})
    private Long sysUserId;

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

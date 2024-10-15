package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.helper.LoginHelper;
import com.ruoyi.common.utils.BeanCopyUtils;
import com.ruoyi.system.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.enums.AuthResponseStatus;
import me.zhyd.oauth.exception.AuthException;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.*;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.bo.SysSocialUserBo;
import com.ruoyi.system.domain.vo.SysSocialUserVo;
import com.ruoyi.system.domain.SysSocialUser;
import com.ruoyi.system.mapper.SysSocialUserMapper;
import com.ruoyi.system.service.ISysSocialUserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 社会化用户Service业务层处理
 *
 * @author gssong
 * @date 2023-06-20
 */
@RequiredArgsConstructor
@Service
public class SysSocialUserServiceImpl implements ISysSocialUserService {

    private final SysSocialUserMapper baseMapper;

    private final ISysUserService iSysUserService;

    /**
     * 查询社会化用户
     */
    @Override
    public SysSocialUserVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询社会化用户列表
     */
    @Override
    public List<SysSocialUserVo> queryList(SysSocialUserBo bo) {
        return baseMapper.selectVoList(new LambdaQueryWrapper<SysSocialUser>().eq(SysSocialUser::getSysUserId, LoginHelper.getUserId()));
    }

    /**
     * 新增社会化用户
     *
     * @param source   来源
     * @param callback 授权回调时的参数类
     * @param userId   用户id
     * @param authUser 授权成功后的用户信息，根据授权平台的不同，获取的数据完整性也不同
     */
    @Override
    public Map<String, Object> insertByBo(String source, AuthCallback callback, String userId, AuthUser authUser) {
        Map<String, Object> map = new HashMap<>();
        map.put("result", AuthResponseStatus.SUCCESS.getCode());
        LambdaQueryWrapper<SysSocialUser> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(SysSocialUser::getSource, source);
        wrapper.eq(SysSocialUser::getUuid, authUser.getUuid());
        SysSocialUserVo sysSocialUserVo = baseMapper.selectVoOne(wrapper);
        if (sysSocialUserVo == null) {
            SysSocialUser copy = BeanCopyUtils.copy(authUser, SysSocialUser.class);
            SysSocialUser socialUser = BeanCopyUtils.copy(authUser.getToken(), copy);
            socialUser.setSysUserId(Long.valueOf(userId));
            socialUser.setSource(source);
            baseMapper.insert(socialUser);
        } else {
            if (!String.valueOf(sysSocialUserVo.getSysUserId()).equals(String.valueOf(LoginHelper.getUserId()))) {
                SysUser sysUser = iSysUserService.selectUserById(sysSocialUserVo.getSysUserId());
                map.put("result", "【" + source + "】已被【" + sysUser.getNickName() + "】账号：【" + sysUser.getUserName() + "】绑定，请先解除绑定！");
            }
        }
        return map;
    }

    /**
     * 批量删除社会化用户
     */
    @Override
    public Boolean deleteById(Long id) {
        return baseMapper.deleteById(id) > 0;
    }

    /**
     * 获取授权地址
     *
     * @param source       来源
     * @param clientId     客户端ID
     * @param clientSecret 客户端秘钥
     * @param redirectUri  回调地址
     */
    @Override
    public AuthRequest getAuthRequest(String source, String clientId,
                                      String clientSecret, String redirectUri) {
        AuthRequest authRequest = null;
        switch (source.toLowerCase()) {
            case "github":
                authRequest = new AuthGithubRequest(AuthConfig.builder()
                    .clientId(clientId)
                    .clientSecret(clientSecret)
                    .redirectUri(redirectUri)
                    .build());
                break;
            case "gitee":
                authRequest = new AuthGiteeRequest(AuthConfig.builder()
                    .clientId(clientId)
                    .clientSecret(clientSecret)
                    .redirectUri(redirectUri)
                    .build());
                break;
            case "qq":
                authRequest = new AuthQqRequest(AuthConfig.builder()
                    .clientId(clientId)
                    .clientSecret(clientSecret)
                    .redirectUri(redirectUri)
                    .build());
                break;
            case "wechat_enterprise":
                authRequest = new AuthWeChatEnterpriseQrcodeRequest(AuthConfig.builder()
                    .clientId(clientId)
                    .clientSecret(clientSecret)
                    .redirectUri(redirectUri)
                    .agentId("1000003")
                    .build());
                break;
            default:
                break;
        }
        if (null == authRequest) {
            throw new AuthException("未获取到有效的Auth配置");
        }
        return authRequest;
    }
}

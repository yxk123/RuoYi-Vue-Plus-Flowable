package com.ruoyi.system.service;

import com.ruoyi.system.domain.vo.SysSocialUserVo;
import com.ruoyi.system.domain.bo.SysSocialUserBo;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthRequest;

import java.util.List;
import java.util.Map;

/**
 * 社会化用户Service接口
 *
 * @author gssong
 * @date 2023-06-20
 */
public interface ISysSocialUserService {

    /**
     * 查询社会化用户
     *
     * @param id 主键
     * @return 结果
     */
    SysSocialUserVo queryById(Long id);

    /**
     * 查询社会化用户列表
     *
     * @param bo 参数
     * @return 结果
     */
    List<SysSocialUserVo> queryList(SysSocialUserBo bo);

    /**
     * 新增社会化用户
     *
     * @param source   来源
     * @param callback 授权回调时的参数类
     * @param userId   用户id
     * @param authUser 授权成功后的用户信息，根据授权平台的不同，获取的数据完整性也不同
     * @return 结果
     */
    Map<String, Object> insertByBo(String source, AuthCallback callback, String userId, AuthUser authUser);

    /**
     * 删除社会化用户信息
     *
     * @param id 主键
     * @return 结果
     */
    Boolean deleteById(Long id);

    /**
     * 获取授权地址
     *
     * @param source       来源
     * @param clientId     客户端ID
     * @param clientSecret 客户端秘钥
     * @param redirectUri  回调地址
     * @return 结果
     */
    AuthRequest getAuthRequest(String source, String clientId, String clientSecret, String redirectUri);
}

package com.ruoyi.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * 社交登陆 配置属性
 *
 * @author gssong
 */
@Data
@Component
@ConfigurationProperties(prefix = "justauth")
public class SocialProperties {
    /**
     * 是否启用
     */
    private Boolean enabled;

    /**
     * 前端外网访问地址
     */
    private String address;

    /**
     * 授权类型
     */
    private Map<String, SocialConfigProperties> source;

    @Data
    public static class SocialConfigProperties {

        /**
         * 客户端ID
         */
        private String clientId;

        /**
         * 客户端密钥
         */
        private String clientSecret;

        /**
         * 回调地址
         */
        private String redirectUri;
    }
}

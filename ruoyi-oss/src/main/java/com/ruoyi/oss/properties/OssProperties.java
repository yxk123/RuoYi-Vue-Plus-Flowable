package com.ruoyi.oss.properties;

import cn.hutool.core.util.SystemPropsUtil;
import lombok.Data;

import java.io.File;

/**
 * OSS对象存储 配置属性
 *
 * @author Lion Li
 */
@Data
public class OssProperties {

    /**
     * 访问站点
     */
    private String endpoint;

    /**
     * 自定义域名
     */
    private String domain;

    /**
     * 前缀
     */
    private String prefix;

    /**
     * ACCESS_KEY
     */
    private String accessKey;

    /**
     * SECRET_KEY
     */
    private String secretKey;

    /**
     * 存储空间名
     */
    private String bucketName;

    /**
     * 存储区域
     */
    private String region;

    /**
     * 是否https（Y=是,N=否）
     */
    private String isHttps;

    /**
     * 桶权限类型(0private 1public 2custom)
     */
    private String accessPolicy;

    /**
     * 本地资源目录
     */
    public static String getLocalResourceDir() {
        return SystemPropsUtil.get("user.dir") + File.separator;
    }

}

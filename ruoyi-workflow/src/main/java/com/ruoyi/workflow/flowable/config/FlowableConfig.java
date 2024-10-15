
package com.ruoyi.workflow.flowable.config;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import org.flowable.spring.SpringProcessEngineConfiguration;
import org.flowable.spring.boot.EngineConfigurationConfigurer;
import org.springframework.context.annotation.Configuration;
/**
 * @description: 配置
 * @author: gssong
 * @date: 2021/10/03 19:31
 */
@Configuration
public class FlowableConfig implements EngineConfigurationConfigurer<SpringProcessEngineConfiguration> {

    @Override
    public void configure(SpringProcessEngineConfiguration processEngineConfiguration) {
        /**
         * 自定义id
         */
        processEngineConfiguration.setIdGenerator(IdWorker::getIdStr);
    }
}


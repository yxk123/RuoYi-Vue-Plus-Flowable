package com.ruoyi.common.translation.impl;

import com.ruoyi.common.annotation.TranslationType;
import com.ruoyi.common.constant.TransConstant;
import com.ruoyi.common.core.service.UserService;
import com.ruoyi.common.translation.TranslationInterface;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 用户名翻译实现
 *
 * @author gsong
 */
@Component
@AllArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_NICKNAME)
public class NickNameTranslationImpl implements TranslationInterface<String> {

    private final UserService userService;

    @Override
    public String translation(Object key, String other) {
        if (key instanceof Long) {
            return userService.selectNickNameById((Long) key);
        }
        return null;
    }
}

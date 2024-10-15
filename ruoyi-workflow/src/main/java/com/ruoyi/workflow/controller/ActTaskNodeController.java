package com.ruoyi.workflow.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.workflow.domain.ActTaskNode;
import com.ruoyi.workflow.service.IActTaskNodeService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 历史驳回任务节点接口
 *
 * @author gssong
 * @date 2023/02/21 21:56
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/workflow/taskNode")
public class ActTaskNodeController extends BaseController {

    private final IActTaskNodeService iActTaskNodeService;

    /**
     * @description: 启用是否驳回
     * @param: actTaskNode
     * @return: com.ruoyi.common.core.domain.R<java.lang.Void>
     * @author: gssong
     * @date: 2023/2/21 22:00
     */
    @PutMapping("/enableStatus")
    public R<Void> enableStatus(@RequestBody ActTaskNode actTaskNode) {
        return toAjax(iActTaskNodeService.enableStatus(actTaskNode));
    }

}

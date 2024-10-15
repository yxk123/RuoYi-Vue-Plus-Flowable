package com.ruoyi.workflow.domain.bo;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.workflow.domain.vo.ProcessNodePath;
import lombok.Data;

import java.util.*;

/**
 * @description: 完成任务请求对象
 * @author: gssong
 * @date: 2022-02-26
 */
@Data
public class TaskCompleteBo {

    /**
     * 任务ID
     */
    private String taskId;

    /**
     * 是否抄送
     */
    private Boolean isCopy = true;

    /**
     * 附件id
     */
    private String fileId;

    /**
     * 抄送人员id
     */
    private String assigneeIds;

    /**
     * 抄送人员名称
     */
    private String assigneeNames;

    /**
     * 审批意见
     */
    private String message;

    /**
     * 消息对象
     */
    private SendMessage sendMessage;

    /**
     * true 为审批节点选人 false 为申请人选择全部人员
     */
    private Boolean defaultProcess;

    /**
     * 流程节点信息
     */
    private List<ProcessNodePath> processNodeList;

    /**
     * 下一个节点审批，key: 节点id, value：审批人集合,多个人使用英文逗号分隔
     */
    private Map<String, String> assigneeMap;

    public String getMessage() {
        return StringUtils.isBlank(message) ? "同意": message;
    }

    /**
     * 流程变量，前端会提交一个元素{'entity': {业务详情数据对象}}
     */
    private Map<String, Object> variables;

    public Map<String, Object> getVariables() {
        if(variables == null){
            return new HashMap<>(16);
        }
        variables.entrySet().removeIf(entry -> Objects.isNull(entry.getValue()));
        return variables;
    }

    /**
     * 通过节点id获取审批人集合
     * @param key
     * @return
     */
    public List<Long> getAssignees(String key) {
        if(assigneeMap == null) {
            return Collections.emptyList();
        }
        if(StringUtils.isNotBlank(assigneeMap.get(key))){
            List<Long> userIds = new ArrayList<>();
            String[] split = assigneeMap.get(key).split(StringUtils.SEPARATOR);
            for (String userId : split) {
                userIds.add(Long.valueOf(userId));
            }
            return userIds;
        }
        return Collections.emptyList();
    }
}

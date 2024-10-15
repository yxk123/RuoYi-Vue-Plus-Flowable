import request from '@/utils/request'


// 新增网关条件关联网关节点
export function addGatewayConditionRelate(data) {
  return request({
    url: '/workflow/gatewayConditionRelate',
    method: 'post',
    data: data
  })
}

// 删除网关条件关联网关节点
export function delGatewayConditionRelate(processDefinitionId,sequenceId) {
  return request({
    url: `/workflow/gatewayConditionRelate/${processDefinitionId}/${sequenceId}`,
    method: 'delete'
  })
}


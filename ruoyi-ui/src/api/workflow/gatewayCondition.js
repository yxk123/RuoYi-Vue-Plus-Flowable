import request from '@/utils/request'

// 查询网关条件列表
export function listGatewayCondition(query) {
  return request({
    url: '/workflow/gatewayCondition/list',
    method: 'get',
    params: query
  })
}

// 查询网关条件详细
export function getGatewayCondition(id) {
  return request({
    url: '/workflow/gatewayCondition/' + id,
    method: 'get'
  })
}

// 新增网关条件
export function addGatewayCondition(data) {
  return request({
    url: '/workflow/gatewayCondition',
    method: 'post',
    data: data
  })
}

// 修改网关条件
export function updateGatewayCondition(data) {
  return request({
    url: '/workflow/gatewayCondition',
    method: 'put',
    data: data
  })
}

// 删除网关条件
export function delGatewayCondition(id) {
  return request({
    url: '/workflow/gatewayCondition/' + id,
    method: 'delete'
  })
}

// 查询网关条件
export function getInfo(processDefinitionId,sequenceId) {
  return request({
    url: `/workflow/gatewayCondition/${processDefinitionId}/${sequenceId}`,
    method: 'get'
  })
}

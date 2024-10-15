import request from '@/utils/request'

// 查询网关变量条件列表
export function listVariableCondition(query) {
  return request({
    url: '/workflow/variableCondition/list',
    method: 'get',
    params: query
  })
}

// 查询网关变量条件详细
export function getVariableCondition(id) {
  return request({
    url: '/workflow/variableCondition/' + id,
    method: 'get'
  })
}

// 新增网关变量条件
export function addVariableCondition(data) {
  return request({
    url: '/workflow/variableCondition',
    method: 'post',
    data: data
  })
}

// 修改网关变量条件
export function updateVariableCondition(data) {
  return request({
    url: '/workflow/variableCondition',
    method: 'put',
    data: data
  })
}

// 删除网关变量条件
export function delVariableCondition(id) {
  return request({
    url: '/workflow/variableCondition/' + id,
    method: 'delete'
  })
}

// 按照流程定义key查询
export function queryListByKey(key) {
  return request({
    url: '/workflow/variableCondition/queryListByKey/' + key,
    method: 'get'
  })
}

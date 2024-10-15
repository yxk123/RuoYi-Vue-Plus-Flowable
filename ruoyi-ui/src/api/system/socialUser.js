import request from '@/utils/request'

// 查询社会化用户列表
export function listSocialUser(query) {
  return request({
    url: '/system/socialUser/list',
    method: 'get',
    params: query
  })
}

// 删除社会化用户
export function delSocialUser(id) {
  return request({
    url: '/system/socialUser/' + id,
    method: 'delete'
  })
}

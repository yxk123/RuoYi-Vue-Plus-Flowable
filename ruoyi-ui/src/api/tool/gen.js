import request from '@/utils/request'

// 查询生成表数据
export function listTable(query) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/list',
    method: 'get',
    params: query
  })
}

// 查询db数据库列表
export function listDbTable(query) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/db/list',
    method: 'get',
    params: query
  })
}

// 查询db数据库列表
export function listDb(query) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/dbList',
    method: 'get',
    params: query
  })
}

// 查询表详细信息
export function getGenTable(tableId) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/' + tableId,
    method: 'get'
  })
}

// 修改代码生成信息
export function updateGenTable(data) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen',
    method: 'put',
    data: data
  })
}

// 导入表
export function importTable(data) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/importTable',
    method: 'post',
    params: data
  })
}

// 预览生成代码
export function previewTable(tableId) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/preview/' + tableId,
    method: 'get'
  })
}

// 删除表数据
export function delTable(tableId) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/' + tableId,
    method: 'delete'
  })
}

// 生成代码（自定义路径）
export function genCode(tableName) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/genCode/' + tableName,
    method: 'get'
  })
}

// 同步数据库
export function synchDb(tableName) {
  return request({
    headers: { 'datasource': localStorage.getItem("dataName") },
    url: '/tool/gen/synchDb/' + tableName,
    method: 'get'
  })
}

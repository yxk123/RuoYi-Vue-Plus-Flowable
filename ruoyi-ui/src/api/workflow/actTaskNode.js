import request from "@/utils/request";

export function enableStatus(data) {
  return request({
    url: '/workflow/taskNode/enableStatus',
    method: 'put',
    data: data
  })
}


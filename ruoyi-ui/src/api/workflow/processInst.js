import request from "@/utils/request";
import { getToken } from "@/utils/auth";

export default {
  // 提交申请 ，启动流程申请
  startProcessApply(data) {
    return request({
      url: "/workflow/processInstance/startWorkFlow",
      method: "post",
      data: data,
    });
  },

  // 通过流程实例id查询流程审批记录
  getHistoryInfoList(processInstanceId) {
    return request({
      url: "/workflow/processInstance/getHistoryInfoList/" + processInstanceId,
      method: "get",
    });
  },

  // 通过流程实例id获取历史流程图
  getHistoryProcessImage(processInstanceId) {
    return (
      process.env.VUE_APP_BASE_API +
      `/workflow/processInstance/getHistoryProcessImage/${processInstanceId}` +
      "?Authorization=Bearer " +
      getToken() +
      "&t" +
      Math.random()
    );
  },

  // 通过业务id查询流程实例
  getInfoByBusinessKey(businessKey) {
    return request({
      url: "/workflow/actBusiness/getInfoByBusinessKey/" + businessKey,
      method: "get",
    });
  },

  // 查询正在运行的流程实例
  getProcessInstRunningByPage(query) {
    return request({
      url: "/workflow/processInstance/getProcessInstRunningByPage",
      method: "get",
      params: query,
    });
  },

  // 挂起或激活流程实例
  state(data) {
    return request({
      url: "/workflow/processInstance/state",
      method: "put",
      data: data,
    });
  },

  // 作废流程实例，不会删除历史记录
  deleteRuntimeProcessInst(data) {
    return request({
      url: "/workflow/processInstance/deleteRuntimeProcessInst",
      method: "post",
      data: data,
    });
  },

  // 删除运行中的实例，删除历史记录,删除业务与流程关联信息
  deleteRuntimeProcessAndHisInst(processInstanceId) {
    return request({
      url:
        "/workflow/processInstance/deleteRuntimeProcessAndHisInst/" +
        processInstanceId,
      method: "delete",
    });
  },

  // 删除已完成的实例，删除历史记录,删除业务与流程关联信息
  deleteFinishProcessAndHisInst(processInstanceId) {
    return request({
      url:
        "/workflow/processInstance/deleteFinishProcessAndHisInst/" +
        processInstanceId,
      method: "delete",
    });
  },

  // 撤销申请
  cancelProcessApply(processInstanceId) {
    return request({
      url: "/workflow/processInstance/cancelProcessApply/" + processInstanceId,
      method: "get",
    });
  },

  // 查询已完成的流程实例
  getProcessInstFinishByPage(query) {
    return request({
      url: "/workflow/processInstance/getProcessInstFinishByPage",
      method: "get",
      params: query,
    });
  },

  // 获取xml
  getXml(processInstanceId) {
    return request({
      url: `/workflow/processInstance/getXml/${processInstanceId}`,
      method: "get",
    });
  }
}

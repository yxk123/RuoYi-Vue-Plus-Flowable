package com.ruoyi.workflow.service;

import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.workflow.domain.bo.SysUserBo;
import com.ruoyi.workflow.domain.bo.SysUserMultiBo;

import java.util.List;
import java.util.Map;

/**
 * @description: 用户接口
 * @author: gssong
 * @date: 2022-03-25
 */
public interface IWorkflowUserService {

    /**
     * 通过用户ID查询用户集合
     *
     * @param userIds 用户ID
     * @return 用户对象信息
     */
    List<SysUser> selectListUserByIds(List<Long> userIds);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    SysUser selectUserById(Long userId);

    /**
     * 分页查询工作流选人,角色，部门等
     *
     * @param sysUserBo 参数
     * @return 结果
     */
    Map<String, Object> getWorkflowUserListByPage(SysUserBo sysUserBo);

    /**
     * 分页查询工作流选择加签人员
     *
     * @param sysUserMultiBo 参数
     * @return 结果
     */
    Map<String, Object> getWorkflowAddMultiListByPage(SysUserMultiBo sysUserMultiBo);


    /**
     * 查询审批人
     *
     * @param params    参数 用户id，角色id，部门id等
     * @param chooseWay 选择方式
     * @param nodeName  节点名称
     * @return 结果
     */
    List<Long> getAssigneeIdList(String params, String chooseWay, String nodeName);

    /**
     * 分页查询用户
     *
     * @param sysUserBo 参数
     * @return 结果
     */
    Map<String, Object> getUserListByPage(SysUserBo sysUserBo);

    /**
     * 分页查询角色
     *
     * @param sysUserBo 参数
     * @return 结果
     */
    Map<String, Object> getRoleListByPage(SysUserBo sysUserBo);

    /**
     * 查询部门
     *
     * @return 结果
     */
    List<SysDept> getDeptList();

    /**
     * 按照部门id查人员
     *
     * @param deptIds 部门id
     * @return 结果
     */
    List<SysUser> getUserListByDeptIds(List<Long> deptIds);

    /**
     * 按照角色id查人员
     *
     * @param roleIds 角色id
     * @return 结果
     */
    List<SysUser> getUserListByRoleIds(List<Long> roleIds);

    /**
     * 按照人员名称查询
     *
     * @param nickName 人员名称
     * @return 结果
     */
    SysUser selectUserByNickName(String nickName);
}

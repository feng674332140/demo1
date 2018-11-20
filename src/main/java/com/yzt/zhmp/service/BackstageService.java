package com.yzt.zhmp.service;

import com.yzt.zhmp.beans.*;

import java.util.List;

/**
 * @author wang
 */
public interface BackstageService {

    /**
     * 后台系统登陆
     *
     * @param user 用户
     * @return
     */
    User login(User user);

    /**
     * 根据用户id查询行政角色
     *
     * @param usrid 用户ID
     * @return
     */
    DisUser selectDisUser(Integer usrid);


    /**
     * 查询所有的部门
     *
     * @param usrid 用户ID
     * @return
     */
    Department findDept(Integer usrid);


    /**
     * 保存用户
     *
     * @param user 用户
     */
    void registered(User user);

    /**
     * 查询用户id
     *
     * @param username 用户名
     * @return
     */
    Integer selectUserId(String username);

    /**
     * 保存行政用户
     *
     * @param disUser 行政用户
     */
    void saveDisUser(DisUser disUser);

    /**
     * 查询所有下级部门
     *
     * @return
     */
    List<Department> selectAllDept();

    /**
     * 保存部门用户
     *
     * @param deptUser 部门用户
     */
    void saveDeptUser(DeptUser deptUser);

    /**
     * 查询省下面所有的市
     *
     * @param discode 区域编码
     * @return
     */
    List<District> selectAllArea(String discode);


    /**
     * 查询所有部门用户
     * @param usrid 用户ID
     * @return
     */
    List<DeptUser> selectAllDeptUser(Integer usrid);


    /**
     * 修改用户密码
     *
     * @param userId 用户ID
     * @param password 新密码
     */
    void updatePassword(Integer userId,String password);
}

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
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 根据用户id查询行政角色
     *
     * @param usrid
     * @return
     */
    DisUser selectDisUser(Integer usrid);

    /**
     * 根据区域编号查询区域名称
     *
     * @param discode
     * @return
     */
    District getDistrict(String discode);

    /**
     * 查询市下面的所有县区
     *
     * @param discode
     * @return
     */
    List<District> selectAllCounty(String discode);

    /**
     * 查询所有的部门
     *
     * @param usrid
     * @return
     */
    Department findDept(Integer usrid);

    /**
     * 查询所有省
     *
     * @param str
     * @return
     */
    List<DisUser> selectAllProvince(String str);

    /**
     * 保存用户
     *
     * @param user
     */
    void registered(User user);

    /**
     * 查询用户id
     *
     * @param username
     * @return
     */
    Integer selectUserId(String username);

    /**
     * 保存行政用户
     *
     * @param disUser
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
     * @param deptUser
     */
    void saveDeptUser(DeptUser deptUser);

    /**
     * 查询省下面所有的市
     *
     * @param discode
     * @return
     */
    List<District> selectAllArea(String discode);

    /**
     * 查询所有行政用户
     *
     * @return
     */
    List<DisUser> selectAllDisUser();

    /**
     * 查询所有部门用户
     *
     * @return
     */
    List<DeptUser> selectAllDeptUser(Integer usrid);

    /**
     * 行政用户对应的区域
     *
     * @param usrid
     * @return
     */
    String findDisCode(Integer usrid);

    /**
     * 查询省下面的行政区域
     *
     * @return
     */
    List<DisUser> selectAllProvinceDisUser(String substring);

    /**
     * 查询市下面的行政区域
     *
     * @return
     */
    List<DisUser> selectAllCityDisUser(String substring);

    /**
     * 查询县区下面的行政区用户
     *
     * @param substring
     * @return
     */
    List<DisUser> selectAllTownDisUser(String substring);

    /**
     * 查询所有的部门
     *
     * @return
     */
    List<Department> selectAllDepartment();

    /**
     * 修改用户密码
     *
     * @param userId
     * @param password
     */
    void updatePassword(Integer userId,String password);
}

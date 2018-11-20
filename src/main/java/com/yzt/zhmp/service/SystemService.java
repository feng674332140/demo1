package com.yzt.zhmp.service;

import com.yzt.zhmp.beans.*;
import com.yzt.zhmp.beans.System;

import java.util.Date;
import java.util.List;

/**
 * @author .
 */
public interface SystemService {
    /**
     * 查询民政模块功能状态
     *
     * @param deptID 部门ID
     * @return
     */
    List selectSystem(Integer deptID);

    /**
     * 根据ID查询户主信息
     *
     * @param buID 部门ID
     * @return
     */
    Cbuilding selectCBuilding(Integer buID);

    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return
     */
    User login(String username, String password);

    /**
     * 查询行政用户
     *
     * @param usrid 用户ID
     * @return
     */
    DisUser disUser(Integer usrid);

    /**
     * 查询部门用户
     *
     * @param userID 用户ID
     * @return
     */
    DeptUser deptUser(Integer userID);

    /**
     * 获取验证码
     *
     * @param vcode 验证码
     * @param telephone 手机号
     */
    void generateVerificationCode(String vcode, String telephone);

    /**
     * 通过name查询userid
     *
     * @param name 用户名或者手机号
     * @return
     */
    Integer selectUseridbyName(String name);

    /**
     * 查询手机验证码记录
     *
     * @param vcode     验证码
     * @param telephone 手机号
     * @return
     */
    List<String> checkVerificationCode(String vcode, String telephone);

    /**
     * 保存用户
     *
     * @param user 用户
     */
    void registered(User user);

    /**
     * 查询改号码最后一次发送时间
     * @param telephone 电话号码
     * @return 最后发送时间
     */
    Date getLast(String telephone);

    /**
     * 根据房屋id查询所在的区域名称
     * @param buID 房屋编号
     * @return 行政区名称
     */
    String getAreaName(Integer buID);

    /**
     * 查询当前行政区信息
     * @param disCode 区域编码
     * @return 行政区信息
     */
    Cdistrict disInfo(String disCode);

    /**
     * 查询行政区宣传标语
     * @param buID 建筑ID
     * @return 宣传标语
     */
    String title(Integer buID);

    /**
     * 查询户主手机号
     * @param buID 信息编号
     * @return 手机号
     */
    String phoneNum(Integer buID);

}

package com.yzt.zhmp.dao;


import com.yzt.zhmp.beans.*;
import com.yzt.zhmp.beans.System;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @author wangyinglong
 */
@Mapper
@Component(value = "systemDao")
public interface SystemDao {

    /**
     * 查询部门模块功能信息
     *
     * @param deptID 部门ID
     * @return 返回部门所用的功能集合
     */
    @Select("SELECT * FROM d_system where deptID=#{deptID}")
    List<System> selectSystem(Integer deptID);

    /**
     * 查询首页显示的房屋信息
     *
     * @param buID 建筑ID
     * @return 建筑信息
     */
    @Select("SELECT * FROM c_building where buID=#{buID}")
    Cbuilding selectCBuilding(Integer buID);


    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return 存在返回用户对象, 不存在返回null
     */
    @Select("SELECT * FROM d_user where name=#{username} and password=#{password}")
    User login(@Param("username") String username, @Param("password") String password);

    /**
     * 查询行政用户
     *
     * @param userId 用户ID
     * @return 存在返回行政用户对象, 不存在返回null
     */
    @Select("SELECT * FROM d_disUser where usrID=#{userId}")
    DisUser disUser(@Param("userId") Integer userId);

    /**
     * 查询部门用户
     *
     * @param userID 用户ID
     * @return 存在返回行政用户对象, 不存在返回null
     */
    @Select("SELECT * FROM d_deptUser where usrID=#{userId}")
    DeptUser deptUser(Integer userID);

    /**
     * 生成手机验证码记录
     *
     * @param vcode     验证码
     * @param telephone 电话号码
     */
    @Insert("INSERT INTO d_verification (name,verificationCode,createtime) " +
            "values(#{telephone},#{vcode},NOW())")
    void generateVerificationCode(@Param("vcode") String vcode, @Param("telephone") String telephone);

    /**
     * 通过name查询usrID,查询账号是否被注册
     *
     * @param name 用户名
     * @return 存在返回用户ID, 没有返回null
     */
    @Select("SELECT usrID FROM d_user WHERE name=#{name}")
    Integer selectUseridbyName(String name);

    /**
     * 手机验证码验证(2分钟之内)
     *
     * @param vcode     验证码
     * @param telephone 电话号码
     * @return 获取验证吗的账号, 理论上最多只存在一条
     */
    @Select("SELECT name FROM d_verification WHERE name=#{telephone} AND verificationCode=#{vcode} "
            + "AND createtime>=(NOW() - interval 2 minute);")
    List<String> checkVerificationCode(@Param("vcode") String vcode, @Param("telephone") String telephone);

    /**
     * 用户注册
     *
     * @param user 封装用户名和密码的user对象
     */
    @Insert("INSERT INTO d_user (name,password) values(#{name},#{password})")
    void registered(User user);

    /**
     * 获取该号码最后一次发送时间
     *
     * @param telephone 手机号
     * @return
     */
    @Select("SELECT max( createTime ) FROM d_verification WHERE NAME = #{telephone};")
    Date getLast(String telephone);

    /**
     * 根据房屋id查询所在的区域名称
     *
     * @param buID 房屋编号
     * @return 房屋所在行政区名称
     */
    @Select("SELECT t1.name FROM d_zhejiangsheng t1,c_building t2 WHERE t1.disCode=t2.disCode AND t2.buID=#{buID};")
    String getAreaName(Integer buID);

    /**
     * 查询行政区信息
     *
     * @param disCode 区域编码
     * @return 行政区信息
     */
    @Select("SELECT introduction,traffic,travel,memo FROM c_district WHERE disCode=#{disCode};")
    Cdistrict disInfo(String disCode);

    /**
     * 查询行政区域宣传标语
     *
     * @param buID 建筑ID
     * @return 行政区设置的宣传标语
     */
    @Select("SELECT t1.name FROM c_district t1,c_building t2 WHERE t1.disCode=t2.disCode and t2.buID=#{buID};")
    String title(Integer buID);

    /**
     * 查询户主手机号
     *
     * @param buID 建筑ID
     * @return 户主手机号
     */
    @Select("SELECT phoneNum FROM c_building WHERE buID=#{buID};")
    String phoneNum(Integer buID);

    /**
     * 删除手机短信验证码记录
     */
    @Delete("DELETE FROM d_verification;")
    void deleteVCode();
}

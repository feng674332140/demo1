package com.yzt.zhmp.dao;

import com.yzt.zhmp.beans.*;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author wang
 */
@Mapper
@Component("BackstageDao")
public interface BackstageDao {

    /**
     * 用户登陆
     *
     * @param user
     * @return
     */
    @Select("SELECT * FROM d_user WHERE name=#{name} and password=#{password}")
    User login(User user);

    /**
     * 查找行政用户
     *
     * @param usrid
     * @return
     */
    @Select("SELECT * FROM d_disUser WHERE usrID=#{usrid}")
    DisUser selectDisUser(Integer usrid);

    /**
     * 查询区域
     *
     * @param discode
     * @return
     */
    @Select("SELECT * FROM d_district WHERE disCode=#{discode}")
    District getDistrict(String discode);

    /**
     * 查询市下面的所有县区-动态拼接
     *
     * @param discode
     * @return
     */
    @SelectProvider(type = SelectAllCounty.class, method = "selectAllCounty")
    List<District> selectAllCounty(String discode);

    /**
     * 查询所有的部门
     *
     * @return
     */
    @Select("select * from d_department")
    List<Department> selectAllDepartment();

    /**
     * 修改用户密码
     *
     * @param userId
     * @param password
     */
    @Update("UPDATE d_user SET password = #{password} WHERE usrID = #{userId};")
    void updatePassword(@Param("userId") Integer userId, @Param("password") String password);


    class SelectAllCounty {

        public String selectAllCounty(String discode) {
            return new SQL() {{
                SELECT("*").FROM("d_district")
                        .WHERE("SUBSTR(disCode,1,LENGTH('" + discode + "')) ='" + discode + "'");
            }}.toString();
        }
    }

    /**
     * 查询所有的省
     *
     * @param str
     * @return
     */
    @SelectProvider(type = SelectAllProvince.class, method = "selectAllProvince")
    List<DisUser> selectAllProvince(String str);

    class SelectAllProvince {
        public String selectAllProvince(String discode) {
            return new SQL() {{
                SELECT("*").FROM("d_disUser")
                        .WHERE("SUBSTR(disCode,3,LENGTH('" + discode + "')) ='" + discode + "'AND discode!='000000'");
            }}.toString();
        }


    }

    /**
     * 查找对应的县
     *
     * @param usrid
     * @return
     */
    @Select("SELECT * FROM d_department t1,d_deptUser t2 WHERE t2.usrID=#{usrid} and t1.deptID=t2.deptID")
    Department findDept(Integer usrid);

    /**
     * 用户注册
     *
     * @param user
     */
    @Insert("INSERT INTO d_user (name,password) values(#{name},#{password})")
    void registered(User user);

    /**
     * 查询注册的用户id
     *
     * @param username
     * @return
     */
    @Select("SELECT usrID FROM d_user WHERE name=#{username}")
    Integer selectUserId(String username);

    /**
     * 保存行政用户
     *
     * @param disUser
     */
    @Insert("INSERT INTO d_disUser (disCode,usrID,priviligeTime,priviUsrID,ifValid,memo) " +
            "values(#{discode},#{usrid},#{priviligetime},#{priviusrid},#{ifvalid},#{memo})")
    void saveDisUser(DisUser disUser);

    /**
     * 查询所有的部门
     *
     * @return
     */
    @Select("SELECT * FROM d_department")
    List<Department> selectAllDept();

    /**
     * 保存部门用户
     *
     * @param deptUser
     */
    @Insert("INSERT INTO d_deptUser (usrID,deptID,dptUsrID,priviligeTime,priviUsrID,ifValid,memo)" +
            "values(#{usrid},#{deptid},#{dptusrid},#{priviligetime},#{priviusrid},#{ifvalid},#{memo})")
    void saveDeptUser(DeptUser deptUser);

    /**
     * 查询所属区域的下级地区
     *
     * @param discode
     * @return
     */
    @Select("select * from d_district where upDistCode=#{discode}")
    List<District> selectAllArea(String discode);

    /**
     * 查询所有部门用户
     * @param usrid
     * @return
     */
    @Select("SELECT @rowNum := @rowNum + 1 AS rowNo,t3.NAME username, " +
            "( SELECT t2.NAME FROM d_department t2 WHERE t1.deptID = t2.deptID ) deptname,t1.priviligeTime," +
            "CASE t1.ifValid WHEN 1 THEN '有效' ELSE '无效' END ifValid FROM d_deptUser t1 ,d_user t3," +
            "( SELECT @rowNum := 0 ) b WHERE t1.usrID = t3.usrID AND priviUsrID = #{usrid} ORDER BY t3.usrID ASC;")
    List<DeptUser> selectAllDeptUser(Integer usrid);

    /**
     * 查询所有行政用户
     *
     * @return
     */
    @Select("select (\n" +
            "select t2.name from d_district t2 where t1.discode=t2.disCode\n" +
            ") discode,t1.usrID,t1.priviligeTime,t1.priviUsrID,\n" +
            "case when t1.ifValid=1 then '有效'\n" +
            "else  '无效' end ifValid from d_disUser t1  order by t1.usrID asc")
    List<DisUser> selectAllDisUser();

    /**
     * 行政用户对应的区域
     *
     * @param usrid
     * @return
     */
    @Select("select disCode from d_disUser where usrID=#{usrid}")
    String findDisCode(Integer usrid);

    /**
     * 查找省下面的行政区
     *
     * @param substring
     * @return
     */
    @Select("select (\n" +
            "select t2.name from d_district t2 where t1.discode=t2.disCode\n" +
            ") deptname,t1.usrID,t1.priviligeTime,t1.priviUsrID,\n" +
            "case when t1.ifValid=1 then '有效'\n" +
            "else  '无效' end ifValid from d_disUser t1 where SUBSTR(t1.discode,1,2)=#{substring}  order by t1.usrID asc")
    List<DisUser> selectAllProvinceDisUser(String substring);

    /**
     * 查找市下面的行政区
     *
     * @param substring
     * @return
     */
    @Select("select (\n" +
            "select t2.name from d_district t2 where t1.discode=t2.disCode\n" +
            ") discode,t1.usrID,t1.priviligeTime,t1.priviUsrID,\n" +
            "case when t1.ifValid=1 then '有效'\n" +
            "else  '无效' end ifValid from d_disUser t1 where SUBSTR(t1.discode,1,4)=#{substring} order by t1.usrID asc")
    List<DisUser> selectAllCityDisUser(String substring);

    /**
     * 查找县下面的行政区
     */
    @Select("select (\n" +
            "select t2.name from d_district t2 where t1.discode=t2.disCode\n" +
            ") discode,t1.usrID,t1.priviligeTime,t1.priviUsrID,\n" +
            "case when t1.ifValid=1 then '有效'\n" +
            "else  '无效' end ifValid from d_disUser t1 where SUBSTR(t1.discode,1,6)=#{substring} order by t1.usrID asc")
    List<DisUser> selectAllTownDisUser(String substring);
}

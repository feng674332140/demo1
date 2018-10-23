package com.yzt.zhmp.dao;


import com.yzt.zhmp.beans.System;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Mapper
@Component(value = "systemDao")
public interface SystemDao {
    /**
     * 查询部门模块功能信息
     * @return
     */
    @Select("SELECT * FROM d_system where deptID=111")
    List<System> selectSystem();

    /**
     * 查询公安部门模块信息
     * @return
     */
    @Select("SELECT * FROM d_system where deptID=222")
    List<System> selectPliceSystem();

    /**
     * 根据传入县区码查询部门功能模块
     * @param code
     * @return
     */
    @Select("SELECT * FROM d_system, d_disDept WHERE d_disDept.deptID=d_system.deptID AND disCode=#{code};")
    List<System> selectAll(String code);

    /**
     * 添加民政子功能模块
     * @param list
     * @return
     */
    @UpdateProvider(type = OrgProvider.class,method = "addOrgmicroservice")
    int addOrgmicroservice(List list);

    /**
     * 禁用民政子功能模块
     * @param list
     * @return
     */
    @UpdateProvider(type = OrgProvider.class,method ="deleteOrgmicroservice" )
    int deleteOrgmicroservice(List list);

    /**
     * 添加新增模块
     * @param system
     * @return
     */
    @InsertProvider(type = OrgProvider.class,method = "addnewFeatures")
    int addnewFeatures(System system);


    /**
     * 查询首页显示服务有几大类
     * @param disCode
     * @return
     */
    @Select("SELECT deptName FROM d_disDept WHERE disCode=#{disCode}")
    List<String> selectDeptNamebuDisCode(String disCode);



    class OrgProvider{
        //开启功能
        public String addOrgmicroservice(Map map){
            List list=(List) map.get("list");
            return new SQL(){{
                UPDATE("d_system");
                SET("ifValid='1'");
                for (int i=0;i<list.size();i++){
                    WHERE("showName= '"+list.get(i)+"' ");
                    if (i==list.size()-1){
                        break;
                    }
                    OR();
                }
            }}.toString();
        }
        //关闭功能
        public String deleteOrgmicroservice(Map map){
            List list=(List) map.get("list");
            return new SQL(){{
                UPDATE("d_system");
                SET("ifValid='0'");
                for (int i=0;i<list.size();i++){
                    WHERE("showName= '"+list.get(i)+"' ");
                    if (i==list.size()-1){
                        break;
                    }
                    OR();
                }
            }}.toString();
        }

        public String addnewFeatures(System system){
            return new SQL(){{
                java.lang.System.out.println(system);
                INSERT_INTO("d_system");
                INTO_COLUMNS("deptID","name","url","icon","showName","ifValid");
                INTO_VALUES("#{deptid}","#{name}","#{url}","#{icon}","#{showname}","#{ifvalid}");
            }}.toString();
        }
    }

}

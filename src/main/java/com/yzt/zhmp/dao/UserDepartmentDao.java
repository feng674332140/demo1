package com.yzt.zhmp.dao;

import com.yzt.zhmp.beans.UserDepartment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Mapper
@Component("userDepartmentDao")
public interface UserDepartmentDao {
    /**
     * 查询区县用户
     * @param countyName
     * @return
     */
    @Select("SELECT * FROM user_department WHERE county_name=#{countyName};")
    public UserDepartment selectFeaturesByCountyName(String countyName);
}

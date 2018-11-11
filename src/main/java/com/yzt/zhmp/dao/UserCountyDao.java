package com.yzt.zhmp.dao;

import com.yzt.zhmp.beans.UserCounty;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import org.apache.ibatis.jdbc.SQL;

@Mapper
@Component("userCountyDao")
public interface UserCountyDao {
    /**
     * 存入县区管理员的账号
     * @param userCounty
     * @return
     */
    @InsertProvider(type = UserCountySqlProvider.class,method = "insertUserCounty")
    public int insertUserCounty(UserCounty userCounty);

    class UserCountySqlProvider{
        public String insertUserCounty(UserCounty userCounty){
            return new SQL(){{
                INSERT_INTO("user_county");
                INTO_COLUMNS("userid","name","password","county_name");
                INTO_VALUES("#{userid}","#{name}","#{password}","#{county_name}");
            }}.toString();
        }
    }
}

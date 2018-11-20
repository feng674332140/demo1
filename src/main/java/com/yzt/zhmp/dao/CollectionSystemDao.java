package com.yzt.zhmp.dao;


import com.yzt.zhmp.beans.Cbuilding;
import com.yzt.zhmp.beans.Cdistrict;
import com.yzt.zhmp.beans.DisUserAddDisName;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Mapper
@Component("collectionSystemDao")
public interface CollectionSystemDao {
    /**
     * 根据登入的用户id查询此行政区下属行政区用户账号
     *
     * @param usrID 用户ID
     * @return 行政用户集合
     */
    @Select("SELECT @rowNum:=@rowNum+1 as rowNo , t1.`name`,t2.usrID,t3.`name` username,t2.priviligeTime,t2.memo," +
            "case when t2.ifValid=1 then '有效' else  '无效' end ifValid FROM d_district t1,d_disUser t2 ,d_user t3, " +
            "(SELECT @rowNum:=0) b WHERE t1.disCode = t2.disCode AND t2.usrID=t3.usrID AND t2.priviUsrID  = #{usrID} " +
            "ORDER BY t3.usrID ASC;")
    List<DisUserAddDisName> selectUserByuserid(int usrID);

    /**
     * 根据登入的用户id查询所属地名
     *
     * @param usrID 用户ID
     * @return 地名
     */
    @Select("SELECT t1.`name`\n" +
            "FROM d_district t1,d_disUser t2 \n" +
            "WHERE t1.disCode=t2.disCode AND t2.usrID=#{usrID};")
    String selectDisName(int usrID);

    /**
     * 添加民众信息
     *
     * @param cbuilding 农户信息类的对象
     * @return 插入成功返回1,失败返回0
     */
    @InsertProvider(type = FarmerProvider.class, method = "addFarmerInfo")
    int addFarmerInfo(Cbuilding cbuilding);


    /**
     * 删除选中的农户信息
     *
     * @param buID 农户信息的编号
     * @return 删除成功返回1,失败返回0
     */
    @Delete("DELETE FROM c_building WHERE buID=#{buID}")
    int deleteCbuilidingByid(int buID);

    /**
     * 更新农户信息
     *
     * @param cbuilding 农户信息类的对象
     * @return 更新成功返回1,失败返回0
     */
    @UpdateProvider(type = FarmerProvider.class, method = "updateCbuidingByfamilyType")
    int updateCbuidingByfamilyType(Cbuilding cbuilding);


    /**
     * 查询一地区所有建筑信息
     *
     * @param disCode 区域编号
     * @return 农户信息类的集合
     */
    @Select("SELECT buID, disCode, name, phoneNum, familyType, population, roomNum, floorNum,landArea, buildArea, yardArea, \n" +
            "       numberOfRoom, numberOfBed, mealDigits, feature,case busiType when '1' then '普通农户' when '2' then '农家乐' \n" +
            "       when '3' then '民宿' when '4' then '药农' end busiType,memo, ifOpen, buildingYear, address FROM c_building \n" +
            "WHERE disCode=#{disCode}")
    List<Cbuilding> selectBuildingBycode(String disCode);

    /**
     * 添加县区信息介绍
     *
     * @param cdistrict 行政区
     * @return 插入成功返回1,失败返回0
     */
    @InsertProvider(type = FarmerProvider.class, method = "addCountyInfo")
    int addCountyInfo(Cdistrict cdistrict);

    /**
     * 查询行政区介绍
     *
     * @param disCode 区域编号
     * @return 区域对象
     */
    @Select("SELECT * FROM c_district WHERE disCode=#{disCode}")
    Cdistrict selectCdistrict(String disCode);

    /**
     * 更新行政区介绍
     *
     * @param cdistrict 区域对象
     * @return 更新成功返回1,失败返回0
     */
    @UpdateProvider(type = FarmerProvider.class, method = "updateCountyInfo")
    int updateCdistrict(Cdistrict cdistrict);


    class FarmerProvider {
        public String addFarmerInfo(Cbuilding cbuilding) {
            return new SQL() {{
                INSERT_INTO("c_building");
                INTO_COLUMNS("buID", "disCode", "name", "phoneNum", "familyType", "population", "roomNum", "floorNum", "landArea", "buildArea", "yardArea", "numberOfRoom", "numberOfBed", "mealDigits", "feature", "busiType", "memo", "ifOpen", "buildingYear", "address");
                INTO_VALUES("#{buID}", "#{disCode}", "#{name}", "#{phoneNum}", "#{familyType}", "#{population}", "#{roomNum}", "#{floorNum}", "#{landArea}", "#{buildArea}", "#{yardArea}", "#{numberOfRoom}", "#{numberOfBed}", "#{mealDigits}", "#{feature}", "#{busiType}", "#{memo}", "#{ifOpen}", "#{buildingYear}", "#{address}");
            }}.toString();
        }

        /**
         * 添加县区介绍
         *
         * @param cdistrict 行政区信息
         * @return sql
         */
        public String addCountyInfo(Cdistrict cdistrict) {
            return new SQL() {{
                INSERT_INTO("c_district");
                INTO_COLUMNS("disCode", "disType", "name", "introduction", "traffic", "travel", "complaint", "memo", "upcode");
                INTO_VALUES("#{disCode}", "#{disType}", "#{name}", "#{introduction}", "#{traffic}", "#{travel}", "#{complaint}", "#{memo}", "#{upcode}");
            }}.toString();
        }

        /**
         * 更新县区介绍
         *
         * @param cdistrict 行政区信息
         * @return sql
         */
        public String updateCountyInfo(Cdistrict cdistrict) {
            return new SQL() {{
                UPDATE("c_district");
                SET("introduction=#{introduction},traffic=#{traffic},travel=#{travel},memo=#{memo}");
                WHERE("disCode=#{disCode}");
            }}.toString();
        }

        /**
         * 更新农户信息
         *
         * @param cbuilding 行政区信息
         * @return sql
         */
        public String updateCbuidingByfamilyType(Cbuilding cbuilding) {
            return new SQL() {{
                UPDATE("c_building");
                SET("name=#{name},phoneNum=#{phoneNum},familyType=#{familyType},population=#{population}," +
                        "roomNum=#{roomNum},floorNum=#{floorNum},landArea=#{landArea},buildArea=#{buildArea},buildingYear=#{buildingYear}");
                if (cbuilding.getAddress().length() > 0) {
                    SET("address=#{address}");
                }
                if (cbuilding.getIfOpen() != null) {
                    SET("ifOpen=#{ifOpen}");
                }
                if (cbuilding.getMemo().length() > 0) {
                    SET("memo=#{memo}");
                }
                if (cbuilding.getBusiType().length() > 0) {
                    SET("busiType=#{busiType}");
                }
                WHERE("buID=#{buID}");
            }}.toString();
        }
    }

}

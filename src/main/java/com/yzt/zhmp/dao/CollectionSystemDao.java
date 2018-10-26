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
     * @param usrID
     * @return
     */
    @Select("SELECT t1.`name`,t2.usrID,t2.priviUsrID,t2.priviligeTime,t2.memo,t2.ifValid \n" +
            "FROM d_district t1,d_disUser t2 \n" +
            "WHERE t1.disCode=t2.disCode AND t2.priviUsrID=#{usrID};")
    public List<DisUserAddDisName> selectUserByuserid(int usrID);

    /**
     * 根据登入的用户id查询所属地名
     *
     * @param usrID
     * @return
     */
    @Select("SELECT t1.`name`\n" +
            "FROM d_district t1,d_disUser t2 \n" +
            "WHERE t1.disCode=t2.disCode AND t2.usrID=#{usrID};")
    public String selectDisName(int usrID);

    /**
     * 添加民众信息
     *
     * @param cbuilding
     * @return
     */
    @InsertProvider(type = FarmerProvider.class, method = "addFarmerInfo")
    public int addFarmerInfo(Cbuilding cbuilding);

    /**
     * 查询民众信息
     *
     * @param buID
     * @return
     */
    @Select("SELECT * FROM c_building WHERE buID=#{buID}")
    public Cbuilding selectCbuildingByid(int buID);

    /**
     * 删除选中的农户信息
     *
     * @param buID
     * @return
     */
    @Delete("DELETE FROM c_building WHERE buID=#{buID}")
    public int deleteCbuilidingByid(int buID);

    /**
     * 更新农户信息
     *
     * @param cbuilding
     * @return
     */
    @UpdateProvider(type = FarmerProvider.class, method = "updateCbuidingByfamilyType")
    public int updateCbuidingByfamilyType(Cbuilding cbuilding);


    /**
     * 查询一地区所有建筑信息
     *
     * @param disCode
     * @return
     */
    @Select("SELECT * FROM c_building WHERE disCode=#{disCode}")
    public List<Cbuilding> selectBuildingBycode(String disCode);

    /**
     * 添加县区信息介绍
     *
     * @param cdistrict
     * @return
     */
    @InsertProvider(type = FarmerProvider.class, method = "addCountyInfo")
    public int addCountyInfo(Cdistrict cdistrict);

    /**
     * 查询行政区介绍
     *
     * @param disCode
     * @return
     */
    @Select("SELECT * FROM c_district WHERE disCode=#{disCode}")
    public Cdistrict selectCdistrict(String disCode);

    /**
     * 更新行政区介绍
     *
     * @param cdistrict
     * @return
     */
    @UpdateProvider(type = FarmerProvider.class, method = "updateCountyInfo")
    public int updateCdistrict(Cdistrict cdistrict);


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
         * @param cdistrict
         * @return
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
         * @param cdistrict
         * @return
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
         * @param cbuilding
         * @return
         */
        public String updateCbuidingByfamilyType(Cbuilding cbuilding) {
            return new SQL() {{
                UPDATE("c_building");
                SET("name=#{name},phoneNum=#{phoneNum},familyType=#{familyType},population=#{population},roomNum=#{roomNum},floorNum=#{floorNum},landArea=#{landArea},buildArea=#{buildArea},buildingYear=#{buildingYear}");
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

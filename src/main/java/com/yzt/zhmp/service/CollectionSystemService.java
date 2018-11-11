package com.yzt.zhmp.service;

import com.yzt.zhmp.beans.Cbuilding;
import com.yzt.zhmp.beans.Cdistrict;
import com.yzt.zhmp.beans.DisUserAddDisName;


import java.util.List;

public interface CollectionSystemService {


    /**
     * 添加农户家庭详细信息
     *
     * @param cbuilding
     * @return
     */
    int addFarmerInfo(Cbuilding cbuilding);

    /**
     * 添加行政区介绍
     *
     * @param cdistrict
     * @return
     */
    int addCountyInfo(Cdistrict cdistrict);

    /**
     * 查询行政区介绍
     *
     * @param disCode
     * @return
     */
    Cdistrict selectCdistrict(String disCode);

    /**
     * 更新行政区介绍
     *
     * @param cdistrict
     * @return
     */
    int updateCdistrict(Cdistrict cdistrict);

    /**
     * 查询农户建筑信息
     *
     * @param buID
     * @return
     */
    Cbuilding selectBuildingByid(int buID);

    /**
     * 显示所有建筑
     *
     * @param disCode
     * @return
     */
    List<Cbuilding> selectBuildingBycode(String disCode);

    /**
     * 删除选中的农户信息
     *
     * @param buID
     * @return
     */
    int deleteCbuilidingByid(int buID);

    /**
     * 更新农户信息
     *
     * @param cbuilding
     * @return
     */
    int updateCbuidingByfamilyType(Cbuilding cbuilding);

    /**
     * 根据登入的用户id查询此行政区下属行政区用户账号
     *
     * @param usrID
     * @return
     */
    List<DisUserAddDisName> selectUserByuserid(int usrID);

    /**
     * 根据登入的用户id查询所属地名
     *
     * @param usrID
     * @return
     */
    String selectDisName(int usrID);


}

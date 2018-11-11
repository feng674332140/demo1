package com.yzt.zhmp.service;

import com.yzt.zhmp.beans.Cbuilding;
import com.yzt.zhmp.beans.Feedback;
import com.yzt.zhmp.beans.System;

import java.util.List;

/**
 * @author .
 */
public interface SystemService {
    /**
     * 查询民政模块功能状态
     *
     * @return
     */
    public List selectSystem();

    /**
     * 开启民政功能模块状态
     *
     * @param list
     * @return
     */
    public int addOrgmicroservice(List list);

    /**
     * 关闭民政功能模块
     *
     * @param list
     * @return
     */
    public int deleteOrgmicroservice(List list);

    /**
     * 添加新的模块功能
     *
     * @param system
     * @return
     */
    public int addnewFeatures(System system);

    /**
     * 查询公安模块
     *
     * @return
     */
    public List selectPoliceSystem();


    /**
     * 查询首页显示服务有几大类
     *
     * @param disCode
     * @return
     */
    public List<String> selectDeptNamebuDisCode(String disCode);

    /**
     * 根据传入县区码查询部门功能模块
     *
     * @param code 区域编码
     * @return
     */
    public List<System> selectAll(String code);

    /**
     * 添加反馈信息
     *
     * @param feedback
     */
    void addFeedback(Feedback feedback);

    /**
     * 查询用户名或手机号有没有提交过信息
     *
     * @param feedback
     * @return
     */
    Feedback findFeedbackByUsernameOrPhone(Feedback feedback);

    List<Feedback> selectAllFeedback();

    /**
     * 添加回复信息
     *
     * @param feedback
     */
    void updateFeedbackByUsernameOrPhone(Feedback feedback);

    /**
     * 根据页面的数据查询数据库中对应的唯一数据
     * @param feedback
     * @return
     */
    Feedback findOnlyFeedback(Feedback feedback);

    Cbuilding selectCBuilding(String s);
}

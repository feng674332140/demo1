package com.yzt.zhmp.service.impl;

import com.yzt.zhmp.beans.*;
import com.yzt.zhmp.beans.System;
import com.yzt.zhmp.dao.SystemDao;
import com.yzt.zhmp.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author wangyinglong
 */
@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    private SystemDao systemDao;

    @Override
    public List selectSystem(Integer deptID) {
        return systemDao.selectSystem(deptID);
    }

    @Override
    public Cbuilding selectCBuilding(Integer buID) {
        return systemDao.selectCBuilding(buID);
    }

    @Override
    public User login(String username, String password) {
        return systemDao.login(username, password);
    }

    @Override
    public DisUser disUser(Integer userID) {
        return systemDao.disUser(userID);
    }

    @Override
    public DeptUser deptUser(Integer userID) {
        return systemDao.deptUser(userID);
    }

    @Override
    public void generateVerificationCode(String vcode, String telephone) {
        systemDao.generateVerificationCode(vcode, telephone);
    }

    @Override
    public Integer selectUseridbyName(String name) {
        return systemDao.selectUseridbyName(name);
    }

    @Override
    public List<String> checkVerificationCode(String vcode, String telephone) {
        return systemDao.checkVerificationCode(vcode, telephone);
    }

    @Override
    public void registered(User user) {
        systemDao.registered(user);
    }

    @Override
    public Date getLast(String telephone) {
        return systemDao.getLast(telephone);
    }

    @Override
    public String getAreaName(Integer buID) {
        return systemDao.getAreaName(buID);
    }

    @Override
    public Cdistrict disInfo(String disCode) {
        return systemDao.disInfo(disCode);
    }

    @Override
    public String title(Integer buID) {
        return systemDao.title(buID);
    }

    @Override
    public String phoneNum(Integer buID) {
        return systemDao.phoneNum(buID);
    }

    /**
     * 定时任务,每天凌晨一点清空缓存短信验证码的数据表
     */
    @Scheduled(cron = "0 0 1 * * ?")
    public void deleteVCode() {
        systemDao.deleteVCode();
    }

}

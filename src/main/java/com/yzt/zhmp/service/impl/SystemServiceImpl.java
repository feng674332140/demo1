package com.yzt.zhmp.service.impl;

import com.yzt.zhmp.beans.Cbuilding;
import com.yzt.zhmp.beans.Feedback;
import com.yzt.zhmp.beans.System;
import com.yzt.zhmp.dao.SystemDao;
import com.yzt.zhmp.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    private SystemDao systemDao;

    @Override
    public List selectSystem() {
        return systemDao.selectSystem();
    }

    @Override
    public int addOrgmicroservice(List list) {
        return systemDao.addOrgmicroservice(list);
    }

    @Override
    public int deleteOrgmicroservice(List list) {
        return systemDao.deleteOrgmicroservice(list);
    }

    @Override
    public int addnewFeatures(System system) {
        return systemDao.addnewFeatures(system);
    }

    @Override
    public List selectPoliceSystem() {
        return systemDao.selectPoliceSystem();
    }

    @Override
    public List<String> selectDeptNamebuDisCode(String disCode) {
        return systemDao.selectDeptNamebuDisCode(disCode);
    }

    @Override
    public List<System> selectAll(String code) {
        return systemDao.selectAll(code);
    }

    @Override
    public void addFeedback(Feedback feedback) {
        systemDao.addFeedback(feedback);
    }

    @Override
    public Feedback findFeedbackByUsernameOrPhone(Feedback feedback) {
        return systemDao.findFeedbackByUsernameOrPhone(feedback);
    }

    @Override
    public List<Feedback> selectAllFeedback() {
        return systemDao.selectAllFeedback();
    }

    @Override
    public void updateFeedbackByUsernameOrPhone(Feedback feedback) {
        systemDao.updateFeedbackByUsernameOrPhone(feedback);
    }

    @Override
    public Feedback findOnlyFeedback(Feedback feedback) {
        return systemDao.findOnlyFeedback(feedback);
    }

    @Override
    public Cbuilding selectCBuilding(String s) {
        return systemDao.selectCBuilding(s);
    }
}

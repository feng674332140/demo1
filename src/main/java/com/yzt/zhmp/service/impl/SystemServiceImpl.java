package com.yzt.zhmp.service.impl;

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
    public List selectPliceSystem() {
        return systemDao.selectPliceSystem();
    }

    @Override
    public List<String> selectDeptNamebuDisCode(String disCode) {
        return systemDao.selectDeptNamebuDisCode(disCode);
    }

    @Override
    public List<System> selectAll(String code) {
        return systemDao.selectAll(code);
    }
}

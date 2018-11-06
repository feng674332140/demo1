package com.yzt.zhmp.service.impl;

import com.yzt.zhmp.beans.*;
import com.yzt.zhmp.dao.BackstageDao;
import com.yzt.zhmp.service.BackstageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author wang
 */
@Service
@Transactional
public class BackstageServiceImpl implements BackstageService {

    @Autowired
    BackstageDao backstageDao;

    @Override
    public User login(User user) {
        return backstageDao.login(user);
    }

    @Override
    public DisUser selectDisUser(Integer usrid) {
        return backstageDao.selectDisUser(usrid);
    }

    @Override
    public District getDistrict(String discode) {
        return backstageDao.getDistrict(discode);
    }

    @Override
    public List<District> selectAllCounty(String discode) {
        return backstageDao.selectAllCounty(discode);
    }

    @Override
    public Department findDept(Integer usrid) {
        return backstageDao.findDept(usrid);
    }

    @Override
    public List<DisUser> selectAllProvince(String str) {
        return backstageDao.selectAllProvince(str);
    }

    @Override
    public void registered(User user) {
        backstageDao.registered(user);
    }

    @Override
    public Integer selectUserId(String username) {
        return backstageDao.selectUserId(username);
    }

    @Override
    public void saveDisUser(DisUser disUser) {
        backstageDao.saveDisUser(disUser);
    }

    @Override
    public List<Department> selectAllDept() {
        return backstageDao.selectAllDept();
    }

    @Override
    public void saveDeptUser(DeptUser deptUser) {
        backstageDao.saveDeptUser(deptUser);
    }

    @Override
    public List<District> selectAllArea(String discode) {
        return backstageDao.selectAllArea(discode);
    }

    @Override
    public List<DisUser> selectAllDisUser() {
        return backstageDao.selectAllDisUser();
    }

    @Override
    public List<DeptUser> selectAllDeptUser(Integer usrid) {
        return backstageDao.selectAllDeptUser(usrid);
    }

    @Override
    public String findDisCode(Integer usrid) {
        return backstageDao.findDisCode(usrid);
    }

    @Override
    public List<DisUser> selectAllProvinceDisUser(String substring) {
        return backstageDao.selectAllProvinceDisUser(substring);
    }

    @Override
    public List<DisUser> selectAllCityDisUser(String substring) {
        return backstageDao.selectAllCityDisUser(substring);
    }

    @Override
    public List<DisUser> selectAllTownDisUser(String substring) {
        return null;
    }

    @Override
    public List<Department> selectAllDepartment() {
        return backstageDao.selectAllDepartment();
    }

    @Override
    public void updatePassword(User user) {
        backstageDao.updatePassword(user);
    }
}

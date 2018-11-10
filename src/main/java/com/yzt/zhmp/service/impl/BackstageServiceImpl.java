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
    public Department findDept(Integer usrid) {
        return backstageDao.findDept(usrid);
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
    public List<DeptUser> selectAllDeptUser(Integer usrid) {
        return backstageDao.selectAllDeptUser(usrid);
    }

    @Override
    public List<Department> selectAllDepartment() {
        return backstageDao.selectAllDepartment();
    }

    @Override
    public void updatePassword(Integer userId,String password) {
        backstageDao.updatePassword(userId,password);
    }
}

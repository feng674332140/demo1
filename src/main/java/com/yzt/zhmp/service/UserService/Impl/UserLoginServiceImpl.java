package com.yzt.zhmp.service.UserService.Impl;

import com.yzt.zhmp.beans.User;
import com.yzt.zhmp.dao.UserLoginDao;
import com.yzt.zhmp.service.UserService.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @author wang
 */
@Service
@Transactional
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    UserLoginDao userLoginDao;

    @Override
    public User login(User user) {
        return userLoginDao.login(user);
    }

    @Override
    public Integer selectByUserid(int userid) {
        return userLoginDao.selectDeptUserbyUserid(userid);
    }

    @Override
    public List<String> rolelogin(int userid) {
        return userLoginDao.rolelogin(userid);
    }

    @Override
    public  List<String> selectFileIdByUserid(int userid) {
        return userLoginDao.selectFileIdByUserid(userid);
    }

    @Override
    public List<String> selectBuidbyUserId(int userid) {
        return userLoginDao.selectBuidbyUserId(userid);
    }
}

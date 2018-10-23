package com.yzt.zhmp.service.UserService.Impl;

import com.yzt.zhmp.beans.UserCounty;
import com.yzt.zhmp.dao.UserCountyDao;
import com.yzt.zhmp.service.UserService.UserCountyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserCountyServiceImpl implements UserCountyService {
    @Autowired
    private UserCountyDao userCountyDao;
    @Override
    public int addUserCounty(UserCounty userCounty) {
        return userCountyDao.insertUserCounty(userCounty) ;
    }
}

package com.yzt.zhmp.beans;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class UserCounty {
    private String usrID;
    private String name;
    private String password;
    private String countyCode;
    private String countyMark;
    private String dept;
    private Date createTime;

}

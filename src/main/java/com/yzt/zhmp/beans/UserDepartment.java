package com.yzt.zhmp.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author w
 */
@Setter
@Getter
@ToString
public class UserDepartment {
    private int userid;
    private String county_name;
    private String user_name;
    private String user_password;
    private String police;
    private String MinZheng;
    private String tourism;
}

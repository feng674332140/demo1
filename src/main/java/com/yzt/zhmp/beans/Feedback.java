package com.yzt.zhmp.beans;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 反馈信息
 *
 * @author wang
 */
@Setter
@Getter
@ToString
public class Feedback {
    private Integer id;
    private String hoursenumber;
    private String username;
    private String phoneNumber;
    private Integer deptid;
    private String description;
    private Date submittime;
    private String reply;
    private Date replytime;
}

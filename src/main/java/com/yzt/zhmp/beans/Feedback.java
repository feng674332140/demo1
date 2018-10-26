package com.yzt.zhmp.beans;


import java.util.Date;

/**
 * 反馈信息
 *
 * @author wang
 */
public class Feedback {
    private Integer id;
    private String hoursenumber;
    private String username;
    private String phoneNumber;
    private Integer deptid;
    private String description;
    private Date submittime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHoursenumber() {
        return hoursenumber;
    }

    public void setHoursenumber(String hoursenumber) {
        this.hoursenumber = hoursenumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getSubmittime() {
        return submittime;
    }

    public void setSubmittime(Date submittime) {
        this.submittime = submittime;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", hoursenumber='" + hoursenumber + '\'' +
                ", username='" + username + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", deptid=" + deptid +
                ", description='" + description + '\'' +
                ", submittime=" + submittime +
                '}';
    }
}

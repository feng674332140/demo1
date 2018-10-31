package com.yzt.zhmp.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Setter
@Getter
@ToString
public class DisUser extends DisUserKey{
    private String priviligetime;

    private Integer priviusrid;

    private String ifvalid;

    private String ifvalidValue;

    private String memo;


}
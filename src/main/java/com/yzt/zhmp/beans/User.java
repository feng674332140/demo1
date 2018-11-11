package com.yzt.zhmp.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class User {
    private Integer usrid;

    private String name;

    private String password;

    private String account;

}
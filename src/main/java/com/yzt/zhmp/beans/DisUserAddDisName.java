package com.yzt.zhmp.beans;

import lombok.*;

/**
 * @author wang
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DisUserAddDisName {
    private Integer rowNo;
    private String name;
    private int usrID;
    private String username;
    private String ifValid;
    private String memo;
    private String priviligeTime;


}

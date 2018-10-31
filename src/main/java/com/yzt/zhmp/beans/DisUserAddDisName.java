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
    private String name;
    private int usrID;
    private int priviUsrID;
    private String ifValid;
    private String ifValidValue;
    private String memo;
    private String priviligeTime;


}

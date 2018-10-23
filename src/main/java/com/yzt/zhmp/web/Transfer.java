package com.yzt.zhmp.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 实现jsp中转
 * @author .
 */
@Controller
public class Transfer {

    @RequestMapping("login")
    public String login(){
        return "WEB-INF/login/login";
    }

    @RequestMapping("pananlogin")
    public String pananlogin(){
        return "WEB-INF/login/pananHouTailogin";
    }

    /**
     * 注册中转
     * @return 注册页面
     */
    @RequestMapping("regist")
    public String regist(){
        return "WEB-INF/login/regist";
    }

    @RequestMapping("newsystem")
    public String testa(){return "WEB-INF/a/newsystem";}

}

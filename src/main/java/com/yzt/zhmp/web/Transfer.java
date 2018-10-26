package com.yzt.zhmp.web;


import com.yzt.zhmp.beans.Department;
import com.yzt.zhmp.service.BackstageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


/**
 * 实现jsp中转
 *
 * @author .
 */
@Controller
public class Transfer {

    @Autowired
    private BackstageService backstageService;

    @RequestMapping("login")
    public String login() {
        return "WEB-INF/login/login";
    }

    @RequestMapping("pananlogin")
    public String pananlogin() {
        return "WEB-INF/login/pananHouTailogin";
    }

    @RequestMapping("regist")
    public String regist() {
        return "WEB-INF/login/regist";
    }

    @RequestMapping("addFeedbackPage")
    public String addFeedback(Model model) {
        List<Department> departmentList = backstageService.selectAllDepartment();
        model.addAttribute("departmentList",departmentList);
        return "WEB-INF/a/addFeedback";
    }

    @RequestMapping("newPoliceVie")
    public String tst(){return "WEB-INF/microservice/addnewfeaures";}

}

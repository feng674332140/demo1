package com.yzt.zhmp.web;

import com.yzt.zhmp.beans.Cbuilding;
import com.yzt.zhmp.beans.User;
import com.yzt.zhmp.service.CollectionSystemService;
import com.yzt.zhmp.service.SystemService;
import com.yzt.zhmp.service.UserService.UserLoginService;
import com.yzt.zhmp.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author wang
 */
@Controller
public class UserLoginController {

    @Autowired
    private UserLoginService userLoginService;

    @Autowired
    private SystemService systemService;

    @Autowired
    private CollectionSystemService collectionSystemService;


    /**
     * 登入后台管理功能,从session中获取登录的用户
     *
     * @param name
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/pananHouTai")
    public ModelAndView userLogin(String name, String password, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        User existUser = (User) session.getAttribute("existUser1");
        //查找用户对应的部门id
        int deptId = userLoginService.selectByUserid(existUser.getUsrid());
        if (deptId == 111) {
            List systemList = systemService.selectSystem();
            modelAndView.addObject("systemList", systemList);
        } else {
            List policeSystem = systemService.selectPliceSystem();
            modelAndView.addObject("policeSystem", policeSystem);
        }
        modelAndView.addObject("deptid", deptId);
        //把部门id存到session中以便在其他页面判断
        session.setAttribute("deptid", deptId);
        modelAndView.setViewName("WEB-INF/navigation/newnavigation");
        return modelAndView;
    }


    /**
     * 磐安县登入查询用户角色返回首页(手机页面)
     *
     * @param name
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/usersLogin")
    public String usersLogin(String name, String password, HttpSession session, Model model, HttpServletRequest request) {
        String s1 = request.getRequestURL().toString();
        System.out.println("路径:" + s1);
        User user = new User();
        user.setPassword(MD5Utils.md5(password));
        user.setName(name);
        User existUser1 = userLoginService.login(user);
        session.setAttribute("existUser1", existUser1);
        if (existUser1 == null) {
            model.addAttribute("error", "账号或密码错误");
            return "WEB-INF/login/login";
        }
        //查看角色权限字段
        List<String> fileName = userLoginService.rolelogin(existUser1.getUsrid());
        //查看此用户是否有从此建筑权限
        List<String> buid = userLoginService.selectBuidbyUserId(existUser1.getUsrid());
        //声明字段  为1时用户和建筑有关联
        int bfid = 0;
        for (String s : buid) {
            if ("17".equals(s)) {
                bfid = 1;
            }
        }
        session.setAttribute("bfid", bfid);
        //暂未用到
        //查看用户角色id
        List<String> fildId = userLoginService.selectFileIdByUserid(existUser1.getUsrid());
        session.setAttribute("fildId", fildId);
        try {
            //查找用户对应的部门id
            int deptid = userLoginService.selectByUserid(existUser1.getUsrid());
            session.setAttribute("deptid", deptid);
        } catch (Exception e) {

        }
        //暂定为330727
        List allList = systemService.selectAll("330727");
        model.addAttribute("allList", allList);
        //显示农户信息
        Cbuilding cbuilding = collectionSystemService.selectBuildingByid(17);
        model.addAttribute("building", cbuilding);
        session.setAttribute("existUser1", existUser1);
        model.addAttribute("existUser1", existUser1);
        //清空服务器端令牌的session
        request.getSession().removeAttribute("token");
        return "WEB-INF/a/newsystem";
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request) {
        request.getSession().removeAttribute("existUser1");
        return "WEB-INF/a/newsystem";
    }
}

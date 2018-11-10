package com.yzt.zhmp.web;

import com.yzt.zhmp.beans.*;
import com.yzt.zhmp.service.BackstageService;
import com.yzt.zhmp.service.CollectionSystemService;
import com.yzt.zhmp.utils.MD5Utils;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author wang
 * web端后台系统
 */
@Controller
public class BackstageController {

    @Autowired
    private CollectionSystemService collectionSystemService;

    @Autowired
    BackstageService backstageService;

    /**
     * 跳转登陆页面
     *
     * @return 如果session中有登录用户跳转到index页面, 否则跳转登录页面
     */
    @RequestMapping("/control/index")
    public String toLogin(HttpServletRequest request) {
        User existUser = (User) request.getSession().getAttribute("existUser");
        if (existUser != null) {
            return "control/index";
        }
        return "control/login01";
    }

    /**
     * 注销用户 清空session
     *
     * @param request
     */
    @RequestMapping("/control/Logout")
    public String toLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "control/login01";
    }

    /**
     * 用户登陆
     *
     * @param name      账号
     * @param password  密码
     * @param checkCode 验证码
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/control/login")
    public String login(String name, String password, String checkCode, Model model, HttpServletRequest request, HttpSession session) {
        String discode;
        User existUser = (User) request.getSession().getAttribute("existUser");
        if (existUser == null) {
            //回显用户名
            model.addAttribute("name", name);
            String sessionCheckCode = (String) session.getAttribute("checkCode");
            try {
                if (!sessionCheckCode.equalsIgnoreCase(checkCode)) {
                    model.addAttribute("error", "验证码错误!");
                    return "control/login01";
                }
                User user = new User();
                user.setName(name);
                user.setPassword(MD5Utils.md5(password));
                existUser = backstageService.login(user);
                session.setAttribute("existUser", existUser);
                session.setAttribute("usrid", existUser.getUsrid());
            } catch (Exception e) {
                model.addAttribute("error", "账号或密码错误");
                return "control/login01";
            }
        }
        Integer usrid = existUser.getUsrid();
        DisUser disUser = backstageService.selectDisUser(usrid);
        //查询对应的部门的名称,行政用户无对应部门
        Department department = backstageService.findDept(usrid);
        model.addAttribute("department", department);
        session.setAttribute("department", department);
        try {
            discode = disUser.getDiscode();
            session.setAttribute("discode", discode);
        } catch (Exception e) {
            model.addAttribute("error", "此账号没有权限登录");
            return "control/login01";
        }
        //查询对应的区域名称
        String district = collectionSystemService.selectDisName(usrid);
        session.setAttribute("district", district);
        //显示可选择的部门
        List<Department> departments = backstageService.selectAllDept();
        session.setAttribute("departments", departments);
        //管理员
        List<District> districts = null;
        //分别对应管理员,省,市,县/区,街道/镇,村
        if (("00000000000000000").equals(discode)) {
            districts = backstageService.selectAllArea(discode);
        } else if (("0000").equals(discode.substring(2, 6))) {
            districts = backstageService.selectAllArea(discode);
        } else if (("00").equals(discode.substring(4, 6))) {
            districts = backstageService.selectAllArea(discode);
        } else if (("000").equals(discode.substring(6, 9))) {
            districts = backstageService.selectAllArea(discode);
        } else if (("000").equals(discode.substring(9, 12))) {
            districts = backstageService.selectAllArea(discode);
        } else if ("0000".equals(discode.substring(13, 17))) {
            districts = backstageService.selectAllArea(discode);
        } else {
            String msg = "村";
            model.addAttribute("msg", msg);
        }
        session.setAttribute("districts", districts);
        //查询是此行政区是否有介绍
        Cdistrict cdistrict = collectionSystemService.selectCdistrict(discode);
        int dis = 0;
        if (cdistrict == null) {
            request.getSession().setAttribute("dis", dis);
        } else {
            dis = 1;
            request.getSession().setAttribute("dis", dis);
            request.getSession().setAttribute("cdistrict", cdistrict);
        }
        return "control/index";
    }

    /**
     * 查找所有行政用户
     *
     * @param response
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/allDisUser")
    public void allDisUser(HttpServletResponse response, HttpServletRequest request) throws IOException {
        User existUser = (User) request.getSession().getAttribute("existUser");
        Integer userID = existUser.getUsrid();
        List<DisUserAddDisName> disUsers = collectionSystemService.selectUserByuserid(userID);
        int count = disUsers.size();
        JSONArray jsonArray = JSONArray.fromObject(disUsers);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":" + count
                + ",\"data\":" + jsonArray.toString() + "}");
    }

    /**
     * 查询区域下对应的部门用户
     *
     * @param response
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/allDeptUser")
    public void allDeptUser(HttpServletResponse response, HttpServletRequest request) throws IOException {
        User existUser = (User) request.getSession().getAttribute("existUser");
        Integer usrid = existUser.getUsrid();
        List<DeptUser> deptUsers = backstageService.selectAllDeptUser(usrid);
        int count = deptUsers.size();
        JSONArray jsonArray = JSONArray.fromObject(deptUsers);
        response.getWriter().write("{\"code\":0,\"msg\":\"\",\"count\":" + count
                + ",\"data\":" + jsonArray.toString() + "}");
    }

    /**
     * @param username 新创建账号的用户名
     * @param password 新创建账号的密码
     * @param deptID   创建部门账号的ID
     * @param disCode  创建行政用户对应的区域ID
     * @param request
     */
    @RequestMapping("/control/register")
    public String registered(String username, String password, Integer deptID, String disCode, Model model, HttpServletRequest request) {
        User existUser = (User) request.getSession().getAttribute("existUser");
        if (existUser == null) {
            model.addAttribute("status", "账户已失效，请重新登陆");
            return "control/form";
        }
        if (!(username != null && !("").equals(username.trim()) && password != null && !("").equals(password.trim()))) {
            model.addAttribute("status", "用户名密码不能为空");
            return "control/form";
        }
        Integer checkExist = backstageService.selectUserId(username);
        if (checkExist != null) {
            model.addAttribute("status", "用户名已存在");
            return "control/form";
        }
        //上级用户ID
        Integer priviusrid = existUser.getUsrid();
        //保存用户
        User user = new User();
        user.setName(username);
        user.setPassword(MD5Utils.md5(password));
        backstageService.registered(user);
        //保存后再查询对应保存生成的id
        Integer usrID = backstageService.selectUserId(username);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //创建的是部门用户
        if (deptID != null) {
            DeptUser deptUser = new DeptUser();
            deptUser.setDptusrid(usrID);
            deptUser.setUsrid(usrID);
            deptUser.setDeptid(deptID);
            deptUser.setPriviligetime(sdf.format(new Date()));
            deptUser.setPriviusrid(priviusrid);
            deptUser.setIfvalid("1");
            deptUser.setMemo("");
            backstageService.saveDeptUser(deptUser);
        }

        //创建行政用户
        if (disCode.length() > 0) {
            DisUser disUser = new DisUser();
            disUser.setPriviligetime(sdf.format(new Date()));
            disUser.setPriviusrid(priviusrid);
            disUser.setDiscode(disCode);
            disUser.setUsrid(usrID);
            disUser.setIfvalid("1");
            if ("0000".equals(disCode.substring(2, 6))) {
                disUser.setMemo("省级用户");
            } else if ("00".equals(disCode.substring(4, 6))) {
                disUser.setMemo("市级用户");
            } else if ("000".equals(disCode.substring(6, 9))) {
                disUser.setMemo("县级用户");
            } else if ("000".equals(disCode.substring(9, 12))) {
                disUser.setMemo("乡镇用户");
            } else {
                disUser.setMemo("村用户");
                user.setAccount("村");
            }
            backstageService.saveDisUser(disUser);
        }
        model.addAttribute("status", "用户添加成功");
        return "control/form";
    }

    /**
     * 生成验证码
     *
     * @param session
     * @param response
     */
    @RequestMapping("/checkCode")
    public void getCodeImage(HttpServletResponse response, HttpSession session) {
        BufferedImage img = new BufferedImage(68, 22, BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();
        Random r = new Random();
        Color c = new Color(200, 150, 255);
        g.setColor(c);
        g.fillRect(0, 0, 68, 22);
        StringBuffer sb = new StringBuffer();
        char[] ch = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f',
                'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A',
                'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
                'W', 'X', 'Y', 'Z'};
        int index, len = ch.length;
        for (int i = 0; i < 4; i++) {
            index = r.nextInt(len);
            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt
                    (255)));
            g.setFont(new Font("Arial", Font.BOLD | Font.ITALIC, 22));
            g.drawString("" + ch[index], (i * 15) + 3, 18);
            sb.append(ch[index]);
        }
        // 把上面生成的验证码放到Session域中
        session.setAttribute("checkCode", sb.toString());
        try {
            ImageIO.write(img, "JPG", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改密码
     *
     * @param checkCode     验证码
     * @param newPassword   新密码
     * @param reNewPassword 确认新密码
     * @param model
     * @param session
     * @return 返回修改密码页面
     */
    @RequestMapping("/updatePassword")
    public String updatePassword(String checkCode, String newPassword, String reNewPassword, Model model, HttpSession session) {
        //对比验证码
        String sessionCheckCode = (String) session.getAttribute("checkCode");
        if (!sessionCheckCode.equalsIgnoreCase(checkCode)) {
            model.addAttribute("newPassword", newPassword);
            model.addAttribute("reNewPassword", reNewPassword);
            model.addAttribute("msg", "验证码错误");
        } else {
            User existUser = (User) session.getAttribute("existUser");
            Integer userId = existUser.getUsrid();
            backstageService.updatePassword(userId, MD5Utils.md5(newPassword));
            model.addAttribute("msg", "修改成功");
        }
        return "control/updatePassword";
    }


}

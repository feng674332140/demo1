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
import org.springframework.web.bind.annotation.RequestMethod;
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
     * @return
     */
    @RequestMapping("/control/index")
    public String toLogin(HttpServletRequest request) {
        User existUser = null;
        existUser = (User) request.getSession().getAttribute("existUser");
        if (existUser != null) {
            return "control/index";
        }
        return "control/login01";
    }

    /**
     * 注销用户 清空session
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
     * @param model
     * @param checkCode 验证码
     * @param request
     * @return
     */
    @RequestMapping("/control/login")
    public String login(String name, String password, String checkCode,
                        Model model, HttpServletRequest request) {
        model.addAttribute("name", name);
        String sessionCheckCode = (String) request.getSession().getAttribute("checkCode");
        if (!sessionCheckCode.equalsIgnoreCase(checkCode)) {
            model.addAttribute("password", password);
            model.addAttribute("error", "验证码错误!");
            return "control/login01";
        }
        //登录失败后回显用户名

        request.getSession().invalidate();
        String discode = "";
        User existUser = null;
        existUser = (User) request.getSession().getAttribute("existUser");
        if (existUser == null) {
            //判断用户存不存在
            User user = new User();
            user.setName(name);
            if (password != null) {
                user.setPassword(MD5Utils.md5(password));
            }
            existUser = backstageService.login(user);
            //将用户信息存入session
            try {
                model.addAttribute("existUser", existUser);
                request.getSession().setAttribute("existUser", existUser);
                request.getSession().setAttribute("usrid", existUser.getUsrid());
            } catch (Exception e) {
                request.setAttribute("error", "账号或密码错误");
                return "control/login01";
            }
        }
        if (existUser == null) {
            request.setAttribute("error", "账号或密码错误");
            return "control/login01";
        } else {
            Integer usrid = existUser.getUsrid();
            DisUser disUser = backstageService.selectDisUser(usrid);
            //查询对应的部门的名称,行政用户无对应部门
            Department department = backstageService.findDept(usrid);
            model.addAttribute("department", department);
            request.getSession().setAttribute("department", department);
            try {
                discode = disUser.getDiscode();
                //把discode存入session
                request.getSession().setAttribute("discode", discode);
            } catch (Exception e) {
                request.setAttribute("error", "此账号没有权限登录");
                return "control/login01";
            }

            //查询对应的区域名称
            String district = collectionSystemService.selectDisName(usrid);
            model.addAttribute("district", district);
            request.getSession().setAttribute("district", district);

            //显示可选择的部门
            List<Department> departments = backstageService.selectAllDept();
            model.addAttribute("departments", departments);
            request.getSession().setAttribute("departments", departments);
            //如果是村级用户显示录入农户信息页面

            //管理员
            if (discode.equals("00000000000000000")) {
                //代表管理员账号,查询所有省显示
                String str = discode.substring(2, 6);
                List<District> districts = backstageService.selectAllArea(discode);
                //代表是管理员账号,可以添加省级账号
                model.addAttribute("mark", "省级");
                model.addAttribute("districts", districts);
                request.getSession().setAttribute("districts", districts);
                //省级账号
            } else if (discode.substring(2, 6).equals("0000")) {
                model.addAttribute("mark", "市级");
                List<District> districts = backstageService.selectAllArea(discode);
                model.addAttribute("districts", districts);
                request.getSession().setAttribute("districts", districts);
                //市级账号
            } else if (discode.substring(4, 6).equals("00")) {
                model.addAttribute("mark", "县区级");
                String str = discode.substring(0, 4);
                List<District> districts = backstageService.selectAllArea(discode);
                model.addAttribute("districts", districts);
                request.getSession().setAttribute("districts", districts);
            } else if (discode.substring(6, 9).equals("000")) {
                model.addAttribute("mark", "乡镇级");
                List<District> districts = backstageService.selectAllArea(discode);
                model.addAttribute("districts", districts);
                request.getSession().setAttribute("districts", districts);
            } else if (discode.substring(9, 12).equals("000")) {
                model.addAttribute("mark", "村级");
                List<District> districts = backstageService.selectAllArea(discode);
                model.addAttribute("districts", districts);
                request.getSession().setAttribute("districts", districts);
            } else if ("0000".equals(discode.substring(13, 17))) {
                List<District> districts = backstageService.selectAllArea(discode);
                model.addAttribute("districts", districts);
                request.getSession().setAttribute("districts", districts);
            } else {
                String msg = "村";
                model.addAttribute("msg", msg);
            }
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
    }

    /**
     * 查找所有行政用户
     *
     * @param response
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/allDisUser")
    public void allDidUser(HttpServletResponse response, HttpServletRequest request) throws IOException {
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
    @RequestMapping("/control/regist")
    public String registered(String username, String password, Integer deptID, String disCode, Model model, HttpServletRequest request) {
        User existUser = (User) request.getSession().getAttribute("existUser");
        if (existUser != null) {
            if (username != null && !("").equals(username.trim()) && password != null && !("").equals(password.trim())) {
                Integer checkExist = backstageService.selectUserId(username);
                if (checkExist == null) {
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
                } else {
                    model.addAttribute("status", "用户名已存在");
                    return "control/form";
                }
            } else {
                model.addAttribute("status", "用户名密码不能为空");
                return "control/form";
            }
        } else {
            model.addAttribute("status", "账户已失效，请重新登陆");
            return "control/form";
        }
    }

    /**
     * 查询所有下一级的所有用户
     *
     * @param discode
     * @param model
     * @return
     */
    @RequestMapping("/findAllUser")
    public String findAllUser(String discode, Model model) {
        if (("000000").equals(discode)) {
            //代表管理员账号,查询所有省显示
            String str = discode.substring(2, 6);
            List<DisUser> disUsers = backstageService.selectAllProvince(str);
            List<District> districts = backstageService.selectAllArea(discode);
            //代表是管理员账号,可以添加省级账号
            model.addAttribute("mark", "省级");
            model.addAttribute("disUsers", disUsers);
            model.addAttribute("districts", districts);
            //省级账号
        } else if (("0000").equals(discode.substring(2, 6))) {
            model.addAttribute("mark", "市级");
            List<District> districts = backstageService.selectAllArea(discode);
            model.addAttribute("districts", districts);
            //市级账号
        } else if (("00").equals(discode.substring(4, 6))) {
            String str = discode.substring(0, 4);
            List<District> districts = backstageService.selectAllArea(discode);
            model.addAttribute("districts", districts);
            //县区级需要设置部门,查询显示到页面
            List<Department> departments = backstageService.selectAllDept();
            model.addAttribute("departments", departments);
        }
        return "backstagePage/disUserList.jsp";
    }


    @RequestMapping("/checkCode")
    public void getCodeImage(HttpServletRequest request, HttpServletResponse response) {
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
        request.getSession().setAttribute("checkCode", sb.toString());
        try {
            ImageIO.write(img, "JPG", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/updatePassword")
    public String updatePassword(String checkCode, String password, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        model.addAttribute("password", password);
        //对比验证码
        String sessionCheckCode = (String) session.getAttribute("checkCode");
        if (sessionCheckCode.equalsIgnoreCase(checkCode)) {
            User existUser = (User) session.getAttribute("existUser");
            Integer userId = existUser.getUsrid();
            User user = new User();
            user.setUsrid(userId);
            user.setPassword(MD5Utils.md5(password));
            backstageService.updatePassword(user);
            model.addAttribute("msg", "修改成功");
        } else {
            model.addAttribute("msg", "验证码错误");
        }
        return "control/updatePassword";
    }


}

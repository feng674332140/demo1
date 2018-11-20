package com.yzt.zhmp.web;

import com.yzt.zhmp.beans.*;
import com.yzt.zhmp.service.CollectionSystemService;
import com.yzt.zhmp.service.SystemService;
import com.yzt.zhmp.utils.MD5Utils;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 手机端页面控制
 * @author wangyinglong
 */
@Controller
public class MobileWebController {

    @Autowired
    SystemService systemService;

    @Autowired
    CollectionSystemService collectionSystemService;

    @RequestMapping("index")
    public String test(Integer buID, HttpSession session, Model model) {
        model.addAttribute("buID", buID);
        return "WEB-INF/index";
    }

    /**
     * 获取所在行政区
     *
     * @param buID
     * @param response
     * @throws IOException
     */
    @PostMapping("title")
    @ResponseBody
    public void getAreaName(Integer buID, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        JSONObject jsonObject = new JSONObject();
        //查询房屋所在行政区域宣传标语(数据库表中的name字段)
        String title = systemService.title(buID);
        if (null != title && !(("").equals(title))) {
            response.getWriter().write(title);
        } else {
            String areaName = systemService.getAreaName(buID);
            String[] name = null;
            if (areaName.contains("省")) {
                name = areaName.split("省");
            } else if (areaName.contains("市")) {
                name = areaName.split("市");
            } else if (areaName.contains("县")) {
                name = areaName.split("县");
            } else if (areaName.contains("区")) {
                name = areaName.split("区");
            } else if (areaName.contains("街道")) {
                name = areaName.split("街道");
            } else if (areaName.contains("社区")) {
                name = areaName.split("社区");
            } else if (areaName.contains("村")) {
                name = areaName.split("村");
            } else if (areaName.contains("村委会")) {
                name = areaName.split("村委会");
            } else if (areaName.contains("居委会")) {
                name = areaName.split("居委会");
            }
            try {
                String abbreviation = name[0];
                jsonObject.put("title", abbreviation + "欢迎您");
            } catch (NullPointerException e) {
                jsonObject.put("title", title);
            }
            jsonObject.put("buID", buID);
            response.getWriter().write(jsonObject.toString());
        }
    }


    /**
     * 用户登录
     *
     * @param username 账号或手机号
     * @param password 密码
     * @param response
     * @throws IOException
     */
    @PostMapping("login")
    @ResponseBody
    public void login(String username, String password, Integer buID, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        JSONObject json = new JSONObject();
        User user = systemService.login(username, MD5Utils.md5(password));
        if (null != user) {
            Integer userID = user.getUsrid();
            String name = user.getName();
            DisUser disUser = systemService.disUser(userID);
            if (null == disUser) {
                //说明不是行政用户,可以登录
                json.put("userID", userID);
                json.put("name", name);
                DeptUser deptUser = systemService.deptUser(userID);
                if (null != deptUser) {
                    Integer deptId = deptUser.getDeptid();
                    json.put("deptId", deptId);
                }
                //核对登录用户是否为户主
                String phoneNum = systemService.phoneNum(buID);
                if (username.equals(phoneNum)) {
                    json.put("isHost", "1");
                }
                response.getWriter().write(json.toString());
            } else {
                response.getWriter().write("请使用部门账号登录!");
            }
        } else {
            response.getWriter().write("账号或密码错误");
        }
    }

    /**
     * 校验手机号是否可用
     *
     * @param tel      手机号
     * @param response
     * @throws IOException
     */
    @PostMapping("checkTel")
    public void checkTel(String tel, HttpServletResponse response) throws IOException {
        Integer userId = systemService.selectUseridbyName(tel);
        if (null == userId) {
            response.getWriter().write("0");
        } else {
            response.getWriter().write("1");
        }
    }


    /**
     * 用户注册
     *
     * @param tel      电话
     * @param pwd      密码
     * @param vcode    验证码
     * @param response
     * @throws IOException
     */
    @PostMapping("register")
    public void userRegister(String tel, String pwd, String vcode, HttpServletResponse response) throws IOException {
        Integer userId = systemService.selectUseridbyName(tel);
        if (null != userId) {
            response.getWriter().write("该号码已存在!");
            return;
        }
        if (null == (systemService.checkVerificationCode(vcode, tel))) {
            response.getWriter().write("注册失败，手机验证码错误!");
            return;
        }
        User user = new User();
        user.setName(tel);
        user.setPassword(MD5Utils.md5(pwd));
        try {
            systemService.registered(user);
        } catch (Exception e) {
            response.getWriter().write("注册失败!");
        }
        response.getWriter().write("1");
    }


    /**
     * 展示农户信息
     *
     * @param response
     * @throws IOException
     */
    @PostMapping("/areaInfo")
    @ResponseBody
    public void getAreaInfo(Integer buID, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        JSONObject json = new JSONObject();
        Cbuilding cbuilding = systemService.selectCBuilding(buID);
        Map<String, Object> nonghuInfo = new LinkedHashMap<>();
        //公开或者不公开都会显示的信息
        String name = cbuilding.getName();
        nonghuInfo.put("姓名", name);
        String phoneNum = cbuilding.getPhoneNum();
        nonghuInfo.put("联系电话", phoneNum);
        String familyType = cbuilding.getFamilyType();
        nonghuInfo.put("门牌编号", familyType);
        String address = cbuilding.getAddress();
        nonghuInfo.put("地址", address);
        String disCode = cbuilding.getDisCode();
        String busiType = cbuilding.getBusiType();
        String busiTypeName;
        switch (busiType) {
            case "1":
                busiTypeName = "普通农户";
                break;
            case "2":
                busiTypeName = "药农";
                break;
            case "3":
                busiTypeName = "农家乐";
                break;
            case "4":
                busiTypeName = "民宿";
                break;
            default:
                busiTypeName = "普通农户";
        }
        nonghuInfo.put("农户类型", busiTypeName);

        String ifOpen = cbuilding.getIfOpen();
        if (("0").equals(ifOpen)) {
            int population = cbuilding.getPopulation();
            nonghuInfo.put("家庭人数", population);
            int roomNum = cbuilding.getRoomNum();
            nonghuInfo.put("房间数", roomNum);
            int floorNum = cbuilding.getFloorNum();
            nonghuInfo.put("楼层数", floorNum);
            float landArea = cbuilding.getLandArea();
            nonghuInfo.put("占地面积", landArea);
            float buildArea = cbuilding.getBuildArea();
            nonghuInfo.put("建筑面积", buildArea);
            float yardArea = cbuilding.getYardArea();
            nonghuInfo.put("庭院面积", yardArea);
            //农家乐和名宿
            String farmhouse = "3";
            String homeStay = "4";
            if (farmhouse.equals(busiType) || homeStay.equals(busiType)) {
                int numberOfRoom = cbuilding.getNumberOfRoom();
                int numberOfBed = cbuilding.getNumberOfBed();
                int mealDigits = cbuilding.getMealDigits();
                nonghuInfo.put("客房数", numberOfRoom);
                nonghuInfo.put("床位数", numberOfBed);
                nonghuInfo.put("餐位数", mealDigits);
            }
            String feature = cbuilding.getFeature();
            nonghuInfo.put("经营特色", feature);
            String memo = cbuilding.getMemo();
            nonghuInfo.put("总体介绍", memo);
        }
        //用户为公开信息则查询行政区信息进行展示
        Cdistrict cdistrict = systemService.disInfo(disCode);
        String introduction = cdistrict.getIntroduction();
        String traffic = cdistrict.getTraffic();
        String travel = cdistrict.getTravel();
        String memo = cdistrict.getMemo();
        Map<String, Object> areaInfo = new LinkedHashMap<>();
        areaInfo.put("区域介绍", introduction);
        areaInfo.put("交通状况", traffic);
        areaInfo.put("旅游介绍", travel);
        areaInfo.put("名胜古迹", memo);

        json.put("nonghuInfo", nonghuInfo);
        json.put("areaInfo", areaInfo);
        response.getWriter().write(json.toString());
    }

    /**
     * 政务服务
     *
     * @param deptID   部门ID
     * @param response
     * @throws IOException
     */
    @PostMapping("systemList")
    @ResponseBody
    public void getMinzheng(Integer deptID, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        List list = systemService.selectSystem(deptID);
        JSONObject json = new JSONObject();
        json.put("systemList", list);
        response.getWriter().write(json.toString());
    }

    /**
     * @param buID     农户ID
     * @param response
     * @throws IOException
     */
    @PostMapping("cBuilding")
    @ResponseBody
    public void getCBuilding(Integer buID, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        Cbuilding cbuilding = systemService.selectCBuilding(buID);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("cbuilding", cbuilding);
        response.getWriter().write(jsonObject.toString());
    }

    /**
     * 修改农户信息
     *
     * @param cbuilding 农户信息
     * @param response
     */
    @RequestMapping("updateCBuilding")
    public void updateCBuilding(Cbuilding cbuilding, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int i = collectionSystemService.updateCbuidingByfamilyType(cbuilding);
            response.getWriter().write("1");
        } catch (Exception e) {
            response.getWriter().write("0");
        }
    }
}

package com.yzt.zhmp.web;

import com.yzt.zhmp.beans.Cbuilding;
import com.yzt.zhmp.beans.Feedback;
import com.yzt.zhmp.beans.System;
import com.yzt.zhmp.beans.User;
import com.yzt.zhmp.service.CollectionSystemService;
import com.yzt.zhmp.service.SystemService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class SystemController {

    @Autowired
    private SystemService systemService;

    @Autowired
    private CollectionSystemService collectionSystemService;

    /**
     * 手机端首页
     *
     * @return
     */
    @RequestMapping("system")
    public String system() {
        return "WEB-INF/a/newsystem";
    }

    /**
     * 显示政府服务
     *
     * @param request
     * @return
     */
    @RequestMapping("zhengfufuwu")
    public String zhengfufuwu(HttpServletRequest request, Model model) {
        User existUser1 = (User) request.getSession().getAttribute("existUser1");
        model.addAttribute("existUser1", existUser1);
        String discode = "330727";
        //显示政府服务分类
        List<String> deptName = systemService.selectDeptNamebuDisCode(discode);
        request.getSession().setAttribute("deptName", deptName);
        List allList = systemService.selectAll(discode);
        request.getSession().setAttribute("allList", allList);
        //显示农户信息
        Cbuilding cbuilding = collectionSystemService.selectBuildingByid(17);

        model.addAttribute("building", cbuilding);
        return "WEB-INF/a/zhengfufuwu";
    }

    /**
     * 周边反馈
     *
     * @return
     */
    @RequestMapping("zhoubianfankui")
    public String zhoubianfankui(Model model) {
        //查询所有的反馈信息
        List<Feedback> feedbacks = systemService.selectAllFeedback();
        model.addAttribute("feedbacks", feedbacks);
        return "WEB-INF/a/zhoubianfankui";
    }


    /**
     * 后台显示
     *
     * @return
     */
    @RequestMapping("systemnavigation")
    public ModelAndView systemnavigation() {
        ModelAndView modelAndView = new ModelAndView();
        //查询民政
        List systemList = systemService.selectSystem();
        //查询公安
        List policeList = systemService.selectPoliceSystem();
        modelAndView.addObject("policeSystem", policeList);
        java.lang.System.err.println(policeList);
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/navigation/newnavigation");
        return modelAndView;
    }

    /**
     * 显示添加民政功能模块页面
     *
     * @param request
     * @return
     */
    @RequestMapping("addOrgmicroserviceVie")
    public ModelAndView addOrgmicroserviceVie(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String deptid = request.getParameter("deptid");
        List systemList = systemService.selectSystem();
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/microservice/Orgaddmicroservice");
        return modelAndView;
    }

    /**
     * 显示禁用民政模块功能页面
     *
     * @return
     */
    @RequestMapping("deleteOrgmicroserviceVie")
    public ModelAndView deleteOrgmicroserviceVie() {
        ModelAndView modelAndView = new ModelAndView();
        List systemList = systemService.selectSystem();
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/microservice/Orgdeletemicroservice");
        return modelAndView;
    }

    /**
     * 添加民政功能模块
     *
     * @param link_id
     * @return
     */
    @RequestMapping("addOrgmicroservice")
    @ResponseBody
    public int addOrgmicroservice(String link_id) {
        ArrayList arrayList = new ArrayList();
        //把json存入list
        JSONArray jsonArray = JSONArray.fromObject(link_id);
        for (int i = 0; i < jsonArray.size(); i++) {
            arrayList.add(jsonArray.get(i));
        }
        int i = systemService.addOrgmicroservice(arrayList);
        return i;
    }

    /**
     * 禁用模块功能
     *
     * @param link_id
     * @return
     */
    @RequestMapping("deleteOrgmicroservice")
    @ResponseBody
    public int deleteOrgmicroservice(String link_id) {
        ArrayList arrayList = new ArrayList();
        //把json存入list
        JSONArray jsonArray = JSONArray.fromObject(link_id);
        for (int i = 0; i < jsonArray.size(); i++) {
            arrayList.add(jsonArray.get(i));
        }
        int i = systemService.deleteOrgmicroservice(arrayList);
        return i;
    }

    /**
     * 添加功能模块
     *
     * @param urlname
     * @param headico
     * @param ifvial
     * @param shouName
     * @param session
     * @return
     */
    @RequestMapping("addneweatures")
    public ModelAndView addnewfeatures(String urlname, String headico, String ifvial, String shouName, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        int deptid = (int) session.getAttribute("deptid");
        System system = new System(deptid, "民政服务", urlname, headico, shouName, ifvial);
        int i = systemService.addnewFeatures(system);
        //查询民政
        List systemList = systemService.selectSystem();
        //查询公安
        List policeList = systemService.selectPoliceSystem();
        modelAndView.addObject("policeSystem", policeList);
        java.lang.System.err.println(policeList);
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/navigation/newnavigation");
        return modelAndView;

    }

    /**
     * 显示添加功能模块页面
     *
     * @return
     */
    @RequestMapping("addPoliceVie")
    public ModelAndView addPoliceVie() {
        ModelAndView modelAndView = new ModelAndView();
        List systemList = systemService.selectPoliceSystem();
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/microservice/Orgaddmicroservice");
        return modelAndView;
    }

    /**
     * 查询所有的公安部门
     *
     * @return
     */
    @RequestMapping("deletePoliceVie")
    public ModelAndView deletePoliceVie() {
        ModelAndView modelAndView = new ModelAndView();
        List systemList = systemService.selectPoliceSystem();
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/microservice/Orgdeletemicroservice");
        return modelAndView;
    }

    /**
     * 添加公安功能模块
     *
     * @param urlname
     * @param headico
     * @param ifvial
     * @param shouName
     * @return
     */
    @RequestMapping("addPoliceeatures")
    public String addPolicefeatures(String urlname, String headico, String ifvial, String shouName, Model model) {
        System system = new System(222, "公安服务", urlname, headico, shouName, ifvial);
        int i = systemService.addnewFeatures(system);
        return "WEB-INF/system";
    }

    /**
     * 跳转外网链接页面
     *
     * @param url   链接网址
     * @param name  服务项名称
     * @param model
     * @return
     */
    @RequestMapping("skip")
    public String skip(String url, String name, Model model) {
        model.addAttribute("url", url);
        model.addAttribute("name", name);
        return "WEB-INF/a/skip";
    }

    /**
     * json返回地名信息
     *
     * @param discode
     * @param response
     * @throws IOException
     */
    @CrossOrigin
    @ResponseBody
    @RequestMapping("fangwuInfo")
    public void fangwuInfo(String discode, HttpServletResponse response) throws IOException {
        response.setContentType("text/json;charset=UTF-8");


       /*
       {"address":"盘镇饭店 - 浙江省金华市磐安县盘山中路127号",
       "datas":"{'产权人':'汪爱青',
                '申请时间':'2018-10-09 15:52:35',
                '申请人':'周字得',
                '是否打印门牌证':'是',
                '备注':'是磐安县十分出名的一座饭店，让人常常流连忘返'}",
                "c":"127",
                "location":"(29.0067850148,120.5719663071)",
                "result":"01",
                "resultMsg":"获取信息成功"}*/
        JSONObject json = new JSONObject();
        json.put("name","盘镇饭店");
        json.put("address", "浙江省金华市磐安县盘山中路127号");
        json.put("location","(29.0067850148,120.5719663071)");

        HashMap<String, String> dataMap = new HashMap<>();
        dataMap.put("产权人","汪爱青");
        dataMap.put("申请时间","2018-10-09 15:52:35");
        dataMap.put("申请人","周字得");
        dataMap.put("是否打印门牌证","是");
        dataMap.put("备注","是磐安县十分出名的一座饭店，让人常常流连忘返");
        json.put("datas",dataMap);

        response.getWriter().write(json.toString());
    }

    /**
     * 添加反馈信息
     *
     * @param feedback
     * @param response
     */
    @RequestMapping("/addFeedback")
    @ResponseBody
    public void addFeedback(Feedback feedback, HttpServletResponse response) throws IOException {
        //先判断用户或手机号有没有关联的反馈
        JSONObject jsonObject = new JSONObject();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Feedback existFeedback = systemService.findFeedbackByUsernameOrPhone(feedback);
        if (existFeedback == null) {
            feedback.setSubmitTime(new Date());
            systemService.addFeedback(feedback);
            jsonObject.put("msg", "提交成功！请等待反馈");
        } else {
            Date submitTime = existFeedback.getSubmitTime();
            String nowTime = simpleDateFormat.format(new Date());
            String lastTime = simpleDateFormat.format(submitTime);
            if (lastTime.equals(nowTime)) {
                jsonObject.put("msg", "您今天已经提交过信息");
            } else {
                feedback.setSubmitTime(new Date());
                systemService.addFeedback(feedback);
                jsonObject.put("msg", "提交成功！请等待反馈");
            }
        }
        response.getWriter().write(jsonObject.toString());
    }

    /**
     * 跳转返回回复页面
     *
     * @return
     */
    @RequestMapping("/toReply")
    public String toReply(Feedback feedback, Model model, HttpServletRequest request) {
        Feedback existFeedback = systemService.findOnlyFeedback(feedback);
        Date submitTime = existFeedback.getSubmitTime();
        feedback.setSubmitTime(submitTime);
        model.addAttribute("existFeedback", existFeedback);
        return "WEB-INF/a/reply";
    }


    @RequestMapping("/reply")
    @ResponseBody
    public void reply(Feedback feedback, String submitTime1, HttpServletResponse response) throws IOException, ParseException {
        //添加回复时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        feedback.setSubmitTime(sdf.parse(submitTime1));
        feedback.setReplyTime(new Date());
        systemService.updateFeedbackByUsernameOrPhone(feedback);
        String msg = "回复成功";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", msg);
        response.getWriter().write(jsonObject.toString());
    }
}

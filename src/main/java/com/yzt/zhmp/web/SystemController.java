package com.yzt.zhmp.web;

import com.yzt.zhmp.beans.Cbuilding;
import com.yzt.zhmp.beans.System;
import com.yzt.zhmp.beans.User;
import com.yzt.zhmp.service.CollectionSystemService;
import com.yzt.zhmp.service.SystemService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
        model.addAttribute("existUser1",existUser1);
        String discode = "330727 ";
        //显示政府服务分类
        List<String> deptName = systemService.selectDeptNamebuDisCode(discode);

        request.getSession().setAttribute("deptName", deptName);
        //
        List allList = systemService.selectAll(discode);
        request.getSession().setAttribute("allList", allList);
        //显示农户信息
        Cbuilding cbuilding = collectionSystemService.selectBuildingByid(17);

        model.addAttribute("building", cbuilding);
        return "WEB-INF/a/zhengfufuwu";
    }

    /**
     * 相关连接
     *
     * @return
     */
    @RequestMapping("xiangguanlianjie")
    public ModelAndView xiangguanlianjie() {
        ModelAndView modelAndView = new ModelAndView();
        List allList = systemService.selectAll("330727");
        modelAndView.addObject("allList", allList);
        modelAndView.setViewName("WEB-INF/a/xiangguanlianjie");

        return modelAndView;
    }

    /**
     * 周边反馈
     *
     * @return
     */
    @RequestMapping("zhoubianfankui")
    public ModelAndView zhoubianfankui() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WEB-INF/a/zhoubianfankui");
        return modelAndView;
    }

    /**
     * 未使用
     *
     * @return
     */
    @RequestMapping("zhengwu")
    public ModelAndView zhengwu() {
        ModelAndView modelAndView = new ModelAndView();
        List allList = systemService.selectAll("330727");
        modelAndView.addObject("allList", allList);
        modelAndView.setViewName("WEB-INF/a/ZhengWusystem");
        return modelAndView;
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
        List policeList = systemService.selectPliceSystem();
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
        List policeList = systemService.selectPliceSystem();
        modelAndView.addObject("policeSystem", policeList);
        java.lang.System.err.println(policeList);
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/navigation/newnavigation");
        return modelAndView;

    }

    /**
     * 显示添加功能模块页面
     * @return
     */
    @RequestMapping("addPoliceVie")
    public ModelAndView addPoliceVie() {
        ModelAndView modelAndView = new ModelAndView();
        List systemList = systemService.selectPliceSystem();
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/microservice/Orgaddmicroservice");
        return modelAndView;
    }

    /**
     * 查询所有的公安部门
     * @return
     */
    @RequestMapping("deletePoliceVie")
    public ModelAndView deletePoliceVie() {
        ModelAndView modelAndView = new ModelAndView();
        List systemList = systemService.selectPliceSystem();
        modelAndView.addObject("systemList", systemList);
        modelAndView.setViewName("WEB-INF/microservice/Orgdeletemicroservice");
        return modelAndView;
    }

    /**
     * 添加公安功能模块
     * @param urlname
     * @param headico
     * @param ifvial
     * @param shouName
     * @return
     */
    @RequestMapping("addPoliceeatures")
    public ModelAndView addPolicefeatures(String urlname, String headico, String ifvial, String shouName) {
        ModelAndView modelAndView = new ModelAndView();
        System system = new System(222, "民政服务", urlname, headico, shouName, ifvial);
        int i = systemService.addnewFeatures(system);
        modelAndView.setViewName("WEB-INF/system");
        return modelAndView;
    }

    /**
     * 跳转外网链接页面
     * @param url 链接网址
     * @param name 服务项名称
     * @param model
     * @return
     */
    @RequestMapping("skip")
    public String skip(String url,String name, Model model){
        model.addAttribute("url",url);
        model.addAttribute("name",name);
        return "WEB-INF/a/skip";
    }

}

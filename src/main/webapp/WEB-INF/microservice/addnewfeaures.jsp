<%--
  Created by IntelliJ IDEA.
  User: shenbiao
  Date: 2017/3/1
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String userID = (String) session.getAttribute("userID");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>添加功能</title>
    <link rel="stylesheet" href="<%=basepath%>/control/plugins/layui/css/check.css" media="all">
    <script type="text/javascript" src="../static/js/pop-ico.js"></script>
    <link rel="stylesheet" type="text/css" href="../static/style/example.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="../static/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/example.css"/>
    <script type="text/javascript" src="../static/js/jquery-1.10.2.min.js"></script>

    <style type="text/css">
        body {
            font-size: 12px;
            font-family: "宋体";
            color: #333333;
        }

        a {
            text-decoration: none;
        }

        .cmt-ico .head-ico img {
            border: 1px dashed #F60;
            padding: 2px;
        }

        .pop-ico {
            position: absolute;
            width: 250px;
            min-height: 130px;
            top: 50px;
            left: 0px;
            background: #FFF;
            border: 1px solid #D7D7D7;
            z-index: 100
        }

        .pop-ico .ico-title {
            height: 20px;
            background-color: #F0F0F0;
            color: #0078B6;
            padding-top: 5px;
            padding-left: 5px;
            padding-right: 5px
        }

        .pop-ico .ico-title a {
            cursor: pointer;
            display: block;
            width: 15px;
            height: 15px;
            text-align: center;
            position: absolute;
            right: 5px;
            top: 5px;
        }

        .pop-ico .ico-list {
            padding: 7px
        }

        .pop-ico .ico-list a img {
            border: 1px dashed #DDD;
            cursor: pointer;
        }

        .pop-ico .ico-list a:hover img, .pop-ico .ico-list .cur img {
            border: 1px dashed #F60;
        }
    </style>
</head>
<body ontouchstart>
<div class="main" style="width: 100%;margin: 0 auto;border: 1px solid #BEBEBE;min-height:400px">
    <div class="row top">
        <div class="col-xs-3 heig" onClick="history.back(-1);">
            <span class="glyphicon glyphicon-arrow-left"></span>
        </div>
        <div class="col-xs-6 text-center heig"><b>添加服务</b></div>
        <div class="col-xs-3 text-center heig">
        </div>
    </div>

    <div style="padding: 10px">
        <form action="addneweatures" method="post">
            <span> 请输入链入的URL：</span><input type="text" name="urlname" value=""/>
            <br/>
            <br/>
            <span>在页面显示的名称：</span><input type="text" name="shouName" value="">
            <br/>
            <br/>
            <!-- 图标选择 start -->
            <span>请选择图标：</span>
            <br><br>
            <div class="cmt-ico" style="position: relative">
                <a class="head-ico show-ico-btn" title="选择图标"><img
                        class="focus-ico"
                        src="../static/images/minzheng/hunydengji.png"
                        alt="选择图标" width="72" height="72">
                </a>

                &nbsp;<%--图片路径：--%><input type="hidden" name="headico" value="" style="display: none">
                <!-- 弹出窗口  start-->
                <div class="pop-ico" style="display: none">
                    <div class="ico-title">
                        <span>选择头像</span>
                        <a title="关闭窗口" class="hide-ico-btn">x</a>
                    </div>
                    <div class="ico-list">
                        <a data-src="/static/images/minzheng/binzangguanli.png" class="cur"><img
                                src="../static/images/minzheng/binzangguanli.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/chengxiangdibao.png"><img
                                src="../static/images/minzheng/chengxiangdibao.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/cishanjuanzhu.png"><img
                                src="../static/images/minzheng/cishanjuanzhu.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/dimingguanli.png"><img
                                src="../static/images/minzheng/dimingguanli.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/fulicaipiao.png"><img
                                src="../static/images/minzheng/fulicaipiao.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/hunydengji.png"><img
                                src="../static/images/minzheng/hunydengji.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/jiuzaijiuji.png"><img
                                src="../static/images/minzheng/jiuzaijiuji.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/laonianyoudai.png"><img
                                src="../static/images/minzheng/laonianyoudai.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/liulangjiuzhu.png"><img
                                src="../static/images/minzheng/liulangjiuzhu.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/quhuadiming.png"><img
                                src="../static/images/minzheng/quhuadiming.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/shehuifuli.png"><img
                                src="../static/images/minzheng/shehuifuli.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/shehuizuzhi.png"><img
                                src="../static/images/minzheng/shehuizuzhi.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/shequjianshe.png"><img
                                src="../static/images/minzheng/shequjianshe.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/shouyangdengji.png"><img
                                src="../static/images/minzheng/shouyangdengji.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/tekungongyang.png"><img
                                src="../static/images/minzheng/tekungongyang.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/tuiwuanzhi.png"><img
                                src="../static/images/minzheng/tuiwuanzhi.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/yanglaojigou.png"><img
                                src="../static/images/minzheng/yanglaojigou.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/yiliaojiuzhu.png"><img
                                src="../static/images/minzheng/yiliaojiuzhu.png" width="72" height="72"></a>
                        <a data-src="/static/images/minzheng/youdaifuxu.png"><img
                                src="../static/images/minzheng/youdaifuxu.png" width="72" height="72"></a>
                    </div>
                </div>
                <!-- 弹出窗口  end-->
            </div>
            <!-- 头像选择 end -->
            <br/>
            <span>是否立即启用</span><input type="checkbox" value="1" name="ifvial"/>
            <br/>
            <br/>
            <input type="submit" value="立即添加"/>
        </form>
    </div>
</div>
<div class="corp" style="width: 100%;margin: 0 auto;text-align: center;margin-top: 10px">
</div>

</body>
</html>

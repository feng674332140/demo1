<%--
    磐安市主页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    //request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    String userID = (String) session.getAttribute("userID");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>智慧门牌</title>
    <link rel="stylesheet" type="text/css" href="../static/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/example.css"/>
    <%--<script type="text/javascript" src="/static/js/zepto.min.js"></script>--%>
    <script type="text/javascript" src="../static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../static/js/common/common.js"></script>
    <script type="text/javascript" src="../static/js/common/Sortable.min.js"></script>
    <script type="text/javascript" src="../static/js/service/bigservice.js"></script>
    <script type="text/javascript" src="../static/js/navigation/navigation.js"></script>

    <style type="text/css">
        body, html, #container {
            height: 100%;
            margin: 0px;
        }
        .panel {
            background-color: #ddf;
            color: #333;
            border: 1px solid silver;
            box-shadow: 3px 4px 3px 0px silver;
            position: absolute;
            top: 10px;
            right: 10px;
            border-radius: 5px;
            overflow: hidden;
            line-height: 20px;
        }

        @font-face {
            font-family: 'MyNewFont';   /*字体名称*/
            src: url('control/plugins/layui/font/STXINGKA.TTF');       /*字体源文件*/
        }

    </style>
</head>
<body ontouchstart>
<div class="page">

    <div class="pageContent" id="tpl_qrcode" style="display:block;">
        <div class="weui-panel weui-panel_access">
            <p style="text-align: center;height: 38px;line-height: 45px;font-family:'MyNewFont';font-size: 17px">
                群山之祖，诸水之源，大美磐安</p>
        </div>
        <div class="weui-panel weui-panel_access">
            <div class="weui-panel__bd" style="float: left">
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb"
                             src="../static/images/menpai/2c1c1576b4fc5268fd89f17288d1b868.gif" alt="">
                    </div>
                    <div class="weui-media-box__bd">
                        <h4 class="weui-media-box__title ">磐安县海螺街33号民政大楼</h4>
                        <p class="weui-media-box__desc" style="font-size: 10px">管理单位:磐安县民政局</p>
                    </div>
                </a>

            </div>

        </div>

        <%--地图--%>
        <div class="weui-cells weui-cells_form map" style="height:30%;margin-top: 10px" >
            <div class="maps" onclick="toMap()"></div>
            <div id="container" tabindex="0"></div>
        </div>

        <div class="weui-panel weui-panel_access">
            <table style="margin-top: 5px">
                <colgroup>
                    <col width="40">
                    <col width="500">
                </colgroup>
                <tr>
                    <td>
                        <div class="layui-inline">
                            <img src="../static/images/219226629aa.jpg" style="width: 48px;height: 55px"
                                 class="layui-circle">
                        </div>
                    </td>
                    <td style="font-size: 15px ">
                        <p class=" tit">所属部门：磐安</p>
                        <p class=" tit">民警姓名：厉韬</p>
                        <p class=" tit">一键报警：<a href="tel:15179788823">15156257489</a></p>
                    </td>
                </tr>
            </table>
        </div>
        <div class="weui-panel weui-panel_access" style="padding-top: 10px;margin-bottom: 10px">
            <div class="row">
                <a href="javascript:void(0);" id="fangwu" class="col-xs-4">
                    <div class="weui-grid__icon">
                        <img src="../static/images/panan/address.png" style="" alt="">
                    </div>
                    <p class="weui-grid__label">地名信息</p>
                </a>

                <a href="zhengfufuwu" class="col-xs-4" id="engfu">
                    <div class="weui-grid__icon">
                        <img src="../static/images/zhengfu.png" style="" alt="">
                    </div>
                    <p class="weui-grid__label">政府服务</p>
                </a>
                <a href="zhoubianfankui" class="col-xs-4" id="kl">
                    <div class="weui-grid__icon">
                        <img src="../static/images/panan/feedback.png" style="" alt="">
                    </div>
                    <p class="weui-grid__label">周边反馈</p>
                </a>
            </div>
        </div>
        <c:if test="${empty existUser1}">
            <div class="row look">
                <div class="col-xs-12 text-center text-muted">请登录查后看信息!</div>
            </div>
        </c:if>
        <c:if test="${not empty existUser1}">
            <div class="row look">
                <div class="col-xs-12">
                    <span class="pull-right"></span>
                </div>
            </div>
        </c:if>
        <br>
        <c:if test="${empty existUser1}">
            <a href="login" class="btn btn-success btn-block btn-lg">用户登录</a>
        </c:if>
        <c:if test="${not empty existUser1}">
            <a href="loginOut" onclick="loginOut()" class="btn btn-danger btn-block btn-lg">退出登录</a>
        </c:if>
    </div>
</div>

<%--百度地图--%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=skrpasVpQNa6WnSyj8aY5h3fCgVFhBNg">
    //v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
</script>
<script>
    $("#zhengfu").click(function () {
        if ($("#tpl_monitoring").css("display") == "none") {
            $("#tpl_monitoring").show();
        } else {
            $("#tpl_monitoring").hide();
        }
    });

    $("#xiangguan").click(function () {
        if ($("#tpl_rcode").css("display") == "none") {
            $("#tpl_rcode").show();
        } else {
            $("#tpl_rcode").hide();
        }
    });

    $("#zhoubian").click(function () {
        if ($("#tpl_feedback").css("display") == "none") {
            $("#tpl_feedback").show();
        } else {
            $("#tpl_feedback").hide();
        }
    });

    $("#fangwu").click(function () {
        $(".look").fadeToggle(500)
        if (${not empty existUser1}) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/fangwuInfo",
                data: {discode: "33072700000000000"},
                dataType: "json",
                success: function (data) {
                    var json = eval(data);
                    var html = '';
                    for (var key in json) {
                        html += '<div class="col-xs-12">' + key +
                            '<span class="pull-right">' + json[key] + '</span></div>'
                    }
                    $('.look').html(html);
                }
            });
        }
    });

    function showXiangGuan() {
        $(".pageContent").css("display", "none");
        $("#tpl_rcode").css("display", "block");
    }

    var dataX=120.4507351963;//经度
    var dataY=29.0596338332;//纬度

    function toMap(){
        window.location.href="http://api.map.baidu.com/marker?location="+dataY+","+dataX+"" +
            "&title=我的位置&content=磐安县公安局&output=html&src=webapp.baidu.openAPIdemo "
    }

    var map = new BMap.Map("container");
    // 创建地图实例
    var point = new BMap.Point(dataX, dataY);
    // 创建点坐标
    map.centerAndZoom(point, 16);

    var marker = new BMap.Marker(point);        // 创建标注
    map.addOverlay(marker);




</script>


<script type="text/javascript">
    /**
     * 开始自动加载find
     */
    $(document).ready(function () {
        //显示/隐藏子节点
        showInnerContent();
        //搜索栏
        searchBarAction();
        showqrcode();
    })
</script>
</body>
</html>

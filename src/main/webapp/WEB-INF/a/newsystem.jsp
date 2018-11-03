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

        .a {
            text-decoration: none;
        }

        @font-face {
            font-family: 'MyNewFont';   /*字体名称*/
            src: url('control/plugins/layui/font/STXINGKA.TTF');   /*字体源文件*/
        }

    </style>
</head>
<body ontouchstart>
<div class="page">
    <div class="pageContent" id="tpl_qrcode">
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
        <div class="weui-cells weui-cells_form map" style="height:30%;margin-top: 10px">
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
                            <img src="../static/images/219226629aa.jpg" style="width: 80px;height: 90px"
                                 class="layui-circle">
                        </div>
                    </td>
                    <td style="font-size: 15px ">
                        <p class=" tit">所属部门：民政</p>
                        <p class=" tit">民警姓名：厉韬</p>
                        <p class=" tit">一键报警：<a style="text-decoration: none" href="tel:15156257489">15156257489</a></p>
                    </td>
                </tr>
            </table>
        </div>
        <div class="weui-panel weui-panel_access" style="padding-top: 10px;margin-bottom: 10px">
            <div class="row">
                <a href="javascript:void(0);" id="fangwu" class="col-xs-4" style="text-decoration: none">
                    <div class="weui-grid__icon">
                        <img src="../static/images/panan/address.png" style="" alt="">
                    </div>
                    <p class="weui-grid__label">地名信息</p>
                </a>

                <a href="zhengfufuwu" class="col-xs-4" id="engfu" style="text-decoration: none">
                    <div class="weui-grid__icon">
                        <img src="../static/images/zhengfu.png" style="" alt="">
                    </div>
                    <p class="weui-grid__label">政府服务</p>
                </a>
                <a href="zhoubianfankui" class="col-xs-4" id="kl" style="text-decoration: none">
                    <div class="weui-grid__icon">
                        <img src="../static/images/panan/feedback.png" style="" alt="">
                    </div>
                    <p class="weui-grid__label">周边反馈</p>
                </a>
            </div>
        </div>
        <%--<c:if test="${empty existUser1}">--%>
        <%--<div class="row look">--%>
        <%--<div class="col-xs-12 text-center text-muted">请登录查后看信息!</div>--%>
        <%--</div>--%>
        <%--</c:if>--%>

        <div class="row look">
            <div class="col-xs-12">
                <span class="pull-right"></span>
            </div>
        </div>
        <a href="informationError" style="float:right;color: red;font-size: 13px;text-decoration: none">信息报错&nbsp;&nbsp;&nbsp;</a>
        <%--嵌入地址信息页面--%>
        <%--<iframe name="myframe" id="myframe" src="http://119.23.206.104/zhmp/control/login?name=panan&password=111111"--%>
        <%--?srcid=[YOUR_FILE'S_ID_HERE]&pid=explorer&efh=false&a=v&chrome=false&embedded=true--%><%--拼接参数解决部分页面无法嵌入的问题--%>
        <%--        width="100%" height="100%" frameborder="0"></iframe>--%>
        <%--<embed src="../static/硚口区.svg" width="300" height="100" type="image/svg+xml" pluginspage="http://www.adobe.com/svg/viewer/install/" />--%>
        <p style="width: 100%"><?xml version="1.0" standalone="no"?>
            <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
            "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
        <div class="svg-container">
        <svg width="480" height="300" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
            <g>
                <title>Layer 1</title>
                <polygon fill="rgba(94,193,240,1)" stroke="rgb(155,155,155)" stroke-width="5" fill-opacity="0.1" stroke-opacity="0.9" points="106,16 106,96 226,96 226,16 " class="svg_item" id="element0"/>
                <polygon fill="rgba(94,193,240,1)" stroke="rgb(155,155,155)" stroke-width="5" fill-opacity="0.1" stroke-opacity="0.9" points="226,16 226,96 346,96 346,16 " class="svg_item" id="element1"/>
                <polygon fill="rgba(94,193,240,1)" stroke="rgb(155,155,155)" stroke-width="5" fill-opacity="0.1" stroke-opacity="0.9" points="106,96 106,176 226,176 226,96 " class="svg_item" id="element2"/>
                <polygon fill="rgba(94,193,240,1)" stroke="rgb(155,155,155)" stroke-width="5" fill-opacity="0.1" stroke-opacity="0.9" points="346,16 346,96 466,96 466,16 " class="svg_item" id="element3"/>
                <polygon fill="rgba(94,193,240,1)" stroke="rgb(155,155,155)" stroke-width="5" fill-opacity="0.1" stroke-opacity="0.9" points="346,96 346,176 466,176 466,96 " class="svg_item" id="element4"/>
                <text id="svg_1" fill="black" y="148" x="131" font-family="LiSu " font-size="30" class="element2">1-101</text>
                <text id="svg_2" fill="black" y="68" x="131" font-family="LiSu " font-size="30" class="element0">1-201</text>
                <text id="svg_3" fill="black" y="68" x="251" font-family="LiSu " font-size="30" class="element1">1-202</text>
                <text id="svg_4" fill="black" y="148" x="371" font-family="LiSu " font-size="30" class="element4">2-102</text>
                <text id="svg_5" fill="black" y="68" x="371" font-family="LiSu " font-size="30" class="element3">2-202</text>
                <text id="svg_6" fill="black" y="67" x="13" font-family="LiSu " font-size="30" class="floor_num">2 楼</text>
                <text id="svg_7" fill="black" y="147" x="13" font-family="LiSu " font-size="30" class="floor_num">1 楼</text>
                <path id="svg_8" fill="black" stroke-width="2" d="m123,195l220,0l-220,0z"/>
                <text id="svg_9" fill="black" y="253" x="117" font-family="LiSu " font-size="45" class="floor_num">1 单元</text>
                <path id="svg_10" fill="white" stroke="red" stroke-width="2" d="m363,195l100,0l-100,0z"/>
                <text id="svg_11" fill="black" y="255" x="311" font-family="LiSu " font-size="45" class="floor_num">2 单元</text>
            </g>
        </svg>
        </div>
        "
        </p>
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
    $(function () {
        // $("#fangwu").click(function () {
        // $(".look").fadeToggle(500)
        <%--if (${not empty existUser1}) {--%>
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
        // }
        // });
    })

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


    function showXiangGuan() {
        $(".pageContent").css("display", "none");
        $("#tpl_rcode").css("display", "block");
    }

    var dataX = 120.4507351963;//经度
    var dataY = 29.0596338332;//纬度

    function toMap() {
        window.location.href = "http://api.map.baidu.com/marker?location=" + dataY + "," + dataX + "" +
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

</body>
</html>

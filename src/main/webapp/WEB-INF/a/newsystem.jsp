<%--
    磐安市主页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    //request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path ;
    String userID = (String) session.getAttribute("userID");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>智慧门牌服务管理</title>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="/static/style/example.css"/>
    <%--<script type="text/javascript" src="/static/js/zepto.min.js"></script>--%>
    <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/static/js/common/common.js"></script>
    <script type="text/javascript" src="/static/js/common/Sortable.min.js"></script>
    <script type="text/javascript" src="/static/js/service/bigservice.js"></script>
    <script type="text/javascript" src="/static/js/navigation/navigation.js"></script>
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

        #input {
            /*width: 250px;*/
            height: 25px;
            border: 0;
            background-color: white;
        }
    </style>
</head>
<body ontouchstart>
<div class="page">

    <div class="pageContent" id="tpl_qrcode" style="display:block;">
        <div class="weui-panel weui-panel_access">
            <p style="text-align: center;font-family: 华文隶书;font-size: 22px">群山之祖，诸水之源，大美磐安</p>
        </div>
        <div class="weui-panel weui-panel_access">
            <%--<div class="weui-panel__hd">门牌信息</div>--%>
            <div class="weui-panel__bd" style="float: left">
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb"
                             src="/static/images/menpai/2c1c1576b4fc5268fd89f17288d1b868.gif" alt="">
                    </div>
                    <div class="weui-media-box__bd">
                        <h4 class="weui-media-box__title ">磐安县螺山路13号</h4>
                        <p class="weui-media-box__desc" style="font-size: 10px">管理单位:磐安县螺山路</p>
                    </div>
                </a>

            </div>

        </div>

        <%--地图--%>
        <div class="weui-cells weui-cells_form map" style="height:30%;margin-top: 10px">
            <div class="maps"></div>
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
                            <img src="/static/images/219226629aa.jpg" style="width: 48px;height: 55px"
                                 class="layui-circle">
                        </div>
                    </td>
                    <td style="font-size: 15px">
                        <p class="weui-panel__hd">民警姓名：厉韬</p>
                        <p class="weui-panel__hd">一键报警：<a href="tel:15179788823">15156257489</a></p>
                    </td>
                </tr>
            </table>
        </div>
        <div class="weui-panel weui-panel_access" style="padding-top: 10px">
            <div class="row">

                <a href="javascript:void(0);" id="fangwu" class="col-xs-4">
                    <div class="weui-grid__icon">
                        <img src="/static/images/panan/diming.png" style="" alt="">

                    </div>
                    <p class="weui-grid__label">地名信息</p>
                </a>

                <a href="zhengfufuwu" class="col-xs-4" id="engfu">
                    <div class="weui-grid__icon">
                        <img src="/static/images/zhengfu2.png" style="" alt="">

                    </div>
                    <p class="weui-grid__label">政府服务</p>
                </a>
                <%--<a href="xiangguanlianjie" class="col-xs-3" id="ngguan">--%>
                <%--<div class="weui-grid__icon">--%>
                <%--<img src="/static/images/menpai/xiangguan.png" style="" alt="">--%>
                <%--</div>--%>
                <%--<p class="weui-grid__label">相关连接</p>--%>
                <%--</a>--%>
                <a href="zhoubianfankui" class="col-xs-4" id="kl">
                    <div class="weui-grid__icon">
                        <img src="/static/images/menpai/zhoubian.png" style="" alt="">

                    </div>
                    <p class="weui-grid__label">周边反馈</p>
                </a>


            </div>
        </div>

        <%--农户信息--%>
        <div class="weui-panel weui-panel_access" id="fangwuinfo" style="display: none">
            <div class="weui-form-preview">
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">户主姓名</label>
                        <span class="weui-form-preview__value">${building.name}</span>
                    </div>

                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">联系电话</label>
                        <span class="weui-form-preview__value">${building.phoneNum}</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">建筑年份</label>
                        <span class="weui-form-preview__value">${building.buildingYear}</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">门牌编号</label>
                        <span class="weui-form-preview__value">${building.familyType}</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">家庭类别</label>
                        <c:if test="${building.busiType==1}">
                            <span class="weui-form-preview__value">普通房屋</span>
                        </c:if>
                        <c:if test="${building.busiType==2}">
                            <span class="weui-form-preview__value">农家乐</span>
                        </c:if>
                        <c:if test="${building.busiType==3}">
                            <span class="weui-form-preview__value">民宿</span>
                        </c:if>
                        <c:if test="${building.busiType==4}">
                            <span class="weui-form-preview__value">药农</span>
                        </c:if>
                    </div>
                    <c:if test="${building.busiType==2||building.busiType==3}">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">经营特色</label>
                            <span class="weui-form-preview__value">空气清新，环境放松</span>
                        </div>
                        <c:if test="${building.ifOpen==1}">
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">客房数</label>
                                <span class="weui-form-preview__value">${building.numberOfRoom}</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">床位数</label>
                                <span class="weui-form-preview__value">${building.numberOfBed}</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">餐位数</label>
                                <span class="weui-form-preview__value">${building.mealDigits}</span>
                            </div>
                        </c:if>

                    </c:if>

                    <c:choose>
                        <c:when test="${bfid==1}">
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">建筑面积</label>
                                <span class="weui-form-preview__value">${building.buildArea}</span>
                            </div>

                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">占地面积</label>
                                <span class="weui-form-preview__value">${building.landArea}</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">房屋间数</label>
                                <span class="weui-form-preview__value">${building.roomNum}</span>
                            </div>
                            <div class="weui-form-preview__item">
                                <label class="weui-form-preview__label">家庭人口</label>
                                <span class="weui-form-preview__value">${building.population}</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${building.ifOpen==1}">
                                <div class="weui-form-preview__item">
                                    <label class="weui-form-preview__label">建筑面积</label>
                                    <span class="weui-form-preview__value">${building.buildArea}</span>
                                </div>

                                <div class="weui-form-preview__item">
                                    <label class="weui-form-preview__label">占地面积</label>
                                    <span class="weui-form-preview__value">${building.landArea}</span>
                                </div>
                                <div class="weui-form-preview__item">
                                    <label class="weui-form-preview__label">房屋间数</label>
                                    <span class="weui-form-preview__value">${building.roomNum}</span>
                                </div>
                                <div class="weui-form-preview__item">
                                    <label class="weui-form-preview__label">家庭人口</label>
                                    <span class="weui-form-preview__value">${building.population}</span>
                                </div>
                            </c:if>
                            <c:if test="${building.ifOpen==0}">
                                <div class="weui-form-preview__item">
                                    <label class="weui-form-preview__label">户主未公开信息</label>

                                </div>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>

        <br><br><br><br>

        <c:if test="${empty existUser1}">
            <a href="login" class="btn btn-success btn-block btn-lg">用户登录</a>
        </c:if>
        <c:if test="${not empty existUser1}">
            <a href="loginOut" onclick="loginOut()" class="btn btn-danger btn-block btn-lg">退出登录</a>
        </c:if>
    </div>
</div>

<script src="https://webapi.amap.com/maps?v=1.3&amp;key=0527fc08a6b9ab7a0d2dacdf50ed20d6&callback=init"></script>
<!-- UI组件库 1.0 -->
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script type="text/javascript" src="https://webapi.amap.com/demos/js/liteToolbar.js"></script>
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
        if ($("#fangwuinfo").css("display") == "none") {
            $("#fangwuinfo").show();
        } else {
            $("#fangwuinfo").hide();
        }
    });


    function showXiangGuan() {
        $(".pageContent").css("display", "none");
        $("#tpl_rcode").css("display", "block");

    }

    var dataX;//经度
    var dataY;//纬度

    var marker, map = new AMap.Map('container', {
        center: [120.449058, 29.052711],
        zoom: 17
    });

    map.setFeatures(['road', 'bg', 'point'])//多个种类要素显示


    AMap.plugin('AMap.Geocoder', function () {
        var geocoder = new AMap.Geocoder({
            city: "010"//城市，默认：“全国”
        });
        var marker = new AMap.Marker({
            map: map,
            bubble: true
        })
        map.on('click', function (e) {
            dataX = e.lnglat.lng;
            dataY = e.lnglat.lat;

            marker.setPosition(e.lnglat);
            geocoder.getAddress(e.lnglat, function (status, result) {
                if (status == 'complete') {
                    document.getElementById('input').value = result.regeocode.formattedAddress
                }
            })
        })
    });

    function locationConfirm() {
        alert(dataX);
        alert(dataY);
    }

    function addMarker() {
        if (marker) {
            return;
        }
        marker = new AMap.Marker({
            icon: "<%=basepath%>/static/images/mark_b.png",
            position: [114.356531, 30.5274]
        });
        marker.setMap(map);
    }

    $(document).ready(function () {
        addMarker();


    });

</script>


<script type="text/javascript">
    var basepath = "/static";
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

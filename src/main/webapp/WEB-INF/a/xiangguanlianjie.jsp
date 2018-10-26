<%--
    磐安县的相关链接
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    //request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String userID = (String) session.getAttribute("userID");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>智慧门牌</title>
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


    <%--<div class="pageContent" >--%>
        <%--<div class="weui-cells weui-cells_form">--%>

            <%--<div class="weui-grids" onClick="javascript :history.back(-1);">--%>

                <%--<a href="javascript:void(0);" class="weui-grid">--%>
                    <%--<div class="weui-grid__icon" >--%>
                        <%--<img src="/static/images/fanhui.png" style="" alt="">--%>

                    <%--</div>--%>

                <%--</a>--%>

            <%--</div>--%>
                <%--头部--%>
                <div class="row top">
                    <div class="col-xs-3 heig" onClick="history.back(-1);">

                        <span class="glyphicon glyphicon-arrow-left"></span>
                    </div>
                    <div class="col-xs-6 text-center heig"><b>相关链接</b></div>
                    <div class="col-xs-3 text-center heig" >
                        <%--<c:if test="${not empty existUser}">--%>
                            <%--<a href="pananHouTai">--%>
                                    <%--&lt;%&ndash;<span class="glyphicon glyphicon-cog"></span><br>&ndash;%&gt;--%>
                                <%--后台管理--%>
                            <%--</a>--%>
                        <%--</c:if>--%>
                    </div>
                </div>
        <%--</div>--%>
    <%--</div>--%>




            <div class="weui-cells weui-cells_form">
                <div class="weui-panel weui-panel_access">
                    <div class="weui-panel__hd">磐安便民</div>
                </div>

        <div class="weui-grids">

                <c:forEach items="${allList}" var="systemList">

                    <c:if test="${systemList.ifvalid=='1'&& systemList.deptid==444}">
                        <a href="${systemList.url}" class="weui-grid">
                            <div class="weui-grid__icon" >
                                <img src="${systemList.icon}" style="" alt="">

                            </div>
                             <p class="weui-grid__label">${systemList.showname}</p>
                         </a>
                    </c:if>

                </c:forEach>
        </div>
        </div>




        <%--<div class="pageContent" id="tpl_monitoring" style="display:block;">--%>
            <%--<div class="weui-cells weui-cells_form">--%>
                <%--<div class="weui-panel weui-panel_access">--%>
                    <%--<div class="weui-panel__hd">民政服务</div>--%>
                <%--</div>--%>

                <%--<div class="weui-grids">--%>
                    <%--<a href="javascript:void(0);" class="weui-grid">--%>
                        <%--<div class="weui-grid__icon" >--%>
                            <%--<img src="/static/images/menpai/phone.png" style="" alt="">--%>

                        <%--</div>--%>
                        <%--<p class="weui-grid__label">房主电话</p>--%>
                    <%--</a>--%>
                    <%--<a href="javascript:void(0);" class="weui-grid">--%>
                        <%--<div class="weui-grid__icon" >--%>
                            <%--<img src="/static/images/home.png" style="" alt="">--%>

                        <%--</div>--%>
                        <%--<p class="weui-grid__label">房屋信息</p>--%>
                    <%--</a>--%>
                    <%--<c:forEach items="${allList}" var="systemList">--%>

                        <%--<c:if test="${systemList.ifvalid=='1'&& systemList.deptid==111}">--%>
                            <%--<a href="${systemList.url}" class="weui-grid">--%>
                                <%--<div class="weui-grid__icon" >--%>
                                    <%--<img src="${systemList.icon}" style="" alt="">--%>

                                <%--</div>--%>
                                <%--<p class="weui-grid__label">${systemList.showname}</p>--%>
                            <%--</a>--%>
                        <%--</c:if>--%>

                    <%--</c:forEach>--%>

                <%--</div>--%>
                <%--<div class="weui-panel weui-panel_access">--%>
                    <%--<div class="weui-panel__hd">旅游服务</div>--%>
                <%--</div>--%>
                <%--<div class="weui-grids">--%>
                    <%--<c:forEach items="${allList}" var="policeSystem">--%>
                        <%--<c:if test="${policeSystem.ifvalid=='1'&& policeSystem.deptid==333}">--%>
                            <%--<a href="${policeSystem.url}" class="weui-grid">--%>
                                <%--<div class="weui-grid__icon" >--%>
                                    <%--<img src="${policeSystem.icon}" alt="">--%>
                                <%--</div>--%>
                                <%--<p class="weui-grid__label">${policeSystem.showname}</p>--%>
                            <%--</a>--%>
                        <%--</c:if>--%>

                    <%--</c:forEach>--%>
                <%--</div>--%>


                <%--<div class="weui-panel weui-panel_access">--%>
                    <%--<div class="weui-panel__hd">公安便民</div>--%>
                <%--</div>--%>
                <%--<div class="weui-grids">--%>
                    <%--<c:forEach items="${allList}" var="policeSystem">--%>
                        <%--<c:if test="${policeSystem.ifvalid=='1'&& policeSystem.deptid==222}">--%>
                            <%--<a href="${policeSystem.url}" class="weui-grid">--%>
                                <%--<div class="weui-grid__icon" >--%>
                                    <%--<img src="${policeSystem.icon}" alt="">--%>
                                <%--</div>--%>
                                <%--<p class="weui-grid__label">${policeSystem.showname}</p>--%>
                            <%--</a>--%>
                        <%--</c:if>--%>

                    <%--</c:forEach>--%>
                <%--</div>--%>
            <%--</div>--%>




        <br><br><br><br>

        <c:if test="${empty existUser}">
            <a href="login" class="btn btn-success btn-block btn-lg">用户登录</a>
        </c:if>
        <c:if test="${not empty existUser}">
            <a href="system" class="btn btn-danger btn-block btn-lg">退出登录</a>
        </c:if>
    </div>


</div>




<script src="https://webapi.amap.com/maps?v=1.3&amp;key=0527fc08a6b9ab7a0d2dacdf50ed20d6&callback=init"></script>
<!-- UI组件库 1.0 -->
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script type="text/javascript" src="https://webapi.amap.com/demos/js/liteToolbar.js"></script>
<script>



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

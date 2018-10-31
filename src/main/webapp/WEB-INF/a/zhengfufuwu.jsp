<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
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
    <link rel="stylesheet" type="text/css" href="<%=basepath%>/static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basepath%>/static/style/example.css"/>

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
    <div class="pageContent" style="display:block;">
        <div class="weui-cells weui-cells_form">
            <%--头部--%>
            <div class="row top">
                <div class="col-xs-3 heig" onClick="history.back(-1);">

                    <span class="glyphicon glyphicon-arrow-left"></span>
                </div>
                <div class="col-xs-6 text-center heig"><b>政府服务</b></div>
                <div class="col-xs-3 text-center heig">
                    <c:if test="${not empty existUser1 }">
                        <a href="pananHouTai">
                            后台管理
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <div class="pageContent" id="tpl_qrcode" style="display:block;">
        <div class="pageContent" id="tpl_monitoring" style="display:block;">
            <div class="weui-cells weui-cells_form">
                <c:forEach items="${deptName}" var="deptName">
                    <div class="weui-panel weui-panel_access">
                        <div class="weui-panel__hd">${deptName}</div>
                    </div>
                    <div class="weui-grids">
                        <c:forEach items="${allList}" var="policeSystem">
                            <c:if test="${policeSystem.ifdept=='1'}">
                                <c:if test="${policeSystem.ifvalid=='1'&& policeSystem.name==deptName}">
                                    <a href="${pageContext.request.contextPath}/skip?url=${policeSystem.url}&name=${policeSystem.showname}"
                                       class="weui-grid">
                                        <div class="weui-grid__icon">
                                            <img src="${policeSystem.icon}" alt="">
                                        </div>
                                        <p class="weui-grid__label">${policeSystem.showname}</p>
                                    </a>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
        </div>
        <br><br><br><br>
        <c:if test="${empty existUser1}">
            <a href="login" class="btn btn-success btn-block btn-lg">用户登录</a>
        </c:if>
        <c:if test="${not empty existUser1}">
            <a href="loginOut" class="btn btn-danger btn-block btn-lg">退出登录</a>
        </c:if>
    </div>
</div>
</body>
</html>

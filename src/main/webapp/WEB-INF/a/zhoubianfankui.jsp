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
        .fold{
            max-width: 20em;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis; /*超出部分用...代替*/
        }
    </style>
</head>
<body ontouchstart>
<div class="page">
    <div class="row top">
        <div class="col-xs-3 heig" onClick="history.back(-1);">
            <span class="glyphicon glyphicon-arrow-left"></span>
        </div>
        <div class="col-xs-6 text-center heig"><b>反馈信息</b></div>
        <div class="col-xs-3 text-center heig">
        </div>
    </div>
    <%--周边反馈--%>
    <c:if test="${empty existUser1}">
    <div class="weui-form-preview__ft">
        <a class="weui-form-preview__btn weui-form-preview__btn_primary" style="font-size: 18px"
           href="addFeedbackPage">添加反馈信息</a>
    </div>
    </c:if>

    <c:if test="${not empty existUser1}">
    <div class="page__bd page__bd_spacing">
        <c:forEach items="${feedbacks}" var="feedback" varStatus="s">
            <div class="weui-form-preview">
                <div class="weui-form-preview__hd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">门牌号</label>
                        <em class="weui-form-preview__value" id="houseNumber${s.index}">${feedback.houseNumber}</em>
                    </div>
                </div>
                <div class="weui-form-preview__bd">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">用户名</label>
                        <span class="weui-form-preview__value" id="username${s.index}">${feedback.username}</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">电话</label>
                        <span class="weui-form-preview__value" id="phoneNumber${s.index}">${feedback.phoneNumber}</span>
                    </div>
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">问题描述</label>
                        <span class="weui-form-preview__value fold" id="description${s.index}">${feedback.description}</span>
                    </div>
                </div>
                <div class="weui-form-preview__ft">
                    <a class="weui-form-preview__btn weui-form-preview__btn_primary"
                       onclick="toReply(${s.index})">查看</a>
                </div>
            </div>

            <br>
        </c:forEach>
    </div>
    </c:if>
    <br><br>
    <form id="myForm" action="${pageContext.request.contextPath}/toReply" method="post">
        <%--增加隐藏域实现post跳转到回复反馈页面--%>
        <input type="hidden" name="houseNumber"/>
        <input type="hidden" name="username"/>
        <input type="hidden" name="phoneNumber"/>
        <input type="hidden" name="description"/>
    </form>
</body>

<script type="text/javascript">
    function toReply(index) {
        var houseNumber = $("#houseNumber" + index).text();
        $("input[name='houseNumber']").val(houseNumber);

        var username = $("#username" + index).html();
        $("input[name='username']").val(username);

        var phoneNumber = $("#phoneNumber" + index).html();
        $("input[name='phoneNumber']").val(phoneNumber);

        var description = $("#description" + index).html();
        $("input[name='description']").val(description);

        $("#myForm").submit();
    }
</script>

</html>

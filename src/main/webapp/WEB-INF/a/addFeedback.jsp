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
    <link rel="stylesheet" href="<%=basepath%>/control/plugins/layui/css/check.css" media="all">
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

        #input {
            /*width: 250px;*/
            height: 25px;
            border: 0;
            background-color: white;
        }
        #description{
            width: 100%;
        }
    </style>
</head>
<body ontouchstart>
<div class="page">
    <div class="row top">
        <div class="col-xs-3 heig" onClick="history.back(-1);">
            <span class="glyphicon glyphicon-arrow-left"></span>
        </div>
        <div class="col-xs-6 text-center heig"><b>添加反馈信息</b></div>
        <div class="col-xs-3 text-center heig">
        </div>
    </div>
    <div class="page__bd page__bd_spacing">
        <br>
        <div class="weui-form-preview">
            <div class="weui-form-preview__hd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">地址</label>
                    <em class="weui-form-preview__value" id="houseNumber">丹溪路37号</em>
                </div>
            </div>
            <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">用户名</label>
                    <span class="weui-form-preview__value" id="username">刘三</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">电话</label>
                    <span class="weui-form-preview__value" id="phoneNumber">13723452345</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">问题类别</label>
                    <span class="weui-form-preview__value">
                        <select id="deptid" style="line-height: 20px">
                            <option value="">请选择问题类型</option>
                            <c:forEach items="${departmentList}" var="department">
                                <option value="${department.deptid}">${department.name}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label" style="text-align: center">问题描述</label>
                </div>
                <textarea class="wishContent" id="description" rows="10" cols="39" style="resize:none;color: #333" maxlength="400"
                          placeholder="请输入反馈信息(400字以内)" oninput="checkDescription()"></textarea>
                <span id="wordsNum">还可以输入400字</span>
            </div>

                <a class="btn btn-success btn-block btn-lg" href="javascript:"
                   onclick="submitForm()">提交</a>

        </div>
        <br>
        <br><br><br><br><br><br>
    </div>

    <br><br><br><br>
</div>
<%--提示层--%>
<div id="box">
    <div class="con">
        <p id="txt">${error}</p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>
<script>
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $(".weui-form-preview__item").css({"color": "#333"});
        $(".weui-form-preview__label").css({"color": "#333"});

    })

    function checkDescription(){
        var description = $("#description").val();
        var dLength=description.length;
        if (dLength<400) {
            var i=400-dLength;
            $("#wordsNum").html("还可以输入"+i+"字")
        }else{
            $("#txt").text("问题描述不能超过400字");
            $("#box").show(500);
        }


    }
    function submitForm() {
        var houseNumber = $("#houseNumber").html();
        var username = $("#username").html();
        var phoneNumber = $("#phoneNumber").html();
        var deptid = $("#deptid").val();
        var description = $("#description").val();
        if (deptid.length==""){
            $("#txt").text("请选择问题类别");
            $("#box").show(500);
            return;
        }
        if ($.trim(description).length==0){
            $("#txt").text("问题描述不能为空");
            $("#box").show(500);
            return;
        }

        var data={
            "houseNumber":houseNumber,
            "username":username,
            "phoneNumber":phoneNumber,
            "deptId":deptid,
            "description":description
        };

        var url="${pageContext.request.contextPath}/addFeedback";
        $.post(url,data,function (data) {
            var data1=eval("("+data+")");
            //alert(data1.msg);
            $("#box").show(500);
            $("#txt").text(data1.msg);
        })
    }
    function ifhide() {
        $("#box").hide(500);
    }
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>智慧门牌后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/control/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="./plugins/layui/css/check.css" media="all">
    <script src="./plugins/layui/layui.js"></script>
    <script src="../static/js/jquery-1.10.2.min.js"></script>
</head>
<script src="<%=basePath%>/control/plugins/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form'], function () {
        var form = layui.form
            , layer = layui.layer

        //自定义验证规则
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        // form.on('submit(demo1)', function (data) {
        //     layer.alert(JSON.stringify(data.field), {
        //         title: '最终的提交信息'
        //     })
        //     return false;
        // });
    });
</script>
<body>
<div style="width: 350px;margin: 0 auto;margin-top:200px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>智慧门牌系统登录</legend>
    </fieldset>
    <form class="layui-form" id="myForm" action="${pageContext.request.contextPath}/control/login" method="post" onsubmit="return false">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input"
                       value="${name}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off"
                       class="layui-input" value="${password}">
            </div>
            <%--<div class="layui-form-mid layui-word-aux"></div>--%>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="checkCode" id="checkCode"
                       placeholder="请输入验证码" autocomplete="off" lay-verify="required"
                       class="layui-input">
                <br>
                <img src="${pageContext.request.contextPath}/checkCode" height="30" width="80"
                     onclick="this.src='${pageContext.request.contextPath}/checkCode?d='+new Date()" class="code"
                     alt="换一张"/><a href="javascript:void(0);"
                                   onclick="$('.code').attr('src','${pageContext.request.contextPath}/checkCode?d='+new Date())"
                                   title="换一张"> 换一张</a>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="doSubmit()">登录</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<%--提示层--%>
<div id="box">
    <div class="con">
        <p id="txt">${error}</p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>
<script>

    function doSubmit() {
        var checkCode = $("#checkCode").val();
        if (checkCode.length !== 0) {
            $("#myForm").removeAttr("onSubmit");
            $("#myForm").attr("onSubmit", "return true");
        }else{
            $("#myForm").attr("onSubmit", "return false");
        }
    }

    //window.onload = function () {
    var msg = '${error}';
    if (msg.length > 0) {
        console.log(msg)
        $("#box").show(500)
    }

    //};
    function ifhide() {
        $("#box").hide(500)
    }

</script>
</body>
</html>
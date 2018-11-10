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
    <title>智慧门牌</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/control/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>/control/plugins/layui/css/check.css" media="all">
    <script src="../control/plugins/layui/layui.js"></script>
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
        <legend>修改密码</legend>
    </fieldset>
    <form class="layui-form" action="${pageContext.request.contextPath}/updatePassword" method="post" onsubmit="return false">
        <div class="layui-form-item">
            <label class="layui-form-label">输入新密码</label>
            <div class="layui-input-inline">
                <input type="password" id="newPassword" name="newPassword" lay-verify="pass" autocomplete="off" class="layui-input"
                       value="${newPassword}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">请再次输入</label>
            <div class="layui-input-inline">
                <input type="password" name="reNewPassword" id="reNewPassword" onblur="checkPassword()"
                       lay-verify="required" placeholder="请确认密码" autocomplete="off"
                       class="layui-input" value="${reNewPassword}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="checkCode" id="checkCode" placeholder="请输入验证码"
                       autocomplete="off" lay-verify="required" class="layui-input">
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
                <button class="layui-btn" onclick="checkPassword()" lay-submit="" lay-filter="demo1">修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<%--提示层--%>
<div id="box">
    <div class="con">
        <p id="txt">${msg}</p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>
<script>

    var msg = '${msg}';
    if (msg.length > 0) {
        console.log(msg)
        $("#box").show(500)
    }

    //};
    function ifhide() {
        $("#box").hide(500)
    }

    function checkPassword() {
        var newPassword = $("#newPassword").val();
        var reNewPassword = $("#reNewPassword").val();
        var checkCode = $("#checkCode").val();
        if (checkCode.length===0){
            return;
        }
        if (newPassword !== reNewPassword) {
            $("#txt").html("两次密码不一致,请重新新输入");
            $("#box").show(500);
            $(".layui-form").attr("onsubmit","return false");
        }else{
            $(".layui-form").removeAttr("onsubmit")
        }
    }

</script>
</body>
</html>
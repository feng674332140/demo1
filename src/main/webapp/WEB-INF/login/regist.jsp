<%--
  Created by IntelliJ IDEA.
  User: shenbiao
  Date: 2017/3/1
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="../static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/example.css"/>
    <link rel="stylesheet" href="<%=basepath%>/control/plugins/layui/css/check.css" media="all">
    <script type="text/javascript" src="../static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../static/js/user/user.js"></script>
    <script type="text/javascript">
        var msg = '${error}';
        if (msg.length > 0) {
            console.log(msg)
            $("#box").show(500)
        }

        function ifhide() {
            $("#box").hide(500)
        }

        //对比两次密码是否一致
        function comparedPassword() {
            var password = $("#password").val();
            var rePassword = $("#rePassword").val();
            if ($.trim(rePassword).length === 0) {
                $("#txt").text("请再次输入密码");
                $("#box").show();
                return false;
            } else if (!($.trim(password) === $.trim(rePassword))) {
                $("#txt").text("两次密码输入不一致");
                $("#box").show();
                return false;
            }
        }

        //验证密码是否符合规则
        function passwordRule() {
            var password = $("#password").val();
            if ($.trim(password).length < 6 || $.trim(password).length > 16 || $.trim(password).length === 0) {
                $("#txt").text("请输入6到16位密码");
                $("#box").show();
                return false;
            } else if (!(/(?![0-9]+$)[0-9A-Za-z]/).test($.trim(password))) {
                $("#txt").text("请输入字母加数字组合的密码");
                $("#box").show();
                return false;
            }
        }

        $(function () {
            $("#password").blur(function () {
                passwordRule();//验证密码是否符合规范
            });

            $("#rePassword").blur(function () {
                comparedPassword();//判断两次密码是否一致
            })
        });

        function getCheckCode() {
            var username = $("#username").val();
            if ($.trim(username).length === 0) {
                $("#txt").text("请输入手机号");
                $("#box").show();
                return;
            }

            if (!(/0?(13|14|15|17|18|19)[0-9]{9}/).test($.trim(username))) {
                $("#txt").text("请输入正确的手机号")
                $("#box").show();
                return;
            }

            //请求发送验证码
            $.post("url", function (data) {
                if (true) {
                }
            })
        }
    </script>
</head>
<style>
    .check-button {
        height: 27px;
        width: 80px;
    }
</style>
<body ontouchstart>
<!--错误提示-->

<!--用户注册-->
<div class="page__bd">
    <div class="weui-cells weui-cells_form">
        <!--手机号-->
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">手机号</label>
            </div>
            <div class="weui-cell__bd">
                <%--手机号作为用户名,数据库中字段为username--%>
                <input class="weui-input" type="tel" name="username" id="username" placeholder="请输入手机号"/>
            </div>
            <button class="check-button" onclick="getCheckCode()">获取验证码</button>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">验证码</label>
            </div>
            <div class="weui-cell__bd">
                <%--手机号作为用户名,数据库中字段为username--%>
                <input class="weui-input" type="text" name="checkCode" placeholder="验证码" id="checkCode"/>
            </div>
        </div>
        <!--密码-->
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="password" placeholder="请输入密码" name="password" id="password"/>
            </div>
        </div>
        <!--确认密码-->
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="password" name="rePassword" placeholder="请再次输入密码" id="rePassword"/>
            </div>
        </div>
    </div>

    <!--确认提交注册信息-->
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" onclick="userRegistConfirm()">注册</a>
    </div>
</div>

<div id="box">
    <div class="con">
        <p id="txt">${error}</p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>

<!--相关条款-->
<div class="page__ft j_bottom">
    <label for="weuiAgree" class="weui-agree">
        <input id="weuiAgree" type="checkbox" class="weui-agree__checkbox" checked="checked">
        <span class="weui-agree__text">
                阅读并同意<a href="javascript:void(0);">《相关条款》</a>
            </span>
    </label>
</div>


</body>
</html>

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
  <link rel="stylesheet" type="text/css" href="/static/style/weui.css"/>
  <link rel="stylesheet" type="text/css" href="/static/style/example.css"/>
  <script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="/static/js/user/user.js"></script>
</head>
<body ontouchstart>
<!--错误提示-->
<div class="weui-toptips weui-toptips_warn "id="js_tooltips">错误提示</div>

<!--用户注册-->
<div class="page__bd">
  <div class="weui-cells weui-cells_form">
    <!--行政区划-->
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">行政区划</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="text" placeholder="请选择行政区划" id="district" />
      </div>
    </div>
    <!--部门名称-->
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">部门名称</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="text" placeholder="请选择部门名称" id="department" />
      </div>
    </div>
    <!--姓名-->
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">姓名</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="text" placeholder="请输入姓名" id="userName" />
      </div>
    </div>
    <!--手机号-->
    <div class="weui-cell">
      <div class="weui-cell__hd">
        <label class="weui-label">手机号</label>
      </div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="tel" placeholder="请输入手机号" id="userPhone"/>
      </div>
    </div>
    <!--密码-->
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="password" placeholder="请输入密码"id="userPassword"/>
      </div>
    </div>
    <!--确认密码-->
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
      <div class="weui-cell__bd">
        <input class="weui-input" type="password" placeholder="请再次输入密码"id="userPasswordAgain"/>
      </div>
    </div>
  </div>

  <!--确认提交注册信息-->
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="javascript:" onclick="userRegistConfirm()">确定</a>
  </div>

  <div id="dialogs">
  <!--BEGIN dialog2-->
  <div class="js_dialog" id="iosDialog2" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
      <div class="weui-dialog__bd">该功能正在开发中</div>
      <div class="weui-dialog__ft">
        <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">知道了</a>
      </div>
    </div>
  </div>
  <!--END dialog2-->
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

<script>
  var basepath="/static";
</script>

</body>
</html>

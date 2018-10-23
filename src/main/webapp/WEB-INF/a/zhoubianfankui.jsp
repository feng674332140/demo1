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
    <title>智慧门牌服务管理</title>
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
    <div class="row top">
        <div class="col-xs-3 heig" onClick="history.back(-1);">
            <span class="glyphicon glyphicon-arrow-left"></span>
        </div>
        <div class="col-xs-6 text-center heig"><b>周边反馈</b></div>
        <div class="col-xs-3 text-center heig">
        </div>
    </div>
    <%--周边反馈--%>
    <c:if test="${not empty existUser1}">
        <div class="weui-form-preview__ft">
            <a class="weui-form-preview__btn weui-form-preview__btn_primary" style="font-size: 18px" href="javascript:">反馈信息</a>
        </div>
    </c:if>
    <div class="page__bd page__bd_spacing">
        <br>
        <div class="weui-form-preview">
            <div class="weui-form-preview__hd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">门牌号</label>
                    <em class="weui-form-preview__value">丹溪路37号</em>
                </div>
            </div>
            <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">用户名</label>
                    <span class="weui-form-preview__value">刘三</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">电话</label>
                    <span class="weui-form-preview__value">13723452345</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">问题描述</label>
                    <span class="weui-form-preview__value">这里的门牌已经遭受无损，请求修复</span>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
            </div>
        </div>
        <br>

        <div class="weui-form-preview">
            <div class="weui-form-preview__hd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">门牌号</label>
                    <em class="weui-form-preview__value">八一南街102号</em>
                </div>
            </div>
            <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">用户名</label>
                    <span class="weui-form-preview__value">沈四</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">电话</label>
                    <span class="weui-form-preview__value">13732143211</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">问题描述</label>
                    <span class="weui-form-preview__value">希望加上一键报警功能</span>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
            </div>
        </div>
        <br>

        <div class="weui-form-preview">
            <div class="weui-form-preview__hd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">门牌号</label>
                    <em class="weui-form-preview__value">螺狮南路44号</em>
                </div>
            </div>
            <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">用户名</label>
                    <span class="weui-form-preview__value">张六</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">电话</label>
                    <span class="weui-form-preview__value">13780982345</span>
                </div>
                <div class="weui-form-preview__item">
                    <label class="weui-form-preview__label">问题描述</label>
                    <span class="weui-form-preview__value">希望加上附近旅游推荐的功能</span>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">操作</a>
            </div>
        </div>
        <br><br><br><br><br><br>
    </div>


    <br><br><br><br>

    <c:if test="${empty existUser1}">
        <a href="login" class="btn btn-success btn-block btn-lg">用户登录</a>
    </c:if>
    <c:if test="${not empty existUser1}">
        <a href="loginOut" class="btn btn-danger btn-block btn-lg">退出登录</a>
    </c:if>


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

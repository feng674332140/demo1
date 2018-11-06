    <%--
            手机端后台
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
        <link rel="stylesheet" type="text/css" href="../static/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="../static/style/weui.css"/>
        <link rel="stylesheet" type="text/css" href="../static/style/example.css"/>
        <%--<script type="text/javascript" src="/static/js/zepto.min.js"></script>--%>
        <script type="text/javascript" src="../static/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="../static/js/common/common.js"></script>
        <script type="text/javascript" src="../static/js/common/Sortable.min.js"></script>
        <script type="text/javascript" src="../static/js/service/bigservice.js"></script>
        <script type="text/javascript" src="../static/js/navigation/navigation.js"></script>
        </head>
        <body ontouchstart>
        <div class="page">
        <div class="row top">
        <div class="col-xs-3 heig" onClick="history.back(-1);">

        <span class="glyphicon glyphicon-arrow-left"></span>
        </div>
        <div class="col-xs-6 text-center heig"><b>后台管理</b></div>
        <div class="col-xs-3 text-center heig" >
        <c:if test="${not empty existUser1}">
            <a href="system">
            返回首页
            </a>
        </c:if>
        </div>
        </div>
        <div class="pageContent" id="tpl_qrcode" style="display:block;">


        <div class="" style="height: 30px;padding-top: 0px;padding-bottom: 40px;">
        <ul id="ashbin" style="display: none">
        <li>
        <div class="weui-flex">
        <p class="weui-flex__item"></p>
        <img src="../static/images/icon_delete.png" alt="">
        </div>
        </li>
        </ul>
        </div>
        <div class="page__bd page__bd_spacing">

        <ul id="originBigService">
        <c:if test="${sessionScope.deptid==222}">
            <li id="bigService_li_1">
            <div class="weui-flex js_category">
            <p class="weui-flex__item pressToDelete" id="bigService_p_1">公安便民</p>
            <img class="glyphicon-move" src="../static/images/icon_nav_form.png" alt="">
            </div>
            <div class="page__category js_categoryInner">
            <div class="weui-grids page__category-content">

            <c:forEach items="${policeSystem}" var="systemList">
                <c:if test="${systemList.deptid==222}">
                    <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" >
                    <img src="${systemList.icon}" style="position:absolute; z-index:1; width: 28px; height: 28px"
                    alt="">
                    <c:if test="${systemList.ifvalid=='0'}">
                        <img src="../static/images/jinzhi3.png" style="position:absolute; z-index:2;width: 28px; height:
                        28px">
                    </c:if>
                    </div>
                    <p class="weui-grid__label">${systemList.showname}</p>
                    </a>
                </c:if>

            </c:forEach>

            <a href="addPoliceVie" class="weui-grid">
            <div class="weui-grid__icon">
            <img src="../static/images/plus_32px_581648_easyicon.net.png" alt="">
            </div>
            <p class="weui-grid__label">开启子服务</p>
            </a>
            <a href="newPoliceVie" class="weui-grid">
            <div class="weui-grid__icon">
            <img src="../static/images/plus_32px_581648_easyicon.net.png" alt="">
            </div>
            <p class="weui-grid__label">新增子服务</p>
            </a>
            <a href="deletePoliceVie" class="weui-grid">
            <div class="weui-grid__icon">
            <img src="../static/images/icon_delete.png" alt="">
            </div>
            <p class="weui-grid__label">禁用子服务</p>
            </a>

            </div>
            </div>
            </li>
        </c:if>

        <c:if test="${sessionScope.deptid==111}">
            <li id="bigService_li_2">
            <div class="weui-flex js_category">
            <p class="weui-flex__item pressToDelete" id="bigService_2">民政服务</p>
            <img class="glyphicon-move" src="../static/images/icon_nav_form.png" alt="">
            </div>
            <div class="page__category js_categoryInner">
            <div class="weui-grids page__category-content">

            <c:forEach items="${systemList}" var="systemList">
                <c:if test="${systemList.deptid==111}">
                    <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" >
                    <img src="${systemList.icon}" style="position:absolute; z-index:1; width: 28px; height: 28px">
                    <c:if test="${systemList.ifvalid=='0'}">
                        <img src="../static/images/jinzhi3.png" style="position:absolute; z-index:2;width: 28px; height:
                        28px">
                    </c:if>
                    </div>
                    <p class="weui-grid__label">${systemList.showname}</p>
                    </a>
                </c:if>

            </c:forEach>

            <a href="addOrgmicroserviceVie" class="weui-grid">
            <div class="weui-grid__icon">
            <img src="../static/images/plus_32px_581648_easyicon.net.png" alt="">
            </div>
            <p class="weui-grid__label">开启子服务</p>
            </a>
            <a href="newPoliceVie" class="weui-grid">
            <div class="weui-grid__icon">
            <img src="../static/images/plus_32px_581648_easyicon.net.png" alt="">
            </div>
            <p class="weui-grid__label">新增子服务</p>
            </a>
            <a href="deleteOrgmicroserviceVie" class="weui-grid">
            <div class="weui-grid__icon">
            <img src="../static/images/icon_delete.png" alt="">
            </div>
            <p class="weui-grid__label">禁用子服务</p>
            </a>
            </div>
            </div>
            </li>
        </c:if>

       <%-- <li id="bigService_li_3">
        <div class="weui-flex js_category">
        <p class="weui-flex__item pressToDelete" id="bigService_3">旅游服务</p>
        <img class="glyphicon-move" src="../static/images/icon_nav_form.png" alt="">
        </div>
        <div class="page__category js_categoryInner">
        <div class="weui-grids page__category-content">
        <a href="javascript:;" class="weui-grid">
        <div class="weui-grid__icon">
        <img src="../static/images/icon_tabbar.png" alt="">
        </div>
        <p class="weui-grid__label">附近景点</p>
        </a>
        <a href="javascript:;" class="weui-grid">
        <div class="weui-grid__icon">
        <img src="../static/images/icon_tabbar.png" alt="">
        </div>
        <p class="weui-grid__label">附近特色</p>
        </a>
        <a href="javascript:;" class="weui-grid">
        <div class="weui-grid__icon">
        <img src="../static/images/plus_32px_581648_easyicon.net.png" alt="">
        </div>
        <p class="weui-grid__label">添加子服务</p>
        </a>
        </div>
        </div>
        </li>--%>
        </ul>
        <br><br><br><br><br>
        <%--<a href="javascript:addBigService();" class="weui-btn weui-btn_primary">添加新大类服务</a>--%>
        <br>
        </div>
        </div>


        <div class="pageContent" id="tpl_monitoring" style="display:none;">
        <div class="weui-msg">
        <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
        <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">服务监控</h2>

        <p class="weui-msg__desc">服务监控，可根据实际需要安排，从老百姓使用服务的类型，时间，次数来为政府部门提供服务辅助<a
        href="javascript:void(0);">文字链接</a></p>
        </div>
        <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
        <a href="javascript:history.back();" class="weui-btn weui-btn_primary">服务使用情况</a>
        <a href="javascript:history.back();" class="weui-btn weui-btn_default">智慧辅助分析</a>
        </p>
        </div>
        </div>
        </div>
        <div class="pageContent" id="tpl_feedback" style="display:none;">
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
        </div>
        <div class="pageContent" id="tpl_dialogs">
        <div id="dialogs">
        <!--BEGIN dialog1-->
        <div class="js_dialog" id="iosDialog1" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title" id="iosDialog1_title">弹窗标题</strong></div>
        <div class="weui-dialog__bd" id="iosDialog1_content">弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内</div>
        <div class="weui-dialog__ft">
        <a class="weui-dialog__btn weui-dialog__btn_default" >取消</a>
        <a class="weui-dialog__btn weui-dialog__btn_primary" id="iosDialog1_myfunction">确认</a>
        </div>
        </div>
        </div>
        <!--END dialog1-->
        <!--BEGIN dialog1-->
        <div class="js_dialog" id="iosDialog_input" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title" id="iosDialog_input_title">弹窗标题</strong></div>
        <div class="weui-dialog__bd"><input type="text" class="weui-input" placeholder=""
        id="iosDialog_input_content"></div>
        <div class="weui-dialog__ft">
        <a class="weui-dialog__btn weui-dialog__btn_default" >取消</a>
        <a class="weui-dialog__btn weui-dialog__btn_primary" id="iosDialog_input_myfunction">确认</a>
        </div>
        </div>
        </div>
        <!--END dialog1-->
        </div>
        </div>
        </div>


        <!--导航页面-->

        <!--导航-->

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

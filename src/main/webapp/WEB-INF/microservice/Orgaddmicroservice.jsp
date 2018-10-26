<%--
  Created by IntelliJ IDEA.
  User: shenbiao
  Date: 2017/3/1
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>智慧门牌</title>
    <link rel="stylesheet" type="text/css" href="/static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="/static/style/example.css"/>
    <link rel="stylesheet" href="<%=basepath%>/control/plugins/layui/css/check.css" media="all">
    <%--<script type="text/javascript" src="/static/js/zepto.min.js"></script>--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/static/js/common/common.js"></script>
    <script type="text/javascript" src="/static/js/service/microservice.js"></script>
    <script type="text/javascript" src="/static/js/common/Sortable.min.js"></script>
</head>
<body ontouchstart>
<div class="page">
    <div class="page__hd" style="height: 30px;padding-top: 0px;padding-bottom: 40px;">
        <div class="weui-navbar">
            <div class="weui-navbar__item" onClick="javascript :history.back(-1);">
                返回
            </div>

            <div class="weui-navbar__item" id="en"  >
                 确认修改
            </div>

        </div>
    </div>
    <div class="page__bd page__bd_spacing">
        <div class="weui-grids" id="originMicroservice">
            <c:forEach items="${systemList}" var="systemList">
                <c:if test="${systemList.ifvalid=='0'}">
                    <a href="javascript:;" class="weui-grid" id="${systemList.showname}">
                        <div class="weui-grid__icon" >
                            <img src="${systemList.icon}" alt="">
                        </div>
                        <p class="weui-grid__label">${systemList.showname}</p>
                    </a>
                </c:if>
        </c:forEach>



        </div>
        <br><br><br><br><br><br>
        <ul class="weui-footer_fixed-bottom">
            <li>
                <div class="weui-flex js_category">
                    <p class="weui-flex__item pressToDelete" id="bigService_p_1">已选择的微服务</p>
                    <img class="glyphicon-move" src="/static/images/icon_nav_form.png" alt="">
                </div>
                <div class="page__category js_categoryInner">
                    <div class="weui-grids" id="allMicroservice">


                    </div>
                </div>
                </li>
            </ul>
    </div>
</div>
<%--提示层--%>
<div id="box">
    <div class="con">
        <p id="txt"></p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>
<script type="text/javascript">
    var basepath = "/static";
    /**
     * 开始自动加载find
     */
    $(document).ready(function () {
        //显示/隐藏子节点
        showInnerContent();
    })
</script>
<script type="text/javascript">
   $(function () {
       $("#en").click(function () {
           var link=$("#allMicroservice a");
           var link_Id=[];
           //alert(link);

           for (var i=0;i<link.length;i++){
               link_Id.push($(link[i]).attr('id'));
              // alert(link_Id);
           }

           $.ajax({
               url:"addOrgmicroservice",
               type:"POST",
               dataType:"json",
               data:{
                   link_id:JSON.stringify(link_Id)
               },
               success:function(data){
                  // console.log(data);
                   if (data){
                       //alert("添加成功")
                       $("#box").fadeIn(500)
                       $("#txt").text("添加成功")

                   }
               }
           })



       })
   })
   function ifhide() {
       $("#box").fadeOut(500)
       window.location.href="systemnavigation";
   }
</script>
</body>
</html>

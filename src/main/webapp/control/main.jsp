<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String userID = (String) session.getAttribute("userID");
%>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="./plugins/layui/css/layui.css" media="all">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>

    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <style type="text/css">
        html,
        body,
        #container {
            width: 100%;
            height: 800px;
        }
    </style>
</head>
<body>
<div id="container"></div>
<script src="https://webapi.amap.com/maps?v=1.4.10&key=1b1a76a550012e4b2f82c7a08569b4ea"></script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script>
    var map = new AMap.Map('container', {
        resizeEnable: true, //是否监控地图容器尺寸变化
        // zoom:11, //初始化地图层级
        // center: [120.450004,29.054551] //初始化地图中心点
    });
    map.on("complete", function () {

        log.success("地图加载完成！");
    });
</script>
</body>

</html>
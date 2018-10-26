<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String xingqudian= request.getParameter("xingqudian");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>关键字检索</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <style type="text/css">
        #panel {
            position: absolute;
            background-color: white;
            max-height: 90%;
            overflow-y: auto;
            top: 10px;
            right: 10px;
            width: 280px;
        }
    </style>
    <script src="https://webapi.amap.com/maps?v=1.3&amp;key=0527fc08a6b9ab7a0d2dacdf50ed20d6&callback=init"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>
<body>
<div id="container"></div>
<div id="panel"></div>
<script type="text/javascript">
    var map = new AMap.Map("container", {
        resizeEnable: true
    });
    AMap.service(["AMap.PlaceSearch"], function() {
        var placeSearch = new AMap.PlaceSearch({ //构造地点查询类
            pageSize: 3,
            map: map,
            city: "0579", //城市
            panel: "panel"
        });
        //关键字查询120.73224,29.22603
        var xingqudian=<%=xingqudian%>;
        var searchParam="";
        if(xingqudian==1){
            searchParam="农家乐";
        }else if(xingqudian==2){
            searchParam="景点";
        }else if(xingqudian==3){
            searchParam="酒店";
        }else if(xingqudian==4){
            searchParam="药店";
        }
//        var cpoint = new AMap.LngLat(120.73224,29.22603); //搜索查询的中心点设置
        placeSearch.search(searchParam);
    });
</script>
</body>
</body>
</html>
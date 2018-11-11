<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>智慧门牌</title>
    <link rel="stylesheet" href="../control/plugins/layui/css/layui.css" media="all">
</head>

<body>

<table class="layui-table"
       lay-data="{height:315, url:'${pageContext.request.contextPath}/allDisUser', id:'test',height: 'full-25'}"
       lay-filter="test" id="test">
    <thead>
    <tr>
        <th lay-data="{field:'rowNo', width:80, sort: true}">序号</th>
        <th lay-data="{field:'username', width:110}">用户名</th>
        <th lay-data="{field:'name', width:100}">区域</th>
        <th lay-data="{field:'priviligeTime', width:180}">账号创建时间</th>
        <th lay-data="{field:'ifValid', width:120}">账号是否有效</th>
        <th lay-data="{field:'memo', width:120}">所属等级</th>
    </tr>

    </thead>
</table>

<script src="../control/plugins/layui/layui.js"></script>
<script>
    layui.use('table', function () {
        var table = layui.table;
    });
    window.onload = function () {
        var a = document.getElementsByClassName("laytable-cell-1-ifValid")
        if (a.innerText == 1) {
            a.innerText = "有效"
        } else {
            a.innerText = "无效"
        }
    }

</script>
</body>

</html>
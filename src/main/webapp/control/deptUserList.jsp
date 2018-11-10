<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>智慧门牌</title>
    <link rel="stylesheet" href="../control/plugins/layui/css/layui.css" media="all">
</head>

<body>

<table class="layui-table" lay-data="{height:315, url:'${pageContext.request.contextPath}/allDeptUser',  id:'test',height: 'full-25'}"
       lay-filter="test" id="test">
    <thead>
    <tr>
        <th lay-data="{field:'rowNo', width:80, sort: true}">序号</th>
        <th lay-data="{field:'username', width:140}">用户名</th>
        <th lay-data="{field:'deptname', width:100}">部门</th>
        <th lay-data="{field:'priviligetime', width:180}">账号创建时间</th>
        <th lay-data="{field:'ifvalid', width:120}">账号是否有效</th>
    </tr>

    </thead>
</table>

<script src="../control/plugins/layui/layui.js"></script>
<script>
    layui.use('table', function () {
        var table = layui.table;
    });
</script>
</body>

</html>
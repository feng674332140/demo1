<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>智慧门牌</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./plugins/layui/css/layui.css" media="all">
    <script type="text/javascript" src="../static/js/jquery-1.10.2.min.js"></script>
    <style>
        .txt2 {
            width: 1000px;
            line-height: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            height: 115px;
        }
        .txt3{
            display: inline-block;
            vertical-align: middle;
        }
    </style>
</head>

<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>当前行政区介绍</legend>
</fieldset>
<div class="layui-form-item layui-form-text" style="width: 1000px;">
    <label class="layui-form-label " style="line-height: 100px;padding:0" ><span class="txt3">宣传标语</span></label>
    <div class="layui-input-block">
        <p class="txt2" id="name"></p>
    </div>
</div>
<div class="layui-form-item layui-form-text" style="width: 1000px;">
    <label class="layui-form-label " style="line-height: 100px;padding:0" ><span class="txt3">总体介绍</span></label>
    <div class="layui-input-block">
        <p class="txt2" id="introduction"></p>
    </div>
</div>

<div class="layui-form-item layui-form-text" style="width: 1000px;">
    <label class="layui-form-label" style="line-height: 100px;padding:0"><span class="txt3">交通状况</span></label>
    <div class="layui-input-block">
        <p class="txt2" id="traffic"></p>
    </div>
</div>
<div class="layui-form-item layui-form-text" style="width: 1000px;">
    <label class="layui-form-label" style="line-height: 100px;padding:0"><span class="txt3">旅游介绍</span></label>
    <div class="layui-input-block">
        <p class="txt2" id="travel"></p>
    </div>
</div>
<div class="layui-form-item layui-form-text" style="width: 1000px;">
    <label class="layui-form-label" style="line-height: 100px;padding:0"><span class="txt3">名胜古迹</span></label>
    <div class="layui-input-block">
        <p class="txt2" id="memo"></p>
    </div>
</div>

<div class="layui-form-item">
    <div class="layui-input-block" id="divID">
        <%--<button class="layui-btn" lay-filter="demo1" onclick="toadd()" id="buttonId"></button>--%>
    </div>
</div>

<script src="./plugins/layui/layui.js"></script>
<script>
    $(function () {
        $.post("${pageContext.request.contextPath}/xianquData", function (data) {
            var i = eval("(" + data + ")");
            if (i.cdistrict != null) {
                $("#divID").html("<button class=\"layui-btn\" lay-filter=\"demo1\" onclick=\"toadd()\" id=\"buttonId\">修改</button>");
                $("#name").html(i.cdistrict.name);
                $("#introduction").html(i.cdistrict.introduction);
                $("#traffic").html(i.cdistrict.traffic);
                $("#travel").html(i.cdistrict.travel);
                $("#memo").html(i.cdistrict.memo);
            } else {
                $("#divID").html("<button class=\"layui-btn\" lay-filter=\"demo1\" onclick=\"toadd()\" id=\"buttonId\">添加</button>");
            }
        })
    })

    function toadd() {
        location.href = "${pageContext.request.contextPath}/control/formUpadteXianqu"
    }
</script>

</body>

</html>
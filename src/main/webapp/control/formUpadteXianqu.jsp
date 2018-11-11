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
    <link rel="stylesheet" href="../control/plugins/layui/css/check.css" media="all">
    <script type="text/javascript" src="../static/js/jquery-1.10.2.min.js"></script>
</head>
<style>
    .txt3 {
        display: inline-block;
        vertical-align: middle;
    }
    .textarea1{
        resize: none;
    }
</style>

<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>当前行政区介绍</legend>
</fieldset>

<form class="layui-form" id="mytable" method="post" action="${pageContext.request.contextPath}/control/uptadeCdisture">
    <div class="layui-form-item layui-form-text" style="width: 1200px;">
        <label class="layui-form-label" style="line-height: 6"><span class="txt3">总体介绍</span></label>
        <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="introduction" class="layui-textarea textarea1" required>${cdistrict.introduction}</textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text" style="width: 1200px;">
        <label class="layui-form-label" style="line-height: 6"><span class="txt3">交通状况</span></label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" name="traffic" class="layui-textarea textarea1" required>${cdistrict.traffic}</textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text" style="width: 1200px;">
        <label class="layui-form-label" style="line-height: 6"><span class="txt3">旅游介绍</span></label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" name="travel" class="layui-textarea textarea1" required>${cdistrict.travel}</textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text" style="width: 1200px;">
        <label class="layui-form-label" style="line-height: 6"><span class="txt3">名胜古迹</span></label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" name="memo" class="layui-textarea textarea1" required>${cdistrict.memo}</textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-filter="demo1">
                <c:if test="${cdistrict.introduction!=null||cdistrict.traffic!=null||cdistrict.travel!=null||cdistrict.memo!=null}">
                    更新
                </c:if>
                <c:if test="${cdistrict.introduction==null&&cdistrict.traffic==null&&cdistrict.travel==null&&cdistrict.memo==null}">
                    添加
                </c:if>
            </button>
            <span class="layui-btn" onclick="javascript:history.back(-1)">取消</span>
        </div>
    </div>
</form>
<%--提示层--%>
<div id="box">
    <div class="con">
        <p id="txt">${msg}</p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>


<script src="./plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    function toBack() {
        window.history.go(-1);
    }

    function ifhide() {
        $("#box").hide(500)
    }

    window.onload = function () {
        var msg = '${msg}';
        if (msg.length > 0) {
            $("#box").show(500)
        }
    }
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则


        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

    });
</script>

</body>

</html>
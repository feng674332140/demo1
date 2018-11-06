<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.yzt.zhmp.beans.User" %>
<%@ page import="com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>智慧门牌</title>
    <link rel="stylesheet" href="./plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="./plugins/layui/css/check.css" media="all">
    <style>
        .box {
            width: 20%;
            margin-top: 10%;
            margin: auto;
            padding: 28px;
            height: 20%;
            border: 1px #111 solid;
            display: none; /* 默认对话框隐藏 */
        }

        #inputbox {
            display: none;
        }

        .box .x {
            font-size: 18px;
            text-align: right;
            display: block;
        }

        .box input {
            width: 100%;
            font-size: 18px;
            margin-top: 18px;
        }

        .box button {
            text-align: center
        }
    </style>
</head>
<body>
<div id="container" style="width: 100%;" >
    <div class="layui-tab lable" style="margin-top: 40px;margin-left: 40px;width: 50%;float: left">
        <ul class="layui-tab-title" style="width: 550px">
            <li onClick="msgbox(0)" class="layui-this">添加部门用户</li>
            <li onClick="msgbox(0)">添加行政用户</li>
        </ul>
        <%--内容--%>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <table class="layui-table" style="width: 400px">
                    <colgroup>
                        <col width="140">
                        <col width="260">
                    </colgroup>

                    <thead>
                    <tr>
                        <td style="text-align:center">部门</td>
                        <td style="text-align:center">用户操作</td>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${sessionScope.get('departments')}" var="dept">
                        <tr>
                            <td style="text-align:center">${dept.name}</td>
                            <td style="text-align:center">
                                <button class="layui-btn layui-btn-normal"
                                        onClick="changeValue(${dept.deptid});msgbox(1)">添加
                                </button>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="layui-tab-item">
                <table class="layui-table" style="width: 400px">
                    <colgroup>
                        <col width="140">
                        <col width="260">
                    </colgroup>

                    <thead>
                    <tr>
                        <td style="text-align:center">行政区</td>
                        <td style="text-align:center">用户操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sessionScope.get('districts')}" var="d">
                        <tr>
                            <td style="text-align:center">${d.name}</td>
                            <td style="text-align:center">
                                <button class="layui-btn layui-btn-normal"
                                        onClick="msgbox(1);changeDisValue('${d.name}','${d.discode}')">添加
                                </button>


                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="lable" id="divid" style="width:500px;float: left; margin-left: 800px; margin-top: 70px;position: absolute">
        <form id='inputbox' class="layui-form" action="/control/regist">
            <div class="layui-form-item" style="width: 300px;">
                <label class="layui-input-block" id="title"> </label>
            </div>
            <div class="layui-form-item" style="width: 300px;">
                <label class="layui-form-label">账号:</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="username" lay-verify="title" autocomplete="off"
                           placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 300px;">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-block">
                    <input type="password" name="password" id="password" lay-verify="title" autocomplete="off"
                           placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <input type="hidden" name="deptID" id="deptID" class="layui-input">
            <input type="hidden" name="disCode" id="disCode" class="layui-input">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1" >提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
</div>
<%--提示层--%>
<div id="box">
    <div class="con">
        <p id="txt">${status}</p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>

<script src="./plugins/layui/layui.js"></script>
<script src="../static/js/jquery-1.10.2.min.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    $(document).ready(function () {
        var adc = '${status}'
        var menuYloc = $("#divid").offset().top;
        $(window).scroll(function () {
            var offsetTop = menuYloc + $(window).scrollTop() + "px";
            $("#divid").animate({ top: offsetTop }, { duration: 600, queue: false });
        });
        console.log(adc);
        if(adc.length!=0){
            $("#box").show(500)
        }
    });
    function changeValue(data) {
        $("#deptID").val(data);
        if (data == 111) {
            $("#title").html("添加民政部门账号");
        } else if (data == 222) {
            $("#title").html("添加公安部门账号");
        } else if (data == 333) {
            $("#title").html("添加教育部门账号");
        }
    }

    $(function () {
        var temp = '${msg}';
        if (temp.length > 0) {
            alert(temp)
        }
    })

    function changeDisValue(data1, data2) {
        $("#disCode").val(data2);
        $("#title").html("添加" + data1 + "账号");


    }

    function msgbox(n) {
        //点击按钮打开/关闭 对话框,点击添加n=0 提交后n=1
        document.getElementById('inputbox').style.display = n ? 'block' : 'none';
        if (n == 0) {
            document.getElementById('username').val("");
        }
    }


    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项' + (Math.random() * 1000 | 0) //用于演示
                    , content: '内容' + (Math.random() * 1000 | 0)
                    , id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            , tabDelete: function (othis) {
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            , tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });

    });
    // function check() {


    <%--if(${status}==1){--%>
    //     $("#box").show(500)
        <%--$("#txt").text("用户添加成功")--%>
    <%--}else if (${status}==2){--%>
        <%--$("#box").show(500)--%>
        <%--$("#txt").text("用户名或密码不能为空")--%>
    <%--} else if (${status}==3){--%>
        <%--$("#box").show(500)--%>
        <%--$("#txt").text("账户已失效，请重新登陆")--%>
    <%--}else if (${status}==4){--%>
        <%--$("#box").show(500)--%>
        <%--$("#txt").text("用户名已存在")--%>
    <%--}--%>
    <%--else {--%>
        <%--$("#box").show(500)--%>
        <%--$("#txt").text("用户名密码不能为空")--%>
    <%--}--%>
    // }
    function ifhide(){
        $("#box").hide(500)
    }
</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>智慧门牌</title>
    <link rel="stylesheet" href="../control/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../control/plugins/layui/css/check.css" media="all">
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
    <style>
        .layui-form input[type=checkbox], .layui-form input[type=radio], .layui-form select {
             display: block ;
        }
    </style>
</head>

<body>
<table class="layui-table"
       lay-data="{height:315, url:'${pageContext.request.contextPath}/allBuilding', id:'test',height: 'full-25'}"
       lay-filter="test" id="test">
    <thead>
    <tr>
        <th lay-data="{field:'buID', width:80, sort: true}">建筑ID</th>
        <th lay-data="{field:'disCode', width:100}">行政区编码</th>
        <th lay-data="{field:'name', width:150}">户主姓名</th>
        <th lay-data="{field:'phoneNum', width:180}">联系电话</th>
        <th lay-data="{field:'familyType', width:120}">门牌编号</th>
        <th lay-data="{field:'population', width:100}">家庭人口</th>
        <th lay-data="{field:'roomNum', width:100}">房间数</th>
        <th lay-data="{field:'floorNum', width:110}">建筑层数</th>
        <th lay-data="{field:'landArea', width:120}">占地面积</th>

        <th lay-data="{field:'busiType', width:110}">居民类型</th>
        <th lay-data="{field:'feature', width:120}">经营特色</th>
        <th lay-data="{field:'mealDigits', width:120}">餐位数</th>
        <th lay-data="{field:'numberOfBed', width:120}">床位数</th>
        <th lay-data="{field:'numberOfRoom', width:120}"> 客房数</th>
        <th lay-data="{field:'memo', width:120}"> 总体介绍</th>

        <th lay-data="{field:'address', width:110}">具体住址</th>
        <th lay-data="{field:'buildingYear', width:120}">建筑年份</th>
        <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
    </tr>

    </thead>
</table>
<%--提示层--%>
<div id="box">
    <div class="con">
        <p id="txt">${msg}</p>
        <button onclick="ifhide()" class="but">知道了</button>
    </div>
</div>
<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="../control/plugins/layui/layui.js"></script>
<script>
    function ifhide() {
        $("#box").hide(500)
        window.location.href = "buildingList.jsp";
    }
    window.onload = function () {
        var msg = '${msg}';
        if (msg.length > 0) {
            $("#box").show(500)
        }

    }
    layui.use('table', function () {
        var table = layui.table;

        //监听工具条
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layer.msg('ID：' + data.id + ' 的查看操作');
            } else if (obj.event === 'del') {

                $.ajax({
                    url: "/control/deleteCbuilding",
                    type: "POST",
                    dataType: "json",
                    data: {
                        msg: JSON.stringify(data.buID)
                    },
                    success: function (data) {
                        if (data) {
                            $("#box").show(500);
                            $("#txt").text("删除成功");


                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        /*错误信息处理*/
                        alert("删除失败请重试");
                    }
                })

            } else if (obj.event === 'edit') {
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
                layer.open({
                    type: 1,
                    title: '修改门牌信息',
                    area: ['600px', '550px'],
                    closeBtn: 2,
                    id: 'LAY_layuipro',  //设定一个id，防止重复弹出
                    move: false,
                    content: '<form class="layui-form" id="mytable" action="uptadeCbuilding" style="padding-bottom:15px">\n' +
                        '<br>' +
                        '    <div class="layui-form-item" style="width: 300px;">\n' +
                        '        <label class="layui-form-label">户主姓名</label>\n' +
                        '        <div class="layui-input-block">\n' +
                        '            <input type="text" name="name" lay-verify="title" autocomplete="off" value="' + data.name + '" placeholder="' + data.name + '"\n' +
                        '                   class="layui-input">\n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '    <div class="layui-form-item" style="width: 300px;">\n' +
                        '        <label class="layui-form-label">联系电话</label>\n' +
                        '        <div class="layui-input-block">\n' +
                        '            <input type="text" name="phoneNum" lay-verify="title" autocomplete="off" value="' + data.phoneNum + '" placeholder="' + data.phoneNum + '"class="layui-input"><input type="hidden" name="buID" value="' + data.buID + '"> \n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '\n' +
                        '    <div class="layui-form-item">\n' +
                        '        <div class="layui-inline">\n' +
                        '            <label class="layui-form-label">门派编号</label>\n' +
                        '            <div class="layui-input-inline">\n' +
                        '                <input type="tel" name="familyType" lay-verify="familyType" value="' + data.familyType + '" autocomplete="off" class="layui-input">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '        <div class="layui-inline">\n' +
                        '            <label class="layui-form-label">家庭人口</label>\n' +
                        '            <div class="layui-input-inline">\n' +
                        '                <input type="text" name="population" value="' + data.population + '"  autocomplete="off" class="layui-input">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '\n' +
                        '    <div class="layui-form-item">\n' +
                        '        <div class="layui-inline">\n' +
                        '            <label class="layui-form-label">房屋间数</label>\n' +
                        '            <div class="layui-input-inline">\n' +
                        '                <input type="text" name="roomNum" value="' + data.roomNum + '"  class="layui-input">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '        <div class="layui-inline">\n' +
                        '            <label class="layui-form-label">楼层层数</label>\n' +
                        '            <div class="layui-input-inline">\n' +
                        '                <input type="text" name="floorNum" id="num" value="' + data.floorNum + '" autocomplete="off" class="layui-input">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '\n' +
                        '    </div>\n' +
                        '\n' +
                        '    <div class="layui-form-item">\n' +
                        '        <div class="layui-inline">\n' +
                        '            <label class="layui-form-label">占地面积</label>\n' +
                        '            <div class="layui-input-inline">\n' +
                        '                <input type="text" name="landArea" value="' + data.landArea + '"  autocomplete="off" class="layui-input">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '        <div class="layui-inline">\n' +
                        '            <label class="layui-form-label">建筑面积</label>\n' +
                        '            <div class="layui-input-inline">\n' +
                        '                <input type="text" name="buildArea" id="num" value="' + data.buildArea + '" autocomplete="off" class="layui-input">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '        <div class="layui-inline">\n' +
                        '            <label class="layui-form-label">建筑年份</label>\n' +
                        '            <div class="layui-input-inline">\n' +
                        '                <input type="text" name="buildingYear" id="num" value="' + data.buildingYear + '" autocomplete="off" class="layui-input">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '\n' +
                        '    </div>\n' +
                        '\n' +
                        '\n' +
                        '    <div class="layui-form-item" style="width: 300px;">\n' +
                        '        <label class="layui-form-label">农户类型</label>\n' +
                        '        <div class="layui-input-block">\n' +
                        '            <select name="busiType" lay-filter="busiType">\n' +
                        '                <option value="1">一般农户</option>\n' +
                        '                <option value="2">药农</option>\n' +
                        '                <option value="3">农家乐</option>\n' +
                        '                <option value="4">民宿</option>\n' +
                        '            </select>\n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '\n' +
                        '\n' +
                        '    <div class="layui-form-item layui-form-text" style="width: 500px;">\n' +
                        '        <label class="layui-form-label">具体位置</label>\n' +
                        '        <div class="layui-input-block">\n' +
                        '            <textarea placeholder="请输入内容"  class="layui-textarea" name="address">' + data.address + '</textarea>\n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '\n' +
                        '    <div class="layui-form-item layui-form-text" style="width: 500px;">\n' +
                        '        <label class="layui-form-label">备注</label>\n' +
                        '        <div class="layui-input-block">\n' +
                        '            <textarea placeholder="请输入内容"  class="layui-textarea" name="memo">' + data.memo + '</textarea>\n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '    <div class="layui-input-block">\n' +
                        '        <button class="layui-btn tijiao" <%--lay-submit=""--%> <%--lay-filter="demo1"--%> onclick="commitForm()">立即提交</button>\n' +
                        '        <span class="layui-btn layui-btn-normal quxiao" onclick="layer.close(layer.index);">取消</span>\n' +
                        '    </div>\n' +
                        '    </div>\n' +
                        '</form>'

                });
            }
        });


        $('.tijiao').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


    });



</script>
</body>

</html>
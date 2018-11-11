<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>智慧门牌</title>
    <link rel="stylesheet" href="./plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="./build/css/app.css" media="all">
</head>

<body>
<div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">${district}</div>
        <div class="layui-logo kit-logo-mobile">${district}</div>
        <ul class="layui-nav layui-layout-left kit-nav">
        </ul>
        <ul class="layui-nav layui-layout-right kit-nav">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    ${existUser.name}
                </a>

            </li>
            <li class="layui-nav-item"><a href="Logout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black kit-side">
        <div class="layui-side-scroll">
            <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:void(0);"><i class="layui-icon">&#xe638;</i><span> 操作管理</span></a>
                    <dl class="layui-nav-child">
                        <c:if test="${empty msg}">
                            <dd>
                                <a href="javascript:void(0);" kit-target
                                   data-options="{url:'disUserList.jsp',icon:'&#xe6c6;',title:'行政用户列表',id:'1'}">
                                    <i class="layui-icon">&#xe770;</i><span> 行政用户列表</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:void(0);" kit-target
                                   data-options="{url:'deptUserList.jsp',icon:'&#xe6c6;',title:'部门用户列表',id:'2'}">
                                    <i class="layui-icon">&#xe770;</i><span> 部门用户列表</span></a>
                            </dd>
                        </c:if>

                        <c:if test="${empty msg}">
                            <dd>
                                <a href="javascript:void(0);" kit-target
                                   data-options="{url:'form.jsp',icon:'&#xe654;',title:'新建行政管理账号',id:'3'}">
                                    <i class="layui-icon">&#xe654;</i><span> 新建行政管理账号</span></a>
                            </dd>
                        </c:if>
                        <%--<c:if test="${dis==0}">
                        <dd>
                            <a href="javascript:void(0);" data-url="XianquInfo.jsp" data-icon="&#xe614;" data-title="添加当前行政区信息" kit-target data-id='4'><i class="layui-icon">&#xe614;</i><span> 添加当前行政区信息</span></a>
                        </dd>
                        </c:if>--%>

                        <dd>
                            <a href="javascript:void(0);"
                               data-url="<c:if test="${dis==1}">XianquInfo.jsp</c:if><c:if test="${dis==0}">formUpadteXianqu.jsp</c:if>"
                               data-icon="&#xe63c;" data-title="行政区信息" kit-target data-id='5'><i class="layui-icon">&#xe63c;</i><span> 行政区信息</span></a>
                        </dd>
                        <c:if test="${msg=='村'}">
                            <dd>
                                <a href="javascript:void(0);" data-url="formNonghu.jsp" data-icon="&#xe654;"
                                   data-title="添加农户信息" kit-target data-id='6'><i class="layui-icon">&#xe654;</i><span> 添加农户信息</span></a>
                            </dd>
                            <dd>
                                <a href="javascript:void(0);" kit-target
                                   data-options="{url:'buildingList.jsp',icon:'&#xe642;',title:'修改门牌信息',id:'7'}">
                                    <i class="layui-icon">&#xe642;</i><span> 修改门牌信息</span></a>
                            </dd>
                        </c:if>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:void(0);"><i class="layui-icon">&#xe638;</i><span> 用户选项</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:void(0);" kit-target
                               data-options="{url:'updatePassword.jsp',icon:'&#xe6c6;',title:'修改密码',id:'8'}">
                                <i class="layui-icon">&#xe770;</i><span> 修改密码</span></a>
                        </dd>
                    </dl>

                </li>


            </ul>
        </div>
    </div>
    <div class="layui-body" id="container">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">主体内容加载中,请稍等...</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        2018 &copy;
        <a href="#">武汉一张图科技有限公司</a>

    </div>
</div>
<script type="text/javascript">
    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cspan id='cnzz_stat_icon_1264021086'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1264021086%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
</script>
<script src="./plugins/layui/layui.js"></script>
<script>
    var message;
    layui.config({
        base: 'build/js/'
    }).use(['app', 'message'], function () {
        var app = layui.app,
            $ = layui.jquery,
            layer = layui.layer;
        //将message设置为全局以便子页面调用
        message = layui.message;
        //主入口
        app.set({
            type: 'iframe'
        }).init();
    });
</script>
</body>

</html>
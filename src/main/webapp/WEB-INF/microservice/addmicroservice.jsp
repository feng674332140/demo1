<%--
  Created by IntelliJ IDEA.
  User: shenbiao
  Date: 2017/3/1
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="../static/style/weui.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/example.css"/>
    <link rel="stylesheet" href="<%=basepath%>/control/plugins/layui/css/check.css" media="all">
    <%--<script type="text/javascript" src="/static/js/zepto.min.js"></script>--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../static/js/common/common.js"></script>
    <script type="text/javascript" src="../static/js/service/microservice.js"></script>
    <script type="text/javascript" src="../static/js/common/Sortable.min.js"></script>
</head>
<body ontouchstart>
<div class="page">
    <div class="page__hd" style="height: 30px;padding-top: 0px;padding-bottom: 40px;">
        <div class="weui-navbar">
            <div class="weui-navbar__item" onClick="javascript :history.back(-1);">
                返回
            </div>
            <div class="weui-navbar__item" id="en">
                确认修改
            </div>
        </div>
    </div>
    <div class="page__bd page__bd_spacing">
        <div class="weui-grids" id="originMicroservice">
            <a href="javascript:;" class="weui-grid" id="marry">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/hunydengji.png" alt="">
                </div>
                <p class="weui-grid__label">婚姻登记</p>
            </a>
            <a href="javascript:;" class="weui-grid" id="XingZhengQuHua">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/quhuadiming.png" alt="">
                </div>
                <p class="weui-grid__label">行政区划</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/shequjianshe.png" alt="">
                </div>
                <p class="weui-grid__label">社区建设</p>
            </a>
            <a href="javascript:;" class="weui-grid" id="YouDaiFuXu">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/youdaifuxu.png" alt="">
                </div>
                <p class="weui-grid__label">优待抚恤</p>
            </a>
            <a href="javascript:;" class="weui-grid" id="TuiWuAnZhi">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/tuiwuanzhi.png" alt="">
                </div>
                <p class="weui-grid__label">退伍安置</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/binzangguanli.png" alt="">
                </div>
                <p class="weui-grid__label">殡葬管理</p>
            </a>
            <a href="javascript:;" class="weui-grid" id="JiuZaiJuiZhi">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/jiuzaijiuji.png" alt="">
                </div>
                <p class="weui-grid__label">救灾救济</p>
            </a>
            <a href="javascript:;" class="weui-grid" id="TeKunGongYang">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/tekungongyang.png" alt="">
                </div>
                <p class="weui-grid__label">特困供养</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/fulicaipiao.png" alt="">
                </div>
                <p class="weui-grid__label">福利彩票</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/shehuizuzhi.png" alt="">
                </div>
                <p class="weui-grid__label">社会组织</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/liulangjiuzhu.png" alt="">
                </div>
                <p class="weui-grid__label">流浪救助</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/chengxiangdibao.png" alt="">
                </div>
                <p class="weui-grid__label">城乡低保</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/yiliaojiuzhu.png" alt="">
                </div>
                <p class="weui-grid__label">医疗救助</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/cishanjuanzhu.png" alt="">
                </div>
                <p class="weui-grid__label">慈善捐助</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/shehuifuli.png" alt="">
                </div>
                <p class="weui-grid__label">社会福利</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/shouyangdengji.png" alt="">
                </div>
                <p class="weui-grid__label">收养登记</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/dimingguanli.png" alt="">
                </div>
                <p class="weui-grid__label">地名管理</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/laonianyoudai.png" alt="">
                </div>
                <p class="weui-grid__label">老年优待</p>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../static/images/minzheng/yanglaojigou.png" alt="">
                </div>
                <p class="weui-grid__label">养老机构</p>
            </a>
        </div>
        <br><br><br><br><br><br>
        <ul class="weui-footer_fixed-bottom">
            <li>
                <div class="weui-flex js_category">
                    <p class="weui-flex__item pressToDelete" id="bigService_p_1">当前微服务</p>
                    <img class="glyphicon-move" src="../static/images/icon_nav_form.png" alt="">
                </div>
                <div class="page__category js_categoryInner">
                    <div class="weui-grids" id="allMicroservice">
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_panel.png" alt="">
                            </div>
                            <p class="weui-grid__label">行政管辖</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_me.png" alt="">
                            </div>
                            <p class="weui-grid__label">辖区民警</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_addressbook.png" alt="">
                            </div>
                            <p class="weui-grid__label">一键报警</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_dialog.png" alt="">
                            </div>
                            <p class="weui-grid__label">房主留言</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_message.png" alt="">
                            </div>
                            <p class="weui-grid__label">客人留言</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_button.png" alt="">
                            </div>
                            <p class="weui-grid__label">地理位置</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_toast.png" alt="">
                            </div>
                            <p class="weui-grid__label">房屋租售</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_feedback.png" alt="">
                            </div>
                            <p class="weui-grid__label">水电煤气</p>
                        </a>
                        <a href="javascript:;" class="weui-grid">
                            <div class="weui-grid__icon">
                                <img src="../static/images/icon_nav_article.png" alt="">
                            </div>
                            <p class="weui-grid__label">招聘信息</p>
                        </a>
                    </div>
                </div>
            </li>
        </ul>
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
            alert("123");
            var link = $("#allMicroservice a");
            var link_Id = [];
            alert(link);
            alert()
            for (var i = 0; i < link.length; i++) {
                link_Id.push($(link[i]).attr('id'));
                //    alert(link_Id);
            }

        })
    })
</script>
</body>
</html>

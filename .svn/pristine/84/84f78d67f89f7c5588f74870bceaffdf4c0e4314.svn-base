<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <title><%=Const.SYSTEM_NAME%>全部商品</title>
    <meta name="keywords" content="<%=Const.SYSTEM_NAME%>全部商品">
    <meta name="description" content="<%=Const.SYSTEM_NAME%>全部商品">
    <link rel="Bookmark" href="favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
          name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/shopping/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/index.css"/>
</head>
<body style="background: #fff;height:100%;">
<div class="max-box container">
    <div class="top tc row">
        <div class="col-xs-12">
            <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">全部商品</a>
        </div>
    </div>
    <!-- 头部结束 -->
<%--     <div class="nav">
        <ul>
            <li class="lar_l"><a href="${ctx}/wx/index" target="_self">首页</a></li>
            <li class="lar_l"><em class="e_line primary">全部商品</em></li>
            <li class="lar_l"><a href="${ctx}/wx/goods/shareGoods/list" target="_self">晒单</a></li>
        </ul>
    </div> --%>
    <!-- 导航 结束-->
    <div class="con">
        <div id="plist" class="m_index">
            <ul id="dataList" class="clearfix popular-list">
                <c:forEach items="${page.result}" var="entity">
                   <%--  <li class="goodsList">
                        <div class="w-goods">
                            <a href="${ctx }/wx/goods/goodsTimes/detail/${entity.id}?userId=3" target="_self">
                                <div class="w_img p-img">
                                    <img src="${goodsRootUri}/${entity.thumbnail}"/>
                                    <c:if test="${entity.isTenYuan }">
                                        <ins></ins>
                                    </c:if>
                                </div>
                                <div class="w_Plo">
                                    <p class="larger text-heavy w_txt">${entity.goodsName}</p>

                                    <p class="pic_bg"><span class="bar" style="width:${entity.snatchProgress}%;"><i
                                            class="color"></i></span></p>

                                    <p class="text-normal normal">总需${entity.totalTimes}人次<strong class="number">剩余<em
                                            class="blur">${entity.totalTimes-entity.totalBuyTimes}</em></strong></p>
                                </div>
                            </a>

                            <div class="btns btn">
                                <a href="javascript:addSnatchListItem(${entity.id});"
                                   class="add_cart_large btnCart"></a>
                            </div>
                        </div>
                    </li> --%>
                    
                     <li class="goodsList_item">
                    <div class="w-goods">
                        <a href="${ctx }/wx/goods/goodsTimes/detail/${entity.id}?userId=3" target="_self">
                            <div class="w_pic p-img">
                            <img src="${goodsRootUri}/${entity.thumbnail}"/>
                             <c:if test="${entity.isTenYuan }">
                                        <ins></ins>
                                    </c:if>
                            </div>
                            <h4 class="large text-heavy w_txt">${entity.goodsName}</h4>
                            <div class="w-progressBar">
                            <!-- 下边的进度条 代码，我给掩藏掉了，请展开 -->
                                 <p class="large_normal text-normal txt">开奖进度 <strong class="blur">${entity.snatchProgress}%</strong></p>
                                <p class="pic_bg"><span class="bar" style="width:${entity.snatchProgress}%;"><i class="color"></i></span></p>
                                <div class="wpro-words overflow">
                                 	<div class="fl" style="width:3.6rem;"><span class="orange large_normal span-pro">${entity.totalBuyTimes}</span><p class="text-normal largest_plus2 p-pro">已参与</p></div>
                                 	<div class="fl"><span class="text-normal large_normal span-pro">${entity.totalTimes}</span><p class="text-normal largest_plus2 p-pro">总需人数</p></div>
                                 	<div class="fr" style="width:2.5rem;"><span class="blur large_normal span-pro">${entity.totalTimes-entity.totalBuyTimes}</span><p class="text-normal largest_plus2 p-pro">剩余</p></div>
                                </div>
                               
                            </div>
                        </a>
                    </div>
                </li>
                    
                    
                </c:forEach>
            </ul>
        </div>
        <div id="flyItem" class="fly_item">
            <img src="${ctx}/static/wx/css/shopping/images/item-pic.jpg"/>
        </div>
    </div>
    <%-- <div class="mui-mbar-tabs">
        <div class="quick_link_mian mui-mbar-tabs">
            <div class="quick_links_panel">
                <div id="quick_links" class="quick_links">
                    <li id="shopCart">
                        <a href="${ctx }/wx/snatchList/list" class="message_list"><i class="message"></i>

                            <div class="span"></div>
                            <span class="cart_num">${listCount }</span></a>
                    </li>
                </div>
            </div>
            <div id="quick_links_pop" class="quick_links_pop hide"></div>
        </div>
    </div> --%>
    <!-- 购物车结束 -->
</div>
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/css/shopping/js/parabola.js"></script>
<script type="text/javascript">
    //购物车
    var addState = false;
    function addSnatchListItem(goodsTimesId, amount) {
        if (wxcommon.isEmpty('${userId}')) {
            wxcommon.message('您未登录，请授权登录', function () {
                wxcommon.login();
            });

            return;
        }

        $.ajax({
            url: "${ctx}/wx/snatchList/addSnatchListItem",
            data: {
                goodsTimesId: goodsTimesId,
                amount: amount
            },
            type: 'post',
            dataType: 'json',
            success: function (result) {
                if (result.state == 200) {
                    addState = true;
                }
            },
            error: function () {

            }
        });
    }

    var numberItem = ${listCount};
    function parabola() {
        var eleFlyElement = document.querySelector("#flyItem"), eleShopCart = document.querySelector("#shopCart");
        // 抛物线运动
        var myParabola = funParabola(eleFlyElement, eleShopCart, {
            speed: 400, //抛物线速度
            curvature: 0.0008, //控制抛物线弧度
            complete: function () {
                eleFlyElement.style.visibility = "hidden";
                if (addState) {
                    addState = false;
                    eleShopCart.querySelector("span").innerHTML = ++numberItem;
                }
            }
        });
        // 绑定点击事件
        if (eleFlyElement && eleShopCart) {

            [].slice.call(document.getElementsByClassName("btnCart")).forEach(function (button) {
                button.addEventListener("click", function (event) {
                    var src = $(this).parents("li").find('.p-img').find("img").attr("src");
                    $("#flyItem").find("img").attr("src", src);
                    // 滚动大小
                    var scrollLeft = document.documentElement.scrollLeft || document.body.scrollLeft || 0,
                            scrollTop = document.documentElement.scrollTop || document.body.scrollTop || 0;
                    eleFlyElement.style.left = event.clientX + scrollLeft + "px";
                    eleFlyElement.style.top = event.clientY + scrollTop + "px";
                    eleFlyElement.style.visibility = "visible";

                    // 需要重定位
                    myParabola.position().move();
                });
            });
        }
    }

    wxcommon.autoLoad({
        totalPages: ${page.totalPages},                 // 总页数
        pageNo: ${page.pageNo},                         // 页码
        pageSize: ${page.pageSize},                     // 分页大小
        timestamp: ${timestamp},
        loadedCallbackFun: parabola,
        containerId: "dataList",                        // 显示内容的容器id
        url: "${ctx}/wx/goods/goodsTimes/allByJson",    // 请求url
        doRowDataFun: function (rowData) {                // 格式化行级数据
            var number = 1;
            var html = '<li class="goodsList">' +
                    '<div class="w-goods">' +
                    '<a href="${ctx }/wx/goods/goodsTimes/detail/' + rowData.id + '?userId=3" target="_self">' +
                    '<div class="w_img p-img">' +
                    '<img src="${goodsRootUri}/' + rowData.thumbnail + '"/>';
            if (rowData.isTenYuan == "true" || rowData.isTenYuan == true) {
                html = html + '<ins></ins>';
                number = 10;
            }
            html = html + '</div><div class="w_Plo">' +
                    '<p class="larger text-heavy w_txt">' + rowData.goodsName + '</p>' +
                    '<p class="pic_bg"><span class="bar" style="width:' + rowData.snatchProgress + '%;">' +
                    '<i class="color"></i></span></p>' +
                    '<p class="text-normal normal">总需' + rowData.totalTimes + '人次<strong class="number">剩余<em' +
                    ' class="blur">' + (rowData.totalTimes - rowData.totalBuyTimes) + '</em></strong></p>' +
                    '</div></a>';
            html = html + '<div class="btns btn"><a href="javascript:addSnatchListItem(' + rowData.id + ',' + number + ');" class="add_cart_large btnCart"></a></div></div></li>';
            return html;
        }
    });
</script>
</body>
</html>   

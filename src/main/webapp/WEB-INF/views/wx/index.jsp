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
    <title>乐夺宝首页</title>
    <meta name="keywords" content="乐夺宝首页">
    <meta name="description" content="乐夺宝首页">
    <link rel="Bookmark" href="favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
          name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/shopping/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/index.css"/>
</head>
<body style="background-color:#eeeff3">
<div class="max-box container">
    <div class="head">
        <h3 class="p-plus text-f">乐夺宝</h3>
    </div>
    <!-- 头部结束 -->
    <!-- 导航 结束-->
    <div class="banner">
        <div id="focus" class="focus">
            <div class="hd">
                <ul></ul>
            </div>
            <div class="bd">
               <ul>
                    <c:forEach items="${imageList}" var="img">
                        <c:choose>
                            <c:when test="${img.actionType==2 }">
                                <li><a href="${ctx}/wx/goods/goodsTimes/detailbytimes/${img.value}?userId=3"><img src="${topSwitchImgRootUri}/${img.url}"/></a></li>
                            </c:when>
                            <c:when test="${img.actionType==1 }">
                                <li><a href="${img.value}"><img src="${topSwitchImgRootUri}/${img.url}"/></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="javascript:;"><img src="${topSwitchImgRootUri}/${img.url}"/></a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!-- banner 结束 -->
    <!-- 即将揭晓 开始 -->
    <!-- 
    <div>
    <h3 class="tle line lar_l plr text-heavy orange">即将揭晓</h3>
        <div id="plist" class="m_index">
            <ul class="clearfix popular-list">
            <c:forEach items="${goodsTimeList}" var="entity">
                <li class="goodsList_item">
                    <div class="w-goods">
                        <a href="${ctx }/wx/goods/goodsTimes/detail/${entity.id}?userId=3" target="_self">
                            <div class="w_pic p-img">
                             <img src="${goodsRootUri}/${entity.thumbnail}"/>
                            </div>
                            <h4 class="large text-heavy w_txt">${entity.goodsName}</h4>
                            <div class="w-progressBar">
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
            <img src="${ctx }/static/wx/css/shopping/images/item-pic.jpg"/>
        </div>
    </div>
    -->
    <!-- 即将揭晓结束 -->
    <!-- 人气 商品 开始-->
    <div class="con">
    <h3 class="tle line lar_l plr text-heavy orange">人气商品 </h3>
        <div id="plist" class="m_index">
            <ul id="dataList" class="clearfix popular-list">
             <c:forEach items="${page.result}" var="entity">
                <li class="goodsList_item">
                    <div class="w-goods">
                     <a href="${ctx }/wx/goods/goodsTimes/detail/${entity.id}?userId=3" target="_self">
                            <div class="w_pic p-img">
                             <img src="${goodsRootUri}/${entity.thumbnail}"/>
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
    </div>
     <!-- 人气 商品  结束-->
    <div class="foot-flag">
        <ul>
            <li class="on"><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_on_1 icon"></b><p>夺宝</p></a></li>
            <li><a href="${ctx}/wx/goods/goodsCategory/listCategory" class="text-heavy"><b class="icon_6 icon"></b><p>分类</p></a></li>
            <li><a href="${ctx}/wx/goods/goodsTimes/listLastOpen" class="text-heavy"><b class="icon_2 icon"></b><p>最新揭晓</p></a></li>
            <li><a href="${ctx}/wx/snatchList/list" class="text-heavy"><b class="icon_4 icon"></b><p>购物车</p></a></li>
            <li><a href="${ctx}/wx/user/home" class="text-heavy"><b class="icon_5 icon"></b><p>我的</p></a></li>
        </ul>
    </div>
    <div class="mb80"></div>
</div>


<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/css/shopping/js/parabola.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/TouchSlide.1.1.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/jquery.vticker.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript">
    TouchSlide({
        slideCell: "#focus",
        titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
        mainCell: ".bd ul",
        effect: "leftLoop",
        autoPlay: true,//自动播放
        autoPage: true //自动分页
    });
    /*banner图----------*/

    $(function () {
        $('#last li:even').addClass('lieven');
        if($('#last').find('li').length > 0) {
            $('#last').find('ul').show();
            $("#last").vTicker({
                speed: 40, //数值越大，速度越慢
                rowHeight: 68, //li的高度
                height: 10
            });
        }else{
            $('#last').remove();
        }
    });
    //购物车
    var addState = false;
    function addSnatchListItem(goodsTimesId, amount) {
        if(wxcommon.isEmpty('')){
            wxcommon.message('您未登录，请授权登录', function(){
                wxcommon.login();
            });

            return;
        }

        $.ajax({
            url: "/stlife/wx/snatchList/addSnatchListItem",
            data: {
                goodsTimesId: goodsTimesId,
                userId: 3,
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
        url: "${ctx}/wx/allByJson",    // 请求url
        doRowDataFun: function (rowData) {                // 格式化行级数据
            var html = '<li class="goodsList_item">' +
                    '<div class="w-goods">' +
                    '<a href="${ctx }/wx/goods/goodsTimes/detail/' + rowData.id + '?userId=3" target="_self">' +
                    '<div class="w_pic p-img">' +
                    '<img src="${goodsRootUri}/' + rowData.thumbnail + '"/>';
            html = html + '</div><h4 class="large text-heavy w_txt">' + rowData.goodsName + '</h4><div class="w-progressBar">' +
                    '<p class="large_normal text-normal txt">开奖进度 <strong class="blur">' + rowData.snatchProgress + '%</strong></p>' +
                    '<p class="pic_bg"><span class="bar" style="width:' + rowData.snatchProgress + '%;"><i class="color"></i></span></p>' +
                    '<div class="wpro-words overflow">' + 
                    '<div class="fl" style="width:3.6rem;"><span class="orange large_normal span-pro">' + rowData.totalBuyTimes + 
                    '</span><p class="text-normal largest_plus2 p-pro">已参与</p></div>' + 
                    '<div class="fl"><span class="text-normal large_normal span-pro">' + rowData.totalTimes + 
                    '</span><p class="text-normal largest_plus2 p-pro">总需人数</p></div>' + 
                    '<div class="fr" style="width:2.5rem;"><span class="blur large_normal span-pro">' +
                    ${rowData.totalTimes-rowData.totalBuyTimes} + 
                    '</span><p class="text-normal largest_plus2 p-pro">剩余</p></div>' + 
                    '</div></div></a></div></li>';
            return html;
        }
    });
</script>
</body>
</html>   

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
    <title>${categoryName }</title>
    <meta name="keywords" content="${categoryName }">
    <meta name="description" content="${categoryName }">
    <link rel="Bookmark" href="favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
          name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/shopping/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/index.css"/>
    <style type="text/css">
	    #joinBtn{
	    color:#da3651;
	    border-radius: 5px;
	    width:80%;
	    display: block;
	    line-height:30px;
	    text-align: center;
	    height:25px;
	    border:2px solid #da3651;
    }
</style>
</head>
<body style="background-color:#eeeff3">
<div class="max-box">
   <div class="top tc">
       <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">${categoryName }</a>
   </div>
    <!-- 头部结束 -->
    <!-- 商品列表 开始 -->
    <div>
        <div id="plist" class="m_index">
            <ul class="clearfix popular-list">
            <c:forEach items="${page.result}" var="entity">
                <li class="goodsList_item" style="height:15.5rem;">
                    <div class="w-goods">
                        <div class="w_pic p-img">
                         <img src="${goodsRootUri}/${entity.thumbnail}"/>
                        </div>
                        <h4 class="large text-heavy w_txt">${entity.goodsName}</h4>
                        <div>
                        <div class="w-progressBar" style="width:60%;float:left">
                           <p class="pic_bg"><span class="bar" style="width:${entity.snatchProgress}%;"><i class="color"></i></span></p>
                           <div class="wpro-words overflow">
                               <!-- 
                               <div class="fl" style="width:3.6rem;"><span class="orange large_normal span-pro">${entity.totalBuyTimes}</span><p class="text-normal largest_plus2 p-pro">已参与</p></div>
                                -->
                               <div class="fl"><span class="text-normal large_normal span-pro">${entity.totalTimes}</span><p class="text-normal largest_plus2 p-pro">总需</p></div>
                               <div class="fr" style="width:2.5rem;">
                                    <span class="blur large_normal span-pro" style="color:#ff0000;">${entity.totalTimes-entity.totalBuyTimes}</span>
                                    <p class="text-normal largest_plus2 p-pro">剩余</p>
                               </div>
                           </div>
                        </div>
                        <div class="w-progressBar1" style="width:40%;display:inline;float:right" >
                             <a href="${ctx }/wx/goods/goodsTimes/detail/${entity.id}?userId=3" id="joinBtn">参与</a>
                        </div>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div id="flyItem" class="fly_item">
            <img src="${ctx }/static/wx/css/shopping/images/item-pic.jpg"/>
        </div>
    </div>
    <!-- 商品列表结束 -->
    <div class="footer2">
        <a href="${ctx}/wx/goods/goodsTimes/all" target="_self">点击查看更多商品</a>
    </div>
    <div class="foot-flag">
        <ul>
            <li><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_1 icon"></b><p>夺宝</p></a></li>
            <li class="on"><a href="${ctx}/wx/goods/goodsCategory/listCategory" class="text-heavy"><b class="icon_on_6 icon"></b><p>分类</p></a></li>
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
</body>
</html>

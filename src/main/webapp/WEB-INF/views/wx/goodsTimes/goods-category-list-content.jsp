<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>商品分类</title>
<meta name="keywords" content="商品分类">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
<link rel="Bookmark" href="${ctx}/static/wx/favicon.ico">
<meta
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
	name="viewport" id="viewport">
<meta name="format-detection" content="telephone=yes">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/global.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/past.css" />
</head>
<body style="background: #efeff4;">
	<div class="max-box">
		<div class="top tc">
			<a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">商品分类</a>
		</div>
		<!-- 头部结束 -->
		<div class="content-ca clearfloat">
			<ul id="dataList">
				<c:forEach items="${page.result}" var="entity">
					<li class="lr line"><a href="${ctx}/wx/goods/goodsCategory/category/list?categoryId=${entity.id}">
							<div class="img" style="height:6rem">
								<img src="${goodsCategoryRootUri}/${entity.imgUrl}" alt="">
							</div>
							<h6 class="www text-normal large" style="text-align:center;">${entity.name}</h6>
					</a></li>
				</c:forEach>
			</ul>
		</div>
    <div class="foot-flag">
    	<ul>
    		<li ><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_1 icon"></b><p>夺宝</p></a></li>
    		<li class="on"><a href="${ctx}/wx/goods/goodsCategory/listCategory" class="text-heavy"><b class="icon_on_6 icon"></b><p>分类</p></a></li>
    		<li><a href="${ctx}/wx/goods/goodsTimes/listLastOpen" class="text-heavy"><b class="icon_2 icon"></b><p>最新揭晓</p></a></li>
    		<li><a href="${ctx}/wx/snatchList/list" class="text-heavy"><b class="icon_4 icon"></b><p>购物车</p></a></li>
    		<li><a href="${ctx}/wx/user/home" class="text-heavy"><b class="icon_5 icon"></b><p>我的</p></a></li>
    	</ul>
    </div>
    <div class="mb80"></div>
	</div>
	<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/wx/js/openTime.js"></script>
	<script src="${ctx}/static/wx/js/wxcommon.js"></script>
</body>
</html>

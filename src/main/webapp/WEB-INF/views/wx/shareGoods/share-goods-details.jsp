<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>晒单详情</title>
<meta name="keywords" content="夺宝首页">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
<link rel="Bookmark" href="favicon.ico">
<meta
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
	name="viewport" id="viewport">
<meta name="format-detection" content="telephone=yes">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/global.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/bask.css" />
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/layer/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
</head>
<body style="background: #fff;">
	<div class="max-box">
		<div class="top tc">
			<a href="javascript:wxcommon.goback('${ctx}');" target="_self"
				class="black">晒单详情</a>
		</div>
		<!-- 头部结束 -->
		<div class="con">
			<h2 class="lar_l largest_plus tle c_tle">${entity.title}</h2>
			<h3 class="large c_tle">
				<a href="#" class="blur">${entity.userNickName}</a><em
					class="text-low2"><fmt:formatDate value="${entity.createTime}"
						pattern="yyyy-MM-dd HH:mm:ss" /></em>
			</h3>
			<ul>
				<li class="normal">获奖商品：<em><a href="#" class="blur">${entity.goodsName}</a></em></li>
				<li class="normal">参与期号：<em>${entity.goodsTimesName }</em></li>
				<li class="normal">本期参与：<em class="text-heavy"><b
						class="color_3">${entity.goodsTimes.winngUserBuyTimes}</b>人次</em></li>
				<li class="normal">幸运号码：<em class="color_3">${entity.goodsTimes.luckNum}</em></li>
				<li class="normal">揭晓时间：<em class="text-heavy"><fmt:formatDate
							value="${entity.goodsTimes.openTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></em></li>
			</ul>
			<p class="c_tle large text-heavy">${entity.content}</p>
			<c:forEach items="${shareImageList}" var="imgList">
				<ins>
					<img src="${shareGoodsRootUri}/${imgList}" alt="">
				</ins>
			</c:forEach>
		</div>
	</div>
</body>
</html>

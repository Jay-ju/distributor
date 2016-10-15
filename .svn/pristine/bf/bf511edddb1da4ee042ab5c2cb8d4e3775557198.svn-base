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
<title>我的晒单</title>
<meta name="keywords" content="我的晒单">
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
	href="${ctx}/static/wx/css/bask.css">
</head>
<body style="background: #fff;">
	<div class="max-box">
		<div class="top tc">
			<a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">我的晒单</a>
		</div>
		<!-- 头部结束 -->
		<c:set var="notpass" value="<%=Const.ShareGoodsState.AUDIT_NOT_PASS %>" />
		<c:set var="map1" value="<%=Const.ShareGoodsState.MAP%>" />
		<div class="content" id="dataList">
			<c:choose>
				<c:when test="${not empty shareGoodsList}">
					<c:forEach items="${shareGoodsList}" var="entity">
						<c:choose>
							<c:when test="${entity['hasShareGoods']}">
								<c:choose>
									<c:when test="${entity['state']==notpass}">
										<c:set var="url"
											value="${ctx}/wx/goods/shareGoods/create?userId=${userId}&goodsTimesId=${entity['goodsTimesId']}&id=${entity['shareGoodsId']}" />
									</c:when>
									<c:otherwise>
										<c:set var="url"
											value="${ctx}/wx/goods/shareGoods/shareGoodsDetails?shareGoodsId=${entity['shareGoodsId']}" />
									</c:otherwise>
								</c:choose>
								<a href="${url}" target="_self">
									<div class="head">
										<div class="head_t lr">
											<b>${shareStateMap[entity['state']]}</b>
										</div>
										<div class="head_c clearfloat lr">
											<p class="large text-normal">
												${entity['title']}<b class="normal"><fmt:formatDate
														value="${entity['createTime']}"
														pattern="yyyy-MM-dd HH:mm:ss" /></b>
											</p>
										</div>
										<div class="goods clearfloat line">
											<div class="goods_L">
												<img src="${goodsRootUri}/${entity['thumbnail']}" alt="">
											</div>
											<div class="goods_R">
												<p class="larger">
													<a href="#" class="pink2">${entity['goodsName']}</a>
												</p>
												<p class="larger text-normal">${entity['content']}</p>
											</div>
										</div>
									</div>
								</a>
							</c:when>
							<c:otherwise>
								<div class="goods clearfloat">
									<div class="goods_L">
										<img src="${goodsRootUri}/${entity['thumbnail']}" alt="">
									</div>
									<div class="goods_R">
										<p class="larger text-normal">${entity['goodsName']}</p>
										<span><a
											href="${ctx}/wx/goods/shareGoods/create?userId=${userId}&goodsTimesId=${entity['goodsTimesId']}"
											class="bg_1">立即晒单</a></span>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					 <div class="Null">
					 	<img src="${ctx}/static/wx/images/no.png" alt=""/>
           				<a href="${ctx}/wx/index" class="bg_4">立即夺宝</a>
       				</div>
				</c:otherwise>
			</c:choose>
			
		</div>
		<!-- <div class="footer">已到达列表底部~</div> -->
	</div>
	<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
	<script src="${ctx}/static/wx/js/wxcommon.js"></script>
	<script type="text/javascript">
		
		wxcommon.autoLoad({
	        totalPages: ${page.totalPages},                					// 总页数
	        pageNo: ${page.pageNo},                         				// 页码
	        pageSize: ${page.pageSize},                    					// 分页大小
	        timestamp: ${timestamp},										//当前时间戳
	        containerId: "dataList",                        				// 显示内容的容器id
	        url: "${ctx}/wx/goods/shareGoods/myByJson?userId=${userId}",    // 请求url
	        doRowDataFun: function(rowData){                				// 格式化行级数据
	        	var myString;
	        	if(rowData.hasShareGoods){
	        		myString = '<a href="${url}" target="_self" >'+
						'<div class="head">'+
							'<div class="head_t lr">'+
								'<b>'+rowData.stateMap[rowData.state]+'</b>'+
							'</div>'+
							'<div class="head_c clearfloat lr">'+
								'<p class="large text-normal">'+rowData.title+'<b class="normal">'+rowData.createTime+'</b>'+
								'</p>'+
							'</div>'+
							'<div class="goods clearfloat line">'+
								'<div class="goods_L">'+
									'<img src="${goodsRootUri}/'+rowData.thumbnail+'" alt="">'+
								'</div>'+
								'<div class="goods_R">'+
									'<p class="larger" >'+
										'<a href="#" class="pink2">'+rowData.goodsName+'</a>'+
									'</p>'+
									'<p class="larger text-normal">'+rowData.content+'</p>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</a>';
	        	}else{
	        		myString = '<div class="goods clearfloat">'+
									'<div class="goods_L">'+
										'<img src="${goodsRootUri}/'+rowData.thumbnail+'" alt="">'+
									'</div>'+
									'<div class="goods_R">'+
										'<p class="larger text-normal">'+rowData.goodsName+'</p>'+
										'<span><a href="${ctx}/wx/goods/shareGoods/create?userId=${userId}&goodsTimesId='+
											rowData.goodsTimesId+'" class="bg_1">立即晒单</a></span>'+
									'</div>'+
								'</div>';
	        	}
	        	return myString;
	        }
	    });
	</script>
</body>
</html>

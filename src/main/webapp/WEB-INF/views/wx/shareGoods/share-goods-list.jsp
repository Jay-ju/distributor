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
<title>晒单</title>
<meta name="keywords" content="夺宝首页">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
<link rel="Bookmark" href="favicon.ico">
<meta
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
	name="viewport" id="viewport">
<meta name="format-detection" content="telephone=yes">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/shopping/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/global.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/bask.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/index.css" />
</head>
<body style="background: #fff;">
	<div class="max-box">
		<div class="top tc">
			<a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">晒单</a>
		</div>
		<!-- 头部结束 -->
		<div class="content">
			<ul class="inner" id="dataList">
				<c:forEach items="${page.result}" var="entity">
					<li class="shareGoodsList"><a
						href="${ctx}/wx/goods/shareGoods/shareGoodsDetails?shareGoodsId=${entity.id}"
						target="_self">
							<div class="i_pic">
								<ins>
									<img src="${userHeadImgRootUri}/${entity.userHeadImg}" alt="" />
								</ins>
							</div>
							<div class="i_txt">
								<h3 class="i_time large">${entity.userNickName}<em><fmt:formatDate
											value="${entity.createTime}" pattern="MM-dd HH:mm" /></em>
								</h3>
								<div class="news">
									<h2 class="blank lar_l">${entity.title}</h2>
									<p class="large">${entity.goodsName}</p>
									<p class="large">期号：${entity.goodsTimesName}</p>
									<p class="larger text-normal">${entity.content}</p>
									<div class="t_img">
										<c:forEach items="${urlMap[entity.id]}" var="url">
											<img src="${shareGoodsRootUri}/${url}" alt="" />
										</c:forEach>
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript">
    wxcommon.autoLoad({
        totalPages: ${page.totalPages},                				// 总页数
        pageNo: ${page.pageNo},                         				// 页码
        pageSize: ${page.pageSize},                    					// 分页大小
        timestamp: ${timestamp},										//当前时间戳
        containerId: "dataList",                        				// 显示内容的容器id
        url: "${ctx}/wx/goods/shareGoods/allShareGoodsByJson",          // 请求url
        doRowDataFun: function(rowData){                				// 格式化行级数据
            var shareString = '<li class="shareGoodsList">'+
            			'<a href="${ctx}/wx/goods/shareGoods/shareGoodsDetails?shareGoodsId='+rowData.shareGoodsId+'" target="_self">'+
						'<div class="i_pic">'+
							'<ins>'+
								'<img src="${userHeadImgRootUri}/'+rowData.userHeadImg+'" alt="" />'+
							'</ins>'+
						'</div>'+
						'<div class="i_txt">'+
							'<h3 class="i_time large">'+rowData.userNickName+'<em>'+rowData.createTime+'</em></h3>'+
								'<div class="news">'+
									'<h2 class="blank lar_l">'+rowData.title+'</h2>'+
									'<p class="large">'+rowData.goodsName+'</p>'+
									'<p class="large">期号：'+rowData.goodsTimesName+'</p>'+
									'<p class="larger text-normal">'+rowData.content+'</p>'+
									'<div class="t_img">';
			 var urlList = rowData.shareImages;
			for(var i = 0 ; i < urlList.length ; i++){
				shareString = shareString + '<img src="${shareGoodsRootUri}/'+urlList[i]+'" alt="" />';
			}	 
			shareString = shareString + '</div>'+
							'</div>'+
						'</div>'+
						'</a>'+
					'</li>';
			return shareString;
        }
    });
    </script>
</html>

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
<title>中奖记录</title>
<meta name="keywords" content="中奖记录">
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
	href="${ctx}/static/wx/css/past.css">
<style type="text/css">
    #shareBtn{
    color:#ffffff;
    border-radius: 4px;
    background-color:#da3651;
    width:80%;
    display: block;
    line-height: 25px;
    text-align: center;
    height:25px;
    border:2px solid #da3651;
    }
    #sharedBtn{
    color:#ffffff;
    border-radius: 4px;
    background-color:#da3651;
    display: block;
    line-height: 25px;
    text-align: center;
    height:25px;
    border:2px solid #da3651;
    }
    #overBtn{
    color:#ffffff;
    border-radius: 4px;
    background-color:#da3651;
    display: block;
    line-height: 25px;
    text-align: center;
    height:25px;
    border:2px solid #da3651;
    }
	.con_txt_canyu{
	height:80%;
	width:64%;
	float: right;
	padding-top:40px;
	box-sizing:border-box;
	overflow: hidden;
	}
	.hr-line-dashed {
    border-top: 1px dashed #e7eaec;
    color: #ffffff;
    background-color: #ffffff;
    height: 1px;
    margin: 20px 0;
    }
</style>
</head>
<body style="background: #fff;">
	<div class="max-box">
		<div class="top tc">
			<a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">中奖记录</a>
		</div>
		<!-- 头部结束 -->
		<div class="con">
			<ul id="dataList">
				<c:choose>
					<c:when test="${not empty page.result}">
						<c:forEach items="${page.result}" var="entity">
							<li class="lr line">
								<div class="con_img lr" style="width:30%;float:left">
									<img src="${goodsRootUri}/${entity.thumbnail}" alt="">
								</div>
								<div class="con_txt" style="width:55%;float:left">
									<h5 class="text-heavy large tle">${entity.goodsName}</h5>
									<p>总需：${entity.totalTimes}人次</p>
									<p>参与期号：${entity.times}</p>
									<p>
										幸运号码：<b class="pink">${entity.luckNum }</b>
									</p>
									<p>本期参与：${entity.winngUserBuyTimes }人次</p>
									<p style="font-size:0.80rem">
										揭晓时间：<fmt:formatDate value="${entity.openTime}"
											pattern="yyyy-MM-dd HH:mm" />
									</p>
								</div>
                                 <div class="con_txt_canyu" style="width:15%;display:inline;float:right">
                                     <c:if test="${entity.exchangeState == 1 || entity.exchangeState == 4}">
                                        <a href="javascript:void(0)" id="overBtn">已完成</a>
                                     </c:if>
                                     <img src="${ctx}/static/wx/images/share_sm.png">
                                     <c:if test="${!entity.hasShareGoods}">
                                     <a href="${ctx}/wx/goods/shareGoods/create?goodsTimesId=${entity.id}" id="shareBtn">晒单</a>
                                     </c:if>
                                     <c:if test="${entity.hasShareGoods}">
                                     <a href="javascript:void(0)" id="sharedBtn">已晒单</a>
                                     </c:if>
                                 </div> 
                                 
                                 <span class="pai color-8"><a class="color-8" href="${ctx}/wx/winng/detail?goodsTimesId=${entity.id}">参与详情</a></span>
								<!-- 
								<span class="pai color_${entity.winngState}">${winngStateMap[entity.winngState]}</span>
								 -->
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="Null">
					 		<img src="${ctx}/static/wx/images/no.png" alt=""/>
           					<a href="${ctx}/wx/index" class="b_g">立即夺宝</a>
       					</div>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript">
	 wxcommon.autoLoad({
	    totalPages: ${page.totalPages},                				// 总页数
	    pageNo: ${page.pageNo},                         				// 页码
	    pageSize: ${page.pageSize},                    					// 分页大小
	    timestamp: ${timestamp},										//当前时间戳
	    containerId: "dataList",                        				// 显示内容的容器id
	    url: "${ctx}/wx/order/snatch/record/getWinListByJson",          // 请求url
	    doRowDataFun: function(rowData){                				// 格式化行级数据
			return '<li class="lr line"><a href="${ctx}/wx/winng/detail?goodsTimesId='+rowData.id+'">'+
						'<div class="con_img lr">'+
							'<img src="${goodsRootUri}/'+ rowData.thumbnail +'" alt="">'+
						'</div>'+
							'<div class="con_txt">'+
							'<h5 class="text-heavy large tle">'+rowData.goodsName+'</h5>'+
							'<p>总需：'+rowData.totalTimes+'人次</p>'+
							'<p>参与期号：'+rowData.times+'</p>'+
							'<p>幸运号码：<b class="pink">'+rowData.luckNum+'</b></p>'+
							'<p>本期参与：'+rowData.winngUserBuyTimes+'人次</p>'+
							'<p>揭晓时间：'+rowData.openTime+'</p>'+
						'</div> <span class="pai color_'+rowData.winngState+'">'+rowData.winngState+'</span>'+
					'</a></li>';
	    }
	}); 
</script>
</body>
</html>

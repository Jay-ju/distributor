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
<title>夺宝记录</title>
<meta name="keywords" content="夺宝记录">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
<link rel="Bookmark" href="${ctx}/static/wx/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/global.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/all_record.css" />
<body style="background: #fff;">
	<div class="max-box">
		<div class="top tc">
			<a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">夺宝记录</a>
		</div>
		<!-- 头部结束 -->
		<div class="d_tab line">
			<ul>
				<li><a
					href="${ctx}/wx/order/snatch/record/personal/list?userId=${userId}"
					target="_self">全部</a></li>
				<li class="hot">进行中</li>
				<li><a
					href="${ctx}/wx/order/snatch/record/personal/list?userId=${userId}&state=3"
					target="_self">已揭晓</a></li>
			</ul>
		</div>
		<div class="record">
			<ul id="dataList">
				<c:forEach items="${page.result}" var="entity">
					<c:choose>
						<c:when test="${entity.state==2}">
							<li class="plr clearfloat line"><a
								href="${ctx}/wx/goods/goodsTimes/detail/${entity.goodsTimesId}"
								target="_self" class="inner">
									<div class="r_l">
										<img src="${goodsRootUri}/${entity.thumbnail}" alt="">
									</div>
									<div class="r_c">
										<p class="larger text-normal www">${entity.goodsName}</p>
										<p class="large low">参与期号：${entity.goodsTimesName}</p>
										<span class="r_bar"><i
											style="width:${entity.snatchProgress}%"></i></span>
										<p class="large low">
											总需：${entity.totalTimes}&nbsp;&nbsp;剩余<em class="blur">${entity.totalTimes-entity.totalBuyTimes}</em>
										</p>
										<p class="text-heavy can large">
											本期参与：<em class="pink2">${entity.buyTimes}</em>人次<a
												href="${ctx}/wx/order/snatch/record/num/list?userId=${userId}&goodsTimesId=${entity.goodsTimesId}"
												target="_self" class="blur ">wx/snatch/record/num</a>
										</p>
										<div class="large www">
											揭晓倒计时：<b class="pink2">请稍后，正在揭晓中</b>
										</div>
									</div>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="plr clearfloat line"><a
								href="${ctx}/wx/goods/goodsTimes/detail/${entity.goodsTimesId}"
								target="_self" class="inner">
									<div class="r_l">
										<img src="${goodsRootUri}/${entity.thumbnail}" alt="">
									</div>
									<div class="r_c">
										<p class="larger text-normal www">${entity.goodsName}</p>
										<p class="large low">参与期号：${entity.goodsTimesName}</p>
										<span class="r_bar"><i
											style="width: ${entity.snatchProgress}%"></i></span>
										<p class="large low">
											总需：${entity.totalTimes}&nbsp;&nbsp;剩余<em class="blur">${entity.totalTimes-entity.totalBuyTimes}</em>
										</p>
										<p class="text-heavy can large">
											本期参与：<em class="pink2">${entity.buyTimes}</em>人次<a
												href="${ctx}/wx/order/snatch/record/num/list?userId=${userId}&goodsTimesId=${entity.goodsTimesId}"
												target="_self" class="blur ">查看我的号码</a>
										</p>
										<div class="add">
											<a onclick="addGoods(${entity.goodsTimesId})"
												target="_self">追加</a>
										</div>
									</div>
							</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
	<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
	<script src="${ctx}/static/wx/js/wxcommon.js"></script>
	<script type="text/javascript">
    wxcommon.autoLoad({
        totalPages: ${page.totalPages},                 // 总页数
        pageNo: ${page.pageNo},                         // 页码
        pageSize: ${page.pageSize},                     // 分页大小
        timestamp: ${timestamp},
        containerId: "dataList",                        // 显示内容的容器id
        url: "${ctx}/wx/order/snatch/record/personal/allRecordByJson/?userId=${userId}&state=${state}", // 请求url
        doRowDataFun: function(rowData){                // 格式化行级数据
        	var str = "";
        	if(rowData.state==3){
        	str = '<li class="plr clearfloat line">'+
            '<a href="${ctx}/wx/goods/goodsTimes/detail/'+rowData.goodsTimesId+'" target="_self" class="inner">'+
            '<div class="r_l">'+
            '<img src="${goodsRootUri}/'+rowData.thumbnail+'" alt="">'+
            '</div>'+
            '<div class="r_c">'+
              '<p class="larger text-normal www">'+rowData.goodsName+'</p>'+
              '<p class="large low">参与期号：'+rowData.goodsTimesName+'</p>'+
              '<p class="large low">总需：'+rowData.totalTimes+'</p>'+
              '<p class="text-heavy can large">本期参与：<em class="pink2">'+rowData.buyTimes+'</em>人次<a href="${ctx}/wx/order/snatch/record/num/list?userId=${userId}&goodsTimesId='+rowData.goodsTimesId+'" target="_self" class="blur ">查看我的号码</a></p>'+
              '<div class="quan lr"><p class="large low">获奖者：<a href="'+rowData.winngUserId+'" class="blur">'+rowData.winngUserName+'</a></p>'+
              '<p class="low can large">本期参与<em class="pink2">'+rowData.winngUserBuyTimes+'</em>人次</p>'+
              '<p class="large low">幸运号码：<b class="pink2">'+rowData.luckNum+'</b></p>'+
              '<div class="large www low">揭晓时间：'+rowData.openTime.substr(0,16)+'</div></div>'+
            '</div>'+
          '</a>'+
            '</li>';
            }else{
            	str = '<li class="plr clearfloat line">'+
                '<a href="${ctx}/wx/goods/goodsTimes/detail/'+rowData.goodsTimesId+'" target="_self" class="inner">'+
                '<div class="r_l">'+
                '<img src="${goodsRootUri}/'+rowData.thumbnail+'" alt="">'+
                '</div>'+
                '<div class="r_c">'+
                  '<p class="larger text-normal www">'+rowData.goodsName+'</p>'+
                  '<p class="large low">参与期号：'+rowData.goodsTimesName+'</p>'+
                  '<span class="r_bar"><i style="width:'+rowData.snatchProgress+'%"></i></span>'+
                  '<p class="large low">总需：'+rowData.totalTimes+'&nbsp;&nbsp;剩余<em class="blur">'+(rowData.totalTimes-rowData.totalBuyTimes)+'</em></p>'+
                  '<p class="text-heavy can large">本期参与：<em class="pink2">'+rowData.buyTimes+'</em>人次<a href="${ctx}/wx/order/snatch/record/num/list?userId=${userId}&goodsTimesId='+rowData.goodsTimesId+'" target="_self" class="blur ">查看我的号码</a></p>';
                  if(rowData.state==2){
                	  str = str+'<div class="large www">揭晓倒计时：<b class="pink2">请稍后，正在揭晓中</b></div>';
                  }else{
                	  str = str+'<div class="add"><a onclick="addGoods('+rowData.goodsTimesId+')" target="_self">追加</a></div>';
                  }
                str = str+'</div>'+
              '</a>'+
            '</li>';
            }
        	return str;
        }
    });
    function addGoods(goodsTimesId){
    	$.ajax({
			url: '${ctx}/wx/snatchList/editSnatchListItem',
			data:{
				goodsTimesId:goodsTimesId,
				amount:1
			},
			type: 'post',
			dataType: 'json',
			success: function(result){
				if(200 == result.state){
					location.href="${ctx}/wx/snatchList/list";
				}else{
					alert("修改失败");
				}
			},
			error: function(){
				alert("操作失败");
			}
		});
    }
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<%@ taglib prefix="selfmethod" uri="/selfmethod" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" /> 
        <title>往期揭晓</title> 
        <meta name="keywords" content="往期揭晓"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" >
        <meta name="format-detection" content="telephone=yes">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/past.css" />
    </head>
    <body style="background: #efeff4;">
       <div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx }');" target="_self" class="black">往期揭晓</a>
          </div>
          <div class="used">
          	 <c:choose>
          	 	<c:when test="${jsonResult.data.result.size()>0}">
		             <ul>
		             	<c:forEach items="${jsonResult.data.result}" var="data"> 
		             		<c:choose>
		             			<c:when test="${data.state==2 }">
		             			   <li class="lr larger">
					                 <a href="${ctx }/wx/goods/goodsTimes/detail/${data.id}?userId=${data.winngUserId}" class="ab">期号：${data.times } <em>|</em><strong class="www">即将揭晓，正在倒计时</strong></a>
					               </li>
		             			</c:when>
		             			<c:otherwise>
		             				<li>
					                  <h5 class="large_norma"><a href="${ctx }/wx/goods/goodsTimes/detail/${data.id}?userId=${data.winngUserId}" class="www lr">
					                  	参与期号：${data.times } <em>|</em>揭晓时间：<fmt:formatDate value="${selfmethod:dealstrtodate(data.openTimeStr)}" pattern="yyyy-MM-dd  HH:mm:ss"/></a></h5>
					                  <div class="info">
					                     <div class="info_pic">
					                     	<c:choose> 
					                     		<c:when test="${data.winngUserHeadImg!=null}">
					                     			<img src="${ userHeadImgRootUri }/${data.winngUserHeadImg}" alt="">
					                     		</c:when>
					                     		<c:otherwise>
					                     			<img src="${ ctx}/static/images/head/default-head.png" alt="">
					                     		</c:otherwise>
					                     	</c:choose>
					                     </div>
					                     <div class="info_txt">
					                        <p>获奖者：<a href="#" class="blur">${data.winngUserName }</a></p>
					                        <p>用户ID：<b class="text-heavy">${data.winngUserIdentity }(唯一不变的标识)</b></p>
					                        <p>幸运号码：<b class="pink2">${data.luckNum }</b></p>
					                        <p>本期参与：<b class="pink2">${data.winngUserBuyTimes }</b>人次</p>
					                     </div>
					                  </div>
					               </li>
		             			</c:otherwise>
		             		</c:choose>
		             	</c:forEach>
		             </ul>
          	 	</c:when>
          	 	<c:otherwise>
          	 		<div class="used_null">
			            <img src="${ctx }/static/wx/images/pic_null.png" alt=""/>
			        </div>
          	 	</c:otherwise>
          	 </c:choose>
          </div>
       </div>
    </body>
    <script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/static/wx/js/wxcommon.js"></script>
   	<script type="text/javascript">
		$(function(){
			 wxcommon.autoLoad({
			        totalPages: ${page.totalPages},                 // 总页数
			        pageNo: ${page.pageNo},                         // 页码
			        pageSize: ${page.pageSize},                     // 分页大小
			        timestamp: ${timestamp},
			        containerId: "dataList",                        // 显示内容的容器id
			        url: "${ctx}/wx/goods/goodsTimes/record/listByJson/${goodsId}",          // 请求url
			        doRowDataFun: function(rowData){               // 格式化行级数据
			        		var imgUrl="${ ctx}/static/images/head/default-head.png";
							if(rowData.userHeadImg!=null){
								var imgUrl='${userHeadImgRootUri}/'+rowData.userHeadImg;
							}				        	
			          	return '<li><div class="all_pic"><img src="'+imgUrl+'" alt="">'
			          	+'</div><div class="all_txt"><p><a href="${ctx}/wx/snatch/others/list?userId=3"  class="large_normal blur">'+rowData.userNickName+'</a></p>'
			          	+'<p class="large_normal text-heavy">参与了<b class="pink">${data.buyTimes }</b>次'
			          	+'<em class="text-low2"><fmt:formatDate value="${selfmethod:dealstrtodate('+rowData.snatchTimeStr+')}" pattern="yyyy-MM-dd  HH:mm:ss:.SSS"/></em>'
			          	+'</p></div></li>';
			        }
			    });
		});
	</script>
</html>   

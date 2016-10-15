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
        <title>夺宝号码</title> 
        <meta name="keywords" content="夺宝号码"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/number.css" />
        <script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/wx/js/wxcommon.js"></script>
    <body style="background: #fff;">
       <div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx }');" target="_self" class="black">夺宝号码</a>
          </div>
          <!-- 头部结束 -->
         <div class="number clearfloat">
           <div class="number_in">
	            <h6 class="lar_l text-heavy">${jsonResult.data.goodsName}</h6>
	            <p class="text-heavy">期号：${jsonResult.data.goodsTimesName }</p>
	            <p class="text-heavy">本期参与人次:<em class="primary">${jsonResult.data.buyTimes }</em>人次</p>
           </div>
           <div class="num_time">
           		<dl>
           			<dt>夺宝时间</dt><dd><fmt:formatDate value="${selfmethod:dealstrtodate(jsonResult.data.lastSnatchTime)}" pattern="yyyy-MM-dd  HH:mm:ss"/></dd>
           		</dl>
           		<dl>
           			<dt>参与人次</dt><dd>${jsonResult.data.buyTimes }人次</dd>
           		</dl>
           </div>
           <ul class="clearfloat">
         		<c:forEach items="${jsonResult.data.nums}" var="num">
		             <li>${num }</li>
         		</c:forEach>
           </ul>
         </div>
       </div>
    </body>
</html>   

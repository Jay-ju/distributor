<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" /> 
        <title>红包</title> 
        <meta name="keywords" content="红包"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
    <body style="background: #fff;">
       <div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">红包</a>
          </div>
          <!-- 头部结束 -->
          <div class="red_tab larger">
              <ul>
                <li class="line"><a href="${ctx}/wx/record/redPack/list?userId=${userId}&type=1">可使用</a></li>
                <li class="hot primary">已过期/已使用</li>
              </ul>
          </div>
          <div class="content">
            <div class="null">
                  <h6 class="p-plus">&nbsp;&nbsp;还没红包哦！</h6>
                  <span><a href="${ctx}/wx/index">立即夺宝</a></span>
                  <!-- 
                  <span><a href="${ctx}/wx/record/jifen/query?userId=${userId}">积分抽奖</a></span>
                   -->
            </div>
          </div>  
       </div>
       <script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
       <script src="${ctx}/static/wx/js/wxcommon.js"></script>
    </body>
</html>   

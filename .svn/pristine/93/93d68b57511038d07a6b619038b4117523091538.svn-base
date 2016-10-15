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
        <title>个人中心</title> 
        <meta name="keywords" content="个人中心"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/all_record.css" />
    <body style="background: #fff;">
       <div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">个人中心</a>
          </div>
          <!-- 头部结束 -->
          <div class="bar">
            <div class="bar_pic">
               <img src="${userHeadImgRootUri}/${headImg}" alt="">
            </div>
            <div class="bar_txt">
              <p class="large">${user.nickName}</p>
              <p class="normal">ID：${user.userName}</p>
            </div>
          </div>
          <div class="Tab line larger">
             <ul>
               <li><a href="${ctx}/wx/order/snatch/record/others/list?userId=${user.id}">夺宝记录</a></li>
               <li class="lihot">中奖纪录</li>
               <li><a href="${ctx}/wx/goods/shareGoods/listByPersonal?userId=${user.id}">晒单分享</a></li>
             </ul>
          </div>
         <div class="record">
             <ul id="dataList">
             <c:forEach items="${page.result}" var="entity" >
              <li class="plr clearfloat line">
                 <a href="${ctx}/wx/winng/detail/?goodsTimesId=${entity.id}" target="_self" class="inner">
                   <div class="r_l">
                   <img src="${goodsRootUri}/${entity.thumbnail}" alt="">
                   </div>
                   <div class="r_c">
                     <p class="larger text-normal www">${entity.goodsName}</p>
                     <p class="large low">总需：${entity.totalTimes}人次</p>
                     <p class="large low">参与期号：${entity.times}</p>
                     <p class="large low">幸运号码：<b class="pink2">${entity.luckNum}</b></p>
                     <p class="low can large">本期参与：${entity.winngUserBuyTimes}人次</p>
                     <div class="large www">揭晓时间：<fmt:formatDate value="${entity.openTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                   </div>
                 </a>
               </li>
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
        url: "${ctx}/wx/order/snatch/record/others/allWinnerRecordByJson?userId=${user.id}", // 请求url
        doRowDataFun: function(rowData){                // 格式化行级数据
        	var str = '<li class="plr clearfloat line">'+
                '<a href="${ctx}/wx/goods/goodsTimes/detail/'+rowData.id+'" target="_self" class="inner">'+
            '<div class="r_l">'+
            '<img src="${goodsRootUri}/'+rowData.thumbnail+'" alt="">'+
            '</div>'+
            '<div class="r_c">'+
              '<p class="larger text-normal www">'+rowData.goodsName+'</p>'+
              '<p class="large low">总需：'+rowData.totalTimes+'人次</p>'+
              '<p class="large low">参与期号：'+rowData.times+'</p>'+
              '<p class="large low">幸运号码：<b class="pink2">'+rowData.luckNum+'</b></p>'+
              '<p class="low can large">本期参与：'+rowData.winngUserBuyTimes+'人次</p>'+
              '<div class="large www">揭晓时间：'+rowData.openTime.substr(0,16)+'</div>'+
              '</div>'+
              '</a>'+
            '</li>';
        	return str;
        }
    });
</script>
    </body>
</html>   

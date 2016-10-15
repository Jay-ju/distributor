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
                <li class="hot primary">可使用</li>
                <li class="line"><a href="${ctx}/wx/record/redPack/list?userId=${userId}&type=2">已过期/已使用</a></li>
              </ul>
          </div>
          <div class="content">
             <ul id="dataList">
             <c:forEach items="${page.result}" var="entity">
               <li class="line">
                 <div class="conLeft p-plus">
                    ${entity.total}元
                 </div>
                 <div class="conRight larger">
                   <h5><c:choose><c:when test="${entity.category==1}">夺宝红包</c:when><c:otherwise>夺宝红包</c:otherwise></c:choose></h5>
                   <p class="normal text-low2">余额：<b class="pink">${entity.balance}乐金币</b></p>
                   <p class="normal text-low2">有效期：<fmt:formatDate value="${entity.expireTime}" pattern="yyyy-MM-dd HH:mm"/></p>
                 </div>
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
        url: "${ctx}/wx//record/redPack/listByJson?userId=${userId}&type=${type}", // 请求url
        doRowDataFun: function(rowData){                // 格式化行级数据
        	var str = '<li class="line">'+
                '<div class="conLeft p-plus">'+rowData.total+'元</div><div class="conRight larger"><h5>';
         if(rowData.category==1){
        	 str = str+'夺宝红包';
         }else{
        	 str = str+'生活红包';
         }
           str = str+'</h5><p class="normal text-low2">余额：<b class="pink">'+rowData.balance+'夺宝币</b></p>'+
           '<p class="normal text-low2">有效期：'+rowData.expireTime.substr(0,16)+'</p>'+
         '</div></li>';
        	return str;
        }
    });
</script>
    </body>
</html>   

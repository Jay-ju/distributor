<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       	<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" >
       	<title>便民服务</title>
       	<link rel="stylesheet" type="text/css" href="${ctx}/static/service/css/style.css" />
       	<link rel="stylesheet" type="text/css" href="${ctx}/static/service/css/global.css" />
       	<link rel="stylesheet" type="text/css" href="${ctx}/static/service/css/index.css" />
    </head>
	<body>
       <div class="max-box">
          <div class="main">
            <ul class="main_f">
             <c:forEach items="${page.result}" var="entity">
	              <li class="line clearfloat">
	                    <a href="${staticHtmlRootUri}/${convenience}/${ entity.htmlUrl}" target="_self" >
	                      <div class="con">
	                        <input type="hidden" name="ids" value="${entity.id}"/>
                        	<p class="cp lar_l blank">${entity.title}</p>
	                        <p class="large text-low2">联系人：${entity.linker}</p>
	                      </div>
	                   </a>
	                   <div class="con_tel"><a href="tel://${entity.tel}"></a></div>
	              </li>
              </c:forEach>
            </ul>
          </div>
       </div>
    </body>
</html>
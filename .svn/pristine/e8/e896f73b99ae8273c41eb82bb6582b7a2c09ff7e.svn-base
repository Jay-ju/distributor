<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
    <title>修改昵称</title>
    <meta name="keywords" content="修改昵称">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="favicon.ico" >
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" >
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" href="${ctx}/static/wx/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/mine.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/js/Validform/Validform_v5.3.2_min.css" />
    <script type="text/javascript" src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
    <script>
        jQuery(document).ready(function($) {
            $('.del').click(function(){
                 $('.txtinput').val('');
            });
        });/*清空*/
    </script>
</head>
<body style="background: #F3F4F6;">
<div class="max-box container">
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/wx/user/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <div class="top tc row">
        <div class="col-xs-12">
            <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">修改昵称</a>
            <button id="btn_sub" class="keep">保存</button>
        </div>
    </div>
    <!-- 头部结束 -->
   <div class="name">
       <div class="name_input line">
           <form:input type="text" path="nickName" cssClass="lr txtinput" datatype="s4-20" />
           <i class="del"></i>
       </div>
       <p  id="msg" class="large_normal text-low2 lr">4-20个字符，可由中中文、英文、数字、“_”、“-”组成</p>
   </div>
   </form:form>
</div>
<script type="text/javascript" src="${ctx}/static/wx/js/Validform/Validform_v5.3.2_min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript">
$(function(){
	$("#inputForm").Validform( {
		//btnSubmit:"#btn_sub",
		tiptype:function(msg,o,cssctl){
			var objtip=$("#msg");
			cssctl(objtip,o.type);
			objtip.text(msg);
		},
		ajaxPost:false
	} );
})
</script>

</body>
</html>
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
        <title>编辑收货地址</title> 
        <meta name="keywords" content="编辑收货地址"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" >
        <meta name="format-detection" content="telephone=yes">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/mine.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/city/area.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/js/Validform/Validform_v5.3.2_min.css" />
    </head>
    <body style="background: #fff;">
		<div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">${empty address.id ? "新增":"编辑"}收货地址</a>
          </div>
          <!-- 头部结束 -->
          <form:form id="inputForm" modelAttribute="address" action="${ctx}/wx/receiveAddress/save" method="post">
          <form:hidden path="id"/>
          <input type="hidden" name="userId" value="${userId}"/>
          <div class="content">
				<ul>
					<li class="line"><form:input path="receiver" placeholder="收货人" datatype="s1-20" errormsg="收货人最多20个字符！" nullmsg="请填写收货人"
							cssClass="larges text-heavy plr Validform_checktip" /></li>
					<li class="line"><form:input path="tel" placeholder="手机号码" datatype="m" errormsg="请正确填写手机号码！" nullmsg="请填写手机号码"
							cssClass="larges text-heavy plr Validform_checktip" /></li>
					<li class="line">
						<div id="addAddress">
							<div class="address_input">
								<input value="${address.province}${address.city}${address.district}"
									class="address_input1 larges text-heavy plr Validform_checktip" type="text"
									placeholder="所在地区" id="shengshi" onClick="getProvinceBuy()"
									readonly="readonly" datatype="*" nullmsg="请填写地区">
							</div>
							<form:hidden id="province" path="province"/>
							<form:hidden id="city" path="city"/>
							<form:hidden id="district" path="district"/>
						</div>
					</li>
				</ul>
				<p class="line"><form:textarea path="detailAddress" placeholder="详细地址" class="larges text-heavy plr Validform_checktip" datatype="s1-50" errormsg="收货人最多50个字符！" nullmsg="请填写详细地址" /></p><span id="msg" style="margin-left:30px;"></span>
          </div><!-- 信息填写 -->
            <div class="new-built built">
               <!-- <a href="edit.html" target="_self" class="text-f plus bg_1">保存</a> -->
               <button type="submit" value="保存" class="text-f plus bg_1">保存</button>
            </div>
            </form:form>
       </div>
       <script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
       <script type="text/javascript" src="${ctx}/static/wx/js/jquery-input/jquery.placeholder.min.js"></script>
       <script type="text/javascript" src="${ctx}/static/wx/city/area.js"></script>
       <script type="text/javascript" src="${ctx}/static/wx/js/Validform/Validform_v5.3.2_min.js"></script>
       <script src="${ctx}/static/wx/js/wxcommon.js"></script>
       <script type="text/javascript">
$(function(){
	$("#inputForm").Validform( {
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

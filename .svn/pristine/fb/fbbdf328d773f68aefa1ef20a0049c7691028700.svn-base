<%@page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8" %>
<%@include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>手机验证</title>
    <meta name="keywords" content="手机验证">
    <meta name="description" content="手机验证">
    <link rel="Bookmark" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/mine.css"/>
</head>
<body style="background: #edeef2;">
<div class="max-box">
    <div class="top tc">
		<a href="javascript:wxcommon.goback('${ctx }');" target="_self" class="black">手机验证</a>
	</div>
    <form id=""  method="post">
    	<input type="hidden" id="userId" name="userId" value="${userId}"/>
    	<input type="hidden" id="uid" name="uid" value=""/>
        <div class="phone_box plr mt5">
        	<label for="mobileNo" class="lab_tel"></label>
        	<input type="text" name="mobileNo" id="mobileNo" value="" placeholder="电话号码" class="telnum"/>
        </div>
        <div class="phone_box plr" style="border:0px;">
        	<label for="smsCode" class="lab_code"></label>
        	<input type="text" name="smsCode" id="smsCode" value="" placeholder="请输入验证码" class="telnum verti"/>
        	<a href="javascript:;" onClick="sendSmsCode()" class="get_code">获取验证码</a>
        </div> 
        <div class="new-built2 built back-none">
           <!-- <button type="submit" value="保存" class="text-f plus bg_5">保存</button> -->
           <a href="javascript:;" onclick="bindMobileNo()" class="text-f plus bg_5">保存</a>
        </div>
    </form>
    <script type="text/javascript" src="${ctx}/static/wx/js/jquery-1.9.1.min.js"></script>
    <script src="/stlife/static/wx/js/wxcommon.js"></script>
    <script type="text/javascript">
    function sendSmsCode()
    {
    	var mobileNo =$('#mobileNo').val();
    	var type=1;
    	var uid=Date.parse(new Date());
    	$('#uid').val(uid);
    	 $.ajax({
	            url: "${ctx}/app/user/sendSmsCode",
	            data: {
	               mobileNo:mobileNo,type:type,uid:uid
	            },
	            type: 'get',
	            dataType: 'json',
	            success: function (result) {
	                if (result.state == 200) {
	                wxcommon.message("发送成功");
	       //         setTimeout("wxcommon.goback('${ctx }')", 3000 );
	              //  wxcommon.goback('${ctx }');
	                	//    alert("绑定成功");
	                }else if(result.state == 301)
	                {
	                 wxcommon.message("手机号码无效");
	                	//alert("该账户已使用");
	                }else if(result.state == 303)
	                {
	                 wxcommon.message("手机号码不存在");
	                	//alert("该账户已使用");
	                }else if(result.state == 302)
	                {
	                 wxcommon.message("该手机号码已被注册");
	                	//alert("该账户已使用");
	                }else
	                {
	                 wxcommon.message("发送失败");
	                	//alert("绑定失败");
	                }
	            },
	            error: function () {
	 				wxcommon.message("发送失败");
	            }
	        });
    }
    
    function bindMobileNo()
    {
    	var userId=$('#userId').val();
    	var mobileNo =$('#mobileNo').val();
    	var smsCode =$('#smsCode').val();
    	var uid=$('#uid').val();
    	 $.ajax({
	            url: "${ctx}/app/user/bindMobileNo",
	            data: {
	              userId:userId,smsCode:smsCode,mobileNo:mobileNo,uid:uid
	            },
	            type: 'post',
	            dataType: 'json',
	            success: function (result) {
	                if (result.state == 200) {
	                wxcommon.message("绑定成功");
			        setTimeout("wxcommon.goback('${ctx }')", 3000 );
	                }else if(result.state == 301)
	                {
	                 wxcommon.message("手机号码无效");
	                	//alert("该账户已使用");
	                }else if(result.state == 304)
	                {
	                 wxcommon.message("验证码错误");
	                	//alert("该账户已使用");
	                }else if(result.state == 302)
	                {
	                 wxcommon.message("该手机号码已被注册");
	                	//alert("该账户已使用");
	                }else
	                {
	                 wxcommon.message("绑定失败");
	                	//alert("绑定失败");
	                }
	            },
	            error: function () {
	 				wxcommon.message("绑定失败");
	            }
	        });
    }
    
    </script>
</div>
</body>
</html>

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
    <title>支付宝绑定</title>
    <meta name="keywords" content="支付宝绑定">
    <meta name="description" content="支付宝绑定">
    <link rel="Bookmark" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/mine.css"/>
</head>
<body style="background: #edeef2;">
<div class="max-box">
    <div class="top tc">
		<a href="javascript:wxcommon.goback('${ctx }');" target="_self" class="black">支付宝绑定</a>
	</div>
    <form id="bindAlipay"  method="post">
    	<input type="hidden" id="userId" name="userId" value="${userId}">
    	<input type="hidden" id="type" name="type" value="1">
    	<input type="hidden" id="accountBank" name="accountBank" value="">
        <div class="phone_box plr mt5">
        	<input type="text" name="accountName" id="accountName" value="" placeholder="请输入支付宝姓名" class="telnum" style="width:100%"/>
        </div>
        <div class="phone_box plr" style="border:0px;">
        	<input type="text" name="accountCode" id="accountCode" value="" placeholder="请输入支付宝账号" class="telnum" style="width:100%"/>
        </div> 
        
        <div class="new-built2 built back-none">
          <!--  <button type="submit" value="保存" class="text-f plus bg_5">确认</button> -->
           <a href=" javascript:;" onClick="bindAlipay()" class="text-f plus bg_5">确认</a>
        </div>
    </form>
    <script type="text/javascript" src="${ctx}/static/wx/js/jquery-1.9.1.min.js"></script>
    <script src="/stlife/static/wx/js/wxcommon.js"></script>
    <script type="text/javascript">
    	function bindAlipay()
    	{
    		var userId=$('#userId').val();
    		var type=$('#type').val();
    		var accountName=$('#accountName').val();
    		var accountCode=$('#accountCode').val();
    		var accountBank=$('#accountBank').val();
    		 $.ajax({
			            url: "${ctx}/app/user/bindAlipayOrBank",
			            data: {
			               userId:userId,type:type,accountName:accountName,accountCode:accountCode,accountBank:accountBank
			            },
			            type: 'get',
			            dataType: 'json',
			            success: function (result) {
			                if (result.state == 200) {
			                wxcommon.message("绑定成功");
			                setTimeout("wxcommon.goback('${ctx }')", 3000 );
			                	//    alert("绑定成功");
			                }else if(result.state == 303)
			                {
			                 wxcommon.message("该账户已使用");
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

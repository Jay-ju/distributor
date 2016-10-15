<%@page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,user-scalable=no"/>
    <title>完善资料</title>
    <meta name="keywords" content="完善资料">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="favicon.ico">
    <meta
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
            name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet"
          href="${ctx}/static/wx/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/mine.css"/>
          <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/js/layer/need/layer.css"/>
          <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
</head>
<body>
<div class="max-box container">
    <div class="top tc row ">
        <div class="top tc">
            <a href="javascript:wxcommon.goback('${ctx}');" target="_self"
               class="black">完善资料</a>
               <input type="hidden" id="userId" name="userId" value="${user.id}"/>
        </div>
    </div>
    <!-- 头部结束 -->
    <div class="main_box container">
        <div class="data row">
            <div class="data_pic line lr">
                <em class="large_p text-normal">头像</em>
                <ins>
                    <c:choose>
                        <c:when test="${fn:startsWith(headImg, 'http://') or fn:startsWith(headImg, 'https://')}">
                            <img src="${headImg}"/>
                        </c:when>
                        <c:otherwise>
                            <img src="${userHeadImgRootUri}/${headImg}"/>
                        </c:otherwise>
                    </c:choose>
                </ins>

            </div>
            <div class="data_new">
                <ul>
                    <li class="line"><em class="large_p text-normal">ID</em> <strong
                            class="low large">${user.userName}</strong></li>
                    <li class="line"><a
                            href="${ctx}/wx/user/editNickName?userId=${user.id}"> <em
                            class="large_p text-normal">昵称</em> <strong class="blur large">${user.nickName}</strong>
                    </a></li>
                </ul>
            </div>
        </div>
        <!-- 个人信息 -->
        <div class="manage line data_pic" style="height:auto">
            <ul>
                <li class="line"><a href="${ctx}/wx/receiveAddress/detail?userId=${user.id}"target="_self"> <em class="large_p text-normal">地址管理</em>
                    <ins></ins></a></li>
                 <li class="line"><a href="javascript:;" target="_self" style="position: relative;"> <em class="large_p text-normal">QQ</em>
                	<div class="qinput_box" onclick="style_exchange()"><ins></ins>
                	<span id="">${empty member.qq ? "请输入qq号码" :  member.qq} </span></div>
                	<input type="num" name="bindqq" id="bindqq" value="" class="qq_input" maxlength="15"/></a></li>
                <li class="line"><a href="${ctx}/wx/user/bindPhoneWX?userId=${user.id}" target="_self"> <em class="large_p text-normal">手机验证</em><ins class="fr pr8"></ins><em class="large_p text-normal fr pr5">${user.mobileNo}</em></a></li>
                <li><a href="${ctx}/wx/user/bindAccountWX?userId=${user.id}&type=1" target="_self" > <em class="large_p text-normal">提现管理</em><ins class="fr pr8"></ins><em class="large_p text-normal fr pr5">${member.accountCode}</em></a></li>
            </ul>
        </div>
        <!-- 管理 -->
    </div>
    <div class="jf_exchange" style="margin-top:4rem">
    	<p class="tc">
         	<a href="javascript:;" onclick="saveqq()" class="red_btn2">保存</a>
        </p>
    </div>
</div>
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script src="${ctx}/static/wx/js/layer/layer.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
		function cash_draw(){
			var html='';
			//html+='<p style="width:100%;height:2.5rem;border-bottom:1px solid #d9d9d9;text-align:center;color:#4c4c4c;line-height:2.5rem" onclick=window.location.href="${ctx}/wx/user/bindAccountWX?userId=${user.id}&type=2">支付宝</p>';
			html+='<p style="width:100%;height:2.5rem;text-align:center;color:#4c4c4c;line-height:2.5rem" onclick=window.location.href="${ctx}/wx/user/bindAccountWX?userId=${user.id}&type=1">银行卡</p>';
			layer.open({
		    title: [
		        '请选择',
		        'background-color:#fff; color:#58bfe7;border-bottom:1px solid #58bfe7;text-align:center'
		    ],
		    content: html  
		});
		}
		
		function style_exchange(){
			$(".qinput_box").css("display","none");
			$(".qq_input").show();
			$(".qq_input").focus();
			}
			
	function saveqq()
    {
    	var userId=$('#userId').val();
    	var qq=$('#bindqq').val();
    	 $.ajax({
	            url: "${ctx}/app/user/bindQQ",
	            data: {
	               userId:userId,qq:qq
	            },
	            type: 'get',
	            dataType: 'json',
	            success: function (result) {
	                if (result.state == 200) {
	                wxcommon.message("保存成功");
	                $("#bindqq").html(result.qq);
	       //         setTimeout("wxcommon.goback('${ctx }')", 3000 );
	              //  wxcommon.goback('${ctx }');
	                	//    alert("绑定成功");
	                }else if(result.state == 303)
	                {
	                 wxcommon.message("该qq号码已使用");
	                	//alert("该账户已使用");
	                }else
	                {
	                 wxcommon.message("保存失败");
	                	//alert("绑定失败");
	                }
	            },
	            error: function () {
	 				wxcommon.message("保存失败");
	            }
	        });
    }
			
</script>
</body>
</html>
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
        <title>积分商城</title> 
        <meta name="keywords" content="积分商城"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
        <script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
        <%-- <script type="text/javascript" src="${ctx}/static/wx/js/int.js"></script> --%>
    <body style="background: #fff;">
       <div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">积分商城</a>
          </div>
          <!-- 头部结束 -->
          <div class="banner">
             <img src="${ctx}/static/wx/images/pay/banner.png" alt="">
          </div>
          <div class="integral lr">
             <p>我的积分：<b id="jifen" class="largest primary">${jifen}</b></p>
             <button class="promptly">立即抽奖</button>
          </div>
          <div class="hr"></div>
          <div class="rule lr">
             <h6 class="largest_plus">活动规则</h6>
             <p>1.在活动页面上使用Q币充值钻石，1Q币能充10钻石。在游戏客户端购买并使用非永久召唤图标‘魅蓝面具’，可获赠150钻石，每个QQ号码只能获赠一次。总钻石持有量可以在页面上查询。</p>
             <p>2.在活动页面上使用Q币充值钻石，1Q币能充10钻石。在游戏客户端购买并使用非永久召唤图标‘魅蓝面具’，可获赠150钻石，每个QQ号码只能获赠一次。总钻石持有量可以在页面上查询。</p>
             <p>3.在活动页面上使用Q币充值钻石，1Q币能充10钻石。在游戏客户端购买并使用非永久召唤图标‘魅蓝面具’，可获赠150钻石，每个QQ号码只能获赠一次。总钻石持有量可以在页面上查询。</p>
          </div>
          <div class="bgColor" style="display:none;"></div>
          <div id="r1" class="bgpic">
            <ins></ins>
            <button class="largest_plus again">再试一次</button>
          </div>
          <div id="r2" class="bgpic bgpic2">
             <ins></ins>
             <h6 id="drawNum"></h6>
             <span class="again">再来一次</span>
          </div>
          <!--确认框-->
		<div id="tips" class="hint" style="display: none;">
			<div class="hint_tle">提示</div>
			<div class="hint_tex">积分不够100，无法抽奖！</div>
			<div class="hint_btn">
				<input type="button" value="确定" onclick="showTips(false)" />
			</div>
		</div>
       </div>
       <script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript">
function showTips(show){
	   if(show){
		   $("#tips").attr("style","display:block");
		   $('.bgColor').stop().show();
	   }else{
		   $("#tips").attr("style","display:none");
		   $('.bgColor').stop().hide();
	   }
}
	$(function(){
		$(".promptly").click(function(){
			$.ajax({
				url: '${ctx}/wx/record/jifen/redPack',
				data:{
					userId: ${userId}
				},
				type: 'post',
				dataType: 'json',
				success: function(result){
					if(result.state==200){
						$("#jifen").text($("#jifen").text()-100);
						if(result.data.redPackMoney==0){
							$('#r1').stop().show();
							$('.bgColor').stop().show();
						}else{
							$("#drawNum").text(result.data.redPackMoney+"元");
							$('.bgColor').stop().show();
							$('#r2').stop().show();
						}
					}else if(result.state==301){
						showTips(true);
					}else{
						alert("出错了");
					}
				},
				error: function(){
					alert("操作失败");
				}
			});
			$("#r1,#r2").click(function(){
				$('#r1').stop().hide();
				$('#r2').stop().hide();
				$('.bgColor').stop().hide();
			});
			
			
		});
	});
</script>
    </body>
</html>   

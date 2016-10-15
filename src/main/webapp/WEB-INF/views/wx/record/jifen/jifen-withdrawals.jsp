<%@page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8" %>
<%@include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" /> 
        <title>积分提现</title> 
        <meta name="keywords" content="积分提现"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
	</head>
	<body style="background-color: #fff;">
		<div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black tc">积分提现</a>
             
              <input type="hidden" id="userId" name="userId" value="${user.id}" />
          </div>
          <!-- 头部结束 -->
          <div class="jf_exchange">
          	<div class="jf_box">
          		积分余额 <span class="primary" id="jifen">${member.jifen}</span>
          	</div>
          	<p class="hui">选择兑换金额（100积分=1元（手续费${withDrawFee}%））</p>
          	<ul class="jf_ul">
          		<li class="on"><a href="javascript:;">10</a></li>
          		<li><a href="javascript:;">20</a></li>
          		<li><a href="javascript:;">50</a></li>
          		<li><a href="javascript:;">100</a></li>
          		<li><a href="javascript:;">300</a></li>
          		<li><a href="javascript:;" class="other">其他</a>
          			<input type="text" name="" id="" placeholder="其他" style="display: none;" onBlur="fuzhi(this)" class="input_other"/>
          		</li>
          	</ul>
          	<p class="hui">所需积分: <span id="sxjf"> </span> </p>
          	<p class="tc">
          		<a href="javascript:;" onclick="exchange()" class="red_btn2">立即申请提现</a>
          	</p>
          	<p class="plr text-heavy larger">提现规则</p>
          	<p class="lr color-7 large_normal mb10">一、单笔提现最低10元，提现金额为10的倍数。实际到账金额为扣除手续费后的金额。</p>
          	<p class="lr color-7 large_normal mb10">二、单用户每天可申请2次提现，超出次数部分后续处理。</p>
          	<p class="lr color-7 large_normal mb10">三、当天17：00前提交的申请当天处理，17：00后提交的申请次日处理。</p>
          	<p class="lr color-7 large_normal mb10">四、当天提现当天到账，如遇节假日等特殊原因，以银行具体到账时间为准。</p>
          	<p class="lr color-7 large_normal mb10">五、提现处理后正常2小时内到账，若超过24小时提现未到账，请及时与我们联系。</p>
          	<p class="lr color-7 large_normal mb10">六、请务必填写真实有效的提现银行卡信息。</p>
          </div>
          
       </div>
		<script src="${ctx}/static/js/jquery/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
	    <script src="${ctx}/static/wx/js/wxcommon.js"></script>
	    <script type="text/javascript">
	        $('#sxjf').html(1000);
	    	$(".jf_ul li").click(function(){
	    		$(".jf_ul li").removeClass("on");
	    		$(this).addClass("on");
	    		var jiden=$(this).children("a").html();
	    		$('#sxjf').html(jiden*100);
	    	})
	    	$(".jf_ul li:last-child").click(function(){
	    		$(this).find("a").hide();
	    		$(this).find("input").show();
	    		$(".input_other").focus();
	    		$(".input_other").attr("placeholder","");
	    	})
	    	
	    	
	    	function fuzhi(that)
	    	  {
	    	  	checkRate($(that).val());
	    	  	$('#sxjf').html($(that).val()*100);
	    	  }
	    	  
	    	  function checkRate(value)  
				{  
				     var re = /^[1-9]+[0-9]*]*$/; 
				  
				     if (!re.test(value))  
				    {  
				        wxcommon.message("请输入正整数");
				        return false;  
				     }  
				}  
	    	
function exchange()
    {
    	var userId=$('#userId').val();
    	var dhjifen=$('#sxjf').html();
    	checkRate(dhjifen);
    	 $.ajax({
	            url: "${ctx}/app/record/jifen/withdrawals",
	            data: {
	               userId:userId,dhjifen:dhjifen
	            },
	            type: 'get',
	            dataType: 'json',
	            success: function (result) {
	                if (result.state == 200) {
	                //wxcommon.message("提现申请成功");
	                //$("#jifen").html(result.jifen);
                    wxcommon.message("提现申请成功", function(){
                        window.location.href="${ctx}/wx/user/home";
                    });
	                }else if(result.state == 301)
	                {
	                 wxcommon.message("积分不足");
	                	//alert("该账户已使用");
	                }else if(result.state == 303)
	                {
	                 wxcommon.message("请先绑定银行卡");
	                	//alert("该账户已使用");
	                }else
	                {
	                 wxcommon.message("提现申请失败");
	                	//alert("绑定失败");
	                }
	            },
	            error: function () {
	 				wxcommon.message("提现申请失败");
	            }
	        });
    }
	    </script>
	</body>
</html>

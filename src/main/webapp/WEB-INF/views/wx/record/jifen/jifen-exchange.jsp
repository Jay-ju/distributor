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
        <title>积分兑换</title> 
        <meta name="keywords" content="积分兑换"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
	</head>
	<body style="background-color: #fff;">
		<div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">积分兑换</a>
             <input type="hidden" id="userId" name="userId" value="${user.id}" />
          </div>
          <!-- 头部结束 -->
          <div class="jf_exchange">
          	<div class="jf_box">
          		积分余额 <span class="primary" id="jifen">${member.jifen}</span>
          	</div>
          	<p class="hui">选择兑换金额（100积分=1元）</p>
          	<ul class="jf_ul">
          		<li class="on"><a href="javascript:;">5</a></li>
          		<li><a href="javascript:;">10</a></li>
          		<li><a href="javascript:;">30</a></li>
          		<li><a href="javascript:;">50</a></li>
          		<li><a href="javascript:;">100</a></li>
          		<li><a href="javascript:;" class="other">其他</a>
          			<input type="text" name="" id="" placeholder="其他" style="display: none;" onBlur="fuzhi(this)" class="input_other"/>
          		</li>
          	</ul>
          	<p class="hui">所需积分: <span id="sxjf"> </span> </p>
          	<p class="tc">
          		<a href="javascript:;" onclick="exchange()" class="red_btn2">立即兑换</a>
          	</p>
          	
          </div>
          
       </div>
		<script src="${ctx}/static/js/jquery/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
	    <script src="${ctx}/static/wx/js/wxcommon.js"></script>
	    <script type="text/javascript">
	        $('#sxjf').html(500);
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
				      //  alert("请输入正整数");  
				         wxcommon.message("请输入正整数");
				      //  input.rate.focus();  
				        return false;  
				     }  
				}  
	    	
 function exchange()
    {
    	var userId=$('#userId').val();
    	var dhjifen=$('#sxjf').html();
    		checkRate(dhjifen);
    	 $.ajax({
	            url: "${ctx}/app/record/jifen/exchange",
	            data: {
	               userId:userId,dhjifen:dhjifen
	            },
	            type: 'get',
	            dataType: 'json',
	            success: function (result) {
	                if (result.state == 200) {
	                //wxcommon.message("兑换成功");
                    wxcommon.message("兑换成功", function(){
                        window.location.href="${ctx}/wx/user/home";
                    });
	                	//    alert("绑定成功");
	                }else if(result.state == 301)
	                {
	                 wxcommon.message("积分不足");
	                	//alert("该账户已使用");
	                }else
	                {
	                 wxcommon.message("兑换失败");
	                	//alert("绑定失败");
	                }
	            },
	            error: function () {
	 				wxcommon.message("兑换失败");
	            }
	        });
    }
	    </script>
	</body>
</html>

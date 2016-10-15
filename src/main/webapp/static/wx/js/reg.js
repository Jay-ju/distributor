var InterValObj; //timer变量，控制时间
var count = 120; //间隔函数，1秒执行
var curCount;//当前剩余秒数

function sendMessage() {
  　curCount = count;
　　//设置button效果，开始计时
     $("#btnSendCode").attr("disabled", "true");
     $("#btnSendCode").val( + curCount + "秒后再次获取");
     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
　　  //向后台发送处理数据
    /* $.ajax({
     　　type: "POST", //用POST方式传输
     　　dataType: "text", //数据格式:JSON
     　　url: 'Login.ashx', //目标地址
    　　 data: "dealType=" + dealType +"&uid=" + uid + "&code=" + code,
    　　 error: function (XMLHttpRequest, textStatus, errorThrown) { },
     　　success: function (msg){ }
     });*/
}

//timer处理函数
function SetRemainTime() {
            if (curCount == 0) {                
                window.clearInterval(InterValObj);//停止计时器
                $("#btnSendCode").removeAttr("disabled");//启用按钮
                $("#btnSendCode").val("再次获取");
            }
            else {
                curCount--;
                $("#btnSendCode").val( + curCount + "秒后再次获取");
            }
        }

$(document).ready(function($) {
  	    
  	$('#num').click(function(){
  		$('.shade,.phone').show();
     });//更改手机、
  	$('.cancel').click(function(){
  		$('.shade,.phone').hide();
  	});//取消更改手机

  	$('#pow').click(function(){
  		$('.shade,.pow').show();
     });//更改密码、
  	$('.can-in').click(function(){
  		$('.shade,.pow').hide();
  	});//取消更改密码



});
   
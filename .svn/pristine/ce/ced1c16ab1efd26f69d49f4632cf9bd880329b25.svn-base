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
        <title>充值</title> 
        <meta name="keywords" content="充值"> 
        <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！"> 
        <link rel="Bookmark" href="favicon.ico" > 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css    " />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
   
    </head>
    <body style="background-color: #fff;">
        <div class="max-box">
          <div class="top tc">
             <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black tc">充值</a>
          </div>
          <!-- 头部结束 -->
          <div class="jf_exchange ">
            <div class="jf_box jf_bg lr">
                充值获得生活币（1元=1乐金币），可用于夺宝，充值的款项将无法退回
            </div>
            <ul class="jf_ul">
                <li class="on"><a href="javascript:;">5</a></li>
                <li><a href="javascript:;">10</a></li>
                <li><a href="javascript:;">30</a></li>
                <li><a href="javascript:;">50</a></li>
                <li><a href="javascript:;">100</a></li>
                <li><a href="javascript:;" class="other">其他</a>
                    <input type="text" name="" id="" placeholder="其他" style="display: none;" class="input_other" onBlur="fuzhi(this)"/>
                    <input type="hidden" id="money" name="money" value="" />
                </li>
            </ul>
            
          </div>
          <!--其他支付方式   微信和支付宝只能显示其中一个-->
          <div class="other_pay">
            <p class="lr low">其他支付方式:</p>
            <div class="zf">
                <a href="javascirpt:;" class="radio_f" style="background-color: #fe3756;"></a><span class="span1">微信支付</span>
            </div>
            <div class="zf" style="display: none;">
                <a href="javascirpt:;" class="radio_f"></a><span class="span2">支付宝支付</span>
            </div>
            <!-- <div class="zf">
                <a href="javascirpt:;" class="radio_f"></a><span class="span3">银行卡支付</span>
            </div> -->
          </div>
          <div class="jf_exchange">
              <p class="tc">
                <a href="javascript:;" class="red_btn2" id="recharge">立即充值</a>
              </p>
          </div>
       </div>
        <script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${ctx}/static/wx/js/weixin/jweixin-1.0.0.js"></script>
        <script type="text/javascript" src="${ctx}/static/wx/js/goods.js"></script>
        <script src="${ctx}/static/wx/js/dos/bootstrap.min.js"></script>
        <script src="${ctx}/static/wx/js/dos/plugins/iCheck/icheck.min.js"></script>
        <script src="${ctx}/static/wx/js/wxcommon.js"></script>
        <script src="${ctx}/static/wx/js/weixin/jweixin-1.0.0.js"></script>
        <!--<script src="${ctx}/../static/wx/js/wxcommon.js"></script>-->
        <script type="text/javascript">
            $(".jf_ul li").click(function(){
                $(".jf_ul li").removeClass("on");
                $(this).addClass("on");
                var money=$(this).children("a").html();
                $('#money').val(money);
                
            })
            $(".jf_ul li:last-child").click(function(){
                $(this).find("a").hide();
                $(this).find("input").show();
                $(".input_other").focus();
                $(".input_other").attr("placeholder","");
            })
            //支付方式  三选一
            $(".radio_f").click(function(){
                $(".radio_f").css("background-color","#999");
                $(this).css("background-color","#fe3756");
            })
              $(document).ready(function () {
              
               $('#recharge').click(function(){
                        var money= $('#money').val(); 
                        recharge.pay('${ctx}', '${userId}', money);
                    });
              
              });
              
              function fuzhi(that)
              {
                 checkRate($(that).val());
                $('#money').val($(that).val());
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
               var recharge= {
                    isPaying: false,
                    pay: function (ctx, userId,money) {
                        var _this = this;
                        if (_this.isPaying)
                            return;
                        _this.isPaying = true;
                        if (money == null || money == "") {
                            money = 5;
                        }
                        checkRate(money);
                        wxcommon.showProgress("支付中...");

                        $.ajax({
                            url: ctx + "/app/snatch/rechargeOrders",
                            data: {userId:userId,payWay:2,money:money,isAlipayWithH5:"false"},
                            type: 'post',
                            dataType: 'json',
                            success: function (result) {
                                _this.isPaying = false;
                                wxcommon.colseProgress();

                                if(result.state == 200){
                                    var data = result.data;
                                   
                                    if (parseInt(data.agent) < 5) {
                                        alert("您的微信版本低于5.0，无法使用微信支付");
                                        return;
                                    }

                                    try {
                                        WeixinJSBridge.invoke('getBrandWCPayRequest', {
                                                    "appId": data.appId,                  //公众号名称，由商户传入
                                                    "timeStamp": data.timeStamp,          //时间戳，自 1970 年以来的秒数
                                                    "nonceStr": data.nonceStr,         //随机串
                                                    "package": data.package,      //统一下单接口返回的prepay_id参数值，提交格式如：prepay_id=***
                                                    "signType": data.signType,        //签名算法，暂支持MD5
                                                    "paySign": data.paySign           //微信签名
                                                }, function (res) {
                                                    if (res) {
                                                        if (res.err_msg == "get_brand_wcpay_request:ok") {//发送成功
                                                            wxcommon.message("恭喜你，支付成功！", function(){
                                                                wxcommon.showProgress('获取中...');
                                                                setTimeout(function(){
                                                                    location.replace(ctx + '/wx/user/home');
                                                                }, 1500);
                                                            });

                                                            return;
                                                        }
                                                        else if (res.err_msg == "get_brand_wcpay_request:cancel") {//用户取消

                                                        }
                                                        else if (res.err_msg == "get_brand_wcpay_request:fail") {//发送失败
                                                            wxcommon.message("支付失败，请重试！");
                                                        } else {
                                                            wxcommon.message("支付失败：" + res.err_msg);
                                                        }

                                                        //取消订单
                                                        _this.cancel(ctx, data.outTradeNo);
                                                    } else {
                                                        wxcommon.message('支付返回结果为空', function () {
                                                            location.href = redirectUrl;
                                                        });
                                                    }
                                                }
                                        );
                                    } catch (ex) {
                                        wxcommon.message("抱歉，只支持在微信中支付，不支持浏览器访问，请登录微信进行支付");
                                    }
                                }else if(result.state==300){
                                    if(result.data && result.data.errDescr){
                                        wxcommon.message(result.data.errDescr);
                                    }else{
                                        wxcommon.message("支付失败");
                                    }
                                }else{
                                    var errMsg;
                                    switch (result.state){
                                        case 301:
                                            errMsg = "仅支持微信或支付宝支付充值";
                                            break;
                                        case 302:
                                            errMsg = " 充值金额范围在1-10000000之间";
                                            break;
                                        case 303:
                                            errMsg = "请选择支付方式";
                                            break;
                                        case 304:
                                            errMsg = "红包不可用";
                                            break;
                                        case 305:
                                            errMsg = "余额不足";
                                            break;
                                        case 306:
                                            errMsg = "只支持除微信支付";
                                            break;
                                        case 307:
                                            errMsg = "需要微信支付的金额不能小于等于1";
                                            break;
                                        case 308:
                                            errMsg = "红包不可用";
                                            break;
                                        case 309:
                                            errMsg = "十元夺宝的商品购买人次必须能被10整除";
                                            break;
                                        case 310:
                                            errMsg = "你选择的期号已买满，不能夺宝";
                                            break;
                                        case 311:
                                            errMsg = "不支持微信支付";
                                            break;
                                        case 312:
                                            errMsg = "不支持支付宝支付";
                                            break;
                                        case 330:
                                            errMsg = "用户错误";
                                            break;
                                        default:
                                            errMsg = "支付失败(state: "+ result.state +")";
                                    }

                                    wxcommon.message(errMsg);
                                }
                            },
                            error: function () {
                                wxcommon.colseProgress();
                                wxcommon.message("支付失败");
                                _this.isPaying = false;
                            }
                        });
                    },
                    /**
                     * 取消订单
                     * @param ctx
                     * @param outTradeNo
                     */
                    cancel: function(ctx, outTradeNo){
                        $.ajax({
                            url: ctx + "/wx/order/snatchPay/cancel",
                            data: {
                                outTradeNo: outTradeNo
                            },
                            type: 'post',
                            dataType: 'json',
                            success: function (result) {

                            }
                        });
                    }
                };
              
            
        //支付方式  三选一
        
        </script>
    </body>
</html>


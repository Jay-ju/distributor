<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>支付订单</title>
    <meta name="keywords" content="支付订单">
    <meta name="description" content="支付订单">
    <link rel="Bookmark" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/goods.css">
    <link href="${ctx}/static/wx/dos/css/plugins/iCheck/custom.css" rel="stylesheet">
</head>
<body style="background: #fff;">
<div class="max-box">
    <div class="top tc">
        <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">支付订单</a>
    </div>
    <c:choose>
        <c:when test="${totalBuyTimes > 0}">
            <form id="frmPay" action="${ctx}/wx/order/snatchPay/pay" method="post">
                <!-- 头部结束 -->
                <div class="goods">
                    <p class="lr larger text-normal moy line">商品合计<em class="primary">${totalBuyTimes}乐金币<i></i></em></p>
                    <ul class="goodsDetail" style="display: none;">
                        <c:forEach items="${snatchListList}" var="entity" varStatus="stat">
                            <li class="lr low large clearfloat line">
                                <p class="www">${entity.goodsName}</p><em><b>${entity.buyTimes}</b>人次</em>
                                <input type="hidden" name="snatchList[${stat.index}].gid" value="${entity.goodsTimesId}">
                                <input type="hidden" name="snatchList[${stat.index}].amount" value="${entity.buyTimes}">
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- 商品合计结束 -->

                <c:if test="${not empty redPackList}">
                    <div class="hong">
                        <p class="lr larger text-normal hot line">使用红包<em class="primary"><span id="redpackTxt">&nbsp;</span><i class=""></i></em></p>
                        <ul class="h_hot" style="display: none;">
                            <c:forEach items="${redPackList}" var="entity">
                                <li class="lr low large clearfloat line">
                                    <div class="h_l clearfloat">
                                        <span class="h_pic">${entity.total}乐金币</span>

                                        <div class="h_txt">
                                            <h6 class="larger text-heavy">${redPackSourceTypeMap[entity.sourceType]}</h6>
                                            <span class="large low">余额：<em class="primary">${entity.balance}乐金币</em></span>
                                            <span>有限期：<fmt:formatDate value="${entity.expireTime}" pattern="yyyy-MM-dd"/></span>
                                        </div>
                                    </div>
                                    <div class="h_r">
                                        <div class="checkbox i-checks">
                                            <label class="code_redpack" data-value="${entity.balance}">
                                                <div class="icheckbox_square-green green">
                                                    <div class="icheckbox_square-green" style="position: relative;">
                                                        <input type="checkbox" name="redPackIds" value="${entity.id}" style="position: absolute; visibility: hidden;">
                                                        <ins class="iCheck-helper"
                                                             style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                                    </div>
                                                    <ins class="iCheck-helper"></ins>
                                                </div>
                                                <i></i>
                                            </label>
                                        </div> 
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- 红包结束 -->
                </c:if>

                <div class="mode">
                    <ul>
                        <li class="line lr text-normal larger clearfloat">
                            <p class="www" style="width: 60%;">余额支付
                                <small>(${balance}乐金币)</small>
                            </p>
                            <p id="balanceTxt" class="www" style="color: #F15353; width: 30%;text-align: right"></p>
                            <em>
                                <c:if test="${balance > 0}">
                                    <div class="checkbox i-checks">
                                        <label class="code_balance" data-value="${balance}">
                                            <div class="icheckbox_square-green green">
                                                <div class="icheckbox_square-green" style="position: relative;">
                                                    <input type="checkbox" name="payWays" value="<%=Const.PayWayType.CURRENCY%>" style="position: absolute; visibility: hidden;">
                                                    <ins class="iCheck-helper"
                                                         style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                                </div>
                                                <ins class="iCheck-helper"></ins>
                                            </div>
                                            <i></i>
                                        </label>
                                    </div>
                                </c:if>
                            </em>
                        </li>
                        <li class="line lr text-normal larger clearfloat">
                            <p class="www" style="width: 60%">其他支付方式</p>
                            <p id="weixinTxt" class="www" style="color: #F15353; width: 40%;text-align: right"></p>
                        </li>
                        <li class="line lr text-normal larger clearfloat">
                            <div class="checkbox i-checks">
                                <label class="code_weixin">
                                    <div class="icheckbox_square-green green">
                                        <div class="icheckbox_square-green" style="position: relative;">
                                            <input type="checkbox" name="payWays" value="<%=Const.PayWayType.WEIXIN%>" style="position: absolute; visibility: hidden;">
                                            <ins class="iCheck-helper"
                                                 style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                        </div>
                                        <ins class="iCheck-helper"></ins>
                                    </div>
                                    <i></i> 微信支付
                                    <input type="hidden" id="thirdpartMoney" name="thirdpartMoney" value="${totalBuyTimes}">
                                </label>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 支付方式 -->
                <div class="bottom">
                    <a href="javascript:;" class="bg_1" id="orders">确认支付</a>
                </div>
            </form>

            <div id="payResultPage" style="position: absolute;top: 0px;left: -10000px;">
                <div class="max-box">
                    <div class="top tc">
                        <a href="javascript:wxcommon.goback('${ctx}')" target="_self" class="black">支付结果</a>
                    </div>
                    <!-- 头部结束 -->
                    <div class="res line">
                        <div class="resT lr">
                            <p class="largest_plus blank">恭喜你参与成功！</p>
                            <p class="largest_plus blank">请等待系统为您揭晓！</p>
                        </div>
                        <div class="resB">
                            <div class="res_bon">
                                <ul>
                                    <li class="bg_1"><a href="${ctx}/wx/index" target="_self" class="text-f">继续夺宝</a></li>
                                    <li class="bg_3"><a href="${ctx}/wx/order/snatch/record/personal/list?userId=${userId}" target="_self" class="text-heavy">查看夺宝记录</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 上部分结束 -->
                    <h3 class="normal low plr" id="resultDesc"><%--您成功参与了<em class="primary">5</em>件商品共<em class="primary">5</em>人次夺宝，信息如下：--%></h3>
                        <%--<div class="pay">
                            <h6 class="clearfloat large"><p class="www blur">联想Y430p 14.0英寸笔记本电脑</p><em class="text-heavy"><b class="primary">5</b>人次</em></h6>
                            <p class="large low">商品期号：211202305</p>
                            <dl class="low large clearfloat">
                                <dt>夺宝号码：</dt>
                                <dd>1000368</dd>
                                <dd>1000456</dd>
                                <dd>1000101</dd>
                                <dd>1000056</dd>
                                <dd>1000899</dd>
                            </dl>
                        </div>--%>
                </div>
            </div>


            <script type="text/javascript" src="${ctx}/static/wx/js/jquery-1.9.1.min.js"></script>
            <script type="text/javascript" src="${ctx}/static/wx/js/goods.js"></script>
            <script src="${ctx}/static/wx/js/dos/bootstrap.min.js"></script>
            <script src="${ctx}/static/wx/js/dos/plugins/iCheck/icheck.min.js"></script>
            <script src="${ctx}/static/wx/js/wxcommon.js"></script>
            <script src="${ctx}/static/wx/js/weixin/jweixin-1.0.0.js"></script>
            <script>
                $(document).ready(function () {
                    var totalBuyTimes = ${totalBuyTimes};
                    if(totalBuyTimes < 1){
                        return;
                    }
                    $('.i-checks').iCheck({
                        checkboxClass: 'icheckbox_square-green',
                        radioClass: 'iradio_square-green'
                    });

                    var redPackMoney = 0;
                    var balance = 0;
                    var totalBalance = ${balance};
                    var thirdpartMoney = wxcommon.getNumberValue($('#thirdpartMoney').val());

                    if(totalBalance > 0 && totalBalance >= totalBuyTimes){
                        //$(".code_balance").parent().iCheck('check');
                        //$(".code_balance").find('input').attr('checked', true);
                        //$('#balanceTxt').text('￥' + totalBuyTimes);
                        //$(".code_weixin").parent().iCheck('uncheck');
                        //$(".code_weixin").find('input').attr('checked', false);
                        balance = totalBuyTimes;
                        setBalance(true);
                        setThirdpartPay(false);
                    }
                    $(".code_redpack,.code_balance,.code_weixin").click(function(){
                        var $this = $(this);
                        setTimeout(function(){
                            var hasChecked = $this.find('div.checked').length > 0;
                            $this.find('input').attr('checked', hasChecked);
                            if($this.hasClass('code_redpack')){ // 红包
                                var value = wxcommon.getNumberValue($this.attr('data-value'));
                                if(hasChecked){
                                    redPackMoney += value;
                                }else{
                                    redPackMoney -= value;
                                }

                                if(redPackMoney >= totalBuyTimes){
                                    setBalance(false);
                                    setThirdpartPay(false);
                                }else{
                                    //console.info('click redpack');
                                    setBalance(true);
                                    $(".code_balance").click();
                                }

                                $('#redpackTxt').html(redPackMoney > 0 ? ('￥' + redPackMoney) : '&nbsp;');
                            }else if($this.hasClass('code_balance')){ // 余额
                                balance = totalBuyTimes - redPackMoney;
                                //console.info(balance);
                                if(balance < 1){
                                    balance = 0;
                                    setBalance(false);
                                    wxcommon.message('红包足够支付了，不需要选择余额支付');
                                    return;
                                }

                                if(hasChecked){
                                    //console.info(1, hasChecked);
                                    var isCheckThirdpartPay;
                                    if(totalBalance < balance){
                                        balance = totalBalance;
                                        isCheckThirdpartPay = true;
                                    }else{
                                        isCheckThirdpartPay = !((redPackMoney + balance) >= totalBuyTimes);
                                    }
                                    setBalance(hasChecked);
                                    setThirdpartPay(isCheckThirdpartPay);
                                }else{
                                    //console.info(2, hasChecked);
                                    setBalance(hasChecked);
                                    setThirdpartPay(true);
                                }
                            }else if($this.hasClass('code_weixin')) { // 微信
                                thirdpartMoney = totalBuyTimes - redPackMoney - balance;
                                if(thirdpartMoney < 1){
                                    thirdpartMoney = 0;
                                    setThirdpartPay(false);
                                    wxcommon.message('足够支付了，不需要选择微信支付');
                                    return;
                                }

                                setThirdpartPay(true);
                            }

                            //print();
                        }, 10);
                    });


                    function setRedpack(isChecked){
                        if(isChecked){
                            $(".code_redpack").parent().iCheck('check');
                            $(".code_redpack").find('input').attr('checked', true);

                            $(".code_balance").parent().iCheck('uncheck');
                            $(".code_balance").find('input').attr('checked', false);

                            $(".code_weixin").parent().iCheck('uncheck');
                            $(".code_weixin").find('input').attr('checked', false);
                        }else{
                            $(".code_redpack").parent().iCheck('uncheck');
                            $(".code_redpack").find('input').attr('checked', false);
                        }
                    }

                    function setBalance(isChecked){
                        if(isChecked && balance > 0){
                            $(".code_balance").parent().iCheck('check');
                            $(".code_balance").find('input').attr('checked', true);
                            $('#balanceTxt').text('￥' + balance);

                            $(".code_redpack").parent().iCheck('uncheck');
                            $(".code_redpack").find('input').attr('checked', false);

                            $(".code_weixin").parent().iCheck('uncheck');
                            $(".code_weixin").find('input').attr('checked', false);
                            
                        }else{
                            $(".code_balance").parent().iCheck('uncheck');
                            $(".code_balance").find('input').attr('checked', false);
                            $('#balanceTxt').text('');
                            balance = 0;
                        }
                    }

                    function setThirdpartPay(isChecked){
                        if(isChecked){
                            $(".code_weixin").parent().iCheck('check');
                            $(".code_weixin").find('input').attr('checked', true);

                            $(".code_balance").parent().iCheck('uncheck');
                            $(".code_balance").find('input').attr('checked', false);

                            $(".code_redpack").parent().iCheck('uncheck');
                            $(".code_redpack").find('input').attr('checked', false);

                            thirdpartMoney = totalBuyTimes - redPackMoney - balance;
                            if(thirdpartMoney <= 0) {
                                thirdpartMoney = 0;
                                setThirdpartPay(false);
                            }

                            $('#weixinTxt').text(thirdpartMoney > 0 ? ('￥' + thirdpartMoney) : '');
                        }else{
                            $(".code_weixin").parent().iCheck('uncheck');
                            $(".code_weixin").find('input').attr('checked', false);
                            thirdpartMoney = 0;
                            $('#weixinTxt').text('');
                        }
                    }

                    function checkValid(){
                        var t = totalBuyTimes - redPackMoney - balance;
                        if(t != thirdpartMoney){
                            thirdpartMoney = t < 0 ? 0 : t;
                            setThirdpartPay(thirdpartMoney > 0);
                        }
                        $('#thirdpartMoney').val(thirdpartMoney);

                        setHideParams('payWaysWithRedPack', redPackMoney, '<%=Const.PayWayType.REDPACKET%>');
                        setHideParams('payWaysWithBalance', balance, '<%=Const.PayWayType.CURRENCY%>');
                        setHideParams('payWaysWithWeixin', thirdpartMoney, '<%=Const.PayWayType.WEIXIN%>')
                    }

                    function setHideParams(id, value, payWayType){
                        var $form = $('#frmPay');
                        var $hide = $('#' + id);
                        if(value > 0){
                            if($hide.length < 1){
                                $hide = $('<input type="hidden" id="'+id+'" name="payWays">');
                                $form.append($hide);
                            }
                            $hide.val(payWayType);
                        }else{
                            $hide.remove();
                        }
                    }

                    function print(){
                        console.info('redPackMoney:', redPackMoney, 'balance:', balance, 'thirdpartMoney:', thirdpartMoney);
                    }

                    setThirdpartPay(false);

                    $('#orders').click(function(){
                        checkValid();
                        order.pay('${ctx}', '${userId}', $('#frmPay'));
                    });
                });

                var order= {
                    isPaying: false,
                    pay: function (ctx, userId, $form) {
                        var _this = this;
                        if (_this.isPaying)
                            return;
                        _this.isPaying = true;
                        wxcommon.showProgress("支付中...");
                        $.ajax({
                            url: ctx + "/wx/order/snatchPay/pay",
                            data: $form.serialize(),
                            type: 'post',
                            dataType: 'json',
                            success: function (result) {
                                _this.isPaying = false;
                                wxcommon.colseProgress();

                                if(result.state == 200){
                                    var data = result.data;
                                    if(wxcommon.isNotEmpty(data.descr)){ // 非微信支付
                                        $('body').html($('#payResultPage').html());
                                        var $resultDesc = $('#resultDesc');
                                        $resultDesc.html(data.descr + "，明细如下：");
                                        if(data.snatchList){
                                            var html = '';
                                            $(data.snatchList).each(function(i, e){
                                                html += '<div class="pay">' +
                                                        '<h6 class="clearfloat large"><p class="www blur">' +
                                                        e.goodsName + '</p><em class="text-heavy"><b class="primary">' +
                                                        e.buyTimes +'</b>人次</em></h6>' +
                                                        '<p class="large low">商品期号：' + e.goodsTimesName + '</p>' +
                                                        '<dl class="low large clearfloat">' +
                                                        '<dt>夺宝号码：</dt>';

                                                $(e.nums).each(function(i, num){
                                                    html += '<dd>' + num + '</dd>';
                                                });
                                                if(e.nums.length == 6 && e.buyTimes > 6){
                                                    html += '<dd><a href="'+ ctx +'/wx/order/snatch/record/num/list?goodsTimesId='+
                                                            e.goodsTimesId +'&userId='+ userId +'">更多</a></dd>'
                                                }

                                                html += '</dl></div>';
                                            });

                                            if(html) {
                                                $resultDesc.after(html);
                                            }
                                        }

                                        return;
                                    }

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
                                                                    location.replace(ctx + '/wx/order/snatchPay/getPayResult?outTradeNo=' + data.outTradeNo);
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
                                            errMsg = "没有夺宝商品";
                                            break;
                                        case 302:
                                            errMsg = "购买人次不能小于1";
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
            </script>
        </c:when>
        <c:otherwise>
            <div style="margin:  10px; color: red;">抱歉，您未选择商品或您选择的商品已购买或已被买满。</div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>

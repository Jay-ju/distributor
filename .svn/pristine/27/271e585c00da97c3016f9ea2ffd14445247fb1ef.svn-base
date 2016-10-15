<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <title>中奖记录</title>
    <meta name="keywords" content="中奖记录">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
          name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/past.css"/>

    <style type="text/css">
	    .conWin{
		width:100%;
		position: relative;
		}
		.conWin dt{
		width:100%;
		height:2.6rem;
		line-height: 3.6rem;
		font-size: 1.04rem;
		}
        .conChange{
        width:100%;
        position: relative;
        }
        .conChange dt{
        width:100%;
        height:1.6rem;
        font-size: 1.04rem;
        }
		.hr-line-dashed {
	    border-top: 1px solid #e7eaec;
	    color: #ffffff;
	    background-color: #ffffff;
	    height: 1px;
	    margin: 10px 0;
		}
        .hr-line-dashed-l {
        border-top: 5px solid #e7eaec;
        color: #ffffff;
        background-color: #ffffff;
        height: 3px;
        margin: 10px 0;
        }
    </style>

</head>
<body style="background: #fff;">
<div class="max-box">
    <div class="top tc">
        <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">中奖记录</a>
    </div>
    <!-- 头部结束 -->
    <div class="con">
        <div class="detail clearfloat" style="margin-top:0px">
            <div class="con_img lr" style="width:30%;float:left;padding-bottom:0px">
			    <img src="${goodsRootUri}/${goodsTimes.thumbnail}" alt="">
			    <input type="hidden" id="currentWinState" value="${curWinState}" />
			</div>
			<div class="con_txt" style="width:40%;float:left;padding-top:45px;">
			    <h5 class="text-heavy large tle">${goodsTimes.goodsName }</h5>
			    <p>本期参与：${goodsTimes.winngUserBuyTimes}人次</p>
			</div>
			 <div class="con_txt_canyu" style="width:30%;display:inline;float:right;padding-top:35px;">
			     <img src="${ctx}/static/wx/images/zj_max.png">
			 </div>
        </div>
        <div class="conWin">
            <dl>
                <dt class="lr text-heavy">商品状态：&nbsp;&nbsp;&nbsp;<font size="4" color="red">恭喜您中奖了</font></dt>
            </dl>
         </div>
        <div class="hr-line-dashed-l"></div>
        <div class="conChange">
           <dl>
           <dt class="lr text-heavy">兑换方式</dt>
           <div class="hr-line-dashed"></div>
            <p class="lr large text-heavy" onclick="changJifen(${goodsTimes.goodsInfo.changeJifen});">&nbsp;&nbsp;
            <font size="3" color="red">兑换积分</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">积分可兑换乐金币/提现</font></p>
           <div class="hr-line-dashed"></div>
           <p class="lr large text-heavy" onclick="getJiangpin()">&nbsp;&nbsp;
           <font size="3" color="red">领取奖品</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">实物默认发货,虚拟商品由客服代充</font></p>
           </dl>
        </div>
        <div class="hr-line-dashed-l"></div>
        <div class="conIn">
            <dl>
                <dt class="lr text-heavy">商品状态</dt>
                <c:set var="exchanged"><%=Const.WxWinngGoodsState.OVER %>
                </c:set>
                <c:set var="dispatch"><%=Const.WxWinngGoodsState.DISPATCH %>
                </c:set>
                <c:set var="confirmAddress"><%=Const.WxWinngGoodsState.CONFIRM_RECEIVE %>
                </c:set>
                <c:set var="over"><%=Const.WxWinngGoodsState.OVER %>
                </c:set>

                <c:forEach items="${goodsStates}" var="entity">
                    <dd class="lr ${entity.isCurrState ? "color_5 hot_in" : "text-normal"}">
                        <p class="line">
                                ${winngGoodsStateMap[entity.state]}
                            <b>
                                <c:choose>
                                    <c:when test="${not empty entity.finishTime}">
                                        <fmt:formatDate value="${entity.finishTime}" pattern="yyyy-MM-dd HH:mm"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${entity.state==confirmAddress && entity.isCurrState}">
                                                <a href="${ctx}/wx/receiveAddress/detail?userId=${goodsTimes.winngUser.id}&goodsTimesId=${goodsTimes.id}"
                                                   target="_self" class="bg_1 a ">确认地址</a>
                                            </c:when>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </b>
                        </p>
                    </dd>
                </c:forEach>
            </dl>
        </div>
    </div>
</div>

<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script src="${ctx}/static/js/utils/public.js"></script>
<script src="${ctx }/static/mould/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript">
function changJifen(jifen){
	    var curWinStateVal = $("#currentWinState").val();
		if (curWinStateVal > 2) {
			alert("您已选择过兑换方式");
			return;
		}
        var title = "确定要兑换  " + jifen + "  吗？";
        Public.confirm(title, function(){
            var index = layer.load();
            $.ajax({
                url: '${ctx}/wx/winng/setExchangeState',
                type: 'post',
                data: {
                	gid: ${goodsTimes.id},
                	state: 1
                },
                dataType: 'text',
                success: function (result){
                   alert("兑换完成");
                   layer.close(index);
                   location.href="${ctx}/wx/winng/detail?goodsTimesId="+${goodsTimes.id};
                },
                error: function () {
                	alert("兑换失败");
                	layer.close(index);
                	location.href="${ctx}/wx/winng/detail?goodsTimesId="+${goodsTimes.id};
                }
            });
        });
    }
function getJiangpin(){
    var curWinStateVal = $("#currentWinState").val();
    if (curWinStateVal > 2) {
        alert("您已选择过兑换方式");
        return;
    }
    var title = "确定要领取奖品吗？";
    Public.confirm(title, function(){
        var index = layer.load();
	    $.ajax({
	        url: '${ctx}/wx/winng/setExchangeState',
	        type: 'post',
	        data: {
	            gid: ${goodsTimes.id},
	            state: 2
	        },
	        dataType: 'text',
	        success: function (result){
	        	layer.close(index);
	           location.href="${ctx}/wx/winng/detail?goodsTimesId="+${goodsTimes.id};
	        },
	        error: function () {
	        	layer.close(index);
	            location.href="${ctx}/wx/winng/detail?goodsTimesId="+${goodsTimes.id};
	        }
	    });
    });
}
</script>
</body>
</html>  
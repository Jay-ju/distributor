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
    <title>我的</title>
    <meta name="keywords" content="我">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="${ctx}/static/wx/favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
            name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/mine.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/js/layer/need/layer.css"/>
    <style type="text/css">
    	 @media screen and (width: 320px){
	    	.declare{text-align: left;padding:0.8rem;}
	    }
	    .layermbox0 .layermchild{
	    	width:80%;
	    	margin:0 auto;
	    }
    </style>
    
</head>
<body>
<div class="max-box" style="background-color: #fff;;">
    <div class="head">
        <div class="head_in">
            <div class="head_t">
                <ul>
                    <li><a href="${ctx}/wx/user/account">完善资料、收货地址 ></a>
                    </li>
                </ul>
            </div>
            <div class="head_c">
                <a href="${ctx}/wx/user/account" target="_self"><c:choose>
                    <c:when test="${fn:startsWith(member.headImg, 'http://') or fn:startsWith(member.headImg, 'https://')}">
                        <img src="${member.headImg}"/>
                    </c:when>
                    <c:otherwise>
                        <img src="${userHeadImgRootUri}/${member.headImg}"/>
                    </c:otherwise>
                </c:choose></a>

                <div class="head_text text-f">
                    <p class="lar_l">${user.nickName}</p>

                    <p class="normal"><span>余额：<em class="color_6">${member.balance}</em>乐金币</span><span class="ml10">积分：${member.jifen}</span></p>
                </div>
            </div>
        </div>
        <div class="bon">
            <a href="${ctx}/wx/user/rechargeWX?userId=${user.id}" class="btn"><em>充值</em></a>
        </div>
    </div>
    <!-- 头部结束 -->
    <div class="my_all">
        <div class="prize">
            <div class="prize_t">
                <ul>
                    <li><a href="${ctx}/wx/order/snatch/record/personal/list?userId=${user.id}">
                        <ins></ins>
                        <p class="large text-heavy">夺宝记录</p>
                    </a></li>
                    <li><a href="${ctx}/wx/order/snatch/record/list/${user.id}">
                        <ins></ins>
                        <p class="large text-heavy">中奖记录</p>
                    </a></li>
                    <li><a href="${ctx}/wx/goods/shareGoods/my?userId=${user.id}">
                        <ins></ins>
                        <p class="large text-heavy">我的晒单</p>
                    </a></li>
                    <li><a href="${ctx}/wx/record/redPack/list">
                        <ins></ins>
                        <p class="large text-heavy">我的红包</p>
                    </a></li>
                    <li><a href="${ctx}/wx/user/exchangeWX?userId=${user.id}">
                        <ins></ins>
                        <p class="large text-heavy">积分兑换</p>
                    </a></li>
                    <li><a href="${ctx}/wx/user/withdrawalsWX?userId=${user.id}">
                        <ins></ins>
                        <p class="large text-heavy">积分提现</p>
                    </a></li>
                    <li><a href="${ctx}/wx/user/account">
                        <ins></ins>
                        <p class="large text-heavy">完善资料</p>
                    </a></li>
                    <li><a href="${ctx}/page/problem.html">
                        <ins></ins>
                        <p class="large text-heavy">常见问题</p>
                    </a></li>
                    <li><a href="${ctx}/wx/user/contactus">
                        <ins></ins>
                        <p class="large text-heavy">联系客服</p>
                    </a></li>
                </ul>
            </div>
            <!-- 上 -->
        </div>
        <!-- 关于奖 -->
    </div>
    <!--底部-->
    <p class="declare">声明：所有商品抽奖活动与苹果公司（apple Inc.）无关</p>
    <div class="foot-flag">
    	<ul>
    		<li ><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_1 icon"></b><p>夺宝</p></a></li>
    		<li><a href="${ctx}/wx/goods/goodsCategory/listCategory" class="text-heavy"><b class="icon_6 icon"></b><p>分类</p></a></li>
    		<li><a href="${ctx}/wx/goods/goodsTimes/listLastOpen" class="text-heavy"><b class="icon_2 icon"></b><p>最新揭晓</p></a></li>
    		<li><a href="${ctx}/wx/snatchList/list" class="text-heavy"><b class="icon_4 icon"></b><p>购物车</p></a></li>
    		<li  class="on"><a href="${ctx}/wx/user/home" class="text-heavy"><b class="icon_on_5 icon"></b><p>我的</p></a></li>
    	</ul>
    </div>
    <div class="mb80"></div>
    <!--底部-->
</div>
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/layer/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript">
	function kefu(){
		layer.open({
		    content: '<p class="tc large_normal">电话：400-605-9858</p>',
		    btn: [ '取消'],
		    shadeClose: false,
			 no: function(){
//		        layer.open({content: '你选择了取消', time: 1});
		    }
		});
			}
</script>

</body>
</html>


<%-- <%@page language="java" contentType="text/html; charset=utf-8"
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
    <title>我的</title>
    <meta name="keywords" content="我">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="${ctx}/static/wx/favicon.ico">
    <meta
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
            name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/mine.css"/>
</head>
<body>
<div class="max-box">
    <div class="head">
        <div class="head_in">
            <div class="head_t">
                <ul>
                    <li><a href="javascript:wxcommon.goback('${ctx}');"
                           class="bolck"></a>我的账户
                    </li>
                </ul>
            </div>
            <div class="head_c">
                <a href="${ctx}/wx/user/account" target="_self"><c:choose>
                    <c:when test="${fn:startsWith(member.headImg, 'http://') or fn:startsWith(member.headImg, 'https://')}">
                        <img src="${member.headImg}"/>
                    </c:when>
                    <c:otherwise>
                        <img src="${userHeadImgRootUri}/${member.headImg}"/>
                    </c:otherwise>
                </c:choose></a>

                <div class="head_text text-f">
                    <p class="lar_l">${user.nickName}</p>

                    <p class="normal">积分：${member.jifen}</p>
                </div>
            </div>
            <div class="head_b large">
                <a href="${ctx}/wx/user/account" target="_self">账户管理、收货地址>&nbsp;</a>
            </div>
        </div>
        <div class="bon">
            <ul>
                <li class="large">余额：<em>${member.balance}</em>夺宝币
                </li>

            </ul>
        </div>
    </div>
    <!-- 头部结束 -->
    <div class="my_all">
        <div class="prize">
            <div class="prize_t line">
                <ul>
                    <li><a
                            href="${ctx}/wx/order/snatch/record/personal/list?userId=${user.id}">
                        <ins></ins>
                        <p class="large text-heavy">全部记录</p>
                    </a></li>
                    <li><a
                            href="${ctx}/wx/order/snatch/record/personal/list?userId=${user.id}&state=1">
                        <ins></ins>
                        <p class="large text-heavy">正在进行</p>
                    </a></li>
                    <li><a
                            href="${ctx}/wx/order/snatch/record/personal/list?userId=${user.id}&state=3">
                        <ins></ins>
                        <p class="large text-heavy">已揭晓</p>
                    </a></li>
                </ul>
            </div>
            <!-- 上 -->
            <div class="prize_b">
                <ul>
                    <li><a href="${ctx}/wx/order/snatch/record/list/${user.id}">
                        <ins></ins>
                        <p class="lar_l">中奖记录</p>
                    </a></li>
                    <li><a href="${ctx}/wx/record/jifen/query">
                        <ins></ins>
                        <p class="lar_l">积分</p>
                    </a></li>
                    <li><a href="${ctx}/wx/record/redPack/list">
                        <ins></ins>
                        <p class="lar_l">红包</p>
                    </a></li>
                    <li><a href="${ctx}/wx/goods/shareGoods/my?userId=${user.id}">
                        <ins></ins>
                        <p class="lar_l">晒单</p>
                    </a></li>
                </ul>
            </div>
            <!-- 下 -->
        </div>
        <!-- 关于奖 -->
    </div>
</div>
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
</body>
</html> --%>
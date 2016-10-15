<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>支付结果</title>
    <meta name="keywords" content="支付结果">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/goods.css">
    <script type="text/javascript" src="${ctx}/static/wx/js/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/wx/js/wxcommon.js"></script>
</head>
<body style="background: #fff;">
<div class="max-box">
    <div class="top tc">
        <a href="javascript: wxcommon.goback('${ctx}');" target="_self" class="black">支付结果</a>
    </div>
    <!-- 头部结束 -->
    <div class="res line">
        <div class="resT lr">
            <c:choose>
                <c:when test="${resultMap.state == 200}">
                    <c:choose>
                        <c:when test="${fn:length(resultMap.data.snatchList) > 0}">
                            <c:set var="isSccuess" value="true" scope="page"/>
                            <p class="largest_plus blank">恭喜你参与成功！</p>

                            <p class="largest_plus blank">请等待系统为您揭晓！</p>
                        </c:when>
                        <c:otherwise>
                            <p class="largest_plus blank">未查询到支付结果，请耐心等待！</p>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <p class="largest_plus blank">夺宝失败！</p>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="resB">
            <div class="res_bon">
                <ul>
                    <li class="bg_1"><a href="${ctx}/wx/index" target="_self" class="text-f">继续夺宝</a></li>
                    <li class="bg_3"><a href="${ctx}/wx/order/snatch/record/personal/list?userId=${userId}"
                                        target="_self" class="text-heavy">查看夺宝记录</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 上部分结束 -->

    <c:if test="${isSccuess}">
        <h3 class="normal low plr">${resultMap.data.descr}，明细如下：</h3>
        <c:forEach items="${resultMap.data.snatchList}" var="entity">
            <div class="pay">
                <h6 class="clearfloat large">
                    <p class="www blur">${entity.goodsName}</p>
                    <em class="text-heavy"><b class="primary">${entity.buyTimes}</b>人次</em>
                </h6>
                <p class="large low">商品期号：${entity.goodsTimesName}</p>
                <dl class="low large clearfloat">
                    <dt>夺宝号码：</dt>
                    <c:forEach items="${entity.nums}" var="num">
                        <dd>${num}</dd>
                    </c:forEach>

                    <c:if test="${fn:length(entity.nums) == 6 && entity.buyTimes > 6}">
                        <dd>
                            <a href="${ctx}/wx/order/snatch/record/num/list?goodsTimesId=${entity.goodsTimesId}&userId=${userId}">更多</a>
                        </dd>
                    </c:if>
                </dl>
            </div>
        </c:forEach>
    </c:if>
</div>
</body>
</html>

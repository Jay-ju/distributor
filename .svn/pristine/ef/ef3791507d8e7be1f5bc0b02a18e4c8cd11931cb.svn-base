<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
    content="width=device-width,initial-scale=1,user-scalable=no" />
<title>最新揭晓</title>
<meta name="keywords" content="最新揭晓">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
<link rel="Bookmark" href="${ctx}/static/wx/favicon.ico">
<meta
    content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
    name="viewport" id="viewport">
<meta name="format-detection" content="telephone=yes">
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/wx/css/style.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/wx/css/global.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/wx/css/past.css" />
</head>
<body style="background: #efeff4;">
    <div class="max-box">
        <div class="top tc">
            <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">最新揭晓</a>
        </div>
        <!-- 头部结束 -->
        <div class="content clearfloat">
            <ul id="dataList">
                <c:forEach items="${page.result}" var="entity">
                    <li class="lr line" style="height:18rem;padding-right:0.1rem;"><a href="${ctx}/wx/goods/goodsTimes/detail/${entity.id}">
                            <div class="img">
                                <img src="${goodsRootUri}/${entity.thumbnail}" alt="">
                            </div>
                            <br>
                            <h6 class="www text-normal large">${entity.goodsName}</h6>
                            <p class="normal text-low2">
                                期号：<em class="text-normal">${entity.times}</em>
                            </p>
                            <input name="canGetCqsscno" type="hidden" value="${entity.canGetCqsscno}" />
                            <input name="openTime" type="hidden" value="${entity.openTime}" />
                            <input name="id" type="hidden" value="${entity.id}" />
                            <input name="state" type="hidden" value="${entity.state}" />
                            <c:if test="${entity.state==2}">
                                <p class="largest_plus primary">
                                    <ins></ins>
                                    即将开奖
                                </p>
                                <p class="primary largest lr djs" name="changeflag"
                                    nowtime='<fmt:formatDate value="${date}" pattern="MM/dd/yyyy HH:mm:ss:SSS"/>'
                                    endtime='<fmt:formatDate value="${entity.openTime}" pattern="MM/dd/yyyy HH:mm:ss:SSS"/>'
                                    col="0" lxfday="yes" goodstime="${entity.id}"></p>

                            </c:if> <c:if test="${entity.state==3}">
                                <p class="low normal">
                                         获&nbsp;奖&nbsp;者&nbsp;：<a href="javascript:void(0)" class="blur www">${entity.winngUserName}</a>
                                </p>
                                <p class="low normal">参与人次：<em class="text-normal">${entity.winngUserBuyTimes}</em></p>
                                <p class="low normal">幸运号码：<em>${entity.luckNum}</em></p>
                                <p class="low normal">揭晓时间：<em class="pink2"><fmt:formatDate value="${entity.openTime}" pattern="yyyy-MM-dd HH:mm"/></em></p>
                            </c:if>
                    </a></li>
                </c:forEach>
            </ul>
        </div>
    <div class="foot-flag">
        <ul>
            <li ><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_1 icon"></b><p>夺宝</p></a></li>
            <li><a href="${ctx}/wx/goods/goodsCategory/listCategory" class="text-heavy"><b class="icon_6 icon"></b><p>分类</p></a></li>
            <li class="on"><a href="${ctx}/wx/goods/goodsTimes/listLastOpen" class="text-heavy"><b class="icon_on_2 icon"></b><p>最新揭晓</p></a></li>
            <li><a href="${ctx}/wx/snatchList/list" class="text-heavy"><b class="icon_4 icon"></b><p>购物车</p></a></li>
            <li><a href="${ctx}/wx/user/home" class="text-heavy"><b class="icon_5 icon"></b><p>我的</p></a></li>
        </ul>
    </div>
    <div class="mb80"></div>
    </div>
    <script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/wx/js/openTime.js"></script>
    <script src="${ctx}/static/wx/js/wxcommon.js"></script>
    <script type="text/javascript">
        $(function(){
            var now = new Date("${now}").getTime();
            $(".line").each(function(index,element){
                var openTime = $(this).find("input[name='openTime']").val();
                var canGetCqsscno = $(this).find("input[name='canGetCqsscno']").val();
                var changeflag = $(this).find("p[name='changeflag']");
                var time = new Date(openTime.substr(0,19).replace(/-/g,"/")).getTime();
                if($(this).find("input[name='state']").val()=="2"){
                    if(time-now>86400000){
                        changeflag.text("超过24小时，请等待");
                        changeflag.attr("class","primary normal");
                    }else if(time-now>0){
                        changeflag.attr("class","primary largest lr djs lxftime");
                    }else if(canGetCqsscno=="true"){
                        changeflag.text("请稍后，正在计算中");
                        changeflag.attr("class","primary normal");
                    }else{
                        changeflag.text("暂时无法获取\"老时时彩\"开奖结果");
                        changeflag.attr("class","primary normal");
                    }
                }
            });
            
        });
        function change(id){
            $.ajax({
                url: '${ctx}/wx/goods/goodsTimes/lastOpen/detail',
                data:{
                    id: id
                },
                type: 'post',
                dataType: 'json',
                success: function(result){
                    var p = $("p[goodstime='"+result.data.id+"']");
                    if(result.state==200){
                        if(result.data.state==3){
                            p.after('<p class="low normal">'+
                                    '获&nbsp;奖&nbsp;者&nbsp;：<a href="${ctx}/wx/order/snatch/record/others/list?userId='+result.data.winngUserId+'" class="blur www">'+result.data.winngUserName+'</a></p>'+
                                    '<span class="low normal">参与人次：<em class="text-normal">'+result.data.winngUserBuyTimes+'</em></span>'+
                                    '<span class="low normal">幸运号码：<em class="pink2 ">'+result.data.luckNum+'</em></span>'+
                                    '<span class="low normal">揭晓时间：<em class="pink2 ">'+result.data.openTime+'</em></span>');
                            p.text("");
                            p.prev().text("");
                        }else{
                            p.attr("class","primary normal");
                            if(result.data.canGetCqsscno==true){
                                p.text("请稍后，正在计算中");
                            }else{
                                p.text("暂时无法获取\"老时时彩\"开奖结果");
                            }
                        }
                    }else{
                        alert("信息更新失败");
                    }
                },
                error: function(){
                    alert("操作失败");
                }
            });
        }
    </script>
</body>
</html>

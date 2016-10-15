<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ taglib prefix="selfmethod" uri="/selfmethod" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <title>商品详情</title>
    <meta name="keywords" content="商品详情">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
          name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/goods.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/css/loaders.css"/>
    <link rel="Stylesheet" type="text/css" href="${ctx }/static/css/loginDialog.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/bask.css">
    <link href="${ctx}/static/wx/dos/css/plugins/iCheck/custom.css" rel="stylesheet">
</head>
<body style="background: #efeff4;">
<div class="max-box">
    <div class="top tc">
        <a href="javascript:wxcommon.goback('${ctx }');" target="_self" class="black">商品详情</a>
    </div>
    <!-- 头部结束 -->
    <div class="banner">
        <div id="focus" class="focus">
            <div class="bd">
                <ul>
                    <c:forEach items="${goodsImages }" var="topSwitchImages">
                        <c:choose>
                            <c:when test="${not empty topSwitchImages.url && fn:startsWith(topSwitchImages.url, 'http')}">
                                <li><a href="javaScript:;" class="p-img"><img src="${topSwitchImages.url}"/></a>
                            </c:when>
                            <c:otherwise>
                            <li><a href="javaScript:;" class="p-img"><img src="${goodsRootUri}/${topSwitchImages.url}"/></a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
                <div id="flyItem" class="fly_item">
                    <img src="${goodsRootUri}/${goodsTimes.thumbnail}"/>
                </div>
            </div>
            <div class="hd">
                <ul></ul>
            </div>
            <ins>
                <c:choose>
                    <c:when test="${goodsTimes.state==1 }">
                        <img src="${ctx}/static/wx/images/pay/jin.png" alt="进行中"/>
                    </c:when>
                    <c:when test="${goodsTimes.state==2 }">
                        <img src="${ctx}/static/wx/images/pay/dao.png" alt="等待揭晓"/>
                    </c:when>
                    <c:when test="${goodsTimes.state==3 }">
                        <img src="${ctx}/static/wx/images/pay/xiao.png" alt="已揭晓"/>
                    </c:when>
                </c:choose>

            </ins>
            <c:if test="${goodsTimes.isTenYuan==true }">
                <i>
                    <img src="${ctx}/static/wx/images/pay/moy.png" alt="十元区"/>
                </i>
            </c:if>
        </div>
    </div>
    <!-- banner结束 -->
    <div class="detail">
        <div class="tle lr largest_plus text-heavy">${ goodsTimes.goodsName}<em class="pink">${goodsTimes.goodsTip}</em>
        </div>
    </div>
    <c:choose>
        <c:when test="${goodsTimes.state==3 }">
            <div class="content">
                <div class="con_inner">
                    <div class="conTop">
                        <dl class="clearfloat">
                            <dt>
                                <c:choose>
                                    <c:when test="${goodsTimes.winngUserHeadImg!=null}">
                                        <img src="${userHeadImgRootUri}/${goodsTimes.winngUserHeadImg }"
                                             alt="">获奖者：<a href="javascript:void(0)" class="blur">${goodsTimes.winngUserName}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${ctx}/static/images/head/default-head.png" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </dt>
                            <dd class="www">用户名ID：${goodsTimes.winngUserIdentity }（唯一不变的标识）</dd>
                            <dd class="www">期号：${ goodsTimes.times }</dd>
                            <dd class="www">本期参与：<b class="pink2">${goodsTimes.winngUserBuyTimes }</b>人次</dd>
                            <dd class="www">揭晓时间：${ goodsTimes.openTime}</dd>
                        </dl>
                    </div>
                    <div class="conBon">
                        <p class="lr text-f">幸运号码：<b class="larger">${ goodsTimes.luckNum}</b></p>
                    </div>
                </div>
                <i></i>
                <!-- 
                <a href="${staticHtmlRootUri}/goodsTimes/${goodsTimes.computeDetailUri}" class="suan">计算详情</a>
                 -->
            </div>
        </c:when>
        <c:when test="${goodsTimes.state==2 }">
            <div class="count" id="result">
                   <span class="bg_1">
                     <p class="text-f large plr">期号：${ goodsTimes.times }</p><!-- 开始时间 -->    <!-- 结束时间 -->
                     <c:choose>
                         <c:when test="${goodsTimes.canGetCqsscno==true}"> <!-- 获取到福利彩 -->
                             <p class="lr text-f large djs lxftime">揭晓倒计时：<em id="c2">${goodsTimes.openTime}</em></p>
                         </c:when>
                         <c:otherwise>
                             <p class="text-f large lr djs lxftime">揭晓倒计时：请稍后...</p>
                         </c:otherwise>
                     </c:choose>
                   </span>
            </div>
            <c:if test="${goodsTimes.canGetCqsscno==false}">
                <div class="d_d  large_normal lr">
                    <p>
                        由于福彩中心通讯故障，暂时无法获取"老时时彩"开奖结果，正在等待"老时时彩"开奖结果。
                    </p>
                </div>
            </c:if>
        </c:when>
        <c:otherwise>
            <div class="count">
                <p class="text-low2 large lr">期号：${goodsTimes.times }</p>

                <div class="schedule lr"><span><ins style="width:${goodsTimes.snatchProgress}%"></ins></span></div>
                <p class="text-low2 lr large">总需${goodsTimes.totalTimes }人次<b>剩余<em
                        class="blur">${goodsTimes.totalTimes-goodsTimes.totalBuyTimes }</em></b></p>
            </div>
        </c:otherwise>
    </c:choose>
    <div class="d_t low large_normal">
        <c:choose>
            <c:when test="${userBuyTimes== 0 || userBuyTimes==null }">
                <span>您没有参与本期夺宝哦！</span>
            </c:when>
            <c:when test="${userBuyTimes>0 }">
                <div class="d_t low large_normal">
                    <p class="large low lr">您参与了：<em class="pink2">${userBuyTimes }</em>人次</p>
                    <dl class="lr large nub">
                        <dt>夺宝号码</dt>
                        <c:forEach items="${userNums }" var="nums">
                            <dd>${nums }</dd>
                        </c:forEach>
                        <dd>
                            <c:if test="${userBuyTimes>7}">
                                <a href="${ctx }/wx/order/snatch/record/num/list?goodsTimesId=${goodsTimes.id}&userId=${userId}">查看号码</a>
                            </c:if>
                        </dd>
                    </dl>
                </div>
            </c:when>
        </c:choose>
    </div>
    <!-- 产品详情 结束-->
    <div class="txt_de">
        <ul>
            <li class="line lr">
                <a href="${staticHtmlRootUri }/goods/${goodsTimes.goodsInfo.detailsHtmlUrl}">图文详情<em>建议在WiFi下查看</em></a>
            </li>
            <li class="line lr">
                <a href="${ctx }/wx/goods/goodsTimes/record/list/${goodsTimes.goodsInfo.id}">往期揭晓</a>
            </li>
            <li class="line lr">
                <a href="${ctx}/wx/goods/shareGoods/${goodsTimes.goodsInfo.id}/list">晒单分享</a>
            </li>
        </ul>
    </div>
    <!-- 小功能结束 -->
    <div class="partake">
        <p class="lr ">所有参与记录<em class="large_normal low">&nbsp;</em></p>
    </div>
    <div class="all_people">
        <ins></ins>
        <p class="all-time"><fmt:formatDate value="${selfmethod:dealstrtodate(timestamp)}" pattern="yyyy-MM-dd"/></p>
        <ul id="dataList">
            <c:forEach items="${jsonResult.data.result}" var="data">
                <li>
                    <div class="all_pic">
                        <c:choose>
                            <c:when test="${data.userHeadImg!=null}">
                                <c:choose>
                                    <c:when test="${fn:startsWith(data.userHeadImg, 'http://') or fn:startsWith(data.userHeadImg, 'https://')}">
                                        <img src="${data.userHeadImg}" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${userHeadImgRootUri}/${data.userHeadImg}" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <img src="${ ctx}/static/images/head/default-head.png" alt="">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="all_txt">
                        <p>
                            <a href="javascript:void(0)" class="large_normal blur">${data.userNickName }</a>
                        <!-- 
                        <a href="${ctx}/wx/order/snatch/record/others/list?userId=3"
                              class="large_normal blur">${data.userNickName }</a>
                         -->
                        </p>

                        <p class="large_normal text-heavy">参与了<b class="pink">${data.buyTimes }</b>次<em
                                class="text-low2"><fmt:formatDate
                                value="${selfmethod:dealstrtodate(data.snatchTimeStr)}"
                                pattern="yyyy-MM-dd  HH:mm:ss"/></em></p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <!-- 全部参与人数结束 
    <div class="footer">
        <ul>
            <c:choose>
                <c:when test="${ goodsTimes.state!=1 && hasLastGoodsTimes==true }">
                    <li class="low large www">新一期正在火热进行中</li>
                   <div class="tc gtd_btn">
                       <div class="plr">
                           <a href="${ctx }/wx/goods/goodsTimes/detail/getLast/${goodsTimes.goodsInfo.id}?userId=3" class="btn" id="join_rn">立即参与</a>
                       </div>
                   </div>
                </c:when>
                <c:otherwise>
                      <div class="tc gtd_btn">
                        <div class="plr">
                            <a href="#" class="btn" id="join_rn">立即参与</a>
                            <a href="${ctx}/wx/snatchList/list?userId=3" class="btn2 add_cart_large btnCart text-heavy">加入购物车</a>
                        </div>
                      </div>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    -->
       <div id="LoginBox">
       <input type="hidden" id="remindBlance" value="${goodsTimes.totalTimes-goodsTimes.totalBuyTimes}">
       <div class="row1">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择参与人次<a href="javascript:void(0)" title="关闭" class="close_btn" id="closeBtn">×</a>
       </div>
       <div class="row">
            <button type="button" class="jian" onclick="listItem1.minus(this)"></button>
                <c:if test="${goodsTimes.isTenYuan==true }">
                    <input type="number" id="selecttimes" value="10" class="num"  onkeyup="listItem1.keyup(this)" data-is-enit="false" data-ten-yuan=${goodsTimes.isTenYuan}>
                </c:if>
                <c:if test="${goodsTimes.isTenYuan==false }">
                    <input type="number" id="selecttimes" value="1" class="num"  onkeyup="listItem1.keyup(this)" data-is-enit="false" data-ten-yuan=${goodsTimes.isTenYuan}>
                </c:if>
            <button type="button" class="add" onclick="listItem1.add(this)"></button>
       </div>
       <c:if test="${goodsTimes.isTenYuan==true }">
           <input type="hidden" name="youbuytimes" id="youbuytimes" value="10" />
       </c:if>
       <c:if test="${goodsTimes.isTenYuan==false }">
           <input type="hidden" name="youbuytimes" id="youbuytimes" value="1" />
       </c:if>
       <div class="lijicanyu">
            <ul class="cy_ul">
               <li onclick="changTimes(10);"><a href="javascript:void(0)">10</a></li>
               <li onclick="changTimes(20);"><a href="javascript:void(0)">20</a></li>
               <li onclick="changTimes(30);"><a href="javascript:void(0)">30</a></li>
            </ul>
        </div>
       <div class="row2">
           <a href="#" id="loginbtn">确定</a>
       </div>
   </div>
    <div class="foot-flag">
        <ul>
            <c:choose>
                <c:when test="${ goodsTimes.state!=1 && hasLastGoodsTimes==true }">
                    <!-- <li class="low large www">新一期正在火热进行中</li> -->
                   <div class="tc gtd_btn">
                       <div class="plr">
                       新一期正在火热进行中...&nbsp;&nbsp;&nbsp;&nbsp;
                           <a href="${ctx }/wx/goods/goodsTimes/detail/getLast/${goodsTimes.goodsInfo.id}?userId=3" class="btn" >立即前往</a>
                       </div>
                   </div>
                </c:when>
                <c:otherwise>
                      <div class="tc gtd_btn">
                        <div class="plr">
                            <a href="#" class="btn" id="join_rn">立即参与</a>
                            <a href="${ctx}/wx/snatchList/list?userId=3" class="btn2 add_cart_large btnCart text-heavy">加入购物车</a>
                        </div>
                      </div>
                </c:otherwise>
            </c:choose>
        </ul>
        <!-- 
        <ul>
            <li class="on"><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_on_1 icon"></b><p>夺宝</p></a></li>
            <li><a href="${ctx}/wx/goods/goodsTimes/listLastOpen" class="text-heavy"><b class="icon_2 icon"></b><p>最新揭晓</p></a></li>
            <li><a href="${ctx}/wx/service/activity/find" class="text-heavy"><img src="${ctx}/static/wx/images/index/icon_find.png"/></a></li>
            <li><a href="${ctx}/wx/snatchList/list" class="text-heavy"><b class="icon_4 icon"></b><p>购物车</p></a></li>
            <li><a href="${ctx}/wx/user/home" class="text-heavy"><b class="icon_5 icon"></b><p>我的</p></a></li>
        </ul>
         -->
    </div>
    <div class="mb80"></div>
    <input type="hidden"
           value="<fmt:formatDate value="${selfmethod:dealstrtodate(timestamp)}" pattern="yyyy-MM-dd HH:mm:ss"/>"
           id="currentTimeStr">
    <!-- 底部信息 结束-->
</div>
<script src="${ctx}/static/wx/js/TouchSlide.1.1.js"></script>
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/all.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/css/shopping/js/parabola.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils/moment-with-locales.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils/public.js"></script>
<script type="text/javascript">
    $(function () {
        var $e = $("#c2");
        var timeStr = $.trim($e.text());
        var currentTimeStr = $("#currentTimeStr").val();
        if (Public.isNotNull(timeStr) && Public.isNotNull(currentTimeStr)) {
            var deadlineDate = moment(timeStr, "YYYY-MM-DD HH:mm:ss");
            var timeStart = moment(currentTimeStr, "YYYY-MM-DD HH:mm:ss");
            var ms = deadlineDate.diff(timeStart);
            var t = setInterval(function () {
                var content;
                if (ms < 1) {
                    clearInterval(t);
                    content = "等待揭晓";
                    window.location.reload();
                } else {
                    content = moment.utc(ms).format("mm:ss:SSS");
                }
                $e.html(content);
                ms = ms - 100;
            }, Public.getRandomNum(100));
        } else {
            $e.html("请稍后...");
        }
    });

    var buyListBoolean =${buyListBoolean};
    var sta =${goodsTimes.state };
    if (sta != 1) {
        buyListBoolean = true;
    }
    var reqState = false; //
    var listItem = {
        enit: function (num) {
            if (buyListBoolean == false) {
                $.ajax({
                    url: "${ctx}/wx/snatchList/editSnatchListItem",
                    data: {
                        goodsTimesId: ${goodsTimes.id},
                        userId: 3,
                        amount: num
                    },
                    type: 'post',
                    dataType: 'json',
                    success: function (result) {
                        if (result.state == 200) {
                            reqState = true;
                            window.location.href="${ctx}/wx/snatchList/list?userId=3";
                        }
                    },
                    error: function () {

                    }
                });
            }
        }
    };
    TouchSlide({
        slideCell: "#focus",
        titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
        mainCell: ".bd ul",
        effect: "left",
        autoPlay: true,//自动播放
        autoPage: true, //自动分页
        switchLoad: "_src" //切换加载，真实图片路径为"_src"
    });
    var eleFlyElement = document.querySelector("#flyItem"), eleShopCart = document.querySelector("#shopCart");
    var numberItem = ${listCount};
    // 抛物线运动
    var myParabola = funParabola(eleFlyElement, eleShopCart, {
        speed: 400, //抛物线速度
        curvature: 0.0008, //控制抛物线弧度
        complete: function () {
            eleFlyElement.style.visibility = "hidden";
            if (reqState == true) {
                reqState = false;
                buyListBoolean = true;
                eleShopCart.querySelector("span").innerHTML = ++numberItem;
            }
        }
    });
    // 绑定点击事件
//    if (eleFlyElement && eleShopCart) {
        [].slice.call(document.getElementsByClassName("btnCart")).forEach(function (button) {
            button.addEventListener("click", function (event) {
                if (wxcommon.isEmpty('${userId}')) {
                    wxcommon.message('您未登录，请授权登录', function () {
                        wxcommon.login();
                    });

                    return;
                }

                var src = $(this).parents("li").find('.p-img').find("img").attr("src");
                $("#flyItem").find("img").attr("src", src);
                // 滚动大小
                var scrollLeft = document.documentElement.scrollLeft || document.body.scrollLeft || 0,
                        scrollTop = document.documentElement.scrollTop || document.body.scrollTop || 0;
                eleFlyElement.style.left = event.clientX + scrollLeft + "px";
                eleFlyElement.style.top = event.clientY + scrollTop + "px";
                eleFlyElement.style.visibility = "visible";

                // 需要重定位
                myParabola.position().move();
                listItem.enit(${goodsTimes.isTenYuan==false?1:10});
            });
        });
  //  }

    $(function () {
        wxcommon.autoLoad({
            totalPages: ${page.totalPages},                 // 总页数
            pageNo: ${page.pageNo},                         // 页码
            pageSize: ${page.pageSize},                     // 分页大小
            timestamp: ${timestamp},
            containerId: "dataList",                        // 显示内容的容器id
            url: "${ctx}/wx/snatch/snatchRecordDetail/${goodsTimes.id}/list",          // 请求url
            doRowDataFun: function (rowData) {               // 格式化行级数据
                var imgUrl = "${ ctx}/static/images/head/default-head.png";
                if (rowData.userHeadImg != null) {
                    var imgUrl = '${userHeadImgRootUri}/' + rowData.userHeadImg;
                }
                return '<li><div class="all_pic"><img src="' + imgUrl + '" alt="">'
                        + '</div><div class="all_txt"><p><a href="${ctx}/wx/order/snatch/record/others/list?userId=3"  class="large_normal blur">' + rowData.userNickName + '</a></p>'
                        + '<p class="large_normal text-heavy">参与了<b class="pink">${data.buyTimes }</b>次'
                        + '<em class="text-low2"><fmt:formatDate value="${selfmethod:dealstrtodate('+rowData.snatchTimeStr+')}" pattern="yyyy-MM-dd  HH:mm:ss"/></em>'
                        + '</p></div></li>';
            }
        });
    });

</script>
<script type="text/javascript">
    $(function ($) {
        //弹出登录
        $("#join_rn").hover(function () {
            $(this).stop().animate({
                opacity: '1'
            }, 600);
        }, function () {
            $(this).stop().animate({
                opacity: '0.6'
            }, 1000);
        }).on('click', function () {
            $("body").append("<div id='mask'></div>");
            $("#mask").addClass("mask").fadeIn("slow");
            $("#LoginBox").fadeIn("slow");
        });
        //按钮的透明度
        $("#loginbtn").hover(function () {
            $(this).stop().animate({
                opacity: '1'
            }, 600);
        }, function () {
            $(this).stop().animate({
                opacity: '0.8'
            }, 1000);
        });
        $("#loginbtn").on('click', function () {
            var times1 = $("#selecttimes").val();
            var val=parseInt(times1);
            var isTenYuan=$("#selecttimes").attr("data-ten-yuan");
            if(isTenYuan=="true" || isTenYuan==true){
                val=val-val%10;
            }

            if(val!=0){
               $("#selecttimes").val(val);
            }

            $.ajax({
                url: "${ctx}/wx/snatchList/editSnatchListItem",
                data: {
                    goodsTimesId: ${goodsTimes.id},
                    userId: 3,
                    amount: val
                },
                type: 'post',
                dataType: 'json',
                success: function (result) {
                    window.location.href="${ctx}/wx/snatchList/list?userId=3";
                },
                error: function () {
                    window.location.href="${ctx}/wx/snatchList/list?userId=3";
                }
            });
        });
        //关闭
        $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
            $("#LoginBox").fadeOut("fast");
            $("#mask").css({ display: 'none' });
        });
    });
    var listItem1={
        add:function(_this){ /*加*/
            var number=listItem1.returnNum($(_this).prev());
            var val=$(_this).prev().val();
            if(listItem1.isNull(val)){
                val=0;
            }

            var tarNumber = parseInt(val)+number;
            var remind =parseInt($("#remindBlance").val());
            if (tarNumber > remind) {
                tarNumber = remind;
            }

            var isTenYuan=$(_this).prev().attr("data-ten-yuan");
            if(isTenYuan=="true" || isTenYuan==true){
                tarNumber=tarNumber-tarNumber%10;
            }

            $(_this).prev().val(tarNumber);  
            $(_this).prev().prev().removeAttr("disabled");/*启用按钮*/
            $("#youbuytimes").val(tarNumber);
            $("#selecttimes").val(tarNumber);
        },
        minus:function(_this){ /*减*/
            var number=listItem1.returnNum($(_this).next());
            var v=parseInt($(_this).next().val())-number;

            if(v<number){
                v=number;
                $(_this).attr({disabled: 'true'}); /*禁用按钮*/
            }

            var tarNumber = v;
            var remind =parseInt($("#remindBlance").val());
            if (tarNumber > remind) {
                tarNumber = remind;
            }

            var isTenYuan=$(_this).next().attr("data-ten-yuan");
            if(isTenYuan=="true" || isTenYuan==true){
                tarNumber=tarNumber-tarNumber%10;
            }

            $(_this).next().val(tarNumber);
            $("#youbuytimes").val(tarNumber);
            $("#selecttimes").val(tarNumber);
        },
        returnNum:function(_this){ //返回 1 或者 10
            var isTemYuan=$(_this).attr("data-ten-yuan");
            var number=1;
            if(isTemYuan=="true"||isTemYuan==true){
                number=10;
            }
            $(_this).attr("data-is-enit","true");
            return number;
        },
        keyup:function(_this){
            var val=$(_this).val();
            var isTenYuan=$(_this).attr("data-ten-yuan");
            var defaultNum=10;

            var tarNumber = parseInt(val);
            var remind =parseInt($("#remindBlance").val());
            if (tarNumber > remind) {
                val = $("#remindBlance").val();
            }

            $(_this).val(val);
            $(_this).attr("data-is-enit",true);
        }, 
        isNull : function(str) {//判断字符串是否为空
            if (str == '' || str == undefined || str == 'undefined' || str == null || str == 'null' || str=='NULL')
                return true;
            return false;
        }
    };
    function changTimes(value) {
        $("#selecttimes").val(value);
        $("#youbuytimes").val(value);
    };
    </script>
</body>
</html>

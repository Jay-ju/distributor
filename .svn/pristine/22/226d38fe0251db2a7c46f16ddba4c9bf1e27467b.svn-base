<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
    content="width=device-width,initial-scale=1,user-scalable=no" />
<title>购物车</title>
<meta name="keywords" content="购物车">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
<link rel="Bookmark" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/goods.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/bask.css">
<link href="${ctx}/static/wx/dos/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="${ctx}/static/wx/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/wx/js/goods.js"></script>
<script src="${ctx}/static/wx/dos/js/bootstrap.min.js"></script>
<script src="${ctx}/static/wx/dos/js/plugins/iCheck/icheck.min.js"></script>
<style type="text/css">
    @media screen and (width: 414px){
        .bill-txt{
            width:47%;
        }
    }
</style>
<script type="text/javascript">
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green'
                });
            });
</script>
</head>
<body style="background: #fff;">
    <div class="max-box">
        <c:choose>
            <c:when test="${jsonResult.data.size()>0 }">
                <form action="${ctx}/wx/order/snatchPay/prepay">
                <div class="top tc">
                    <a href="javascript:wxcommon.goback('${ctx }');" target="_self" class="black">购物车</a>
                </div>
                <!-- 头部结束 -->
                <div class="bill" id="bottom">
                
                <ul>
                <c:forEach items="${jsonResult.data }" var="data">
                        <li>
                            <div class="checkbox i-checks">
                                <label class="" style="display:none">
                                        <div class="icheckbox_square-green left">
                                            <input type="checkbox" name="goodsTimesIds" checked="checked"
                                                onclick="listItem.checked(this)" value="${data.goodsTimesId}">
                                            
                                        </div> <i></i>
                                    </label>
                                <div class="b-inner">
                                    <div class="bill-img">
                                        <img src="${ goodsRootUri }/${data.thumbnail }" alt="">
                                        <c:if test="${data.isTenYuan }">
                                                <ins class="ten-yuan"></ins>
                                        </c:if>
                                    </div>
                                    <div class="bill-txt">
                                        <p class="large">${data.goodsName }</p>
                                        <p class="large low mt5">
                                            总需${data.totalTimes }人次
                                        </p>
                                        <p class="large low mt5">
                                            剩余<em class="blur">${data.totalTimes-data.totalBuyTimes }</em>人次
                                        </p>
                                        <div class="b-bon">
                                            <button type="button" class="jian" onclick="listItem.minus(this)"></button>
                                            <input type="number" value="${data.buyTimes }" class="num"  onkeyup="listItem.keyup(this)" data-is-enit="false" data-ten-yuan=${data.isTenYuan }>
                                            <button type="button" class="add" onclick="listItem.add(this)"></button>
                                            <input type="hidden" value="${data.totalTimes-data.totalBuyTimes}">
                                        </div>
                                    </div>
                                    <button class="close" type="button"
                                        onclick="listItem.confirm(this,${userId},${data.id })"></button>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
            <!-- 清单结束 -->
                <div>
                    <p class="tc plr text-low2">
                        共<span id="size" class="primary" >${ jsonResult.data.size()}</span>件商品，总计<b class="primary mub" id="total">0乐金币</b>
                    </p>
                    <p><a href="javascript:listItem.snatch();" target="_self" class="btn_account">结算</a></p>
                </div>
                    <%-- <p class="tc plr text-low2">总共参与  <span class="primary">${ jsonResult.data.size()} </span>个商品  
                        合计:<b class="primary ml10">￥1</b>乐金币</p>
                    <p><a href="javascript:listItem.snatch();" target="_self" class="btn_account">结算</a></p> --%>
                </div>
                </form>
            </c:when>
            <c:otherwise>
                <div class="top tc">
                    <a href="#" target="_self" class="black">购物车</a>
                </div>
                <!-- 头部结束 -->
                <div class="bill">
                    <div class="Null">
                        <img src="${ctx }/static/wx/images/nono.png" alt=""/>
                        <a href="${ ctx}/wx/goods/goodsTimes/all" class="bg_4">立即夺宝</a>
                    </div>
                </div>  
            </c:otherwise>
        </c:choose>

        <div class="footer low">
            <a href="${ctx}/page/problem.html" class="orange">&nbsp;&nbsp;&nbsp;&nbsp;常见问题</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="http://www.699fun.com/wx/index.htm">下载APP客户端</a>
        </div>
        <div class="footbox tc f12">
            <p class="text-normal"><span>客服热线</span> <span class="orange">400-163-6995</span><span class="ml10">陕ICP备16006036号</span></p>
            <p class="text-low2">Copyright@2014-2016 陕西乐久久网络科技有限公司</p>
        </div> 
    <div class="foot-flag">
        <ul>
            <li ><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_1 icon"></b><p>夺宝</p></a></li>
            <li><a href="${ctx}/wx/goods/goodsCategory/listCategory" class="text-heavy"><b class="icon_6 icon"></b><p>分类</p></a></li>
            <li><a href="${ctx}/wx/goods/goodsTimes/listLastOpen" class="text-heavy"><b class="icon_2 icon"></b><p>最新揭晓</p></a></li>
            <li class="on"><a href="${ctx}/wx/snatchList/list" class="text-heavy"><b class="icon_on_4 icon"></b><p>购物车</p></a></li>
            <li><a href="${ctx}/wx/user/home" class="text-heavy"><b class="icon_5 icon"></b><p>我的</p></a></li>
        </ul>
    </div>
                   <div class="mb80"></div>
    </div>
</body>
<script type="text/javascript" src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript">
        window.onbeforeunload = beforeunload;
        function beforeunload() {
            $("input[type=number]").each(function(){
                var isEdit=$(this).attr("data-is-enit");
                var number=$(this).val();
                if(listItem.isNull(number)){
                    number=listItem.returnNum(this);
                }
                if(isEdit=="true" || isEdit==true){
                    $(this).attr("data-is-enit",false);
                    var id=$(this).parents(".b-inner").prev().find("input[type=checkbox]").val();
                    $.post("${ctx}/wx/snatchList/editSnatchListItem",{goodsTimesId: id,amount: number},function(){
                        location.reload();
                    });
                }
            });
        }

        var listItem={
            cheState:true, //默认全选
            lockChecker: undefined, //执行修改数量定时器
            time:500, //定时器执行时间
            confirm:function(_this,userId,id){
                wxcommon.confirm("确定要删除该商品吗?",function(){
                    listItem.delListItem(_this,userId,id);
                });
            },
            delListItem:function(_this,userId,id){
                $.ajax({
                    url: "${ctx}/wx/snatchList/delUserList",
                    data:{
                        userId:userId,
                        listItemId: id
                    },
                    type: 'post',
                    dataType:'json',
                    beforeSend:function(){
                        wxcommon.showProgress("正在执行...");
                    },
                    success:function(result){
                      wxcommon.colseProgress();
                      if(<%=Const.COMMON_RESULT_SUCCESS%>==result){
                        $(_this).parents(".checkbox").parent().remove();
                        listItem.isCheckedAll();
                        $("#size").html($('input:checkbox[name=goodsTimesIds]:checked').length);
                      }else{
                          wxcommon.message("删除失败！请检查您的网络是否稳定！",function(){
                              wxcommon.colseProgress();
                          });
                      }
                    },
                    error:function(){
                        wxcommon.colseProgress();
                        wxcommon.message("删除失败！请检查您的网络是否稳定！",function(){
                            wxcommon.colseProgress();
                        });
                    }
                });
            },              
            checkedAll:function(_this){
                if(listItem.cheState==false){ 
                    $(_this).parent().addClass("checked");
                    $('input[name=goodsTimesIds]').prop("checked",true);
                    $('input[name=goodsTimesIds]').attr("checked",true);
                    $('input[name=goodsTimesIds]').each(function(){
                        $(this).parent().addClass("checked");
                    });
                    listItem.cheState=true;
                }else{ 
                    $(_this).parent().removeClass("checked");
                    $('input[name=goodsTimesIds]').prop("checked",false);
                    $('input[name=goodsTimesIds]').attr("checked",false);
                    $('input[name=goodsTimesIds]').each(function(){
                        $(this).parent().removeClass("checked");
                    });
                    listItem.cheState=false;
                } 
                listItem.setTotal();
                $("#size").html($('input:checkbox[name=goodsTimesIds]:checked').length);
            },
            checked:function(_this){
                var a=$(_this).attr("checked");
                if($(_this).prop("checked")){
                    $(_this).parent().removeClass("checked");
                    $(_this).prop("checked",false); 
                    $(_this).attr("checked",false); 
                }else{
                    $(_this).parent().addClass("checked");
                    $(_this).prop("checked",true); 
                    $(_this).attr("checked",true); 
                }
                listItem.isCheckedAll();
            },
            isCheckedAll:function(){ 
                var checkLength=$('input:checkbox[name=goodsTimesIds]:checked').length;
                var checkedLength=$('input[name=goodsTimesIds]').length;
                $("#size").html(checkLength);
                if(checkLength>=checkedLength){
                    $("#checkboxAll").parent().addClass("checked");
                    listItem.cheState=true;
                }else{
                    $("#checkboxAll").parent().removeClass("checked");
                    listItem.cheState=false;
                }
                listItem.setTotal();
            },
            add:function(_this){ /*加*/
                var number=listItem.returnNum($(_this).prev());
                var val=$(_this).prev().val();
                if(listItem.isNull(val)){
                    val=0;
                }
                var remind = parseInt($(_this).next().val());
                var tarNumber = parseInt(val)+number;
                if (tarNumber > remind) {
                    $(_this).prev().val(remind);
                } else {
                    $(_this).prev().val(tarNumber);  
                }
                $(_this).prev().prev().removeAttr("disabled");/*启用按钮*/
                listItem.setTotal();
                listItem.mySetTimeout();
            },
            minus:function(_this){ /*减*/
                var number=listItem.returnNum($(_this).next());
                var v=parseInt($(_this).next().val())-number;
                if(v<number){
                    v=number;
                    $(_this).attr({disabled: 'true'}); /*禁用按钮*/
                }
                $(_this).next().val(v)  
                listItem.setTotal();
                listItem.mySetTimeout();
            },
            mySetTimeout:function(){ //设置修改数据库频率
                clearTimeout(listItem.lockChecker);  //把上一次点击产生的timeout清除掉
                listItem.lockChecker=setTimeout(function(){//设置一个新的timeout
                    $("input[type=number]").each(function(){
                        var isEdit=$(this).attr("data-is-enit");
                        var number=$(this).val();
                        if(listItem.isNull(number)){ //判断当前val是否为空
                            number=listItem.returnNum(this);
                        }
                        if(isEdit=="true" || isEdit==true){
                            var id=$(this).parents(".b-inner").prev().find("input[type=checkbox]").val();
                            var $this=this;
                            $.post("${ctx}/wx/snatchList/editSnatchListItem",{goodsTimesId: id,amount: number},function(){
                                $($this).attr("data-is-enit",false);
                            });
                        }
                    });
                    listItem.lockChecker=undefined;
                  },listItem.time);
            },
            myForm:function(){ //判断是否还在修改数量,没有就提交
                setTimeout(function(){
                    if(!listItem.lockChecker){
                        $('form').submit();
                    }
                    listItem.myForm();
                },listItem.time);
            },
            setTotal:function(){ //计算购买总金额
                var g=0;
                $('input[name=goodsTimesIds]:checked').each(function(k,v){
                    var str=$(this).parents("label").next().find("input[type='number']").val();
                    if(!listItem.isNull(str)){
                        g+=parseInt($(this).parents("label").next().find("input[type='number']").val());
                    }
                });
                $("#total").html(g+'乐金币'); 
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
                var valNum = parseInt(val);
                var remind =parseInt($(_this).next().next().val());
                if (valNum > remind) {
                    val = $(_this).next().next().val();
                }
                var isTenYuan=$(_this).attr("data-ten-yuan");
                var defaultNum=10;
                if(isTenYuan=="true" || isTenYuan==true){
                    if(!listItem.isNull(val)){
                        val=val-val%10;
                        if(val!=0){
                            $(_this).val(val);
                            $(_this).attr("data-is-enit",true);
                            listItem.setTotal();
                            listItem.mySetTimeout();
                        }
                    }
                }else{
                    if(!listItem.isNull(val)){
                        $(_this).val(val);
                        $(_this).attr("data-is-enit",true);
                        listItem.mySetTimeout();
                    }
                }
                listItem.setTotal();
            }, 
            isNull : function(str) {//判断字符串是否为空
                if (str == '' || str == undefined || str == 'undefined' || str == null || str == 'null' || str=='NULL')
                    return true;
                return false;
            },
            snatch: function(){
                 var check=$('input[name=goodsTimesIds]:checked');
                if(check.length < 1){
                    wxcommon.message('请选择需要夺宝商品');
                    return;
                }
                var isNull=false;
                var goodsName="";
                $('input[name=goodsTimesIds]:checked').each(function(k,v){
                    var txt=$(this).parents("label").next().find(".bill-txt");
                    var val=$(txt).find("input[type=number]").val();
                    if(listItem.isNull(val)){
                        isNull=true;
                        goodsName=$(txt).find("p:eq(0)").html();
                    }
                });
                if(isNull){
                    goodsName=goodsName.substring(0,10);
                    wxcommon.message("商品:"+goodsName+"...数量不能为空");
                    return; 
                } 
                if(listItem.lockChecker){
                    wxcommon.showProgress("正在提交数据");
                    listItem.myForm();
                }else{
                    $('form').submit();
                }
            }
        };
        listItem.setTotal();
    </script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,user-scalable=no"/>
    <title>发布晒单</title>
    <meta name="keywords" content="发布晒单">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/bask.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/js/Validform/Validform_v5.3.2_min.css"/>
    <script type="text/javascript">
        window.onload = function () {
            var text = document.getElementById("text"); //用户看到的文本框
            var shadow = document.getElementById("shadow"); //隐藏的文本框
            text.oninput = onchange;

            function onchange() {
                shadow.value = text.value;
                setHeight();
                function setHeight() {
                    text.style.height = shadow.scrollHeight + "px";
                }
            }
        };
    </script>
</head>
<body style="background: #fff;">
<c:set var="backUrl" value="${ctx}/wx/winng/detail?goodsTimesId=${goodsTimes.id}"></c:set>
<div class="max-box">
    <div class="top tc">
        <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black">发布晒单</a>
    </div>
    <!-- 头部结束 -->
    <form:form id="inputForm" modelAttribute="entity"
               action="${ctx}/wx/goods/shareGoods/save" method="post">
        <form:hidden path="id"/>
        <input type="hidden" name="goodsTimesId" value="${goodsTimes.id}">
        <input type="hidden" datatype="checkImageSize" nullmsg="请上传1-8张图片" errormsg="请上传1-8张图片">
        <div class="txt_t">
            <div class="txt_tle lr line">
                <form:input path="title" placeholder="晒单主题，不少于6个字" cssClass="largest_plus low"
                            datatype="s6-64" nullmsg="晒单主题，不少于6个字" errormsg="晒单主题，6-64个字符内"
                            sucmsg="" />
            </div>
            <div class="txt_cen">
                <form:textarea path="content" cssClass="lr low" placeholder="获奖感言，不少于30个字"
                            datatype="s30-200" nullmsg="获奖感言，不少于30个字" errormsg="获奖感言，30-200个字符内"
                            sucmsg="" id="text"/>
                <textarea id="shadow"></textarea>

                <div class="txt_img clearfloat">
                    <ul class="input">
                        <c:forEach items="${shareImages}" var="image">
                            <li class="code_fileIds">
                                <ins onclick="uploadImg.deleteImg(this, 'fileIds', '${image.id}')"></ins>
                                <img src="${shareGoodsRootUri}/${image.url}" style="width: 104px;height: 104px;">
                            </li>
                        </c:forEach>
                        <li class="listyle"><input type="file" accept="image/*" id="fileIds"></li>
                        <!-- 在IOS端点击时会提示选择图片或相机，安卓端要看浏览器对这两个属性的优化，部分浏览器会直接跳转到资源管理器，优化做得好的可以直接提示选择相册或相机 -->
                    </ul>
                </div>
            </div>
            <div class="new plr">
                <p>获奖商品：${goodsTimes.goodsName}</p>

                <p>
                    本期参与：<b class="pink2">${goodsTimes.winngUserBuyTimes}</b>人次
                </p>

                <p>
                    幸运号码：<b class="pink2">${goodsTimes.luckNum}</b>
                </p>

                <p>
                    揭晓时间：
                    <fmt:formatDate value="${goodsTimes.openTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </p>
            </div>
        </div>
    </form:form>
    <div class="k-z"><span class="Validform_checktip"></span></div>
    <div class="foot">
        <a href="javascript:submitForm();" class="bg_1 lar_l">发布晒单</a>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/Validform/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/wxcommon.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/uploadImage/LocalResizeIMG.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/uploadImage/mobileBUGFix.mini.js"></script>
<script type="text/javascript" src="${ctx}/static/wx/js/uploadImage/uploadImg.js"></script>
<script type="text/javascript">
    $(function(){
        $("#inputForm").Validform( {
            tiptype: function (msg, o, cssctl) {
                var objtip = $(".Validform_checktip");
                if (o.type == 2) {
                    objtip.parent().removeClass("tip-db");
                }
                if (o.type == 3) {
                    objtip.parent().addClass("tip-db");
                }
                cssctl(objtip, o.type);
                objtip.text(msg);
            },
            datatype: {
                checkImageSize: function (gets, obj, curform, regxp) {
                    return uploadImg.checkImageSize();
                }
            },
            postonce: true,
            ajaxPost: true,
            beforeSubmit:function(curform){
                wxcommon.showProgress("保存数据中...");
                return true;
            },
            callback: function(data){
                wxcommon.colseProgress();
                if(data && data.status == 'y'){
                    wxcommon.message("发布晒单成功，请等待审核！", function(){
                        location.href='${backUrl}';
                    });
                }else{
                    var msg;
                    switch(data.info){
                        case 301:
                            msg = "主题不少于6个字";
                            break;
                        case 302:
                            msg = "主题不超过32个字";
                            break;
                        case 303:
                            msg = "获奖感言不少于30个字";
                            break;
                        case 304:
                            msg = "获奖感言不超过300个字";
                            break;
                        case 305:
                            msg = "请上传图片";
                            break;
                        case 306:
                            msg = "最多上传8张图片";
                            break;
                        case 307:
                            msg = "已晒单";
                            break;
                        case 308:
                            msg = "只能发布本人的晒单";
                            break;
                        default:
                            msg = "晒单失败"
                    }
                    wxcommon.message(msg);
                }
            }
        });
        $('#Validform_msg').remove();

        uploadImg.initUpload({
            id: 'fileIds',
            id: 'fileIds',
            thumbWidth: 104,
            imgMaxWidth: 720,
            limitAmount: 8,
            uploadUrl: '${ctx}/tmpFile/uploadWithBase64',
            deleteUrl: '${ctx}/wx/goods/shareGoods/deleteImg'
        });
    });

    function submitForm(){
        $("#inputForm").submit();
    }
</script>
</body>
</html>

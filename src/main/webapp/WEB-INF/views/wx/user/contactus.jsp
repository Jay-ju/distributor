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
    <title>联系我们</title>
    <meta name="keywords" content="联系我们">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
    <link rel="Bookmark" href="favicon.ico">
    <meta
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
            name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=yes">
    <link rel="stylesheet"
          href="${ctx}/static/wx/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/global.css"/>
    <link rel="stylesheet" type="text/css"
          href="${ctx}/static/wx/css/mine.css"/>
          <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/js/layer/need/layer.css"/>
          <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/compute.css" />
</head>
<body>
<div class="max-box container">
    <div class="top tc row ">
        <div class="top tc">
            <a href="javascript:wxcommon.goback('${ctx}');" target="_self"
               class="black">联系我们</a>
               <input type="hidden" id="userId" name="userId" value="${user.id}"/>
        </div>
    </div>
    <!-- 头部结束 -->
    <div class="main_box container">
        <!-- 个人信息 -->
        <div class="manage line data_pic" style="height:auto">
            <textarea name="msg" id="msg" class="form-control" placeholder="欢迎反馈问题和建议，我们会尽快回复！" ></textarea>
        </div>
        <!-- 管理 -->
    </div>
    <div class="jf_exchange" style="margin-top:1rem">
        <p class="tc">
            <a href="javascript:;" onclick="contact()" class="red_btn2">提交</a>
        </p>
    </div>
</div>
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/js/wxcommon.js"></script>
<script src="${ctx}/static/wx/js/layer/layer.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    function contact() {
        var userId=$('#userId').val();
        var message = $("#msg").val();
        if (message == '') {
            alert("请输入您宝贵的建议");
            return;
        }
        var msg = encodeURIComponent(message);
         $.ajax({
                url: "${ctx}/app/notice/saveMessage",
                data: {
                   userId: userId,
                   message: msg
                },
                type: 'get',
                dataType: 'json',
                success: function (result) {
                    alert("提交成功，我们会尽快回复！");
                    wxcommon.goback('${ctx}');
                },
                error: function () {
                	wxcommon.goback('${ctx}');
                }
            });
    }
</script>
</body>
</html>
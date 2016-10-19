<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>内容预览</title>
	<jsp:include page="/common/head-css.jsp" flush="true"></jsp:include>
	<jsp:include page="/common/foot-form-js.jsp" flush="true"></jsp:include>
    <script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        div{
            width:100%;
        }
    </style>
	
</head>

<body>
<h5>
	文章编辑 > 内容预览
</h5>
<div modelAttribute = 'content'>
	<input id="content" type="text"   name="content" style="display:none"/>
    <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
</div>

<script>
function HTMLDecode(text) { 
    var temp = document.createElement("div"); 
    temp.innerHTML = text; 
    var output = temp.innerText || temp.textContent; 
    temp = null; 
    return output; 
}

$(document).ready(function () {  
	  
    ue = UE.getEditor('editor');  
    ue.ready(function () {  
    	UE.getEditor('editor').execCommand("inserthtml",'<!DOCTYPE html><html><head><title></title></head><body>' + HTMLDecode('${content}') + '</body></html>');
    })  

}) 

</script>

</body>
</html>
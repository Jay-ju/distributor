<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>编辑模块</title>
	<jsp:include page="/common/head-css.jsp" flush="true"></jsp:include>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
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
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>
						文章编辑 >  ${empty entity.id ? "新增" : "修改"}文章
					</h5>
				</div>
				<div class="ibox-content">
					<form:form id="inputForm" modelAttribute="entity"  action="return formsubmit();" method="post" class="form-horizontal">
						<form:hidden path="id"/>
						<div class="form-group">
							<label class="col-sm-2 control-label">文章标题</label>
							<div id = title class="col-sm-6">
								<form:input path="title" cssClass="form-control" placeholder="请输入1-64个字符" autocomplete="off"/>
							</div>
							<label class="col-sm-4 control-label hint" style="text-align: left;"> </label>
						</div>
						<div class="hr-line-dashed"></div>
						<div>
						 	<input id="content" type="text"   name="content" style="display:none"/>
                            <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group">
							<div class="col-sm-6 col-sm-offset-2">
								<button class="btn btn-primary" type="submit" id="submit_btn" onclick = "submitform()">保存内容</button>
								<button class="btn btn-white" id="btnBack" type="button">返回</button>
							</div>
						</div>
						<jsp:include page="/common/foot-form-js.jsp" flush="true"></jsp:include>
					</form:form>
				</div>
			</div>
		</div>
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
		    	//UE.getEditor('editor').setContent('${entity.content}', true);
		    	//UE.getEditor('editor').execCommand("inserthtml","<!DOCTYPE html> <html><head> </head <body>" + '${entity.content}' + "</body> > </html>");
		    	debugger;
		    	UE.getEditor('editor').execCommand("inserthtml",'<!DOCTYPE html><html><head><title></title></head><body>' + HTMLDecode('${entity.content}') + '</body></html>');
		    })  
		
		}) 
		$(document).ready(function() {
			//实例化编辑器
	        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	        var ue = UE.getEditor('editor');
	        
	        function isFocus(e){
	            alert(UE.getEditor('editor').isFocus());
	            UE.dom.domUtils.preventDefault(e)
	        }
	        function setblur(e){
	            UE.getEditor('editor').blur();
	            UE.dom.domUtils.preventDefault(e)
	        }
	        function insertHtml() {
	            var value = prompt('插入html代码', '');
	            UE.getEditor('editor').execCommand('insertHtml', value)
	        }
	        function createEditor() {
	            enableBtn();
	            UE.getEditor('editor');
	        }
	        function getAllHtml() {
	            alert(UE.getEditor('editor').getAllHtml())
	        }
	        function getContent() {
	            var arr = [];
	            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
	            arr.push("内容为：");
	            arr.push(UE.getEditor('editor').getContent());
	            alert(arr.join("\n"));
	        }
	        function getPlainTxt() {
	            var arr = [];
	            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
	            arr.push("内容为：");
	            arr.push(UE.getEditor('editor').getPlainTxt());
	            alert(arr.join('\n'))
	        }
	        function setContent(isAppendTo) {
	            var arr = [];
	            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
	            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
	            alert(arr.join("\n"));
	        }
	        function setDisabled() {
	            UE.getEditor('editor').setDisabled('fullscreen');
	            disableBtn("enable");
	        }
	    
	        function setEnabled() {
	            UE.getEditor('editor').setEnabled();
	            enableBtn();
	        }
	    
	        function getText() {
	            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
	            var range = UE.getEditor('editor').selection.getRange();
	            range.select();
	            var txt = UE.getEditor('editor').selection.getText();
	            alert(txt)
	        }
	    
	        function getContentTxt() {
	            var arr = [];
	            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
	            arr.push("编辑器的纯文本内容为：");
	            arr.push(UE.getEditor('editor').getContentTxt());
	            alert(arr.join("\n"));
	        }
	        function hasContent() {
	            var arr = [];
	            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
	            arr.push("判断结果为：");
	            arr.push(UE.getEditor('editor').hasContents());
	            alert(arr.join("\n"));
	        }
	        function setFocus() {
	            UE.getEditor('editor').focus();
	        }
	        function deleteEditor() {
	            disableBtn();
	            UE.getEditor('editor').destroy();
	        }
	        function disableBtn(str) {
	            var div = document.getElementById('btns');
	            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
	            for (var i = 0, btn; btn = btns[i++];) {
	                if (btn.id == str) {
	                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
	                } else {
	                    btn.setAttribute("disabled", "true");
	                }
	            }
	        }
	        function enableBtn() {
	            var div = document.getElementById('btns');
	            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
	            for (var i = 0, btn; btn = btns[i++];) {
	                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
	            }
	        }
	    
	        function getLocalData () {
	            alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
	        }
	    
	        function clearLocalData () {
	            UE.getEditor('editor').execCommand( "clearlocaldata" );
	            alert("已清空草稿箱")
	        }
			
		    $.validator.setDefaults({
		        highlight: function (element) {
		            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
		        },
		        success: function (element) {
		            element.closest('.form-group').removeClass('has-error').addClass('has-success');
		        },
		        errorElement: "span",
		        errorPlacement: function (error, element) {
		            if (element.is(":radio") || element.is(":checkbox")) {
		                error.appendTo(element.parent().parent().parent());
		            } else {
		                error.appendTo(element.parent());
		            }
		        },
		        errorClass: "help-block m-b-none",
		        validClass: "help-block m-b-none"
		    });
		    
		    var icon = "<i class='fa fa-times-circle'></i> "; 
			$("#inputForm").validate({
				rules: {
					title: {
	                    required: true,
	                    minlength:1,
	                    maxlength:64
					}
				},
				messages: {
                	title: {
                        required: icon + "请输入您的标题",
                        minlength: icon + "标题最少1个字符",
                        maxlength: icon + "标题最多64个字符"
                    }
				},
            	errorPlacement:function(error,element) {  
            		error.appendTo(element.parent("div").next("label"));
               }
			});
		});
	</script>
	
	<script type="text/javascript">  
  
    function submitform() {  
    	debugger;
    	 with (document.getElementById("inputForm")) {
    	  method = "post";  
          action = "${ctx}/article/article/save";    
          document.getElementById("content").value = UE.getEditor('editor').getContent();
//           entity.content = UE.getEditor('editor').getAllHtml();
          submit();
    	 }
    }  
 
</script>
</body>
</html>

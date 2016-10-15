<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>收货地址管理</title>
<meta name="keywords" content="收货地址管理">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
<link rel="Bookmark" href="favicon.ico">
<meta
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
	name="viewport" id="viewport">
<meta name="format-detection" content="telephone=yes">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/global.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/wx/css/mine.css" />
<link href="${ctx}/static/wx/dos/css/font-awesome.css" rel="stylesheet">
<link href="${ctx}/static/wx/dos/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${ctx}/static/wx/dos/js/bootstrap.min.js"></script>
<script src="${ctx}/static/wx/dos/js/plugins/iCheck/icheck.min.js"></script>
<script>
          $(document).ready(function () {
              $('.i-checks').iCheck({
                  checkboxClass: 'icheckbox_square-green',
                  radioClass: 'iradio_square-green',
              });
          });
          
      </script>
</head>
<body style="background: #fff;">
	<div class="max-box">
		<div class="top tc">
			<a href="javascript:wxcommon.goback('${ctx}');" target="_self"
				class="black">收货地址管理</a>
		</div>
		<!-- 头部结束 -->

		<div class="main_box">
			<div class="site">
				<ul>
					<c:forEach items="${addresses}" var="address" varStatus="i">
						<li class="line">
							<span onclick="confirmAddress(${address.id},${flag});"><p class="plr largest text-heavy">
								<em>${address.receiver}</em>${address.tel}</p>
							<h5 class="plr larger text-low2">${address.province}${address.city}${address.district}${address.detailAddress}</h5>
							</span>
							<div class="edit">
								<ul>
									<li class="plr">
										<div class="checkbox i-checks">
											<label class="text-low2 large">
												<div class="icheckbox_square-green">
													<input type="radio" name="isDefault" id="radio${i.index}"
														${address.isDefault? 'checked' : ''}
														onclick="setDefault(${i.index},${fn:length(addresses)},${userId},${address.id})" />
													<input type="hidden" id="val${i.index}"
														value="${address.isDefault}" />
													<ins class="iCheck-helper"></ins>
												</div> <i></i> 默认地址
											</label>
										</div>
									</li>
									<li class="plr text-low2 large"><a
										href="${ctx}/wx/receiveAddress/edit?id=${address.id}&userId=${userId}"
										target="_self">编辑</a> <em
										onclick="deletes(${address.id})">删除</em></li>
								</ul>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--提示框-->
		<div id="confirm" class="hint" style="display: none;">
			<div class="hint_tle">提示</div>
			<div class="hint_tex">是否删除地址？</div>
			<input id="addressId" type="hidden" />
			<div class="hint_btn">
				<button type="button" class="hint_l" onclick="confirm(true)">确认</button>
				<button type="button" class="hint_r" onclick="confirm(false)">取消</button>
			</div>
		</div>
		<!-- 地址信息 -->
		<div class="k-z"></div>
		<div class="new-built">
			<a href="${ctx}/wx/receiveAddress/create?userId=${userId}"
				target="_self" class="text-f plus bg_1">+新建地址</a>
		</div>
	</div>
	<script src="${ctx}/static/wx/js/wxcommon.js"></script>
	<script type="text/javascript">
		
       function setDefault(id,count,userId,addressId){
			if($("#val"+id).val()=="false"){
				for(var i=0;i<count+1;i++){
					$("#val"+i).val("false");
				}
				$("#val"+id).val("true");
				
				$.ajax({
					url: '${ctx}/wx/receiveAddress/setDefault',
					data:{
						userId: userId,
						addressId: addressId
					},
					type: 'post',
					dataType: 'text',
					success: function(result){
						if(1 == result){
							wxcommon.message("恭喜您，默认地址已修改成功！");
						}else{
							alert("修改失败");
						}
					},
					error: function(){
						alert("操作失败");
					}
				});
			}
		}
       function deletes(addressId){
    	   $("#addressId").val(addressId);
    	   wxcommon.confirm("是否删除地址？", function(){
    		   var addressId = $("#addressId").val();
    		   location.href="${ctx}/wx/receiveAddress/delete?addressId="+addressId+"&userId=${userId}";
    	   });
       }
       function confirmAddress(addressId,flag){
    	   if(flag){
   	          wxcommon.confirm("是否确定收货地址？", function(){
   	        	  location.href="${ctx}/wx/winng/confirmReceiveAddr?userId=${userId}&raid="+addressId;
   	          });
    	   }
       }
       </script>
</body>
</html>
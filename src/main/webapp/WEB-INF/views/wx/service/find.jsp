<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta name="renderer" content="webkit|ie-comp|ie-stand">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	    <title>发现</title>
	    <meta name="keywords" content="发现">
	    <meta name="description" content="发现">
	    <link rel="Bookmark" href="favicon.ico">
	    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/style.css">
	    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/global.css">
	    <link rel="stylesheet" type="text/css" href="${ctx}/static/wx/css/goods.css">
	    <style type="text/css">
	    @media screen and (width: 375px){
	    	.pro_confirm .confirm_r{width:18rem;}
	    }
	    </style>
	</head>
	<body>
	<div class="max-box">
	    <div class="top tc">
	        <a href="javascript:wxcommon.goback('${ctx}');" target="_self" class="black tc">发现</a>
	    </div>
<%-- 	    <div class="pro_confirm plr">
	    	<div class="confirm_l">
	    		<img src="${ctx}/static/wx/images/find.png" style="width:4.5rem;"/>
	    	</div>
	    	<div class="confirm_r">
	    		<h4 class="mb10 larger mt1r">0元夺宝</h4>
	    		<p class="text-heavy overflow normal">周日专场 24小时有效不限量</p>
	    	</div>
	    	<img src="${ctx}/static/wx/images/jion-r.png" style="width:2.5rem;position:absolute;right:0;bottom:2rem;"/>
	    </div>
	    <div class="pro_confirm plr">
	    	<div class="confirm_l">
	    		<img src="${ctx}/static/wx/images/find.png" style="width:4.5rem;"/>
	    	</div>
	    	<div class="confirm_r">
	    		<h4 class="mb10 larger mt1r">0元夺宝</h4>
	    		<p class="text-heavy overflow normal">周日专场 24小时有效不限量</p>
	    	</div>
	    	<img src="${ctx}/static/wx/images/jion-r.png" style="width:2.5rem;position:absolute;right:0;bottom:2rem;"/>
	    </div>
	    <div class="pro_confirm plr">
	    	<div class="confirm_l">
	    		<img src="${ctx}/static/wx/images/find.png" style="width:4.5rem;"/>
	    	</div>
	    	<div class="confirm_r">
	    		<h4 class="mb10 larger mt1r">0元夺宝</h4>
	    		<p class="text-heavy overflow normal">周日专场 24小时有效不限量</p>
	    	</div>
	    	<img src="${ctx}/static/wx/images/jion-r.png" style="width:2.5rem;position:absolute;right:0;bottom:2rem;"/>
	    </div> --%>
	    
	    <div id="dataListsss">
	    
	    </div>
	    
    <div class="foot-flag">
    	<ul>
    		<li ><a href="${ctx}/wx/index" class="text-heavy"><b class="icon_1 icon"></b><p>夺宝</p></a></li>
    		<li><a href="${ctx}/wx/goods/goodsCategory/listCategory" class="text-heavy"><b class="icon_6 icon"></b><p>分类</p></a></li>
    		<li><a href="${ctx}/wx/goods/goodsTimes/listLastOpen" class="text-heavy"><b class="icon_2 icon"></b><p>最新揭晓</p></a></li>
    		<li><a href="${ctx}/wx/snatchList/list" class="text-heavy"><b class="icon_4 icon"></b><p>购物车</p></a></li>
    		<li><a href="${ctx}/wx/user/home" class="text-heavy"><b class="icon_5 icon"></b><p>我的</p></a></li>
    	</ul>
    </div>
	    <div class="mb80"></div>
	</div>
	<script src="${ctx}/static/js/jquery/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ctx}/static/wx/js/wxcommon.js"></script>
	<script type="text/javascript">
/* 	 wxcommon.autoLoad({
	    totalPages: 20,                				// 总页数
        pageNo:1 ,                         				// 页码
        pageSize: 10,                    					// 分页大小
        title:"",
        containerId: "dataList",                        				// 显示内容的容器id
        url: "${ctx}/wx/service/activity/list",          // 请求url
        doRowDataFun: function(rowData){               				// 格式化行级数据
            var shareString = '<div class="pro_confirm plr">'+
            			'<div class="pro_confirm plr">'+
					    	'<div class="confirm_l">'+
					    		'<img src="${ctx}/static/wx/images/find.png" style="width:4.5rem;"/>'+
					    	'</div>'+
					    	'<div class="confirm_r">'+
					    		'<h4 class="mb10 larger mt1r">0元夺宝</h4>'+
					    		'<p class="text-heavy overflow normal">周日专场 24小时有效不限量</p>'+
					    	'</div>'+
					    	'<img src="${ctx}/static/wx/images/jion-r.png" style="width:2.5rem;position:absolute;right:0;bottom:2rem;"/>'+
					    '</div>';
			return shareString;
        }
	 
	 }); */
	 
	 $(function(){
				 $.ajax({
			            url: "${ctx}/wx/service/activity/list",
			            data: {
			               title: ""
			            },
			            type: 'get',
			            dataType: 'json',
			            success: function (result) {
			                if (result.state == 200) {
			                var shareString ='';
			                	if(result.data.result.length>0)
			                	{
			                		for(var i=0;i<result.data.result.length;i++)
			                		{
					                   shareString += '<div class="pro_confirm plr">'+
									    	'<a href="${ctx}/images/activity/'+result.data.result[i].htmlUrl+'"><div class="confirm_l">'+
									    		'<img src="${ctx}/images/activity/'+result.data.result[i].thumbImgUrl+'" style="width:4.5rem;"/>'+
									    	'</div>'+
									    	'<div class="confirm_r">'+
									    		'<h4 class="mb10 larger mt1r">'+result.data.result[i].title+'</h4>'+
									    		'<p class="text-heavy overflow normal">'+result.data.result[i].address+'</p>'+
									    	'</div>'+
									    	'<img src="${ctx}/static/wx/images/jion-r.png" style="width:2.5rem;position:absolute;right:0;bottom:2rem;"/>'+
									    '</a></div>';
									     var divshow = $("#dataListsss");
						                divshow.text("");// 清空数据
						                divshow.append(shareString); 
					                }
				                }
							    
			                }
			            },
			            error: function () {
			
			            }
			        });
	 });
	 
	 
	 </script>
	</body>
</html>

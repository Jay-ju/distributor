<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<title>会员提现申请</title>
	<jsp:include page="/common/head-css.jsp" flush="true"></jsp:include>
</head>

<body>
<form:form action="${ctx}/notice/noticeMessage/list-withdraw" id="frmSearch" cssClass="form-horizontal" modelAttribute="paramsEntity">
	<div class="form-group" style="padding-top: 10px;">
		
			<label class="col-sm-1 control-label">用户名称</label>
			<div class="col-sm-2">
				<form:input  path="params[userName]" cssClass="form-control"/>
			</div>
			<label class="col-sm control-label" style="float: left;">申请日期</label>
			<div class="col-sm-2">
				<form:input path="params[createTime]" cssClass="required span3 form-control" placeholder="请选择时间" 
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d'})"/>
			</div>
		 	<label class="col-sm control-label" style="float: left;"> 状态</label>
            <div class="col-sm-6">
                <form:select path="params[isdone]" cssClass="span3 textCss">
                    <form:option value="">请选择</form:option>
                    <form:option value="1">已处理</form:option>
                    <form:option value="0">未处理</form:option>
                </form:select>
			    <a id="btnSearch" class="btn btn-success" href="javascript:;"><i class="fa fa-search"></i> 查询</a>
			    <a  class="btn btn-success" href="javascript:history.go(-1);"><i class="fa fa-"></i> 返回</a>
			</div>
    </div>
			
			
	<table id="contentTable" class="table table-hover table-striped table-bordered table-condensed">
		<thead>
			<tr class="success">
				<th style="text-align: center; width: 20px;"><input type="checkbox"/></th>
				<th style="text-align: center; width: 15%">用户名称</th>
				<th style="text-align: center; width: 15%">积分</th>
				<th style="text-align: center; width: 20%">申请提现金额(含手续费)</th>
				<th style="text-align: center; width: 20%">实际金额</th>
				<th style="text-align: center; width: 15%">银行卡信息</th>
				<th style="text-align: center; width: 15%">申请日期</th>
				<th style="text-align: center; width: 15%">状态</th>
			</tr>
		</thead>
		<tbody id="tbdContent">
			<jsp:include page="member-withdraw.jsp" flush="true"></jsp:include>
		</tbody>		
	</table>
 </form:form>
   <jsp:include page="/common/foot-list-js.jsp" flush="true"></jsp:include>
<jsp:include page="/common/operate-msg.jsp" flush="true"></jsp:include>
		<script type="text/javascript" src="${ctx}/static/js/jquery/jquery.public.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jqueryui/jquery-ui.js"></script>
<script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
   <script type="text/javascript">
   $(function(){
		$table = $('#contentTable').initTable({
			namespace: '${ctx}/notice/noticeMessage',
			formId:'frmSearch',
			listMethod:'/list-withdraw',
			addMethod:'/create',
			editMethod:'/edit/{id}',
			viewMethod: '/view/{id}',
			deleteMethod:'/delete',
			btnAddId: 'btnAdd',
			btnDeleteId: 'btnDelete',
			btnSearchId: 'btnSearch',
			formId:'frmSearch',
			isBindClick: false,//是否绑定行单击事件
			isClickToEdit: true,//单击是否修改，否则是查看
			isCheckAll: true,
			isBindEnter: false,
			checkboxId: 'ids',
			addMethodParams:'',
			deleteMethodParams:'',
			container: $('#tbdContent')//页面容器
		});
   });
   </script>
</body>
</html>

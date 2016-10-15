<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<title>会员管理</title>
	<jsp:include page="/common/head-css.jsp" flush="true"></jsp:include>
</head>

<body>
<form:form action="${ctx}/member/member/margin" id="frmSearch" cssClass="form-horizontal" modelAttribute="paramsEntity">
	<div class="form-group" style="padding-top: 10px;">
		<label class="col-sm-1 control-label">开始时间</label>
		<div class="col-sm-2">
			<form:input path="params[beginDate]" class="laydate-icon form-control" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})" />
		</div>
		<label class="col-sm control-label" style="float: left;">结束时间</label>
		<div class="col-sm-2">
			<form:input path="params[endDate]" class="laydate-icon form-control" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})" />
		</div>
	 	<div class="col-sm-6">
		    <a id="btnSearch" class="btn btn-success" href="javascript:;"><i class="fa fa-search"></i> 查询</a>
		</div>
    </div>
	<table id="contentTable" class="table table-hover table-striped table-bordered table-condensed">
		<thead>
			<tr class="success">
				<th style="text-align: center; width: 6%">统计日期</th>
				<th style="text-align: center; width: 5%">充值金额</th>
				<th style="text-align: center; width: 5%">支付金额</th>
				<th style="text-align: center; width: 8%">积分兑换的金币额</th>
				<th style="text-align: center; width: 5%">红包金额</th>
				<th style="text-align: center; width: 5%">剩余充值金额</th>
				<th style="text-align: center; width: 5%">剩余红包金额</th>
				<th style="text-align: center; width: 5%">过期红包金额</th>
				<th style="text-align: center; width: 5%">参与人次</th>
				<th style="text-align: center; width: 5%">差额</th>
			</tr>
		</thead>
		<tbody id="tbdContent">
			<jsp:include page="member-margin-content.jsp" flush="true"></jsp:include>
		</tbody>		
	</table>
 </form:form>
   <jsp:include page="/common/foot-list-js.jsp" flush="true"></jsp:include>
<jsp:include page="/common/operate-msg.jsp" flush="true"></jsp:include>
<script src="${ctx }/static/mould/js/plugins/layer/laydate/laydate.js"></script>
   <script type="text/javascript">
   $(function(){
		$table = $('#contentTable').initTable({
			namespace: '${ctx}/member/member',
			formId:'frmSearch',
			listMethod:'/margin-content',
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

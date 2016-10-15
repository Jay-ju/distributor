<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
		<c:forEach items="${page.result}" var="entity">
			<tr>
				<td style="text-align: center;">
				    <fmt:formatDate value="${entity.statDate}" pattern="yyyy-MM-dd" />
				</td>
				<td style="text-align: center;">${entity.rechargeValue}&nbsp;</td>
				<td style="text-align: center;">${entity.payValue}&nbsp;</td>
				<td style="text-align: center;">${entity.jifendhValue}&nbsp;</td>
				<td style="text-align: center;">${entity.redpackValue}&nbsp;</td>
				<td style="text-align: center;">${entity.remainrechargeValue}&nbsp;</td>
				<td style="text-align: center;">${entity.remainredpackValue}&nbsp;</td>
				<td style="text-align: center;">${entity.expireredpackValue}&nbsp;</td>
				<td style="text-align: center;">${entity.personnumValue}&nbsp;</td>
				<td style="text-align: center;">${entity.differenceValue}&nbsp;</td>
			</tr>
		</c:forEach>
	<tr>
		<td colspan="12" style="text-align: right;">
			<jsp:include page="/common/ajax-page.jsp"></jsp:include>
		</td>
	</tr>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
		<c:forEach items="${page.result}" var="entity">
			<tr>
				<td style="text-align: center;"><input type="checkbox" name="ids" value="${entity.id }"/></td>
				<td style="text-align: center;">${entity.title}&nbsp;</td>
				<td style="text-align: center;">${entity.content}&nbsp;</td>
				<td style="text-align: center;"><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd" />&nbsp;</td>
				<td style="text-align: center;"><fmt:formatDate value="${entity.updateTime}" pattern="yyyy-MM-dd" />&nbsp;</td>
				<td style="text-align: center;">
					<shiro:hasPermission name="article:article:edit">
						<a class="btn btn-success aedit" href="javascript:;" id="${entity.id }"><i class="fa fa-pencil"></i> 修改</a>
						<a class="btn btn-success adelete" id="${entity.id}" href="javascript:;"><i class="fa fa-times"></i> 删除</a>
						<a class="btn btn-success " id="${entity.id}" href="${ctx}/article/article/preview?content=${entity.content}"><i class="fa fa-check-circle"></i> 预览</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
	<tr>
		<td colspan="8" style="text-align: right;">
			<jsp:include page="/common/ajax-page.jsp"></jsp:include>
		</td>
	</tr>
	
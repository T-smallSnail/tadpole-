<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable td").click(function() {
				$('.dbe8fc').removeClass('dbe8fc');
				$(this).parent('tr').find('td').addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
				
			$("#newBtn").bind("click", {'url' : "${ctx}/oa/oaNotify/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/oa/oaNotify/delete", 'tableId' : 'contentTable'}, operation.dele);
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}">通知列表</a></li>
		<c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><li><a href="${ctx}/oa/oaNotify/form">通知添加</a></li></shiro:hasPermission></c:if>
	</ul> --%>
	<form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<c:if test="${!requestScope.oaNotify.self}"><li><label>状态：</label>
				<form:radiobuttons path="status" items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li></c:if>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
	<sys:message content="${message}"/>
	    <div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					<c:if test="${!requestScope.oaNotify.self}">
						<shiro:hasPermission name="oa:oaNotify:edit">
						    <li id="delBtn" >删除</li>
						</shiro:hasPermission>
					</c:if>
					   <c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit">
					       <li id="newBtn" >添加</li>
					   </shiro:hasPermission></c:if>
					</ul>
		</div>
		<div class="daiding">
			<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<tr>
						<th>标题</th>
						<th>类型</th>
						<th>状态</th>
						<th>查阅状态</th>
						<th>更新时间</th>
						<c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><th>操作</th></shiro:hasPermission></c:if>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="oaNotify">
					<tr>
						<td><a href="${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}">
							${fns:abbr(oaNotify.title,50)}
						</a></td>
						<td>
							${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}
						</td>
						<td>
							${fns:getDictLabel(oaNotify.status, 'oa_notify_status', '')}
						</td>
						<td>
							<c:if test="${requestScope.oaNotify.self}">
								${fns:getDictLabel(oaNotify.readFlag, 'oa_notify_read', '')}
							</c:if>
							<c:if test="${!requestScope.oaNotify.self}">
								${oaNotify.readNum} / ${oaNotify.readNum + oaNotify.unReadNum}
							</c:if>
						</td>
						<td>
							<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<c:if test="${!requestScope.oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><td>
							<a href="javascript:operation.edit('${ctx}/oa/oaNotify/form?id=', '${oaNotify.id}', 1200, 600)">修改</a>
						</td></shiro:hasPermission></c:if>
						<input type="hidden" value="${oaNotify.id}" />
					</tr>
				</c:forEach>
				</tbody>
	    </table>
	    </div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
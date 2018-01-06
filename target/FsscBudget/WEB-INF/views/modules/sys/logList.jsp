<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>日志管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body>
	<!-- 	<ul class="nav nav-tabs"> -->
	<%-- 		<li class="active"><a href="${ctx}/sys/log/">日志列表</a></li> --%>
	<!-- 	</ul> -->
	<form:form id="searchForm" action="${ctx}/sys/log/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<div>
			<label>操作菜单：</label><input id="title" name="title" type="text"
				maxlength="50" class="input-mini" value="${log.title}" /> <label>用户ID：</label><input
				id="createBy.id" name="createBy.id" type="text" maxlength="50"
				class="input-mini" value="${log.createBy.id}" /> <label>URI：</label><input
				id="requestUri" name="requestUri" type="text" maxlength="50"
				class="input-mini" value="${log.requestUri}" />
		</div>
		<div style="margin-top: 8px;">
			<label>日期范围：&nbsp;</label><input id="beginDate" name="beginDate"
				type="text" readonly="readonly" maxlength="20"
				class="input-mini Wdate"
				value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input
				id="endDate" name="endDate" type="text" readonly="readonly"
				maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />&nbsp;&nbsp;
			&nbsp;<label for="exception"><input id="exception"
				name="exception" type="checkbox"
				<%-- ${log.exception eq '1'?' checked':''} --%> value="1" />只查询异常信息</label>
			&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" />&nbsp;&nbsp;
		</div>
	</form:form>
	<sys:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>操作菜单</th>
				<th>操作用户</th>
				<th>所在部门</th>
				<th>URI</th>
				<th>操作者IP</th>
				<th>操作时间</th>
				<th>操作说明</th>
				<th>操作数据</th>
			</tr>
		</thead>
		<tbody>
			<%
				request.setAttribute("strEnter", "\n");
				request.setAttribute("strTab", "\t");
			%>
			<c:forEach items="${page.list}" var="log">
				<tr>
					<td>${log.title}</td>
					<td>${log.createBy.userName}</td>
					<td>${log.createBy.office.name}</td>
					<td><strong>${log.requestUri}</strong></td>
					<td>${log.remoteIp}</td>
					<td><fmt:formatDate value="${log.createDate}" type="both" /></td>
					<td>${log.operation }</td>
					<td><a href="${ctx}/sys/log/form?id=${log.id}">查看</a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
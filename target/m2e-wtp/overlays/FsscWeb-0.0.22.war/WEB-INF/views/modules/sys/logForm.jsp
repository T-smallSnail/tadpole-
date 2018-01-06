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

	</form:form>
	<sys:message content="${message}" />
	<c:if test="${log.operation=='修改' }">
		<div>
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>对象的属性：</th>
						<c:forEach items="${afthm}" var="map">
							<th>${map.key }</th>
						</c:forEach>
					</tr>

				</thead>

				<tbody>
					<%
						request.setAttribute("strEnter", "\n");
							request.setAttribute("strTab", "\t");
					%>
					<tr>
						<td>操作后的值：</td>
						<c:forEach items="${afthm}" var="map">
							<%-- <c:if test="${not empty map.value }">
								<td>${map.value}</td>
							</c:if> --%>
								<td>${map.value}</td>
						</c:forEach>
					</tr>

				</tbody>
			</table>

		</div>

	</c:if>
	<c:if test="${log.operation=='新增' }">
		<div>
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>对象的属性：</th>
						<c:forEach items="${afthm}" var="map">
							<th>${map.key }</th>
						</c:forEach>
					</tr>

				</thead>

				<tbody>
					<%
						request.setAttribute("strEnter", "\n");
							request.setAttribute("strTab", "\t");
					%>
					<tr>
						<td>新增的数据：</td>
						<c:forEach items="${afthm}" var="map">
							<c:if test="${not empty map.value }">
								<td>${map.value}</td>
							</c:if>
							<c:if test="${empty map.value }">
								<td>null</td>
							</c:if>
						</c:forEach>
					</tr>

				</tbody>
			</table>
		</div>
	</c:if>
	<c:if test="${log.operation=='删除' }">
		<div>
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>删除对象的id：</th>
						<th>${aftInfo}</th>
					</tr>

				</thead>

			</table>
		</div>
	</c:if>

	<c:if test="${log.operation=='登录' }">
		<div>
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>登录的用户名：</th>
						<th>${aftInfo }</th>
					</tr>

				</thead>

			</table>
		</div>
	</c:if>
	<div class="pagination">${page}</div>
</body>
</html>
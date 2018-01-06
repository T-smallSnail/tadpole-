<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>学生信息维护成功管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test/testStudent/">学生信息维护成功列表</a></li>
		<shiro:hasPermission name="test:testStudent:edit"><li><a href="${ctx}/test/testStudent/form">学生信息维护成功添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testStudent" action="${ctx}/test/testStudent/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>name：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>name</th>
				<th>update_date</th>
				<th>remarks</th>
				<shiro:hasPermission name="test:testStudent:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="testStudent">
			<tr>
				<td><a href="${ctx}/test/testStudent/form?id=${testStudent.id}">
					${testStudent.name}
				</a></td>
				<td>
					<fmt:formatDate value="${testStudent.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${testStudent.remarks}
				</td>
				<shiro:hasPermission name="test:testStudent:edit"><td>
    				<a href="${ctx}/test/testStudent/form?id=${testStudent.id}">修改</a>
					<a href="${ctx}/test/testStudent/delete?id=${testStudent.id}" onclick="return confirmx('确认要删除该学生信息维护成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
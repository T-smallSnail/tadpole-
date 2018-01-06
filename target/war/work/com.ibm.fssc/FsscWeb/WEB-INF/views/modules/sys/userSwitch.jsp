<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户切换</title>
	<meta name="decorator" content="default"/>
	
</head>
<body>

	<script>
	function switchUser(orgNo,jobName){
		var topHref="${ctx}/sys/user/doSwitch?office.orgNo="+orgNo+"&jobName="+jobName;
		top.window.location.href=topHref;
	}
	</script>	

	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>人员编码</th>
				<th>人员名称</th>
				<th>组织名称</th>
				<th>部门名称</th>
				<th>登陆名称</th>
				<th>岗位名称</th>
				<shiro:hasPermission name="sys:user:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="user">
				<tr>
					<td>${user.employee.empNo}</td>
					<td>${user.employee.empName}</td>
					<td>${user.company.name}</td>
					<td>${user.office.name}</td>
					<td>${user.loginName}</td>
					<td>${user.jobName}</td>
					<td><a onclick="switchUser('${user.office.orgNo}','${user.jobName}')">切换</a></td>
				</tr>
			</c:forEach>
		</tbody>
</body>
</html>
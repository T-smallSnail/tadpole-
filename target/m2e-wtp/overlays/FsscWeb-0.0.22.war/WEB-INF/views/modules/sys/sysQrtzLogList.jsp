<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务日志管理</title>
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
	<form:form id="searchForm" modelAttribute="sysQrtzLog" action="${ctx}/sys/sysQrtzLog/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>任务名称：</label>
				<form:input path="jobName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>任务ID</th>
				<th>任务名称</th>
				<th>任务描述</th>
				<th>调度时间</th>
				<th>执行时间</th>
				<th>执行状态 </th>
				<shiro:hasPermission name="sys:sysQrtzLog:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysQrtzLog">
			<tr>
				<td>
					${sysQrtzLog.jobId}
				</td>
				<td><a href="${ctx}/sys/sysQrtzLog/form?id=${sysQrtzLog.id}&authMode=view">
					${sysQrtzLog.jobName}
				</a></td>
				<td>
					${sysQrtzLog.jobDesc}
				</td>
				<td>
					<fmt:formatDate value="${sysQrtzLog.triggerTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${sysQrtzLog.handleTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(sysQrtzLog.handleCode, 'handle_code', '无')}
					
				</td>
			
				<shiro:hasPermission name="sys:sysQrtzLog:edit"><td>
    				<a href="${ctx}/sys/sysQrtzLog/form?id=${sysQrtzLog.id}&authMode=edit">修改</a>
					<a href="${ctx}/sys/sysQrtzLog/delete?id=${sysQrtzLog.id}" onclick="return confirmx('确认要删除该任务日志吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>岗位信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#contentTable").on("click","tr",function(){
			var trs=$(this).siblings();
			trs.removeClass('dbe8fc');
			$(this).addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});
			
		$("#delBtn").bind("click", {'url' : "${ctx}/sys/job/delete", 'tableId' : 'contentTable'}, operation.dele);
	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	
    function addLine(){
    	window.location.href="${ctx}/sys/job/form?authMode=edit";
    }
</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/job/">岗位信息列表</a></li>
		<shiro:hasPermission name="sys:job:edit"><li><a href="${ctx}/sys/job/form">岗位信息添加</a></li></shiro:hasPermission>
	</ul> --%>
	<form:form id="searchForm" modelAttribute="job"
		action="${ctx}/sys/job/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>岗位名称：</label> <form:input path="jobName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>岗位编码：</label> <form:input path="jobNo"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
		<sys:message content="${message}" />
	<!-- 	<div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					   <li id="delBtn" >删除</li>
							<li onclick="addLine()" class="text-active">添加</li>
					</ul>
		</div> -->
		<div class="daiding">
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>岗位编码</th>
				<th>岗位名称</th>
				<th>部门编码</th>
				<th>部门名称</th>
				<th>组织编码</th>
				<th>组织名称</th>
				<th>创建者</th>
				<th>创建日期</th>
				<th>备注</th>
		<%-- 		<shiro:hasPermission name="sys:job:edit">
					<th>操作</th>
				</shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="job">
				<tr>
					<td><a href="${ctx}/sys/job/form?id=${job.id}&authMode=view">
							${job.jobNo} </a></td>
					<td>${job.jobName}</td>
					<td>${job.departNo}</td>
					<td>${job.departName}</td>
					<td>${job.orgNo}</td>
					<td>${job.orgName}</td>
					<td>${job.createBy.loginName}</td>
					<td><fmt:formatDate value="${job.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${job.remarks}</td>
				<%-- 	<shiro:hasPermission name="sys:job:edit">
						<td>
						<a href="${ctx}/sys/job/form?id=${job.id}&authMode=edit">修改</a>
						</td>
					</shiro:hasPermission> --%>
					<input type="hidden" value="${job.id}" />
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>人员信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#contentTable").on("click","tr",function(){
			var trs=$(this).siblings();	
			trs.removeClass('dbe8fc');
			$(this).addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});
			
		/* $("#newBtn").bind("click", {'url' : "${ctx}/sys/employee/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open); */
		$("#delBtn").bind("click", {'url' : "${ctx}/sys/employee/delete", 'tableId' : 'contentTable'}, operation.dele);
	});
	
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	
    //新增明细行
    function addLine(){
    	window.location.href="${ctx}/sys/employee/form?authMode=edit";
    }
</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="employee"
		action="${ctx}/sys/employee/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>姓名：</label> <form:input path="empName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>任职级别：</label> <form:input path="officeLevel"
					htmlEscape="false" maxlength="50" class="input-medium" /></li>
			<li><label>岗位名称：</label> <form:input path="jobName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>部门名称：</label> <form:input path="departName"
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
					    <li   id="delBtn" class="text-active">删除</li>
						<li onclick="addLine()" class="text-active">添加</li>
					</ul>
		</div> -->
		<div class="daiding">
		<table id="contentTable" class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>姓名</th>
					<th>人员编码</th>
					<th>性别</th>
					<th>民族</th>
					<th>任职级别</th>
					<th>岗位名称</th>
					<th>部门编码</th>
					<th>部门名称</th>
					<th>更新日期</th>
					<th>人员状态</th>
					<th>备注</th>
				<%-- 	<shiro:hasPermission name="sys:employee:edit">
						<th>操作</th>
					</shiro:hasPermission> --%>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="employee">
					<tr>
						<td><a href="${ctx}/sys/employee/form?id=${employee.id}&authMode=view">${employee.empName} </a></td>
						<td>${employee.empNo}</td>
						<%-- <td>${employee.sex}</td> --%>
						<td>${fns:getDictLabel(employee.sex, 'sex', employee.sex)}</td>
						<%-- <td>${employee.nation}</td> --%>
						<td>${fns:getDictLabel(employee.nation, 'nation', employee.nation)}</td>
						<td>${fns:getDictLabel(employee.officeLevel, 'office_level', employee.officeLevel)}</td>
						
						<td>${employee.jobName}</td>
						<td>${employee.departNo}</td>
						<td>${employee.departName}</td>
						<td><fmt:formatDate value="${employee.updateDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${fns:getDictLabel(employee.status, 'status', employee.status)}</td>
						<td>${employee.remarks}</td>
					<%-- 	<shiro:hasPermission name="sys:employee:edit">
							<td>
								<a href="javascript:operation.edit('${ctx}/sys/employee/form?id=', '${employee.id}', 1200, 600)">修改</a>
								<a href="${ctx}/sys/employee/form?id=${employee.id}&authMode=edit">修改</a>
							</td>
						</shiro:hasPermission> --%>
						<input type="hidden" value="${employee.id}" />
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
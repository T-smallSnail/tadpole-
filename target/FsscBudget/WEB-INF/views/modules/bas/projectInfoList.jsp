<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>项目信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		/* $("#contentTable td").click(function() {
			$('.dbe8fc').removeClass('dbe8fc');
			$(this).parent('tr').find('td').addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		}); */
		$("#contentTable").on("click","tr",function(){
			var trs=$(this).siblings();
			trs.removeClass('dbe8fc');
			$(this).addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});
		//$("#newBtn").bind("click", {'url' : "${ctx}/bas/projectInfo/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
		$("#delBtn").bind("click", {
			'url' : "${ctx}/bas/projectInfo/delete",
			'tableId' : 'contentTable'
		}, operation.dele);
	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	function addLine() {
		window.location.href = "${ctx}/bas/projectInfo/form?authMode=edit";
		//window.open("${ctx}/account/claim/t0104/formLine?claimId="+id,"_blank","width:500,heigt:500");
	}
</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="projectInfo"
		action="${ctx}/bas/projectInfo/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>项目编码：</label> <form:input path="projectNo"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>项目名称：</label> <form:input path="projectName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>项目类型：</label> <form:select path="projectType"
					class="input-medium">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('project_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
		<sys:message content="${message}" />
<!-- 		<div class="only-textBtnDiv">
			<ul class="nav nav-tabs only-textBtn">
				<li id="delBtn">删除</li>
				<li onclick="addLine()" class="text-active">添加</li>
			</ul>
		</div> -->
		<div class="daiding">
			<table id="contentTable"
				class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th>项目编码</th>
						<th>项目名称</th>
						<th>项目类型</th>
						<th>项目状态</th>
						<th>建设单位</th>
						<th>创建日期</th>
				<%-- 		<shiro:hasPermission name="bas:projectInfo:edit">
							<th>操作</th>
						</shiro:hasPermission> --%>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="projectInfo">
						<tr>
							<td><a
								href="${ctx}/bas/projectInfo/form?id=${projectInfo.id}&authMode=view">
									${projectInfo.projectNo} </a></td>
							<td>${projectInfo.projectName}</td>
							<td>${fns:getDictLabel(projectInfo.projectType, 'project_type', '')}
							</td>
							<td>${fns:getDictLabel(projectInfo.projectStatus, 'project_status', '')}
							</td>
							<td>${projectInfo.buildCompany}</td>
							<td><fmt:formatDate value="${projectInfo.createDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<%-- 	<shiro:hasPermission name="bas:projectInfo:edit">
								<td>
									<a onclick="operation.edit('${ctx}/bas/projectInfo/form?id=', '${projectInfo.id}', 1200, 600)">修改</a>
									<a
									href="${ctx}/bas/projectInfo/form?id=${projectInfo.id}&authMode=edit">修改</a>
								</td>
							</shiro:hasPermission> --%>
							<input type="hidden" value="${projectInfo.id}" />
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination">${page}</div>
</body>
</html>
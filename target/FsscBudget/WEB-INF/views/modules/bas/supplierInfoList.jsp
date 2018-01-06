<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>供应商管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	
	$(document).ready(function() {
		$("#contentTable").on("click","tr",function(){
			var trs=$(this).siblings();
			trs.removeClass('dbe8fc');
			$(this).addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});

		$("#newBtn").bind("click", {
			'url' : "${ctx}/bas/supplierInfo/form",
			'title' : "新增",
			'width' : 1200,
			'height' : 700
		}, operation.open);
		$("#delBtn").bind("click", {
			'url' : "${ctx}/bas/supplierInfo/delete",
			'tableId' : 'contentTable'
		}, operation.dele);
	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	
	function addLine(){
    	window.location.href="${ctx}/bas/supplierInfo/form?authMode=edit";
    }
</script>
</head>
<body>

	<form:form id="searchForm" modelAttribute="supplierInfo"
		action="${ctx}/bas/supplierInfo/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label style="width:100px;">供应商编码：</label> <form:input path="supplierNo"
					htmlEscape="false" maxlength="200" class="form-control" />
				<p class="verify-formDescribe colorEC6868"></p></li>
			<li><label style="width:100px;">供应商名称：</label> <form:input path="supplierName"
					htmlEscape="false" maxlength="200" class="form-control" />
				<p class="verify-formDescribe colorEC6868"></p></li>
			<li><label>状态：</label> <form:select path="status"
					class="input-medium">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('status')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
					<p class="verify-formDescribe colorEC6868"></p>
				</form:select></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
		<sys:message content="${message}" />
		<!-- <div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					   <li id="delBtn" class="text-active">删除</li>
					   <li onclick="addLine()" class="text-active">添加</li>
					</ul>
		</div> -->
		<div class="daiding">
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<tr>
						<th>供应商编码</th>
						<th>供应商名称</th>
						<th>供应商类型</th>
						<th>公司法人名称</th>
						<th>行业类型</th>
						<th>机构类型</th>
						<th>状态</th>
						<th>创建日期</th>
					<%-- 	<shiro:hasPermission name="bas:supplierInfo:edit">
							<th>操作</th>
						</shiro:hasPermission> --%>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="supplierInfo">
						<tr>
							<td>
								<a href="${ctx}/bas/supplierInfo/form?id=${supplierInfo.id}&authMode=view">${supplierInfo.supplierNo} </a></td>
							
							<td>${supplierInfo.supplierName}</td>
							<td>
								<%-- ${fns:getDictLabel(supplierInfo.supplierType, '', '')} --%>
								${fns:getDictLabel(supplierInfo.supplierType, 'supplier_type', '')}
							</td>
							<td>${supplierInfo.corporation}</td>
							<td>
								<%-- 	${fns:getDictLabel(supplierInfo.industryType, '', '')} --%>
								${supplierInfo.industryType}
							</td>
							<td>${fns:getDictLabel(supplierInfo.orgType, 'jglx', '')}</td>
						<td>
								${fns:getDictLabel(supplierInfo.status, 'status', '')}
						</td>
						<td>
							<fmt:formatDate value="${supplierInfo.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
					<%-- 	<shiro:hasPermission name="bas:supplierInfo:edit"><td>
							<a href="${ctx}/bas/supplierInfo/form?id=${supplierInfo.id}&authMode=edit">修改</a>
						</td></shiro:hasPermission> --%>
						<input type="hidden" value="${supplierInfo.id}"/>
					</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>客户信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#contentTable").on("click","tr",function(){
			var trs=$(this).siblings();
			trs.removeClass('dbe8fc');
			$(this).addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});
			
		$("#newBtn").bind("click", {'url' : "${ctx}/bas/customerInfo/form", 'title' : "新增", 'width' : 1200, 'height' : 700}, operation.open);
		$("#delBtn").bind("click", {'url' : "${ctx}/bas/customerInfo/delete", 'tableId' : 'contentTable'}, operation.dele);
		
	});
	
	
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	
	function addLine(){
    	window.location.href="${ctx}/bas/customerInfo/form?authMode=edit";
    }

</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="customerInfo"
		action="${ctx}/bas/customerInfo/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<ul class="ul-form">
			<li><label>客户编码：</label>
				<form:input path="customerNo" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>客户名称：</label>
				<form:input path="customerName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>客户类型：</label>
				<form:select path="customerType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('customer_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>

	<div class="pr">
		<sys:message content="${message}" />
	<!-- 	<div class="only-textBtnDiv">
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
						<th>客户编码</th>
						<th>客户名称</th>
						<th>客户类型</th>
						<th>登记注册类型</th>
						<th>公司法人名称</th>
						<th>行业类型</th>
						<th>企业电话</th>
						<th>状态</th>
						<th>创建日期</th>
						<%-- <shiro:hasPermission name="bas:customerInfo:edit">
							<th>操作</th>
						</shiro:hasPermission> --%>
					</tr>
				</thead>
				<tbody>
		<c:forEach items="${page.list}" var="customerInfo">
			<tr>
				<td><a href="${ctx}/bas/customerInfo/form?id=${customerInfo.id}&authMode=view"">
					${customerInfo.customerNo}
				</a></td>
				<td>
					${customerInfo.customerName}
				</td>
				<td>
					${fns:getDictLabel(customerInfo.customerType, 'customer_type', '')}
				</td>
				<td>
					${fns:getDictLabel(customerInfo.registerType, 'regisier_type', '')}
				</td>
				<td>
					${customerInfo.corporation}
				</td>
				<td>
					${customerInfo.industryType}
				</td>
				<td>
					${customerInfo.orcTel}
				</td>
				<td>
					${fns:getDictLabel(customerInfo.status, 'status', '')}
				</td>
				<td>
					<fmt:formatDate value="${customerInfo.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			<%-- 	<shiro:hasPermission name="bas:customerInfo:edit"><td>
					<a href="javascript:operation.edit('${ctx}/bas/customerInfo/form?id=', '${customerInfo.id}', 1200, 700)">修改</a>
					<a href="${ctx}/bas/customerInfo/form?id=${customerInfo.id}&authMode=edit">修改</a>
				</td></shiro:hasPermission> --%>
				<input type="hidden" value="${customerInfo.id}" />
			</tr>
		</c:forEach>
		</tbody>
			</table>
		</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
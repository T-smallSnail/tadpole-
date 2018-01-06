<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>银行账户成功管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
				
			$("#newBtn").bind("click", {'url' : "${ctx}/bas/bankAccount/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/bas/bankAccount/delete", 'tableId' : 'contentTable'}, operation.dele);
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function addLine(){
	    	window.location.href="${ctx}/bas/bankAccount/form?authMode=edit";
	    }


	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="bankAccount" action="${ctx}/bas/bankAccount/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>账户编码：</label>
				<form:input path="accountNo" htmlEscape="false" maxlength="200" class="form-control"/>
				<p class="verify-formDescribe colorEC6868"></p>
			</li>
			<li><label>账户名称：</label>
				<form:input path="accountName" htmlEscape="false" maxlength="200" class="form-control"/>
				<p class="verify-formDescribe colorEC6868"></p>
			</li>
			<li><label>账户类型：</label>
				<form:select path="accountType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('account_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					<p class="verify-formDescribe colorEC6868"></p>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
		<sys:message content="${message}" />
<!-- 		<div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					   <li id="delBtn"  class="text-active">删除</li>
					   <li onclick="addLine()" class="text-active">添加</li>
					</ul>
		</div> -->
		<div class="daiding">
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>客户编码</th>
				<th>供应商编码</th>
				<th>账户</th>
				<th>账户编码</th>
				<th>账户名称</th>
				<th>开户行联行号</th>
				<th>开户行名称</th>
				<th>创建日期</th>
			<%-- 	<shiro:hasPermission name="bas:bankAccount:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="bankAccount">
			<tr>
				<td><a href="${ctx}/bas/bankAccount/form?id=${bankAccount.id}&authMode=view">
					${bankAccount.customerNo}
				</a></td>
				<td>
					${bankAccount.supplierNo}
				</td>
				<td>
					${bankAccount.account}
				</td>
				<td>
					${bankAccount.accountNo}
				</td>
				<td>
					${bankAccount.accountName}
				</td>
				<td>
					${bankAccount.bankAccount}
				</td>
				<td>
					${bankAccount.bankName}
				</td>
				<td>
					<fmt:formatDate value="${bankAccount.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
		<%-- 		<shiro:hasPermission name="bas:bankAccount:edit"><td>
    				<a onclick="operation.edit('${ctx}/bas/bankAccount/form?id=', '${bankAccount.id}', 1200, 600)">修改</a>
    				<a href="${ctx}/bas/bankAccount/form?id=${bankAccount.id}&authMode=edit">修改</a>
				</td></shiro:hasPermission> --%>
				<input type="hidden" value="${bankAccount.id}"/>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
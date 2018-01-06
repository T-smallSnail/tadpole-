<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>会计科目管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
			$("#newBtn").bind("click", {'url' : "${ctx}/bas/acctSub/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/bas/acctSub/delete", 'tableId' : 'contentTable'}, operation.dele);
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function addLine(){
	    	window.location.href="${ctx}/bas/acctSub/form?authMode=edit";
	    }

	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="acctSub" action="${ctx}/bas/acctSub/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>科目编码：</label>
				<form:input path="acctNo" htmlEscape="false" maxlength="200" class="form-control"/>
				<p class="verify-formDescribe colorEC6868"></p>
			</li>
			<li><label>科目名称：</label>
				<form:input path="acctName" htmlEscape="false" maxlength="200" class="form-control"/>
				<p class="verify-formDescribe colorEC6868"></p>
			</li>
			<li><label>使用状态：</label>
				<form:select path="isUsed" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
					   <li  onclick="addLine()" class="text-active">添加</li>
					</ul>
		</div> -->
		<div class="daiding">
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>科目编码</th>
				<th>科目名称</th>
				<th>使用标志</th>
				<th>上级科目编码</th>
				<th>上级科目名称</th>
				<th>创建日期</th>
				<%-- <shiro:hasPermission name="bas:acctSub:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="acctSub">
			<tr>
				<td><a href="${ctx}/bas/acctSub/form?id=${acctSub.id}&authMode=view"">
					${acctSub.acctNo}
				</a></td>
				<td>
					${acctSub.acctName}
				</td>
				<td>
					${acctSub.isUsed eq "0"?"启用":"停用"}
				</td>
				<td>
					${acctSub.parentno}
				</td>
				<td>
					${acctSub.parentname}
				</td>
				<td>
					<fmt:formatDate value="${acctSub.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			<%-- 	<shiro:hasPermission name="bas:acctSub:edit"><td>
    				<a onclick="operation.edit('${ctx}/bas/acctSub/form?id=', '${acctSub.id}', 1200, 600)">修改</a>
					<a href="${ctx}/bas/acctSub/form?id=${acctSub.id}&authMode=edit">修改</a>
				</td></shiro:hasPermission> --%>
				<input type="hidden" value="${acctSub.id}" />
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
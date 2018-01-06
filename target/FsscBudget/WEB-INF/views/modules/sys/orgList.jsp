<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织架构管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
				
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/org/delete", 'tableId' : 'contentTable'}, operation.dele);
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		  //新增明细行
	    function addLine(){
	    	window.location.href="${ctx}/sys/org/form?authMode=edit";
	    }
	</script>
</head>
<body>
<%-- 	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/org/">组织架构列表</a></li>
		<shiro:hasPermission name="sys:org:edit"><li><a href="${ctx}/sys/org/form">组织架构添加</a></li></shiro:hasPermission>
	</ul> --%>
	<form:form id="searchForm" modelAttribute="org" action="${ctx}/sys/org/listDown" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>组织名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>组织编码：</label>
				<form:input path="orgNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>所属行业：</label> <form:select path="belongIndustry" class="input-medium">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('belong_industry')}" itemLabel="label" itemValue="value" htmlEscape="false" />
					<p class="verify-formDescribe colorEC6868"></p>
				</form:select></li>
			<li><label>企业性质：</label> <form:select path="businessNature" class="input-medium">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('business_nature')}" itemLabel="label" itemValue="value" htmlEscape="false" />
					<p class="verify-formDescribe colorEC6868"></p>
				</form:select></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
		<div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					    <li   id="delBtn" class="text-active">删除</li>
						<li onclick="addLine()" class="text-active">添加</li>
					</ul>
		</div>
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>组织名称</th>
				<th>组织编码</th>
				<th>所属行业</th>
				<th>更新日期</th>
				<th>备注</th>
				<shiro:hasPermission name="sys:org:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="org">
			<tr>
				<td><a href="${ctx}/sys/org/form?id=${org.id}&authMode=view">
					${org.name}
				</a></td>
				<td>
					${org.orgNo}
				</td>
				<td>
					${fns:getDictLabel(org.belongIndustry, 'belong_industry', org.belongIndustry)}
				</td>
				<td>
					<fmt:formatDate value="${org.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${org.remarks}
				</td>
				<shiro:hasPermission name="sys:org:edit"><td>
    				<a href="${ctx}/sys/org/form?id=${org.id}&authMode=edit">修改</a>
			<%-- 		<a href="${ctx}/sys/org/delete?id=${org.id}" onclick="return confirmx('确认要删除${org.name}吗？', this.href)">删除</a> --%>
				</td></shiro:hasPermission>
				<input type="hidden" value="${org.id}" />
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
	<title>预算控制策略 ( 主）管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
    <script src="<%=path%>/static/js/common/FormValidate.js?version=${fsscVersion}" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=path%>/static/css/fsscAccountIndex.css"/>
    <link href="<%=path%>/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script src="${ctxStatic}/pop/pop.js?version=${fsscVersion}" type="text/javascript"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		//公司设置
		function comp(){
			$.ajax({
				type : "POST",
				//data : $("#inputForm").serialize(),
				dataType : "json",
				async : false,
				url : "${ctx}/modules/budget/lmtBudgetControlStrategy/form",
				/* success : function(result) {
					if (result.status == 1) {
						a = result.claimNo;
						top.$.jBox.info("保存成功！", "提示");
					} else {
						top.$.jBox.alert('报账单保存失败！', '提示');
					}
				} */
			});
		}
	</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/modules/budget/lmtBudgetControlStrategy/">预算控制策略 ( 主）列表</a></li>
		<shiro:hasPermission name="modules:budget:lmtBudgetControlStrategy:edit"><li><a href="${ctx}/modules/budget/lmtBudgetControlStrategy/form">预算控制策略 ( 主）添加</a></li></shiro:hasPermission>
	</ul> --%>
	<form:form id="searchForm" modelAttribute="lmtBudgetControlStrategy" action="${ctx}/modules/budget/lmtBudgetControlStrategy/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
		
	</form:form>
	
	<!-- 控制策略设置 -->
	<div  class="btn-main-animateDiv" style="float:right">
		<button class="btn btn-main" type="button" onclick="group();">集团设置</button>
		<button class="btn btn-main" type="button" onclick="window.location='${ctx}/modules/budget/lmtBudgetControlStrategy/form'">公司设置</button>
	</div>

	<div style="width:100%;margin:65px auto;">
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>公司</th>
				<th>预算科目</th>
				<th>预算名称</th>
				<th>控制策略</th>
				<th>时间范围</th>
				<th>更新时间</th>
				
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="lmtBudgetControlStrategy">
			<tr>
				<td>${lmtBudgetControlStrategy.compName}</td>
				<td>${lmtBudgetControlStrategy.budgetSubjectCode}</td>
				<td>${lmtBudgetControlStrategy.budgetSubjectName}</td>
				<td>${lmtBudgetControlStrategy.controlStrategy}</td>
				<td><a href="${ctx}/modules/budget/lmtBudgetControlStrategy/form?id=${lmtBudgetControlStrategy.id}">
					<fmt:formatDate value="${lmtBudgetControlStrategy.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td><a href="${ctx}/modules/budget/lmtBudgetControlStrategy/form?id=${lmtBudgetControlStrategy.id}">
					<fmt:formatDate value="${lmtBudgetControlStrategy.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				
				<td>
    				<a href="${ctx}/modules/budget/lmtBudgetControlStrategy/form?id=${lmtBudgetControlStrategy.id}">详情</a>
					<a href="${ctx}/modules/budget/lmtBudgetControlStrategy/delete?id=${lmtBudgetControlStrategy.id}" onclick="return confirmx('确认要删除该预算控制策略 ( 主）吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
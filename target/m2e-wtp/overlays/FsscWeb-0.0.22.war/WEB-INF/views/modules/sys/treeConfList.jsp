<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通用树配置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/treeConf/delete", 'tableId' : 'contentTable'}, operation.dele);
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		//新增明细行
	    function addLine(){
	    	window.location.href="${ctx}/sys/treeConf/form";
	    }
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="treeConf" action="${ctx}/sys/treeConf/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>场景编号：</label>
				<form:input path="sceneId" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>场景描述：</label>
				<form:input path="sceneDesc" htmlEscape="false" maxlength="4000" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
		<sys:message content="${message}"/>
		<div class="only-textBtnDiv">
			<ul class="nav nav-tabs only-textBtn">
				<li   id="delBtn" class="text-active">删除</li>
				<li onclick="addLine()" class="text-active">添加</li>
			</ul>
		</div>
		<div class="daiding">
		<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
			<thead>
				<tr>
					<th style="text-align:center;">场景编号</th><th style="text-align:center;">场景描述</th><th style="text-align:center;">选择模式</th>
					<th style="text-align:center;">参数</th><th style="text-align:center;">sql查询语句</th><th style="text-align:center;">触发方法</th><th style="text-align:center;">节点触发级别</th>
					<shiro:hasPermission name="sys:treeConf:edit"><th style="text-align:center;">操作</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="treeConf">
				<tr align = "center">
					<%-- <td><a href="${ctx}/sys/treeConf/form?id=${treeConf.id}&authMode=edit">
						${treeConf.remarks}
					</a></td> --%>
					<td><a href="${ctx}/sys/treeConf/form?id=${treeConf.id}&authMode=view">${treeConf.sceneId}</td>
					<td>${treeConf.sceneDesc}</td>
					<td>${treeConf.selectType}</td>
					<td>${treeConf.params}</td>
					<td>${treeConf.sql}</td>
					<td>${treeConf.triFunc}</td>
					<td>${treeConf.triLev}</td>
					<shiro:hasPermission name="sys:treeConf:edit"><td>
					    <a href="${ctx}/sys/treeConf/form?id=${treeConf.id}&authMode=edit">修改</a>
	    				<%-- <a href="${ctx}/sys/treeConf/test?sceneId=${treeConf.sceneId}">测试</a> --%>
					</td>
					</shiro:hasPermission>
					<input type="hidden" value="${treeConf.id}" />
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
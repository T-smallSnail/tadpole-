<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>POP单选配置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
				
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/popSingle/delete", 'tableId' : 'contentTable'}, operation.dele);
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		//新增明细行
	    function addLine(){
	    	window.location.href="${ctx}/sys/popSingle/form?authMode=edit";
	    }
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="popSingle" action="${ctx}/sys/popSingle/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>场景编号：</label>
				<form:input path="sceneId" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>场景描述：</label>
				<form:input path="sceneDesc" htmlEscape="false" maxlength="50" class="input-medium"/>
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
						<th>场景编号</th>
						<th>场景描述</th>
						<th>查询列表语句</th>
						<shiro:hasPermission name="sys:popSingle:edit"><th>操作</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="popSingle">
					<tr>
						<td><a href="${ctx}/sys/popSingle/form?id=${popSingle.id}&authMode=view">
							${popSingle.sceneId}
						</a></td>
						<td>
							${popSingle.sceneDesc}
						</td>
						<td>
							${popSingle.sql}
						</td>
						<shiro:hasPermission name="sys:popSingle:edit"><td>
							<a href="${ctx}/sys/popSingle/form?id=${popSingle.id}&authMode=edit">修改</a>
						</td></shiro:hasPermission>
						<input type="hidden" value="${popSingle.id}" />
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
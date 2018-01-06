]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(document).ready(function() {
		
	$("#contentTable").on("click","tr",function(){
		var trs=$(this).siblings();
		trs.removeClass('dbe8fc');
		$(this).addClass('dbe8fc');
		$('#delBtn').addClass('text-corEC6868');
	});
		
	/* $("#newBtn").bind("click", {'url' : "${ctx}/sys/role/formAssign", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open); */
	$("#delBtn").bind("click", {'url' : "${ctx}/sys/roleTemp/delete", 'tableId' : 'contentTable'}, operation.dele);
	
	});
	
	//新增明细行
    function addLine(){
    	window.location.href="${ctx}/sys/roleTemp/formAssign?authMode=edit";
    }
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/role/">角色列表</a></li>
		<li class="active"><a href="${ctx}/sys/roleTemp/">临时授权</a></li>
	</ul>
	<div class="pr">
		<sys:message content="${message}" />
		<div class="only-textBtnDiv">
			<ul class="nav nav-tabs only-textBtn">
			    <li   id="delBtn" class="text-active">删除</li>
				<li onclick="addLine()" class="text-active">添加</li>
			</ul>
		</div>
		<div class="daiding">
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<tr>
			<th>角色序号</th>
			<th>角色名称</th>
			<th>登录名称</th>
			<th>用户名称</th>
			<th>组织名称</th>
			<th>部门名称</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<shiro:hasPermission name="sys:role:edit"><th>操作</th></shiro:hasPermission>
		</tr>
		<c:forEach items="${list}" var="role">
			<tr>
				<td><a href="${ctx}/sys/roleTemp/formAssign?id=${role.id}&authMode=view">${role.roleNo}</a></td>
				<td><a href="${ctx}/sys/roleTemp/formAssign?id=${role.id}&authMode=view">${role.roleName}</a></td>
				<td>${role.user.loginName}</td>
				<td><a href="${ctx}/sys/roleTemp/formAssign?id=${role.id}&authMode=view">${role.user.userName}</a></td>
				<td>${role.org.name}</td>
				<td>${role.depart.name}</td>
				<td>
				    <fmt:formatDate value="${role.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				    <fmt:formatDate value="${role.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="sys:role:edit"><td>
					<c:if test="${(role.sysData eq fns:getDictValue('是', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('是', 'yes_no', '1'))}">
						<%-- <a href="javascript:operation.edit('${ctx}/sys/role/formAssign?id=', '${role.id}', 1200, 600)">修改</a> --%>
						<a href="${ctx}/sys/roleTemp/formAssign?id=${role.id}&authMode=edit">修改</a>
					</c:if>
				</td></shiro:hasPermission>	
				<input type="hidden" value="${role.id}" />
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
</body>
</html>
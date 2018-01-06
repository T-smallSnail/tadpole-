]<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>角色管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">

    $(document).ready(function() {
			
    	$("#contentTable").on("click","tr",function(){
			var trs=$(this).siblings();	
			trs.removeClass('dbe8fc');
			$(this).addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});
				
			$("#newBtn").bind("click", {'url' : "${ctx}/sys/role/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/role/delete", 'tableId' : 'contentTable'}, operation.dele);
	});
		
	 //新增明细行
    function addLine(){
    	window.location.href="${ctx}/sys/role/form?authMode=edit";
    }
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/role/">角色列表</a></li>
		<li><a href="${ctx}/sys/roleTemp/">临时授权</a></li>
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
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed table-hover">
				<tr>
					<th>角色序号</th>
					<th>角色名称</th>
					<th>英文名称</th>
					<th>归属机构</th>
					<th>数据范围</th>
					<shiro:hasPermission name="sys:role:edit">
						<th>操作</th>
					</shiro:hasPermission>
				</tr>
				<c:forEach items="${list}" var="role">
					<tr>
						<td><a
							href="form?id=${role.id}&roleName=${role.roleName}&roleNo=${role.roleNo}&enname=${role.enname}&org.orgNo=${role.org.orgNo}&org.name=${role.org.name}&authMode=view">${role.roleNo}</a></td>
						<td><a
							href="form?id=${role.id}&roleName=${role.roleName}&roleNo=${role.roleNo}&enname=${role.enname}&org.orgNo=${role.org.orgNo}&org.name=${role.org.name}&authMode=view">${role.roleName}</a></td>
						<td><a
							href="form?id=${role.id}&roleName=${role.roleName}&roleNo=${role.roleNo}&enname=${role.enname}&org.orgNo=${role.org.orgNo}&org.name=${role.org.name}&authMode=view">${role.enname}</a></td>
						<td>${role.org.name}</td>
						<td>${fns:getDictLabel(role.dataScope, 'sys_data_scope', '无')}</td>
						<shiro:hasPermission name="sys:role:edit">
							<td><%-- <a href="${ctx}/sys/role/assign?id=${role.id}">分配</a>  --%><c:if
									test="${(role.sysData eq fns:getDictValue('是', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('是', 'yes_no', '1'))}">
									<a href="${ctx}/sys/role/form?id=${role.id}&authMode=edit">修改</a>
								</c:if></td>
						</shiro:hasPermission>
						<input type="hidden" value="${role.id}" />
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>菜单管理</title>
<meta name="decorator" content="default" />
<%@include file="/WEB-INF/views/include/treetable.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#treeTable td").click(function() {
			$('.dbe8fc').removeClass('dbe8fc');
			$(this).parent('tr').find('td').addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});

		$("#newBtn").bind("click", {
			'url' : "${ctx}/sys/menu/form",
			'title' : "新增",
			'width' : 1200,
			'height' : 600
		}, operation.open);
		$("#delBtn").bind("click", {
			'url' : "${ctx}/sys/menu/delete",
			'tableId' : 'treeTable'
		}, operation.dele);



		$("#treeTable").treeTable({
			expandLevel : 3
		}).show();
		
		$("#treeTable").on("click","tr",function(){
			var trs=$(this).siblings();
			trs.removeClass('dbe8fc');
			$(this).addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});
		
		
	});
	function updateSort() {
		loading('正在提交，请稍等...');
		$("#listForm").attr("action", "${ctx}/sys/menu/updateSort");
		$("#listForm").submit();
	}
	function addLine(){
    	window.location.href="${ctx}/sys/menu/form?authMode=edit";
    	//window.open("${ctx}/account/claim/t0104/formLine?claimId="+id,"_blank","width:500,heigt:500");
    }
</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/menu/">菜单列表</a></li>
		<shiro:hasPermission name="sys:menu:edit">
			<li><a href="${ctx}/sys/menu/form">菜单添加</a></li>
		</shiro:hasPermission>
	</ul> --%>
	<div class="pr">
		<sys:message content="${message}" />
		<div class="only-textBtnDiv">
			<ul class="nav nav-tabs only-textBtn">
				<li id="delBtn">删除</li>
				<li onclick="addLine()" class="text-active">添加</li>
			</ul>
		</div>
		<div class="daiding">
			<form id="listForm" method="post">
				<table id="treeTable"
					class="table table-striped table-bordered table-condensed hide table-hover">
					<thead>
						<tr>
							<th>名称</th>
							<th>昵称</th>
							<th>链接</th>
							<th style="text-align:center;">排序</th>
							<th>可见</th>
							<th>权限标识</th>
							<shiro:hasPermission name="sys:menu:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="menu">
							<tr id="${menu.id}"
								pId="${menu.parent.id ne '1'?menu.parent.id:'0'}">
								<td nowrap><i
									class="icon-${not empty menu.icon?menu.icon:' hide'}"></i><a
									href="${ctx}/sys/menu/form?id=${menu.id}&authMode=view">${menu.name}</a></td>
												<td nowrap><i
									class="icon-${not empty menu.icon?menu.icon:' hide'}"></i><a
									href="${ctx}/sys/menu/form?id=${menu.id}&authMode=view">${menu.nickname}</a></td>
								<td title="${menu.href}">${fns:abbr(menu.href,30)}</td>
								<td style="text-align:center;"><shiro:hasPermission
										name="sys:menu:edit">
										<input type="hidden" name="ids" value="${menu.id}" />
										<input name="sorts" type="text" value="${menu.sort}"
											style="width:50px;margin:0;padding:0;text-align:center;">
									</shiro:hasPermission>
									<shiro:lacksPermission name="sys:menu:edit">
							${menu.sort}
						</shiro:lacksPermission></td>
								<td>${menu.isShow eq '1'?'显示':'隐藏'}</td>
								<td title="${menu.permission}">${fns:abbr(menu.permission,30)}</td>
								<shiro:hasPermission name="sys:menu:edit">
									<td nowrap>
									<%-- <a onclick="operation.edit('${ctx}/sys/menu/form?id=', '${menu.id}', 1200, 600)">修改</a> --%>
									<a href="${ctx}/sys/menu/form?id=${menu.id}&authMode=edit">修改</a>
										<a href="${ctx}/sys/menu/form?parent.id=${menu.id}">添加下级菜单</a>
									</td>
								</shiro:hasPermission>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
	<shiro:hasPermission name="sys:menu:edit">
		<div class="form-actions pagination-left">
			<input id="btnSubmit" class="btn btn-primary" type="button"
				value="保存排序" onclick="updateSort();" />
		</div>
	</shiro:hasPermission>
	</form>
</body>
</html>
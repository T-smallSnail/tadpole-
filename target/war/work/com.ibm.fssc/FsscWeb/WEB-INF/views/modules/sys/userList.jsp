<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
	
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
		
		$("#delBtn").bind("click", {
			'url' : "${ctx}/sys/user/delete",
			'tableId' : 'contentTable'
		}, operation.dele);

		$("#btnExport").click(function() {
			top.$.jBox.confirm("确认要导出用户数据吗？", "系统提示", function(v, h, f) {
				if (v == "ok") {
					$("#searchForm").attr("action", "${ctx}/sys/user/export");
					$("#searchForm").submit();
				}
			}, {
				buttonsFocus : 1
			});
			top.$('.jbox-body .jbox-icon').css('top', '55px');
		});
		$("#btnImport").click(function() {
			$.jBox($("#importBox").html(), {
				title : "导入数据",
				buttons : {
					"关闭" : true
				},
				bottomText : "导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"
			});
		});
	});
	function page(n, s) {
		if (n) $("#pageNo").val(n);
		if (s) $("#pageSize").val(s);
		$("#searchForm").attr("action", "${ctx}/sys/user/list");
		$("#searchForm").submit();
		return false;
	}
	function addLine(){
    	window.location.href="${ctx}/sys/user/form?authMode=edit";
    	//window.open("${ctx}/account/claim/t0104/formLine?claimId="+id,"_blank","width:500,heigt:500");
    }
	function addMoreLine(){
    	window.location.href="${ctx}/sys/user/addMoreform?authMode=edit";
    	//window.open("${ctx}/account/claim/t0104/formLine?claimId="+id,"_blank","width:500,heigt:500");
    }
</script>
</head>
<body>
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/sys/user/import" method="post"
			enctype="multipart/form-data" class="form-search"
			style="padding-left:20px;text-align:center;"
			onsubmit="loading('正在导入，请稍等...');">
			<br /> <input id="uploadFile" name="file" type="file"
				style="width:330px" /><br />
			<br /> <input id="btnImportSubmit" class="btn btn-primary"
				type="submit" value="   导    入   " /> <a
				href="${ctx}/sys/user/import/template">下载模板</a>
		</form>
	</div>
	
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/user/list">用户列表</a></li>
		<shiro:hasPermission name="sys:user:edit"><li><a href="${ctx}/sys/user/form">用户添加</a></li></shiro:hasPermission>
	</ul> --%>
	
	<form:form id="searchForm" modelAttribute="user"
		action="${ctx}/sys/user/list" method="post"
		class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}"
			callback="page();" />
		<ul class="ul-form">
			<li><label>归属公司：</label>
			<sys:asynctreeselect id="company" name="company.orgNo"
					value="${user.company.orgNo}" labelName="company.name"
					labelValue="${user.company.name}" title="公司"  
					url="/sys/org/asynctreeDataCompany?type=4" 
					allowClear="true" /></li>
			<li><label>登录名：</label>
			<form:input path="loginName" htmlEscape="false" maxlength="50"
					class="input-medium" /></li>
			<li class="clearfix"></li>
			<li><label>归属部门：</label>
			<sys:asynctreeselect id="office" name="office.orgNo" value="${user.office.orgNo}"
					labelName="office.name" labelValue="${user.office.name}" title="部门"
					url="/sys/org/asynctreeDataCompany?type=4"   queryParms="company.orgNo"
					allowClear="true"  /></li>
			<li><label>姓&nbsp;&nbsp;&nbsp;名：</label>
			<form:input path="userName" htmlEscape="false" maxlength="50"
					class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" onclick="return page();" /> 
				<!-- <input
				id="btnExport" class="btn btn-primary" type="button" value="导出" /> <input
				id="btnImport" class="btn btn-primary" type="button" value="导入" /> -->
				</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
		<sys:message content="${message}" />
		<div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					   <li id="delBtn" >删除</li>
					   <li onclick="addLine()" class="text-active">添加</li>
					   <li onclick="addMoreLine()" class="text-active">批量添加</li>
					</ul>
		</div>
		<div class="daiding">
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th class="sort-column login_name">登录名</th>
				<th class="sort-column name">姓名</th>
				<th>归属公司</th>
				<th>归属部门</th>
				<th>电话</th>
				<th>手机</th>
				<%--<th>角色</th> --%>
				<shiro:hasPermission name="sys:user:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="user">
				<tr>
					<td><a href="${ctx}/sys/user/form?id=${user.id}&authMode=view">${user.loginName}</a></td>
					<td>${user.userName}</td>
					<td>${user.company.name}</td>
					<td>${user.office.name}</td>
					<td>${user.phone}</td>
					<td>${user.mobile}</td>
					<%--
				<td>${user.roleNames}</td> --%>
					<shiro:hasPermission name="sys:user:edit">
						<td>
							<%-- <a onclick="operation.edit('${ctx}/sys/user/form?id=', '${user.userNo}', 1200, 600)">修改</a> --%>
							<a href="${ctx}/sys/user/form?id=${user.id}&authMode=edit">修改</a>
						</td>
					</shiro:hasPermission>
					<input type="hidden" value="${user.id}" />
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
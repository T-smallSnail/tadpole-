<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>异常管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/sysException/">异常列表</a></li>
		<shiro:hasPermission name="sys:sysException:edit"><li><a href="${ctx}/sys/sysException/form">异常添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysException" action="${ctx}/sys/sysException/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>项目代码：</label>
				<form:input path="expProCode" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="beginCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sysException.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endCreateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sysException.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>项目代码</th>
				<th>标题</th>
				<th>请求URI</th>
				<th>异常发生类</th>
				<th>异常发生方法</th>
				<th>异常信息</th>
				<th>异常详细信息</th>
				<th>操作者编号</th>
				<th>创建时间</th>
				<shiro:hasPermission name="sys:sysException:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysException">
			<tr>
				<td><a href="${ctx}/sys/sysException/form?id=${sysException.id}">
					${sysException.expProCode}
				</a></td>
				<td>
					${sysException.expTitle}
				</td>
				<td>
					${sysException.expReqUri}
				</td>
				<td>
					${sysException.expClass}
				</td>
				<td>
					${sysException.expMethod}
				</td>
				<td>
					${sysException.expName}
				</td>
				<td>
					${sysException.expInfo}
				</td>
				<td>
					${sysException.user.name}
				</td>
				<td>
					<fmt:formatDate value="${sysException.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="sys:sysException:edit"><td>
    				<a href="${ctx}/sys/sysException/form?id=${sysException.id}">修改</a>
					<a href="${ctx}/sys/sysException/delete?id=${sysException.id}" onclick="return confirmx('确认要删除该异常吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
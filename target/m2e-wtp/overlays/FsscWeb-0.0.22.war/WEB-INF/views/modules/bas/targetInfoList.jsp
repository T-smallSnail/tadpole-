<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>指标信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			/* $("#contentTable td").click(function() {
				$('.dbe8fc').removeClass('dbe8fc');
				$(this).parent('tr').find('td').addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			}); */
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});

			$("#newBtn").bind("click", {'url' : "${ctx}/bas/targetInfo/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/bas/targetInfo/delete", 'tableId' : 'contentTable'}, operation.dele);
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function addLine(){
	    	window.location.href="${ctx}/bas/targetInfo/form?authMode=edit";
	    	//window.open("${ctx}/account/claim/t0104/formLine?claimId="+id,"_blank","width:500,heigt:500");
	    }

	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="targetInfo" action="${ctx}/bas/targetInfo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>指标编码：</label>
				<form:input path="targetNo" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			
			<li><label>指标名称：</label>
				<form:input path="targetName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>指标类型：</label>
				<form:select path="targetType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('zblx')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
					   <li id="delBtn" >删除</li>
					   <li onclick="addLine()" class="text-active">添加</li>
					</ul>
		</div> -->
		<div class="daiding">
	<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>指标编码</th>
				<th>指标类型</th>
				<th>指标名称</th>
				<th>指标单位</th>
				<th>指标来源</th>
				<th>报表编码</th>
				<th>报表名称</th>
				<th>是否使用</th>
				<th>创建日期</th>
			<%-- 	<shiro:hasPermission name="bas:targetInfo:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="targetInfo">
			<tr>
				<td><a href="${ctx}/bas/targetInfo/form?id=${targetInfo.id}&authMode=view">
					${targetInfo.targetNo}
				</a></td>
				<td>
					${fns:getDictLabel(targetInfo.targetType, 'zblx', '')}
				</td>
				<td>
					${targetInfo.targetName}
				</td>
				<td>
					${targetInfo.unit}
				</td>
				<td>
					${targetInfo.source}
				</td>
				<td>
					${targetInfo.reportno}
				</td>
				<td>
					${targetInfo.reportname}
				</td>
				<td>
					${fns:getDictLabel(targetInfo.isUsed, 'yes_no', '')}
				</td>
				<td>
					<fmt:formatDate value="${targetInfo.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			<%-- 	<shiro:hasPermission name="bas:targetInfo:edit"><td>
    				<a onclick="operation.edit('${ctx}/bas/targetInfo/form?id=', '${targetInfo.id}', 1200, 600)">修改</a>
				  <a href="${ctx}/bas/targetInfo/form?id=${targetInfo.id}&authMode=edit">修改</a>
				</td></shiro:hasPermission> --%>
				<input type="hidden" value="${targetInfo.id}" />
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
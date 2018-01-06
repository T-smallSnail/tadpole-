<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>webService URL 地址管理</title>
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
				
			//$("#newBtn").bind("click", {'url' : "${ctx}/web/addUrl", 'title' : "新增", 'width' : 800, 'height' : 450}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/web/deleteUrl", 'tableId' : 'contentTable'}, operation.dele);
		});
	  	//新增明细行
	    function addLine(){
	    	window.location.href="${ctx}/web/addUrl?authMode=edit";
	    }
        
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="webserviceUrlEntity" action="${ctx}/web/index/" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <label>类型：</label>
    <form:select id="serverType" path="serverType" class="input-medium">
        <form:option value="" label=""/>
        <form:options items="${serverType}" htmlEscape="false"/>
    </form:select>
    &nbsp;&nbsp;<label>名称：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>
<div class="pr">
		<sys:message content="${message}"/>
		<div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					   <li id="delBtn" >删除</li>
					   <li id="newBtn" onclick="addLine()">添加</li>
					</ul>
		</div>
		<div class="daiding">
			<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
			    <thead><tr><th>名称</th><th>服务端类型</th><th>url地址</th><th>命名空间</th><th>描述</th><shiro:hasPermission name="sys:dict:edit"><th>操作</th></shiro:hasPermission></tr></thead>
			    <tbody>
			    <c:forEach items="${page.list}" var="webserviceUrl">
			        <tr>
			            <%-- <td width="10%">${webserviceUrl.name}</td> --%>
			            <td><a href="${ctx}/web/addUrl?id=${webserviceUrl.id}&authMode=view" >${webserviceUrl.name}</a></td>
			            <td width="5%">${webserviceUrl.serverType}</td>
			            <td width="20%"><a href="${webserviceUrl.urlAddress}" target="_blank">${webserviceUrl.urlAddress}</a></td>
			            <td width="35%">${webserviceUrl.namespace}</td>
			            <td width="15%">${webserviceUrl.remarks}</td>
			            <td width="10%">
			                <%-- <a href="javascript:operation.edit('${ctx}/web/addUrl?id=', '${webserviceUrl.id}', 800, 450)">修改</a> --%>
			            	<a href="${ctx}/web/addUrl?id=${webserviceUrl.id}&authMode=edit">修改</a>
			            </td>
			            <input type="hidden" value="${webserviceUrl.id}" />
			        </tr>
			    </c:forEach>
			    </tbody>
			</table>
		</div>
</div>
<div class="pagination">${page}</div>
</body>
</html>


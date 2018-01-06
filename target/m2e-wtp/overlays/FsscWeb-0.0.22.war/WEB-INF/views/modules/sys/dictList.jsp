<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
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
			//$("#newBtn").bind("click", {'url' : "${ctx}/sys/dict/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/dict/delete", 'tableId' : 'contentTable'}, operation.dele);
		});
		
		//新增明细行
	    function addLine(){
	    	window.location.href="${ctx}/sys/dict/form?authMode=edit";
	    }
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		var flag = true;
		function initalizeMDM(){
			/*
			
			var mdmUrls=new Array();
			    mdmUrls[0]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/accountsubs"
				mdmUrls[1]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/bankaccounts"
				mdmUrls[2]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/budgets"
				mdmUrls[3]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/customers"
				mdmUrls[4]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/depts"
				mdmUrls[5]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/employees"
				mdmUrls[6]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/orgs"
				mdmUrls[7]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/positions"
				mdmUrls[8]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/suppliers"
				mdmUrls[9]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/projects"
				mdmUrls[10]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/accountsubs"
				mdmUrls[11]="${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/targets"
					
						$.ajax(Urls[]={
								for(var i = 0;i<mdmUrls.length;i++){
									url:mdmUrls[i] ,
							   		type:"post",
							   		async: true;
							   		dataType:"json",
							   		success:function(obj){
					   				console.log(obj)
					   			
							}
				   		}
					} */
			 //第一种方式
		    
		  
		        if(flag){
		           flag = false;
		           $.ajax({
		   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/accountsubs",
		   				type:"post",
		   				dataType:"json",
		   				async: true,
		   				success:function(obj){
		   					
		   				}
		   			})
		   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/bankaccounts",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
		   				$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/budgets",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/customers",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/depts",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/employees",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/orgs",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/positions",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/projects",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/suppliers",
			   				type:"post",
			   				dataType:"json",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
			   			$.ajax({
			   				url: "${pageContext.request.contextPath}/${fns:getAdminPath()}/inf/targets",
			   				type:"post",
			   				dataType:"text",
			   				async: true,
			   				success:function(obj){
			   					
			   				}
			   			})
		        	}else{
		        		alert("禁止重复点击初始化缓存按钮");
		        	}
   				}
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/dict/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>类型：</label><form:select id="type" path="type" class="input-medium"><form:option value="" label="请选择"/><form:options items="${typeList}" htmlEscape="false"/></form:select>
		&nbsp;&nbsp;<label>描述 ：</label><form:input path="description" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;&nbsp;&nbsp;
		
		<shiro:hasPermission name="sys:dict:edit"><a href="javascript:void(0)" onclick="initalizeMDM()" ;return false;" class="btn">初始化MDM缓存</a></shiro:hasPermission>
		<shiro:hasPermission name="sys:dict:edit"><a href="${ctx}/sys/dict/removeAllCache" class="btn" style="float:right" >清除缓存</a></shiro:hasPermission>
	</form:form>
	<div class="pr">
		<sys:message content="${message}"/>
		<div class="only-textBtnDiv">
					<ul class="nav nav-tabs only-textBtn">
					   <li id="delBtn">删除</li>
					   <li id="newBtn" onclick="addLine()">添加</li>
					</ul>
		</div>
		<div class="daiding">
			<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
				<thead><tr><th>键值</th><th>标签</th><th>类型</th><th>描述</th><th>排序</th><shiro:hasPermission name="sys:dict:edit"><th>操作</th></shiro:hasPermission></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="dict">
					<tr>
						<td>${dict.value}</td>
						<td><a href="${ctx}/sys/dict/form?id=${dict.id}&authMode=view">${dict.label}</a></td>
						<td><a href="javascript:" onclick="$('#type').val('${dict.type}');$('#searchForm').submit();return false;">${dict.type}</a></td>
						<td>${dict.description}</td>
						<td>${dict.sort}</td>
						<shiro:hasPermission name="sys:dict:edit"><td>
						    <%-- <a href="javascript:operation.edit('${ctx}/sys/dict/form?id=', '${dict.id}', 800, 550)">修改</a>--%>
		    				<a href="${ctx}/sys/dict/form?id=${dict.id}&authMode=edit">修改</a>
		    				<a href="<c:url value='${fns:getAdminPath()}/sys/dict/form?type=${dict.type}&sort=${dict.sort+10}'><c:param name='description' value='${dict.description}'/></c:url>">添加键值</a>
						</td></shiro:hasPermission>
						<input type="hidden" value="${dict.id}" />
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
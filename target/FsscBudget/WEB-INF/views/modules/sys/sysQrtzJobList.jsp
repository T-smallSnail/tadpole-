<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务调度管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/sysQrtzJob/delete", 'tableId' : 'contentTable'}, operation.dele);
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function addLine(){
	    	window.location.href="${ctx}/sys/sysQrtzJob/form?authMode=edit";
	    }
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="sysQrtzJob" action="${ctx}/sys/sysQrtzJob/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>任务名称：</label>
				<form:input path="jobName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>任务组：</label>
				<form:input path="jobGroup" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>任务开始日期：</label>
				<input name="begDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sysQrtzJob.begDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>任务结束日期：</label>
				<input name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${sysQrtzJob.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>任务状态：</label>
				<form:select path="jobStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('job_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			
			
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
	<sys:message content="${message}"/>
		<div class="only-textBtnDiv">
						<ul class="nav nav-tabs only-textBtn">
						   <li id="delBtn" >删除</li>
						   <li onclick="addLine()" class="text-active">添加</li>
						</ul>
		</div>
		<div class="daiding">
			<table id="contentTable" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<tr>
						<th>任务ID</th>
						<th>任务名称</th>
						<th>定时配置</th>
						<th>执行任务实现类</th>
						<th>任务方法</th>
						<th>任务开始日期</th>
						<th>任务结束日期</th>
						<th>任务状态</th>
						<shiro:hasPermission name="bas:bankAccount:edit"><th>操作</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="sysQrtzJob">
					<tr>
						<td>
							${sysQrtzJob.id}
						</td>
						<td><a href="${ctx}/sys/sysQrtzJob/form?id=${sysQrtzJob.id}&authMode=view">
							${sysQrtzJob.jobName}
						</a></td>
						<td>
							${sysQrtzJob.jobCron}
						</td>
						<td>
							${sysQrtzJob.jobClass}
						</td>
						<td>
							${sysQrtzJob.jobMethod}
						</td>
						<td>
							<fmt:formatDate value="${sysQrtzJob.begDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							<fmt:formatDate value="${sysQrtzJob.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							${fns:getDictLabel(sysQrtzJob.jobStatus, 'job_status', '无')}
						</td>
						<shiro:hasPermission name="sys:sysQrtzJob:edit"><td>
							<c:if test="${fns:getDictLabel(sysQrtzJob.jobStatus, 'job_status', '无')!='启用'}">
			    				<a href="${ctx}/sys/sysQrtzJob/resume?id=${sysQrtzJob.id}">启用</a>
			    				<a href="${ctx}/sys/sysQrtzJob/start?id=${sysQrtzJob.id}">执行</a>
		    				</c:if>
		    				<c:if test="${fns:getDictLabel(sysQrtzJob.jobStatus, 'job_status', '无')=='启用'}">
			    				<a href="${ctx}/sys/sysQrtzJob/pause?id=${sysQrtzJob.id}">暂停</a>
		    				</c:if>
		    				<%-- <a onclick="operation.edit('${ctx}/sys/sysQrtzJob/form?id=', '${sysQrtzJob.id}', 1200, 700)">修改</a> --%>
		    				<a href="${ctx}/sys/sysQrtzJob/form?id=${sysQrtzJob.id}&authMode=edit">修改</a>
		    				<input type="hidden" value="${sysQrtzJob.id}" />
						</td></shiro:hasPermission>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
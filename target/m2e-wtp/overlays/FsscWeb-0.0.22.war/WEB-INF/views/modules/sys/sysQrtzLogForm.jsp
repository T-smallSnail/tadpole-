<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务日志管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/sysQrtzLog/">任务日志列表</a></li>
		<li class="active"><a href="${ctx}/sys/sysQrtzLog/form?id=${sysQrtzLog.id}">任务日志<shiro:hasPermission name="sys:sysQrtzLog:edit">${not empty sysQrtzLog.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:sysQrtzLog:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="sysQrtzLog" action="${ctx}/sys/sysQrtzLog/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label"><font color="red">*</font>任务外键：</label>
			<div class="controls">
				 	<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.jobId}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="jobId" />
                    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">执行节点地址2：</label>
			<div class="controls">
					<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.executorAddress}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="executorAddress" />
                    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务描述：</label>
			<div class="controls">
					<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.jobDesc}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="jobDesc" />
                    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">调度时间：</label>
			<div class="controls">
				<c:if test="${sysQrtzLog.authMode=='view' && sysQrtzJob.authMode!=''}">
                       <p class="form-control"><fmt:formatDate value="${sysQrtzLog.triggerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                </c:if>
                <c:if test="${sysQrtzLog.authMode=='edit'}">
                 	<input name="triggerTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${sysQrtzLog.triggerTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                </c:if>	
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">调度结果：</label>
			<div class="controls">
					<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.triggerCode}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="triggerCode" />
                    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">调度日志：</label>
			<div class="controls">
					<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.triggerMsg}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="triggerMsg" />
                    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">执行时间：</label>
			<div class="controls">
				<c:if test="${sysQrtzLog.authMode=='view' && sysQrtzJob.authMode!=''}">
                       <p class="form-control"><fmt:formatDate value="${sysQrtzLog.handleTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                </c:if>
                <c:if test="${sysQrtzLog.authMode=='edit'}">
               		<input name="handleTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${sysQrtzLog.handleTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                </c:if>	
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">执行状态 [0-失败 1-成功]：</label>
			<div class="controls">
					<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.handleCode}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="handleCode" />
                    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">执行日志：</label>
			<div class="controls">
					<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.handleMsg}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="triggerMsg" />
                    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label"><font color="red">*</font>任务名称：</label>
			<div class="controls">
					<c:if test="${sysQrtzLog.authMode=='view'  ||  sysQrtzLog.authMode==''}">
	                        <p class="form-control">${sysQrtzLog.jobName}</p>
                    </c:if>
                    <c:if test="${sysQrtzLog.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="jobName" />
                    </c:if>
			</div>
		</div>
					<div class="toolbar-Onlybtn">
						<c:if test="${sysQrtzLog.authMode == 'edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
						</c:if>
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
						</div>
	</form:form>
</body>
</html>
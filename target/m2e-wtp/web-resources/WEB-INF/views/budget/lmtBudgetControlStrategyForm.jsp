<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>预算控制策略 ( 主）管理</title>
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
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/modules/budget/lmtBudgetControlStrategy/">预算控制策略 ( 主）列表</a></li>
		<li class="active"><a href="${ctx}/modules/budget/lmtBudgetControlStrategy/form?id=${lmtBudgetControlStrategy.id}">预算控制策略 ( 主）<shiro:hasPermission name="modules:budget:lmtBudgetControlStrategy:edit">${not empty lmtBudgetControlStrategy.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="modules:budget:lmtBudgetControlStrategy:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	<form:form id="inputForm" modelAttribute="lmtBudgetControlStrategy" action="${ctx}/modules/budget/lmtBudgetControlStrategy/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">预算科目编码：</label>
			<div class="controls">
				<form:input path="budgetSubjectCode" htmlEscape="false" maxlength="256" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预算科目名称：</label>
			<div class="controls">
				<form:input path="budgetSubjectName" htmlEscape="false" maxlength="1200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属公司编码：</label>
			<div class="controls">
				<form:input path="compId" htmlEscape="false" maxlength="256" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属公司名称：</label>
			<div class="controls">
				<form:input path="compName" htmlEscape="false" maxlength="1200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">控制策略：</label>
			<div class="controls">
				<form:input path="controlStrategy" htmlEscape="false" maxlength="88" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">控制生效开始时间：</label>
			<div class="controls">
				<input name="startTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${lmtBudgetControlStrategy.startTime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
			
			
		</div>
		<div class="control-group">
			<label class="control-label">控制生效结束时间：</label>
			<div class="controls">
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${lmtBudgetControlStrategy.endTime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">摘要：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="4000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
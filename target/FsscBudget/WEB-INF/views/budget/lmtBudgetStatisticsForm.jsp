<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>预算执行统计管理</title>
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
		<li><a href="${ctx}/budget/lmtBudgetStatistics/">预算执行统计列表</a></li>
		<li class="active"><a href="${ctx}/budget/lmtBudgetStatistics/form?id=${lmtBudgetStatistics.id}">预算执行统计<shiro:hasPermission name="budget:lmtBudgetStatistics:edit">${not empty lmtBudgetStatistics.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="budget:lmtBudgetStatistics:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="lmtBudgetStatistics" action="${ctx}/budget/lmtBudgetStatistics/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">预算基础数据表ID：</label>
			<div class="controls">
				<form:input path="budgetId" htmlEscape="false" maxlength="256" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报账单主表ID：</label>
			<div class="controls">
				<form:input path="claimId" htmlEscape="false" maxlength="256" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报账单单号：</label>
			<div class="controls">
				<form:input path="claimNo" htmlEscape="false" maxlength="400" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报账单行表ID：</label>
			<div class="controls">
				<form:input path="claimLineId" htmlEscape="false" maxlength="400" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">操作状态 F:冻结，R：释放，O：占用：</label>
			<div class="controls">
				<form:input path="opType" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">会计科目名称：</label>
			<div class="controls">
				<form:input path="accountName" htmlEscape="false" maxlength="1200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">会计科目编码：</label>
			<div class="controls">
				<form:input path="accountCode" htmlEscape="false" maxlength="256" class="input-xlarge "/>
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
					value="<fmt:formatDate value="${lmtBudgetStatistics.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">控制生效结束时间：</label>
			<div class="controls">
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${lmtBudgetStatistics.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报账单模板：</label>
			<div class="controls">
				<form:input path="templateNo" htmlEscape="false" maxlength="256" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报账单模版名称：</label>
			<div class="controls">
				<form:input path="templateName" htmlEscape="false" maxlength="400" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">业务大类编码：</label>
			<div class="controls">
				<form:input path="supCateId" htmlEscape="false" maxlength="256" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">业务大类名称：</label>
			<div class="controls">
				<form:input path="supCateName" htmlEscape="false" maxlength="400" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报账金额：</label>
			<div class="controls">
				<form:input path="applyAmount" htmlEscape="false" maxlength="22" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报账日期：</label>
			<div class="controls">
				<input name="applyDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${lmtBudgetStatistics.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">变动金额：</label>
			<div class="controls">
				<form:input path="changeAmount" htmlEscape="false" maxlength="22" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预算总金额：</label>
			<div class="controls">
				<form:input path="budgetAmount" htmlEscape="false" maxlength="22" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预算已完成（占用）金额（按会计科目累加统计)：</label>
			<div class="controls">
				<form:input path="occupiedAmount" htmlEscape="false" maxlength="22" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">预算冻结金额（按会计科目累加统计)：</label>
			<div class="controls">
				<form:input path="blockedAmount" htmlEscape="false" maxlength="22" class="input-xlarge  digits"/>
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
			<shiro:hasPermission name="budget:lmtBudgetStatistics:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
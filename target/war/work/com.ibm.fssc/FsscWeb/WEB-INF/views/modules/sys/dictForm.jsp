<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#value").focus();
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
			$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/sys/dict/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/sys/dict/list';
							}
						});
		   				}
		   			},
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.responseText);
                    },
                    complete: function(XMLHttpRequest, textStatus) {
                        this; // 调用本次AJAX请求时传递的options参数
                    }
		   		});
	    	});
		});
		
	</script>
</head>
<body>
<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="dict" action="${ctx}/sys/dict/save" method="post" class="form-inline">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="suspend-card">
		<div class="form-group suspend-cardForm">
		 <span class="help-inline"><font color="red">*</font> </span>
			<label class="control-label">键值:</label>
			<%-- <div class="controls">
				<form:input path="value" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div> --%>
			<c:if test="${dict.authMode == 'view'||dict.authMode==''}">
		        <p class="form-control">${dict.value}</p>
		    </c:if>
		    <c:if test="${dict.authMode == 'edit'}">
				<form:input path="value" htmlEscape="false" maxlength="200"	class="form-control required" />
			</c:if>
		</div>
		<div class="form-group suspend-cardForm">
		    <span class="help-inline"><font color="red">*</font> </span>
			<label class="control-label">标签:</label>
			<%-- <div class="controls">
				<form:input path="label" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div> --%>
			<c:if test="${dict.authMode == 'view'||dict.authMode==''}">
		        <p class="form-control">${dict.label}</p>
		    </c:if>
		    <c:if test="${dict.authMode == 'edit'}">
				<form:input path="label" htmlEscape="false" maxlength="200"	class="form-control required" />
			</c:if>
		</div>
		<div class="form-group suspend-cardForm">
			<span class="help-inline"><font color="red">*</font> </span>
			<label class="control-label">类型:</label>
			<%-- <div class="controls">
				<form:input path="type" htmlEscape="false" maxlength="50" class="required abc"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div> --%>
			<c:if test="${dict.authMode == 'view'||dict.authMode==''}">
		        <p class="form-control">${dict.type}</p>
		    </c:if>
		    <c:if test="${dict.authMode == 'edit'}">
				<form:input path="type" htmlEscape="false" maxlength="200"	class="form-control required" />
			</c:if>
		</div>
		<div class="form-group suspend-cardForm">
		<span class="help-inline"><font color="red">*</font> </span>
			<label class="control-label">描述:</label>
			<%-- <div class="controls">
				<form:input path="description" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div> --%>
			<c:if test="${dict.authMode == 'view'||dict.authMode==''}">
		        <p class="form-control">${dict.description}</p>
		    </c:if>
		    <c:if test="${dict.authMode == 'edit'}">
				<form:input path="description" htmlEscape="false" maxlength="200"	class="form-control required" />
			</c:if>
		</div>
		<div class="form-group suspend-cardForm">
		    <span class="help-inline"><font color="red">*</font> </span>
			<label class="control-label">排序:</label>
			<%-- <div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="11" class="required digits"/>
			</div> --%>
			<c:if test="${dict.authMode == 'view'||dict.authMode==''}">
		        <p class="form-control">${dict.sort}</p>
		    </c:if>
		    <c:if test="${dict.authMode == 'edit'}">
				<form:input path="sort" htmlEscape="false" maxlength="200"  onkeyup="value=value.replace(/[^\d]/g,'')"  placeholder="请输入数字"	class="form-control required" />
			</c:if>
		</div>
		<div class="form-group form-inline-align" style="text-align:right;">
			<label class="control-label">备注:</label>
			<%-- <div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div> --%>
			<c:if test="${dict.authMode == 'view'||dict.authMode==''}">
		        <p class="form-control">${dict.remarks}</p>
		    </c:if>
		    <c:if test="${dict.authMode == 'edit'}">
				<%-- <form:textarea path="remarks" htmlEscape="false" maxlength="200" class="form-control" /> --%>
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
			</c:if>
		</div>
				<div class="toolbar-Onlybtn">
				<c:if test="${dict.authMode == 'edit'}">	
					<button type="button" class="btn btn-main " id="submitForm">保存</button>
				</c:if>
					<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
	</div>
	</form:form>
	</div>
</body>
</html>
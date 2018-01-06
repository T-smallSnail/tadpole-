<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>岗位信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">

$(document).ready(function() {
 	$("#submitForm").click(function(){
 		if(!$("#inputForm").valid()){
				return;
			}
 		$.ajax({
	   			url:'${ctx}'+"/sys/job/save",
	   			data:$("#inputForm").serialize(),
	   			dataType:"json",
	   			type:"post",
	   			success:function(data){
	   			 if (data && data == "success") {
					/* window.location=ctx + '/sys/employee/list'; */
					$.jBox.prompt('保存成功。', '提示', 'info', {
						closed : function() {
							$.jBox.tip("正在处理，请稍候....", "loading");
							location.href = ctx + '/sys/job/list';
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
	<div class="layout-content">
		<form:form id="inputForm" modelAttribute="job"
			action="${ctx}/sys/job/save" method="post" class="form-inline" role="form">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<div class="suspend-card">
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">岗位编码：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.jobNo}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control required" path="jobNo" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">岗位名称：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.jobName}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control required" path="jobName" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">部门编码：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.departNo}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control required" path="departNo" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">部门名称：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.departName}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control required" path="departName" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">组织编码：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.orgNo}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control required" path="orgNo" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">组织名称：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.orgName}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control required" path="orgName" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							 <label class="control-label">上级岗位编码：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.pJobNo}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control " path="pJobNo" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							<label class="control-label">上级岗位名称：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.pJobName}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
	                        <form:input type="text" class="form-control " path="pJobName" />
                    		</c:if>	
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">是否撤销：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
	                        	<p class="form-control">${job.isRevoke}</p>
                    		</c:if>
                    		<c:if test="${job.authMode=='edit'}">
						    <form:select path="isRevoke" class="form-control required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<%-- <form:input path="isDirect" htmlEscape="false" maxlength="50" class="form-control "/> --%>
						</c:if>
						</div>
						<div class="form-group suspend-cardForm"></div>
						<div class="form-group suspend-cardForm"></div>
						<div class="form-group form-inline-align">
							<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注：</label>
							<c:if test="${job.authMode=='view'  ||  job.authMode==''}">
                        		<p class="form-control">${job.remarks}</p>
                  			</c:if>
                    		<c:if test="${job.authMode=='edit'}">
                       			<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
                    		</c:if>
						</div>
						<div class="toolbar-Onlybtn">
						<c:if test="${job.authMode == 'edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
						</c:if>
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
					</div>
			</div>
		</form:form>
	</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>项目信息管理</title>
<meta name="decorator" content="default" />
<!-- <script type="text/javascript">
	$(document).ready(function() {
		//$("#name").focus();
		$("#inputForm").validate({
			submitHandler : function(form) {
				loading('正在提交，请稍等...');
				form.submit();
			},
			errorContainer : "#messageBox",
			errorPlacement : function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
	});
</script> -->

<script type="text/javascript">
			
		   $(document).ready(function() {
		    	$("#submitForm").click(function(){
		    		if(!$("#inputForm").valid()){
						return;
					}
		    		$.ajax({
			   			url:'${ctx}'+"/bas/projectInfo/save",
			   			data:$("#inputForm").serialize(),
			   			dataType:"json",
			   			type:"post",
			   			success:function(data){
			   			 if (data && data == "success") {
							/* window.location=ctx + '/sys/employee/list'; */
							$.jBox.prompt('保存成功。', '提示', 'info', {
								closed : function() {
									$.jBox.tip("正在处理，请稍候....", "loading");
									location.href = ctx + '/bas/projectInfo/list';
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
		<form:form id="inputForm" modelAttribute="projectInfo"
			action="${ctx}/bas/projectInfo/save" method="post"
			class="form-inline" role="form">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<div class="suspend-card" style="width:98%;margin:4px auto;">
					<div id="collapseTwo1" class="panel-defined-content collapse in">
						<div class="form-group suspend-cardForm">
						<font color="red">*</font> <label class="control-label">项目编码：</label>
						 <c:if test="${projectInfo.authMode=='view'  ||  projectInfo.authMode==''}">
	                        	<p class="form-control">${projectInfo.projectNo}</p>
                   		</c:if>
                    	<c:if test="${projectInfo.authMode=='edit'}">
	                        	<form:input type="text" class="form-control required" path="projectNo" />
                    	</c:if>		
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">项目名称：</label>
							<c:if test="${projectInfo.authMode=='edit'}">
							    <form:input path="projectName" htmlEscape="false" maxlength="200"
								  class="form-control required" />
							</c:if>
							 <c:if test="${projectInfo.authMode=='view'  ||  projectInfo.authMode==''}">
	                        	<p class="form-control">${projectInfo.projectName}</p>
                   		     </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">项目类型：</label>
							<c:if test="${projectInfo.authMode=='edit'}">
								<form:select path="projectType" class="form-control required">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('project_type')}" itemLabel="label"
										itemValue="value" htmlEscape="false" />
								</form:select>
							</c:if>
							 <c:if test="${projectInfo.authMode=='view'  ||  projectInfo.authMode==''}">
							    <p class="form-control">${fns:getDictLabel(projectInfo.projectType, 'project_type', '')}</p>
							 </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">项目状态：</label>
							<c:if test="${projectInfo.authMode=='edit'}">
								<form:select path="projectStatus" class="form-control required">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('project_status')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</c:if>
							 <c:if test="${projectInfo.authMode=='view'  ||  projectInfo.authMode==''}">
							    <p class="form-control">${fns:getDictLabel(projectInfo.projectStatus, 'project_status', '')}</p>
							 </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">建设单位：</label>
							<c:if test="${projectInfo.authMode=='edit'}">
								<form:input path="buildCompany" htmlEscape="false"
									maxlength="200" class="form-control required" />
							</c:if>
							 <c:if test="${projectInfo.authMode=='view'  ||  projectInfo.authMode==''}">
							     <p class="form-control">${projectInfo.buildCompany}</p>
							 </c:if>
						</div>

						<div class="form-group suspend-cardForm">
							<font color="red">*</font>
							<label class="control-label">工程分类：</label>
							<c:if test="${projectInfo.authMode=='edit'}">
								<form:select path="programType" class="form-control required">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('program_type')}" itemLabel="label"
										itemValue="value" htmlEscape="false"  class="form-control required"/>
								</form:select>
							</c:if>
							 <c:if test="${projectInfo.authMode=='view'  ||  projectInfo.authMode==''}">
							     <p class="form-control">${fns:getDictLabel(projectInfo.programType, 'program_type', '')}</p>
							 </c:if>
						</div>
						<div class="form-group suspend-cardForm"></div>
						<div class="form-group form-inline-align">
							<label class="control-label">备注：</label>
							<c:if test="${projectInfo.authMode=='edit'}">
								<form:textarea path="remarks" htmlEscape="false" rows="3"
									maxlength="4000" class="form-control" />
						    </c:if>
						    <c:if test="${projectInfo.authMode=='view'  ||  projectInfo.authMode==''}">
						        <p class="form-control">${projectInfo.remarks}</p>
						    </c:if>
						</div>
					</div>
			</div>
				<c:if test="${formType!='view'}">
					<div class="toolbar-Onlybtn">
						<c:if test="${projectInfo.authMode=='edit'}">
							<button type="button" class="btn btn-main " id="submitForm">保存</button>
						</c:if>
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
					</div>
		        </c:if>
		</form:form>
	</div>
</body>
</html>
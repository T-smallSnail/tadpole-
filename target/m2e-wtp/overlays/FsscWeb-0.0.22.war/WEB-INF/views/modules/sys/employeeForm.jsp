<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
	<title>人员信息管理</title>
    <meta name="decorator" content="default" />
	<script type="text/javascript">
			
		   $(document).ready(function() {
		    	$("#submitForm").click(function(){
		    		if(!$("#inputForm").valid()){
						return;
					}
		    		$.ajax({
			   			url:'${ctx}'+"/sys/employee/save",
			   			data:$("#inputForm").serialize(),
			   			dataType:"json",
			   			type:"post",
			   			success:function(data){
			   			 if (data && data == "success") {
							/* window.location=ctx + '/sys/employee/list'; */
							$.jBox.prompt('保存成功。', '提示', 'info', {
								closed : function() {
									$.jBox.tip("正在处理，请稍候....", "loading");
									location.href = ctx + '/sys/employee/list';
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
			<form:form id="inputForm" modelAttribute="employee" action="${ctx}/account/claim/travel/saveLine" method="post" class="form-inline" >
				<form:hidden path="id"/>
			    <div class="suspend-card">
			             <div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">人员编号：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.empNo}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							    <form:input path="empNo" htmlEscape="false" maxlength="200"	class="form-control required" />
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">姓名：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.empName}</p>
		                    </c:if>
							<c:if test="${employee.authMode == 'edit'}">
								<form:input path="empName" htmlEscape="false" maxlength="200" class="form-control required" />
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> 
							<label class="control-label">性别：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${fns:getDictLabel(employee.sex, 'sex', '')}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
								<form:select path="sex" class="form-control required">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('sex')}" itemLabel="label"
										itemValue="value" htmlEscape="false" />
								</form:select>
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font>
							<label class="control-label">民族：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${fns:getDictLabel(employee.nation, 'nation', '')}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:select path="nation" class="form-control required">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('nation')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font>
							<label class="control-label">任职级别：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${fns:getDictLabel(employee.officeLevel, 'office_level', '')}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:select path="officeLevel" class="form-control required">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('office_level')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">电子邮箱：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.email}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:input path="email" htmlEscape="false" maxlength="200"	class="form-control required" />
							</c:if>
						</div>

						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">岗位编码：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.jobNo}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:input path="jobNo" htmlEscape="false" maxlength="200"	class="form-control required" />
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">岗位名称：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.jobName}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							    <form:input path="jobName" htmlEscape="false" maxlength="200" class="form-control required" />
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">部门编码：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.departNo}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:input path="departNo" htmlEscape="false" maxlength="200" class="form-control required" />
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">部门名称：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.departName}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:input path="departName" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<label class="control-label">手机：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.mobile}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:input path="mobile" htmlEscape="false" maxlength="200"
								class="form-control" />
							</c:if>
						</div>
				
						<div class="form-group suspend-cardForm">
							<font color="red">*</font>
							<label class="control-label">用户类型：</label>
							<c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${fns:getDictLabel(employee.userType, 'sys_user_type', '')}</p>
		                    </c:if>
		                    <c:if test="${employee.authMode == 'edit'}">
							<form:select path="roleNo" class="form-control required">
									<form:option value="" label=""/>
									<form:options items="${AuthRoleList}" itemLabel="roleName" itemValue="id" htmlEscape="false"/>
							</form:select>
							</c:if>
						</div>
                     	<div class="form-group suspend-cardForm">
						  <font color="red">*</font> 
           				  <label >人员状态：</label>
           				  <c:if test="${employee.authMode == 'view'}">
		                        <p class="form-control">${employee.status}</p>
		                  </c:if>
		                   <c:if test="${employee.authMode == 'edit'}">
              					<sys:treeselect id="status" name=""
               					value="${employee.status}" labelName="status"
               					 labelValue="${employee.status}" title="人员状态"
                				url="/sys/dict/treeDataProduct?type=useraccountstatus"  cssClass="required" allowClear="true" />
						   </c:if>
						</div>
						
						<div class="form-group suspend-cardForm">
						 
						</div>

						<div class="form-group suspend-cardForm">
							<label class="control-label">备注：</label>
						    <c:if test="${employee.authMode == 'view'}">
	                            <p class="form-control">${employee.remarks}</p>
	                        </c:if>
	                        <c:if test="${employee.authMode == 'edit'}">
							<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="4000" class="form-control" />
							</c:if>
						</div>
			
		     </div>
					<c:if test="${employee.authMode == 'edit'}">
					<div class="toolbar-Onlybtn">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
					</div>
					</c:if>
					<c:if test="${employee.authMode == 'view'}">
					<div class="toolbar-Onlybtn">
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
					</div>
					</c:if>
			</form:form>
			</div>
	</body>
</html>
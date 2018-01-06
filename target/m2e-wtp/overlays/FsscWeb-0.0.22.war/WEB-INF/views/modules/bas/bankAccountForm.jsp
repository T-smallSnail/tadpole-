<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>银行账户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	   $(document).ready(function() {
	    	$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/bas/bankAccount/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/bas/bankAccount/list';
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
	<form:form id="inputForm" modelAttribute="bankAccount" action="${ctx}/bas/bankAccount/save" method="post" class="form-inline" role="form">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<!-- <div style="width:98%;margin:4px auto;"> -->
		<!-- <div id="collapseTwo1" class="panel-defined-content collapse in"> -->
		
			 <div class="suspend-card">
			 	<div class="form-inline">
				<div class="form-group suspend-cardForm" >
					<font color="red">*</font>
					<label class="control-label">客户编码：</label>
					
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.customerNo}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="customerNo" htmlEscape="false" maxlength="18" class="form-control required"/>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm" >
					<font color="red">*</font>
					<label class="control-label">供应商编码：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.supplierNo}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="supplierNo" htmlEscape="false" maxlength="18" class="form-control required"/>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">账户编码：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.account}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="account" htmlEscape="false" maxlength="200" class="form-control required"/>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
						<font color="red">*</font>
					<label class="control-label">账户：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.accountNo}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="accountNo" htmlEscape="false" maxlength="200" class="form-control required"/>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">账户名称：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.accountName}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="accountName" htmlEscape="false" maxlength="200" class="form-control required"/>
					</c:if>
				</div>
				<div class="form-group suspend-cardForm">
				    <font color="red">*</font>
					<label class="control-label">开户单位：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.accountUnit}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="accountUnit" htmlEscape="false" maxlength="200" class="form-control required"/>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
				    <font color="red">*</font>
					<label class="control-label">币种：</label>
					
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(bankAccount.moneyType,'cur_type','')}</p>
						</c:if>
						
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="moneyType" class="form-control required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('cur_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</c:if>
						
				</div>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">开户行联行号：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.bankAccount}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="bankAccount" htmlEscape="false" maxlength="200" class="form-control required"/>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">开户行名称：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.bankName}</p>
					</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:input path="bankName" htmlEscape="false" maxlength="200" class="form-control required"/>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">所在国家：</label>
					
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
	          				 		<p class="form-control">${fns:getDictLabel(bankAccount.country,'country_arearegister','')}</p>
						</c:if>
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="country" class="form-control">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('country_arearegister')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">所在省市：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
         				 		<p class="form-control">${bankAccount.province}</p>
         				</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<sys:treeselect id="province" name="" value="${bankAccount.province}" labelName="province" 
							labelValue="${bankAccount.province}" title="省市" url="/sys/treeConf/treeData?sceneId=10000" 
							cssClass="" allowClear="true"/>
					</c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">银行类别：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
	          				 		<p class="form-control">${fns:getDictLabel(bankAccount.bankType,'bank_type','')}</p>
						</c:if>
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="bankType" class="form-control">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('bank_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">账户属性：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
	          				 		<p class="form-control">${fns:getDictLabel(bankAccount.accountProperty,'account_property','')}</p>
						</c:if>
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="accountProperty" class="form-control">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('account_property')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">账户类型：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
	          				 		<p class="form-control">${fns:getDictLabel(bankAccount.accountType,'account_type','')}</p>
						</c:if>
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="accountType" class="form-control">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('account_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">账户性质：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
	          				<p class="form-control">${fns:getDictLabel(bankAccount.accountNature,'account_nature','')}</p>
					</c:if>
					
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:select path="accountNature" class="form-control">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('account_nature')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">自动归集父账户：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.parentAccount}</p>
          				</c:if>
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:input path="parentAccount" htmlEscape="false" maxlength="50" class="form-control"/>
						</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">是否授权给财务公司：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.isGrentfd}</p>
          			</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:radiobuttons path="isGrentfd" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" />
					</c:if>	
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">账户状态：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
	          				 		<p class="form-control">${fns:getDictLabel(bankAccount.accountStatus,'account_status','')}</p>
						</c:if>
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="accountStatus" class="form-control required">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('account_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</c:if>
						
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">是否直连：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.isDirect}</p>
          				</c:if>
						<c:if test="${bankAccount.authMode=='edit'}">
						    <form:select path="isDirect" class="form-control ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							<%-- <form:input path="isDirect" htmlEscape="false" maxlength="50" class="form-control "/> --%>
						</c:if>
				</div>
				<div class="form-group form-inline-align">
					<label class="control-label">备注：</label>
					<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.remarks}</p>
          			</c:if>
					<c:if test="${bankAccount.authMode=='edit'}">
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="4000" class="form-control"/>
					</c:if>
				</div>
				
				
				
				</div>
			</div>
	
			<c:if test="${formType!='view'}">
				<div class="toolbar-Onlybtn">
					<c:if test="${bankAccount.authMode=='edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</c:if>
					<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
			</c:if>
	</form:form>
	</div>
</body>
</html>
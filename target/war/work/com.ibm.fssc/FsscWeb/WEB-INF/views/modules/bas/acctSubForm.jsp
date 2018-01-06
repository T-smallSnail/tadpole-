<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>会计科目管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	   $(document).ready(function() {
	    	$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/bas/acctSub/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/bas/acctSub/list';
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
<style>
	/*修改下拉框*/
	.form-group .select2-container .select2-choice{height: 30px;padding: 0px;line-height: 30px;text-align: left;padding-left: 17px;border: 1px solid #cccccc;background-image: none;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);}
	.form-group .select2-container .select2-choice .select2-arrow{background-image: none;background: transparent;border-left:none;}
	.form-group .select2-container{width: 64.7% !important}
</style>
	
	<div class="overall-layoutSEO">
		<form:form id="inputForm" modelAttribute="acctSub" action="${ctx}/bas/acctSub/save" method="post" class="form-inline" role="form">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>	
			<!-- <div style="width:98%;margin:4px auto;"> -->
			<!-- <div id="collapseTwo1" class="panel-defined-content collapse in"> -->
		 <div class="suspend-card">
		 	<div class="form-inline">
			<div class="form-group suspend-cardForm" >
				<font color="red">*</font>
				<label class="control-label">科目编码：</label>
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${acctSub.acctNo}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:input path="acctNo" htmlEscape="false" maxlength="200" class="form-control required"/> 
				</c:if>
					
			</div>
			<div class="form-group suspend-cardForm">
			    <font color="red">*</font>
				<label class="control-label">科目名称：</label>
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${acctSub.acctName}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:input path="acctName" htmlEscape="false" maxlength="200" class="form-control required"/>
				</c:if>
					
			</div>
			<div class="form-group suspend-cardForm">
		    <font color="red">*</font>
			<label class="control-label">使用标志：</label>
			
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${fns:getDictLabel(acctSub.isUsed,'is_used','')}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:select path="isUsed" class="form-control required">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('is_used')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</c:if>
			</div>
			<div class="form-group suspend-cardForm">
		    <font color="red">*</font>
			<label class="control-label">科目级次：</label>
			
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${fns:getDictLabel(acctSub.subjectLevel,'kmjc','')}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:select path="subjectLevel" class="form-control required">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('kmjc')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</c:if>
			</div>
			<div class="form-group suspend-cardForm">
				<font color="red">*</font>
				<label class="control-label">上级科目编码：</label>
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${acctSub.parentno}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:input path="parentno" htmlEscape="false" maxlength="200" class="form-control required"/>
				</c:if>
					
			</div>
			<div class="form-group suspend-cardForm">
				<font color="red">*</font>
				<label class="control-label">上级科目名称：</label>
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${acctSub.parentname}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:input path="parentname" htmlEscape="false" maxlength="200" class="form-control required"/>
				</c:if>
					
			</div>
			
			<div class="form-group suspend-cardForm">
			<font color="red">*</font>
				<label class="control-label">科目唯一编码(远光)：</label>
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${acctSub.unAcctNo}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:input path="unAcctNo" htmlEscape="false" maxlength="18" class="form-control required"/>
				</c:if>
					
			</div>
				
			<div class="form-group suspend-cardForm">
				<label class="control-label">科目属性：</label>
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${acctSub.budgetProperty}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:input path="budgetProperty" htmlEscape="false" maxlength="18" class="form-control "/>
				</c:if>
			</div>
			
			<div class="form-group suspend-cardForm">
			    <font color="red">*</font>
				<label class="control-label">KMID：</label>
				<c:if test="${acctSub.authMode=='view' || supplierInfo.authMode==''}">
          				 	<p class="form-control">${acctSub.KMID}</p>
				</c:if>
				<c:if test="${acctSub.authMode=='edit'}">
					<form:input path="KMID" htmlEscape="false" maxlength="18" class="form-control required"/>
				</c:if>
			</div>
			<div class="form-group suspend-cardForm"></div>
			<div class="form-group suspend-cardForm"></div>
			<div class="form-group form-inline-align" >
					<label class="control-label">备注：</label>
					<c:if test="${acctSub.authMode=='view' || acctSub.authMode==''}">
                        	<p class="form-control" style="width: 100%;float: none;display: inline;">${acctSub.remarks }</p>
                    </c:if>
                    <c:if test="${acctSub.authMode=='edit'}">
                       	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
                    </c:if>
				</div>
		</div>
		</div>
		</div>
			
			<c:if test="${formType!='view'}">
				<div class="toolbar-Onlybtn">
					<c:if test="${acctSub.authMode=='edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</c:if>
					<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
			</c:if>
		
		</form:form>
	</div>

	</body>
</html>
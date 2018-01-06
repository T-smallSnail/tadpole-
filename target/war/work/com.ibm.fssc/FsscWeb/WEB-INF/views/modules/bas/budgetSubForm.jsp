<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>预算科目信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">

$(document).ready(function() {
 	$("#submitForm").click(function(){
 		if(!$("#inputForm").valid()){
				return;
			}
 		$.ajax({
	   			url:'${ctx}'+"/bas/budgetSub/save",
	   			data:$("#inputForm").serialize(),
	   			dataType:"json",
	   			type:"post",
	   			success:function(data){
	   			 if (data && data == "success") {
					/* window.location=ctx + '/sys/employee/list'; */
					$.jBox.prompt('保存成功。', '提示', 'info', {
						closed : function() {
							$.jBox.tip("正在处理，请稍候....", "loading");
							location.href = ctx + '/bas/budgetSub/list';
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

		<form:form id="inputForm" modelAttribute="budgetSub"
			action="${ctx}/bas/budgetSub/save" method="post" class="form-inline"
			role="form">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<!-- <div style="width:98%;margin:4px auto;"> -->
			<!-- <div id="collapseTwo1" class="panel-defined-content collapse in"> -->
			<div class="suspend-card">
				<div class="form-inline">
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">预算编码：</label>
							<c:if test="${budgetSub.authMode=='view' || budgetSub.authMode==''}">
          				 		<p class="form-control">${budgetSub.budgetNo}</p>
							</c:if>
							<c:if test="${budgetSub.authMode=='edit'}">
								<form:input path="budgetNo"  htmlEscape="false" maxlength="200"
									class="form-control required" />
							</c:if>

						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">预算名称：</label>
							<c:if test="${budgetSub.authMode=='view' || budgetSub.authMode==''}">
          				 		<p class="form-control">${budgetSub.budgetName}</p>
							</c:if>
							<c:if test="${budgetSub.authMode=='edit'}">
								<form:input path="budgetName" htmlEscape="false" maxlength="200"
									class="form-control required" />
							</c:if>

						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">使用标志：</label>
							<c:if test="${budgetSub.authMode=='view' || budgetSub.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(budgetSub.isUsed,'status','')}</p>
							</c:if>
							<c:if test="${budgetSub.authMode=='edit'}">
								<form:select path="isUsed" class="form-control required">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</c:if>

						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">科目级次：</label>
							<c:if test="${budgetSub.authMode=='view' || budgetSub.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(budgetSub.budgetLevel,'kmjc','')}</p>
							</c:if>
							<c:if test="${budgetSub.authMode=='edit'}">
								<form:select path="budgetLevel" class="form-control required">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('kmjc')}" itemLabel="label"
										itemValue="value" htmlEscape="false" />
								</form:select>
							</c:if>

						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">上级科目编码：</label>
							<c:if test="${budgetSub.authMode=='view' || budgetSub.authMode==''}">
          				 		<p class="form-control">${budgetSub.parentNo}</p>
							</c:if>
							<c:if test="${budgetSub.authMode=='edit'}">
								<form:input path="parentNo" htmlEscape="false" maxlength="200"
									class="form-control required" />
							</c:if>

						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">上级科目名称：</label>
							<c:if test="${budgetSub.authMode=='view' || budgetSub.authMode==''}">
          				 		<p class="form-control">${budgetSub.parentName}</p>
							</c:if>
							<c:if test="${budgetSub.authMode=='edit'}">
								<form:input path="parentName" htmlEscape="false" maxlength="200"
									class="form-control required" />
							</c:if>
						</div>

						<div class="form-group suspend-cardForm">
							<font color="red">*</font><label class="control-label">备注(科目说明)：</label>
							<c:if test="${budgetSub.authMode=='view' || budgetSub.authMode==''}">
          				 		<p class="form-control">${budgetSub.remarks}</p>
							</c:if>
							<c:if test="${budgetSub.authMode=='edit'}">
							<form:textarea path="remarks" htmlEscape="false" rows="3"
								maxlength="4000" class="form-control required" />
							</c:if>
						</div>
					</div>
				</div>
				</div>
			<c:if test="${formType!='view'}">
				<div class="toolbar-Onlybtn">
					<c:if test="${budgetSub.authMode=='edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</c:if>
					<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
			</c:if>
			
		</form:form>
	</div>
</body>
</html>
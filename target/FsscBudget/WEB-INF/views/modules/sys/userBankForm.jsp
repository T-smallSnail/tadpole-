<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>供应商管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
$(document).ready(function() {
	$("#submitForm").click(function(){
	
		var userId=$("#userid").val();
		var userNo=$("#userNo").val();
		if(!$("#inputForm").valid()){
			return;
		}
		$.ajax({
   			url:'${ctx}'+"/sys/user/saveBank",
   			data:$("#inputForm").serialize(),
   			dataType:"json",
   			type:"post",
   			success:function(data){
   				if(typeof(data.information)!="undefined" && data.information!=""){
   					$.jBox.alert(data.information, '提示');
   				}else{
   					if (data && data.type == "success") {
		   				 _userno = data.userNo;
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								window.location.href="${ctx}/sys/user/info";
							}
						});
		   			}
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
	$('#province').change(function() {
		$("#s2id_city").find("span.select2-chosen").text("");
		var value = $(this).val();
		$.ajax({
			type : "post",
			url : '${ctx}'+"/bas/bankAccount/selectCity",
			data : {
				province : value
			},
			success : function(data) {
    			//先清空$('#city')
    			$("#city").empty();
    			var dataObj = data.bankAccountList;
      			for(var i=0;i<dataObj.length;i++){
	      			$('#city').append('<option value="'+dataObj[i].city+'">'+dataObj[i].city+'</option>');
      			}
      			//设置默认值
      			$("#s2id_city").find("span.select2-chosen").text(dataObj[0].city);
			},
			dataType:"json"
		});
	 });
});

</script>
</head>
<body>
	<div class="overall-layoutSEO">
		<form:form id="inputForm" modelAttribute="bankAccount"
			action="${ctx}/bas/bankAccount/save" method="post"
			class="form-inline" role="form">
			<form:hidden path="id"/> 
		 	<form:hidden path="userNo" value="${user.currentUser.userNo}"/>
			<form:hidden path="customerNo" value="${bankAccount.customerNo}"/>
			<form:hidden path="account" value="${bankAccount.account}"/>
			<form:hidden path="moneyType" value="${bankAccount.moneyType}"/>
			<form:hidden path="accountNature" value="${bankAccount.accountNature}"/>
			<form:hidden path="isGrentfd" value="${bankAccount.isGrentfd}"/>
			<form:hidden path="isDirect" value="${bankAccount.isDirect}"/>
			<form:hidden path="supplierNo" value="${bankAccount.supplierNo}"/>
			<form:hidden path="accountUnit" value="${bankAccount.accountUnit}"/>
			<form:hidden path="country" value="${bankAccount.country}"/>
			<form:hidden path="bankType" value="${bankAccount.bankType}"/>
			<form:hidden path="accountType" value="${bankAccount.accountType}"/>
			<form:hidden path="parentAccount" value="${bankAccount.parentAccount}"/>
			<form:hidden path="accountStatus" value="${bankAccount.accountStatus}"/>
			
			<sys:message content="${message}" />
			<div class="suspend-title">
					<span>基本信息</span> <a data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo1">
					</a>
			</div>
			  <div class="suspend-card">
			 	<div class="form-inline">
					<div class="form-group suspend-cardForm" >
						<font color="red">*</font> <label class="control-label">银行账号:</label>
						 <c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.accountNo}</p>
          				 </c:if>
          				<c:if test="${bankAccount.authMode=='edit'}">
							<form:input path="accountNo" htmlEscape="false" maxlength="200"
								class="form-control  required" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm" >
						<font color="red">*</font> <label class="control-label">账户名称:</label>
						 <c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.accountName}</p>
          				 </c:if>
          				<c:if test="${bankAccount.authMode=='edit'}">
							<form:input path="accountName" htmlEscape="false" maxlength="200"
								class="form-control  required" />
						</c:if>
					</div>
					
					<div class="form-group suspend-cardForm" >
						<font color="red">*</font> <label class="control-label">开户行:</label>
						 <c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.bankName}</p>
          				 </c:if>
          				<c:if test="${bankAccount.authMode=='edit'}">
							<form:input path="bankName" htmlEscape="false" maxlength="200"
								class="form-control  required" />
						</c:if>
					</div>
					
					<div class="form-group suspend-cardForm" >
						<font color="red">*</font> <label class="control-label">联行号:</label>
						 <c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.bankAccount}</p>
          				 </c:if>
          				<c:if test="${bankAccount.authMode=='edit'}">
							<form:input path="bankAccount" htmlEscape="false" maxlength="200"
								class="form-control  required" />
						</c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<font color="red">*</font><label class="control-label">账户属性:</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(bankAccount.accountProperty,'account_property','')}</p>
          				</c:if>
						
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="accountProperty" class="form-control">
								<form:options items="${fns:getDictList('accountProperty')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<font color="red">*</font><label class="control-label">默认账户：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(bankAccount.isDefault,'isDefault','')}</p>
          				</c:if>
						
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="isDefault" class="form-control">
								<form:options items="${fns:getDictList('isDefault')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<font color="red">*</font><label class="control-label">对公对私标识：</label>
						<c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(bankAccount.businessPersonnelFlag,'businessPersonnelFlag','')}</p>
          				</c:if>
						
						<c:if test="${bankAccount.authMode=='edit'}">
							<form:select path="businessPersonnelFlag" class="form-control">
								<form:options items="${fns:getDictList('businessPersonnelFlag')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>
					</div>
					<div class="form-group suspend-cardForm" >
						<label class="control-label">所属省:</label>
						 <c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.province}</p>
          				 </c:if>
          				<c:if test="${bankAccount.authMode=='edit'}">
							<form:input path="province" htmlEscape="false" maxlength="200"
								class="form-control" />
						</c:if>
					</div>
					<div class="form-group suspend-cardForm" >
						 <label class="control-label">所属市:</label>
						 <c:if test="${bankAccount.authMode=='view' || bankAccount.authMode==''}">
          				 		<p class="form-control">${bankAccount.city}</p>
          				 </c:if>
          				<c:if test="${bankAccount.authMode=='edit'}">
							<form:input path="city" htmlEscape="false" maxlength="200"
								class="form-control" />
						</c:if>
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
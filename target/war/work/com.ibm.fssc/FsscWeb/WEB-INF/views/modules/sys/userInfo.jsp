<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人信息</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
					
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
			
			$("#btnTestRedis").click(function(){
				top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/sys/user/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			/* 删除选中行--start--  */
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
			$("#delBankBtn").bind("click", {'url' : "${ctx}/sys/user/deleteBank", 'tableId' : 'contentTable'}, operation.dele);
			
			//校验有无提示信息
			var message = "${information}";
			if(typeof(message)!="undefined" && message!=""){
				$.jBox.alert(message, '提示');
			}
			
		});
		
		
		function addBank(){
			var userNo = $("#userNo").val();
			var userId=$("#userId").val();
			var trLen = $("#contentTable tr").length;
            window.location.href="${ctx}/sys/user/userBankForm?authMode=edit&currentUser.userNo="+userNo+"&currentUser.id="+userId;
			/* if(trLen == 1){
			}else if(trLen > 1){
                 $.jBox.tip("只能添加一条银行账户信息！", "提示");
			} */
	    }

	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/user/info">个人信息</a></li>
		<li><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/info" method="post" class="form-horizontal">
		<sys:message content="${message}"/>
		<input type="hidden" id="userNo" value="${user.userNo}"/>
		<input type="hidden" id="userId" value="${user.id}"/>
		<div class="control-group">
			<label class="control-label">归属公司:</label>
			<div class="controls">
				<label class="lbl">${user.company.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属部门:</label>
			<div class="controls">
				<label class="lbl">${user.office.name}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名:</label>
			<div class="controls">
				<form:input path="userName" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户类型:</label>
			<div class="controls">
				<label class="lbl">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户角色:</label>
			<div class="controls">
				<label class="lbl">${user.roleNames}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上次登录:</label>
			<div class="controls">
				<label class="lbl">IP: ${user.oldLoginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></label>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
		</div>
		
		<!--添加银行账户信息   ---start---  -->
		<c:if test="${user.id==NULL}">
		
		</c:if>
		<c:if test="${user.id!=NULL}">
		    <c:if test="${user.authMode=='edit'}">
				<div class="only-textBtnDiv">
							<ul class="nav nav-tabs only-textBtn">
							   <li id="delBankBtn" >删除</li>
							   <li  onclick="addBank()"  class="text-active">添加</li>
							</ul>
				</div>
			</c:if>
		<div class="suspend-title">
					<span>银行帐号信息</span> <a data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo2"> 
					</a>
		</div>
		<div id="collapseTwo2" class="suspend-card-bottom">
		<style>
		#collapseTwo2 td{
			background-color:#F4F6FA;
		}
		</style>
					<table id="contentTable"
						class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr>
								<th>银行帐号</th>
								<th>帐户名称</th>
								<th>开户名称</th>
								<th>联行号</th>
								<th>帐户属性</th>
								<th>所属省</th>
								<th>所属市</th>
								<th>对公对私标识</th>
								<th>是否默认账户</th>
							    <th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bankAccountList}" var="bankAccount">
								<tr>
									<td>${bankAccount.accountNo}</td>
									<td >${bankAccount.accountName}</td>
									<td>${bankAccount.bankName}</td>
									<td>${bankAccount.bankAccount}</td>
									<td>${fns:getDictLabel(bankAccount.accountProperty,'accountProperty','')}</td>
									<td>${bankAccount.province}</td>
									<td>${bankAccount.city}</td>
									<td>${fns:getDictLabel(bankAccount.businessPersonnelFlag,'businessPersonnelFlag','')}</td>
									<td>${fns:getDictLabel(bankAccount.isDefault,'isDefault','')}</td>
						            <td><a href="${ctx}/sys/user/userBankForm?id=${bankAccount.id}">修改</a></td>
								    <input type="hidden" id="bankAccountId" value="${bankAccount.id}">
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
		<!--添加银行账户信息   ---end---  -->
		
	</form:form>
</body>
</html>
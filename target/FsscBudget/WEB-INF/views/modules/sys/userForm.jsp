<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#contentTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
			$("#contentTables").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtnAuth').addClass('text-corEC6868');
			});
            $("#delBtn").bind("click", {
                'url' : "${ctx}/sys/user/deletebank",
                'tableId' : 'contentTable'
            }, operation.dele);
			$("#delBtnAuth").bind("click", {
				'url' : "${ctx}/sys/userRoleTemp/delete",
				'tableId' : 'contentTables'
			}, operation.dele);
			
	    	$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		//debugger;
	    		$.ajax({
		   			url:'${ctx}'+"/sys/user/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   				//debugger;
		   			 if (data && data == "success") {
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/sys/user/list';
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
		

		
		function addBank(){
			var userNo = $("#user_no").val();
			var userId=$("#id").val();
			//alert("userId22===="+userId);
			var trLen = $("#contentTable tr").length;

			if(trLen == 1){
                window.location.href="${ctx}/sys/user/userBankForm?authMode=edit&currentUser.userNo="+userNo+"&currentUser.id="+userId;
			}else if(trLen > 1){
                $.jBox.tip("只能添加一条银行账户信息！", "提示");
			}
	    }
		
		function addAuth(){
			window.location.href="${ctx}/sys/userRoleTemp/form?authMode=edit&userNo=${user.userNo}";
	    } 
		
	</script>
	<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>
</head>
<body>
	<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}"
			callback="page();" />
		<sys:message content="${message}"/>
		<div class="suspend-card">
		<!-- <div class="form-inline"> -->
<%-- 		 <div class="form-group suspend-cardForm">
			<label class="control-label">头像:</label>
			<div class="controls">
			 <c:if test="${user.authMode=='edit'}">
				<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			 </c:if>
			 <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
			     <p class="form-control">${user.photo}</p>
			 </c:if>
			</div>
		
		<!-- </div> -->
		</div> --%>
		<legend>基本信息</legend>
		<div class="form-group suspend-cardForm">
			 <label class="control-label">归属公司:</label>
			 <c:if test="${user.authMode=='edit'}">
	            <sys:asynctreeselect id="company" name="company.orgNo" value="${user.company.orgNo}" labelName="company.name" labelValue="${user.company.name}"
						title="公司" url="/sys/org/asynctreeDataCompany?type=4" cssClass="required"/>
			 </c:if>
			 <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
		          <p class="form-control">${user.company.name}</p>
		     </c:if>
		</div>
		    <div class="form-group suspend-cardForm">
				<label class="control-label">归属部门:</label>
				<c:if test="${user.authMode=='edit'}">
		            <sys:asynctreeselect id="office" name="office.orgNo" value="${user.office.orgNo}" labelName="office.name" labelValue="${user.office.name}"
							title="部门"  url="/sys/org/asynctreeDataCompany?type=4" queryParms="company.orgNo" cssClass="required"/>
					
					<span class="help-inline"><font color="red">*</font>
				</c:if>
				<c:if test="${user.authMode=='view'  ||  user.authMode==''}">
			          <p class="form-control">${user.office.name}</p>
			    </c:if>
			</div>
		<div class="control-group suspend-cardForm">
			<label class="control-label">工号:</label>
			<div class="controls">
				<c:if test="${user.authMode=='edit'}">
					<form:input path="empNo" htmlEscape="false" name="empNo"  readonly="readonly" maxlength="50" class="required"/>
					<!-- <input id="userNo" name="userNo" type="hidden" > -->
					<span class="help-inline"><font color="red">*</font> </span>
					<a onclick="func_popSingle('ASD002','company.orgNo,office.orgNo','')" class="btn "><i class="icon-search"></i></a>
				</c:if>
				<c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.empNo}</p>
				</c:if>
			</div>
		</div>
		
		<div class="control-group ">
			<label class="control-label">姓名:</label>
			<div class="controls">
			  <c:if test="${user.authMode=='edit'}">
				<form:input path="userName" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			  </c:if>
			  <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.userName}</p>
			  </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户编码:</label>
			<div class="controls">
			   <c:if test="${user.authMode=='edit'}">
					<form:input id="user_no" path="userNo" htmlEscape="false" maxlength="50" class="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
			   </c:if>
			    <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.userNo}</p>
			    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">登录名:</label>
			<div class="controls">
			  <c:if test="${user.authMode=='edit'}">
				<input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
				<form:input path="loginName" htmlEscape="false" maxlength="50" class="required userName"/>
				<span class="help-inline"><font color="red">*</font> </span>
			  </c:if>
			  <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.loginName}</p>
			    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码:</label>
			<div class="controls">
				  <c:if test="${user.authMode=='edit'}">
					<input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="${empty user.id?'required':''}"/>
					<c:if test="${empty user.id}"><span class="help-inline"><font color="red">*</font> </span></c:if>
					<c:if test="${not empty user.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if>
				  </c:if>
				   <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				     
			       </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">确认密码:</label>
			<div class="controls">
			  <c:if test="${user.authMode=='edit'}">
				  <c:choose>
				  	<c:when test="${empty user.id}">
				  		<input id="confirmNewPassword" class="required" name="confirmNewPassword" type="password" value="" maxlength="50" minlength="3" equalTo="#newPassword"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</c:when> 
					<c:otherwise>
						<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="50" minlength="3" equalTo="#newPassword"/>
					</c:otherwise>
				</c:choose>
			  </c:if>
			  <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				    
			  </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮箱:</label>
			<div class="controls">
			  <c:if test="${user.authMode=='edit'}">
				 <form:input path="email" htmlEscape="false" maxlength="100" class="email"/>
			  </c:if>
			  <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.email}</p>
			  </c:if>
			  
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话:</label>
			<div class="controls">
			  <c:if test="${user.authMode=='edit'}">
				 <form:input path="phone" htmlEscape="false" maxlength="100"/>
			  </c:if>
			  <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.phone}</p>
			  </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机:</label>
			<div class="controls">
			   <c:if test="${user.authMode=='edit'}">
				 <form:input path="mobile" htmlEscape="false" maxlength="100"/>
			   </c:if>
			    <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.mobile}</p>
			    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否允许登录:</label>
			<div class="controls">
			   <c:if test="${user.authMode=='edit'}">
					<form:select path="loginFlag">
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					<span class="help-inline"><font color="red">*</font> “是”代表此账号允许登录，“否”则表示此账号不允许登录</span>
			    </c:if>
			    <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.mobile}</p>
			    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户类型:</label>
			<div class="controls">
		    	<c:if test="${user.authMode=='edit'}">
					<form:select path="userType" class="input-xlarge">
						<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</c:if>
				 <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${fns:getDictLabel(user.userType, 'sys_user_type', '')}</p>
			    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">角色列表:</label>
			<div class="controls">
			
				 <c:if test="${user.authMode=='edit'}">
					<%-- <form:checkboxes path="roleIdList" items="${allRoles}" itemLabel="RoleName" itemValue="id" htmlEscape="false" class="required"/> --%>
					<form:input path="roleIdList" htmlEscape="false"  maxlength="200" class="required" />
					<form:input path="roleNameList" htmlEscape="false"  maxlength="200" class="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
					<button type="button" class="btn btn-main " onclick="func_popMultipleCheckbox('ZXC003','')" >选择</button>
					
				 </c:if>
				 <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.roleNameList}</p>
			     </c:if>
			</div>
		</div>
		<legend>临时授权</legend>
			<div class="control-group">
			<div class="only-textBtnDiv">
							<ul class="nav nav-tabs only-textBtn">
							   <li id="delBtnAuth" >删除</li>
							   <li  onclick="addAuth()"  class="text-active">添加</li>
							</ul>
				</div>
			<table id="contentTables" class="table table-striped table-bordered table-condensed table-hover">
				<thead>
				<tr><th title="选中后该字段被加入到查询条件里" >角色ID</th><th>角色名称</th><th>组织名称</th><th>部门</th><th>开始时间</th><th>结束时间</th><th>操作</th></tr>
				</thead>
		
			<c:forEach items="${page.list}" var="userRoleTemp">
			<tr>
				<td><a href="${ctx}/sys/userRoleTemp/form?id=${userRoleTemp.id}&authMode=view">
					${userRoleTemp.id}
				</a></td>
				<td>
					${userRoleTemp.roleName}
				</td>
				<td>
					${userRoleTemp.org.name}
				</td>
				<td>
					${userRoleTemp.depart.name}
				</td>
				<td>
					<fmt:formatDate value="${userRoleTemp.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				 <td>
					<fmt:formatDate value="${userRoleTemp.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
    				<a href="${ctx}/sys/userRoleTemp/form?id=${userRoleTemp.id}&authMode=edit">修改 </a>
				</td>
					<input type="hidden" value="${userRoleTemp.id}" /> 
				</tr>
			
		</c:forEach>
			</table>
				</div>
					<div class="pagination">${page}</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
			  <c:if test="${user.authMode=='edit'}">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			  </c:if>
			  <c:if test="${user.authMode=='view'  ||  user.authMode==''}">
				   <p class="form-control">${user.remarks}</p>
			  </c:if>
			</div>
		</div>
		<c:if test="${not empty user.id}">
			<div class="form-group">
				<label class="control-label">创建时间:</label>
				<div class="controls">
					<label class="lbl"><fmt:formatDate value="${user.createDate}" type="both" dateStyle="full"/></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">最后登陆:</label>
				<div class="controls">
					<label class="lbl">IP: ${user.loginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.loginDate}" type="both" dateStyle="full"/></label>
				</div>
			</div>
		</c:if>
		<c:if test="${formType!='view'}">
			<div class="toolbar-Onlybtn">
				<c:if test="${user.authMode=='edit'}">
					<button type="button" class="btn btn-main " id="submitForm">保存</button>
				</c:if>
				<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
			</div>
		</c:if>
		</div>
		
		<c:if test="${user.id==NULL}">
		
		</c:if>
		<c:if test="${user.id!=NULL}">
		    <c:if test="${user.authMode=='edit'}">
				<div class="only-textBtnDiv">
							<ul class="nav nav-tabs only-textBtn">
							   <li id="delBtn" >删除</li>
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
					<table id="contentTable"
						class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr>
								<th>银行帐号</th>
								<th>帐户名称</th>
								<th>开户名称</th>
								<th>联行号</th>
								<th>帐户属性</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bankAccountList}" var="bankAccount">
								<tr>
									<td>${bankAccount.accountNo}</td>
									<td>${bankAccount.accountName}</td>
									<td>${bankAccount.bankName}</td>
									<td>${bankAccount.bankAccount}</td>
									<td>${bankAccount.accountProperty}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
	</form:form>
 </div>
</body>
</html>
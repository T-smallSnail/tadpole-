<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>S管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSubmit").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		if(CheckEndTime()&&CheckStartTime()){
	    			$.ajax({
			   			url:'${ctx}'+"/sys/userRoleTemp/save",
			   			data:$("#inputForm").serialize(),
			   			dataType:"json",
			   			type:"post",
			   			success:function(data){
			   			 if (data && data == "success") {
							/* window.location=ctx + '/sys/employee/list'; */
							$.jBox.prompt('保存成功。', '提示', 'info', {
								closed : function() {
									$.jBox.tip("正在处理，请稍候....", "loading");
									location.href = ctx + '/sys/user/form?id=${userRoleTemp.userId}';
								}
							});
			   				}else{
			   					$.jBox.prompt('保存失败。', '提示', 'info', {
									closed : function() {
										$.jBox.tip("正在处理，请稍候....", "loading");
										location.href = ctx + 'sys/userRoleTemp/form?id=${userRoleTemp.userId}';
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
	    		}
		    	});
				
			});
	    		
	    		
		function CheckEndTime(){
			 var startTime = document.getElementById("startTime").value;   
		    var endTime = document.getElementById("endTime").value;  
		    var ele = document.getElementById ("msg"); 
		    if(null==startTime||""==startTime.trim()){
		    	ele.innerHTML = "开始时间不能为空!";
		    	return false;
		    }
		    if(null==endTime||""==endTime.trim()){
		    	ele.innerHTML = "结束时间不能为空!";
		    	return false;
		    }
		    if(startTime>=endTime){
		    	ele.innerHTML = "开始时间不能大于等于结束时间!";
		    	return false;
		    }else{
		    	ele.innerHTML = "";
		    	return true;
		    }
			
		}
		
		function CheckStartTime(){
			 var startTime = document.getElementById("startTime").value;   
		    var endTime = document.getElementById("endTime").value;  
		    var ele = document.getElementById ("msg"); 
	
		    if(null==endTime||""==endTime.trim()){
		    	ele.innerHTML = "结束时间不能为空!";
		    	return false;
		    }
		    if(startTime>=endTime){
		    	ele.innerHTML = "开始时间不能大于等于结束时间!";
		    	return false;
		    }else{
		    	ele.innerHTML = "";
		    	return true;
		    }
			
		}
	</script>
</head>
<body>
	<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="userRoleTemp" action="${ctx}/sys/userRoleTemp/save" method="post" class="form-inline">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">用户编码：</label>
			 <c:choose>  
			 <c:when test="${userRoleTemp.authMode=='view'  ||  userRoleTemp.authMode== '' }">
					<p class="form-control">${userRoleTemp.userNo}</p>
			 </c:when>
			 
			 <c:when test="${(userRoleTemp.authMode=='edit') &&(userRoleTemp.id  ne null &&  userRoleTemp.id ne '')}">
			  <form:input path="userNo" htmlEscape="false" maxlength="64" class="input-xlarge required"  readonly="true"  />
				<span class="help-inline"><font color="red">*</font> </span>
			 </c:when>
			 
			 <c:when test="${(userRoleTemp.authMode=='edit') &&(userRoleTemp.id==null ||  userRoleTemp.id== '')}">
			 <form:input path="userNo" htmlEscape="false" maxlength="64" class="input-xlarge required"    readonly="true"   />
				<span class="help-inline"><font color="red">*</font> </span> 
			 </c:when>
			 
			 </c:choose>
			 
		</div>
		<div class="control-group">
			<label class="control-label">归属公司：</label>
			 <c:if test="${userRoleTemp.authMode=='edit'}">
	            <sys:asynctreeselect id="company" name="company.orgNo" value="${userRoleTemp.company.orgNo}" labelName="company.name" labelValue="${userRoleTemp.company.name}"
						title="公司" url="/sys/org/asynctreeDataCompany?type=4" cssClass="required disabled" />
							<span class="help-inline"><font color="red">*</font> </span> 
			 </c:if>
			 <c:if test="${userRoleTemp.authMode=='view'  ||  userRoleTemp.authMode==''}">
		          <p class="form-control">${userRoleTemp.company.name}</p>
		     </c:if>
		</div>
		
		<div class="control-group">
			<label class="control-label">归属部门：</label>
				<c:if test="${userRoleTemp.authMode=='edit'}">
		            <sys:asynctreeselect id="office" name="office.orgNo" value="${userRoleTemp.office.orgNo}" labelName="office.name" labelValue="${userRoleTemp.office.name}"
							title="部门"  url="/sys/org/asynctreeDataCompany?type=4" queryParms="company.orgNo"/>
					
				</c:if>
				<c:if test="${userRoleTemp.authMode=='view'  ||  userRoleTemp.authMode==''}">
			          <p class="form-control">${userRoleTemp.office.name}</p>
			    </c:if>
		</div>
		
		<div class="control-group"> 
			<label class="control-label">角色：</label>
			<form:select path="roleNo" class="input-xlarge required">
				<form:option value="" label=""/>
				<form:options items="${AuthRoleList}" itemLabel="roleName" itemValue="id" htmlEscape="false"/>
			</form:select>
		<span class="help-inline"><font color="red">*</font> </span> 
		</div>
		
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge "  />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开始时间：</label>
			<div class="controls">
				<input  id="startTime" name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required "
					value="<fmt:formatDate value="${userRoleTemp.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"  onblur="CheckStartTime()"/>
						<span class="help-inline"><font color="red">*</font> </span> 
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结束时间：</label>
			<div class="controls">
				<input   id="endTime" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate  required"
					value="<fmt:formatDate value="${userRoleTemp.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" onblur="CheckEndTime()"/>
						<span class="help-inline"><font color="red">*</font> </span> 
						<span  id ="msg" class="help-inline"/> 
			</div>
		</div>
		<div class="form-actions">
		<input id="btnSubmit" class="btn btn-primary" type="button" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
	   $(document).ready(function() {
		   $("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/sys/roleTemp/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   				debugger;
		   			 if (data) {
		   				 if (data.type == "success") {
		   					$.jBox.prompt(data.message, '提示', 'info', {
								closed : function() {
									$.jBox.tip("正在处理，请稍候....", "loading");
									location.href = ctx + '/sys/roleTemp';
								}
							});
		   				 } else if (data.type == "fail") {
		   					alertx(data.message);
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
	   });
	</script>
	<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>
</head>
<body>
	<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="role" action="${ctx}/sys/roleTemp/save" method="post" class="form-inline">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="suspend-card">
		<div class="form-group suspend-cardForm form-inline-align">
		    <i class="icon-sameAttr6 defined-importent"></i>
			<label class="control-label">登录名称:</label>
			<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
                 <p class="form-control">${role.user.loginName}</p>
	        </c:if>
	        <c:if test="${role.authMode=='edit'}">
			<form:input path="user.loginName" maxlength="50" type="search" class="form-control icon-sameAttr16 defined-search required" id="btnSubmit" onclick="func_popSingle('USER001','','')" placeholder="选择用户" />
			<form:hidden path="user.userNo"/>
			<form:hidden path="org.orgNo"/>
			<form:hidden path="depart.orgNo"/>
			</c:if>
		</div>
		<div class="form-group suspend-cardForm  form-inline-align">
		    <i class="icon-sameAttr6 defined-importent"></i>
			<label class="control-label">角色名称:</label>
			<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
                 <p class="form-control">${role.roleName}</p>
	        </c:if>
	        <c:if test="${role.authMode=='edit'}">
				<form:input path="roleName" type="search" class="form-control icon-sameAttr16 defined-search" id="btnSubmit" onclick="func_popSingle('ROLETMP001','','')" placeholder="选择角色" />
			</c:if>
		</div>
		
		<div class="form-group suspend-cardForm  form-inline-align">
			<i class="icon-sameAttr6 defined-importent"></i>
			<label class="control-label">角色编码:</label>
			<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
                 <p class="form-control">${role.roleNo}</p>
	        </c:if>
	        <c:if test="${role.authMode=='edit'}">
			    <form:input path="roleNo"  maxlength="50" class="required"/>
			</c:if>
	    </div>
	    <div class="form-group suspend-cardForm  form-inline-align">
	   		<label class="control-label">角色起始时间：</label>
	   		<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
                 <p class="form-control">${role.beginDate}</p>
	        </c:if>
	         <c:if test="${role.authMode=='edit'}">
				<input name="beginDate" type="text" readonly="readonly"
				class="required"
				maxlength = "50"
				value="<fmt:formatDate value="${role.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</c:if>
		  </div>
		  <div class="form-group suspend-cardForm  form-inline-align">
		   		<label class="control-label">角色结束时间：</label>
		   		<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
                 <p class="form-control">${role.endDate}</p>
	            </c:if>
	            <c:if test="${role.authMode=='edit'}">
					<input name="endDate" type="text" readonly="readonly"
					class="required"
					maxlength = "50"
					value="<fmt:formatDate value="${role.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
				</c:if>
		   </div>
	    </div>
		<div class="toolbar-Onlybtn">
			<c:if test="${(role.sysData eq fns:getDictValue('是', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('是', 'yes_no', '1'))}">
				 <c:if test="${role.authMode=='edit'}">
					<shiro:hasPermission name="sys:role:edit">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</shiro:hasPermission>
                </c:if>
			</c:if>
			<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
		</div>
	</form:form>
	</div>
</body>
</html>
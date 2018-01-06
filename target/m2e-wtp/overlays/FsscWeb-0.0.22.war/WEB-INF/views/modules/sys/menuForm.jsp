\<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	/* 	$(document).ready(function() {
			$("#name").focus();
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
		});
	 */

		 $(document).ready(function() {
		    	$("#submitForm").click(function(){
		    		if(!$("#inputForm").valid()){
						return;
					}
		    		$.ajax({
			   			url:'${ctx}'+"/sys/menu/save",
			   			data:$("#inputForm").serialize(),
			   			dataType:"json",
			   			type:"post",
			   			success:function(data){
			   			 if (data && data == "success") {
							/* window.location=ctx + '/sys/employee/list'; */
							$.jBox.prompt('保存成功。', '提示', 'info', {
								closed : function() {
									$.jBox.tip("正在处理，请稍候....", "loading");
									location.href = ctx + '/sys/menu/list';
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
	<form:form id="inputForm" modelAttribute="menu" action="${ctx}/sys/menu/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">上级菜单:</label>
			<div class="controls">
				 <c:if test="${menu.authMode == 'edit'}">
	                   <sys:treeselect id="menu" name="parent.id" value="${menu.parent.id}" labelName="parent.name" labelValue="${menu.parent.name}"
						title="菜单" url="/sys/menu/treeData" extId="${menu.id}" cssClass="required"/>
				 </c:if>
				 <c:if test="${menu.authMode == 'view'||menu.authMode==''}">
				   <p class="form-control">${menu.parent.name}</p>
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">昵称:</label>
			<div class="controls">
			
			    <c:if test="${menu.authMode == 'edit'}">
					<form:input path="nickname" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
				   <p class="form-control">${menu.nickname}</p>
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称:</label>
			<div class="controls">
			
			    <c:if test="${menu.authMode == 'edit'}">
					<form:input path="name" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
				   <p class="form-control">${menu.name}</p>
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">链接:</label>
			<div class="controls">
			    <c:if test="${menu.authMode == 'edit'}">
					<form:input path="href" htmlEscape="false" maxlength="2000" class="input-xxlarge"/>
					<span class="help-inline">点击菜单跳转的页面</span>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
				   <p class="form-control">${menu.href}</p>
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目标:</label>
			<div class="controls">
			    <c:if test="${menu.authMode == 'edit'}">
					<form:input path="target" htmlEscape="false" maxlength="10" class="input-small"/>
					<span class="help-inline">链接地址打开的目标窗口，默认：mainFrame</span>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
				   <p class="form-control">${menu.target}</p>
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图标:</label>
			<div class="controls">
			    <c:if test="${menu.authMode == 'edit'}">
				    <sys:iconselect id="icon" name="icon" value="${menu.icon}"/>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
				    <%--  <p class="form-control">${menu.icon}</p> --%>
				    <sys:iconselect id="icon" name="icon" value="${menu.icon}" />
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
			    <c:if test="${menu.authMode == 'edit'}">
					<form:input path="sort" htmlEscape="false" maxlength="50" class="required digits input-small"/>
					<span class="help-inline">排列顺序，升序。</span>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
				   <p class="form-control">${menu.sort}</p>
				</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可见:</label>
			<div class="controls">
			    <c:if test="${menu.authMode == 'edit'}">
					<form:radiobuttons path="isShow" items="${fns:getDictList('show_hide')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
					<span class="help-inline">该菜单或操作是否显示到系统菜单中</span>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
			       <p class="form-control">${menu.isShow eq '1'?'显示':'隐藏'}</p>
			    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">权限标识:</label>
			<div class="controls">
			   <c:if test="${menu.authMode == 'edit'}">
					<form:input path="permission" htmlEscape="false" maxlength="100" class="input-xxlarge"/>
					<span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span>
				</c:if>
				<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
			       <p class="form-control">${menu.permission}</p>
			    </c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
			  <c:if test="${menu.authMode == 'edit'}">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xxlarge"/>
			  </c:if>
			</div>
			<c:if test="${menu.authMode == 'view'||menu.authMode==''}">
			   <p class="form-control">${menu.remarks}</p>
			</c:if>
		</div>
		
		    <c:if test="${formType!='view'}">
				<div class="toolbar-Onlybtn">
					<c:if test="${menu.authMode=='edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</c:if>
					<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
		    </c:if>
	</form:form>
</body>
</html>
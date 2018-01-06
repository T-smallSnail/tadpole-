<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>区域管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
$(document).ready(function() {
	$("#submitForm").click(function(){
		if(!$("#inputForm").valid()){
			return;
		}
		$.ajax({
   			url:'${ctx}'+"/sys/area/save",
   			data:$("#inputForm").serialize(),
   			dataType:"json",
   			type:"post",
   			success:function(data){
   			 if (data && data == "success") {
				/* window.location=ctx + '/sys/employee/list'; */
				$.jBox.prompt('保存成功。', '提示', 'info', {
					closed : function() {
						$.jBox.tip("正在处理，请稍候....", "loading");
						location.href = ctx + '/sys/area/list';
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
	<div class="layout-content">
		<form:form id="inputForm" modelAttribute="area"
			action="${ctx}/sys/area/save" method="post" class="form-horizontal">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<div class="suspend-card">
			
			<div class="form-group suspend-cardForm">
				<label class="control-label">上级区域：</label>
				<div class="controls">
					<c:if test="${area.authMode=='view'  ||  area.authMode== ''}">
	                        <p class="form-control">${area.parent.name}</p>
                    </c:if>
                    <c:if test="${area.authMode=='edit'}">
                 		<sys:treeselect id="area" name="parent.id"
						value="${area.parent.id}" labelName="parent.name"
						labelValue="${area.parent.name}" title="区域"
						url="/sys/area/treeData" extId="${area.id}" cssClass=""
						allowClear="true" />
                    </c:if>
				</div>
			</div>
			<div class="form-group suspend-cardForm">
				<font color="red">*</font><label class="control-label">区域名称：</label>
				<div class="controls">
					<c:if test="${area.authMode=='view'  ||  area.authMode== ''}">
	                        <p class="form-control">${area.name}</p>
                    </c:if>
                    <c:if test="${area.authMode=='edit'}">
	                        <form:input type="text" class="form-control required " path="name" />
                    </c:if>
				</div>
			</div>
			<div class="form-group suspend-cardForm">
				<font color="red">*</font><label class="control-label">区域编码：</label>
				<div class="controls">
					<c:if test="${area.authMode=='view'  ||  area.authMode== ''}">
	                        <p class="form-control">${area.code}</p>
                    </c:if>
                    <c:if test="${area.authMode=='edit'}">
	                        <form:input type="text" class="form-control required" path="code" />
                    </c:if>
				</div>
			</div>
			<div class="form-group suspend-cardForm">
				<label class="control-label">区域类型：</label>
				<div class="controls">
					<c:if test="${area.authMode=='view'  ||  area.authMode== ''}">
	                        <p class="form-control">${fns:getDictLabel(area.type, 'sys_area_type', '')}</p>
                    </c:if>
                    <c:if test="${area.authMode=='edit'}">
                  			<form:select path="type" class="input-medium">
									<form:options items="${fns:getDictList('sys_area_type')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
                    </c:if>
				</div>
			</div>
			<div class="form-group suspend-cardForm">
				<label class="control-label">备注：</label>
				<div class="controls">
					<c:if test="${area.authMode=='view'  ||  area.authMode== ''}">
                        	<p class="form-control">${area.remarks}</p>
                    </c:if>
                    <c:if test="${area.authMode=='edit'}">
                       	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
                    </c:if>
				</div>
		</div>
						<div class="toolbar-Onlybtn">
						<c:if test="${area.authMode == 'edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
						</c:if>
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
						</div>
		</div>
		</form:form>
	</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>行业信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	  $(document).ready(function() {
	    	$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/sys/industry/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/sys/industry/list';
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
		<form:form id="inputForm" modelAttribute="industry"
			action="${ctx}/sys/industry/save" method="post" class="form-inline"
			role="form">
			<form:hidden path="id" />
			<sys:message content="${message}" />
					<div class="suspend-card">
						<div class="form-group suspend-cardForm">
						   <font color="red">*</font> 
							<label class="control-label">行业编号：</label>
							 <c:if test="${industry.authMode=='view'  ||  industry.authMode== ''}">
	                        	<p class="form-control">${industry.industryNo}</p>
                   			 </c:if>
                   			 <c:choose>  
                   			 <c:when test="${(industry.authMode=='edit' ||  industry.authMode== '') &&(industry.id==null ||  industry.id== '')}">
                   			 	<form:input type="text" class="form-control required"  path="industryNo" />
                   			 </c:when>
                   			 <c:otherwise>
              			 		<form:input type="text" class="form-control required"  path="industryNo"  readonly ="true"/>
                   			 </c:otherwise>
                   			 </c:choose>
						</div>
						<div class="form-group suspend-cardForm">
						   <font color="red">*</font> 
							<label class="control-label">行业名称：</label>
							 <c:if test="${industry.authMode=='view'  ||  industry.authMode== ''}">
	                        	<p class="form-control">${industry.industryName}</p>
                   			 </c:if>
                			 <c:if test="${industry.authMode=='edit'}">
	                        	<form:input type="text" class="form-control required"    path="industryName" />
                   			 </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<label class="control-label">上级行业编号：</label>
                   			<c:if test="${industry.authMode=='view'  ||  industry.authMode== ''}">
	                        	<p class="form-control">${industry.pindustryNo}</p>
		                    </c:if>
		                   <c:if test="${industry.authMode=='edit'}">
	                        	<form:input type="text" class="form-control" path="pindustryNo" />
                   			 </c:if>
						</div>
						
						<div class="form-group suspend-cardForm">
							<label class="control-label">类型：</label>
		 						<c:if test="${industry.authMode=='view'  ||  industry.authMode== ''}">
	                        	<p class="form-control">${industry.type}</p>
                   			 </c:if>
                			 <c:if test="${industry.authMode=='edit'}">
	                        	<form:input type="text" class="form-control" path="type" />
                   			 </c:if>
						</div>
						<div class="form-group form-inline-align" >
							<label class="control-label">备注：</label>
							<c:if test="${industry.authMode=='view'  ||  industry.authMode== ''}">
                        		<p class="form-control">${industry.remarks}</p>
                    		</c:if>
                    		<c:if test="${industry.authMode=='edit'}">
                       			<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
                    		</c:if>
								
						</div>
						<div class="toolbar-Onlybtn">
						<c:if test="${industry.authMode == 'edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
						</c:if>
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
						</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>
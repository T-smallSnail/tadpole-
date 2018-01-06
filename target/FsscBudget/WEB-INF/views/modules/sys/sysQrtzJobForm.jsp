<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>任务调度管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(document).ready(function() {
	 	$("#submitForm").click(function(){
	 		var begDate = $("#begDate").val();
			var endDate = $("#endDate").val();
			if(begDate!="" && endDate!="" && endDate<=begDate){  
				alert("结束时间必须晚于开始时间")
		        return false;  
		    }  
	 		if(!$("#inputForm").valid()){
					return;
				}
	 		$.ajax({
		   			url:'${ctx}'+"/sys/sysQrtzJob/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/sys/sysQrtzJob/list';
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
		<form:form id="inputForm" modelAttribute="sysQrtzJob" action="${ctx}/sys/sysQrtzJob/save" method="post" class="form-inline">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>	
			<div class="suspend-card">	
				<div class="form-inline">
					<div class="form-group suspend-cardForm">
						<label class="control-label"><font color="red">*&nbsp;</font> 任务名称：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control">${sysQrtzJob.jobName}</p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       <form:input type="text"  path="jobName"  class="form-control required"/>
		                </c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label"><font color="red">*&nbsp;</font>任务描述：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control">${sysQrtzJob.jobDesc}</p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       <form:input type="text"  path="jobDesc"  class="form-control required"/>
		                </c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label"><font color="red">*&nbsp;</font>定时配置：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control">${sysQrtzJob.jobCron}</p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       <form:input type="text"  path="jobCron"  class="form-control required"/>
		                </c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label"><font color="red">*&nbsp;</font>执行任务实现类：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control">${sysQrtzJob.jobClass}</p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       <form:input type="text"  path="jobClass"  class="form-control required"/>
		                </c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label"><font color="red">*&nbsp;</font>执行任务方法：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control">${sysQrtzJob.jobMethod}</p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       <form:input type="text"  path="jobMethod"  class="form-control required"/>
		                </c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">执行参数：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control">${sysQrtzJob.executorParam}</p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       <form:input type="text"  path="executorParam" class="form-control"/>
		                </c:if>
					</div>
				</div>
				
				<div class="form-inline">
					<div class="form-group suspend-cardForm">
						<label class="control-label"><font color="red">*&nbsp;</font>任务开始日期：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p  class="form-control"><fmt:formatDate value="${sysQrtzJob.begDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                     <input name="begDate" id="begDate" type="text" readonly="readonly" maxlength="20" class="form-control icon-sameAttr16 defined-calendar"
							value="<fmt:formatDate value="${sysQrtzJob.begDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
		                </c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">任务结束日期：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control"><fmt:formatDate value="${sysQrtzJob.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                   <input name="endDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="form-control icon-sameAttr16 defined-calendar"
							value="<fmt:formatDate value="${sysQrtzJob.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
		                </c:if>	
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">任务状态：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                        <p class="form-control">${fns:getDictLabel(sysQrtzJob.jobStatus, 'job_status', '')}</p>
	                    </c:if>
	                    <c:if test="${sysQrtzJob.authMode=='edit'}">
		                        	<form:select path="jobStatus" class="form-control required">
								<form:options items="${fns:getDictList('job_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select> 
	                    </c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">报警邮件[逗号分隔]：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control">${sysQrtzJob.alarmEmail}</p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                      	<form:input path="alarmEmail" htmlEscape="false" maxlength="200" class="form-control"/>
		                </c:if>
					</div>
				<%-- 	<div class="form-group suspend-cardForm">
						<label class="control-label">更新时间：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                       <p class="form-control"><fmt:formatDate value="${sysQrtzJob.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		                </c:if>
		                <c:if test="${sysQrtzJob.authMode=='edit'}">
		                 	<input name="updatedate" type="text" readonly="readonly" maxlength="20" class="form-control icon-sameAttr16 defined-calendar"
							value="<fmt:formatDate value="${sysQrtzJob.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
		                </c:if>	
					</div> --%>
					<div class="form-group suspend-cardForm">
						<label class="control-label"><font color="red">*&nbsp;</font>任务组：</label>
						 <c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                        <p class="form-control">${sysQrtzJob.jobGroup}</p>
		                 </c:if>
		                 <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       	<form:input type="text"  path="jobGroup" maxlength="200"  class="form-control required"/>
		                 </c:if>
		              
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">备注：</label>
						<c:if test="${sysQrtzJob.authMode=='view' && sysQrtzJob.authMode!=''}">
		                        	<p class="form-control">${sysQrtzJob.remarks}</p>
		                    </c:if>
		                    <c:if test="${sysQrtzJob.authMode=='edit'}">
		                       	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
		                 </c:if>
					</div>
					
				</div>
			</div>
				<div class="toolbar-Onlybtn">
							<c:if test="${sysQrtzJob.authMode == 'edit'}">
							<button type="button" class="btn btn-main " id="submitForm">保存</button>
							</c:if>
							<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
		</form:form>
	</div>
</body>
</html>
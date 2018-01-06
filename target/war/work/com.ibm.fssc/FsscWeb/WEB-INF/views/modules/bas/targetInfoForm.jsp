<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>指标信息管理</title>
<meta name="decorator" content="default" />


<script type="text/javascript">
			
		   $(document).ready(function() {
		    	$("#submitForm").click(function(){
		    		if(!$("#inputForm").valid()){
						return;
					}
		    		$.ajax({
			   			url:'${ctx}'+"/bas/targetInfo/save",
			   			data:$("#inputForm").serialize(),
			   			dataType:"json",
			   			type:"post",
			   			success:function(data){
			   			 if (data && data == "success") {
							/* window.location=ctx + '/sys/employee/list'; */
							$.jBox.prompt('保存成功。', '提示', 'info', {
								closed : function() {
									$.jBox.tip("正在处理，请稍候....", "loading");
									location.href = ctx + '/bas/targetInfo/list';
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

		<form:form id="inputForm" modelAttribute="targetInfo"
			action="${ctx}/bas/targetInfo/save" method="post" class="form-inline"
			role="form">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<div class="suspend-card" ">
					<div id="collapseTwo1" class="form-inline">
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">指标编码：</label>
							<c:if test="${targetInfo.authMode =='edit'}">
							<form:input path="targetNo" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode =='view'||targetInfo.authMode ==''}">
		                        <p class="form-control">${targetInfo.targetNo}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">指标类型：</label>
							<c:if test="${targetInfo.authMode =='edit'}">
							<form:select path="targetType" class="form-control required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('zblx')}" itemLabel="label"
									itemValue="value" htmlEscape="false" />
							</form:select>
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.targetType}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">指标名称：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:input path="targetName" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.targetName}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">指标单位：</label>
							<c:if test="${targetInfo.authMode =='edit'}">
							<form:input path="unit" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.unit}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">小数位：</label>
							<c:if test="${targetInfo.authMode =='edit'}">
							<form:input path="decimals" htmlEscape="false" maxlength="50"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.decimals}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">责任部门：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:input path="dutyCompany" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.dutyCompany}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">贡献部门：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:input path="shareCompany" htmlEscape="false"
								maxlength="200" class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.shareCompany}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">指标来源：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:input path="source" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.source}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">报表编码：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:input path="reportno" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.reportno}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">报表名称：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:input path="reportname" htmlEscape="false" maxlength="200"
								class="form-control required" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.reportname}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<label class="control-label">指标示意：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:input path="sign" htmlEscape="false" maxlength="200"
								class="form-control" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode == ''}">
		                        <p class="form-control">${targetInfo.sign}</p>
		                    </c:if>
						</div>
				<%-- 		<div class="form-group">
							<label class="control-label">排序：</label>
							<form:input path="sort" htmlEscape="false" maxlength="50"
								class="form-control" />
							
						</div>
 --%>

						<div class="form-group suspend-cardForm">
							<label class="control-label">是否电厂填报：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:select path="isPowerplant" class="form-control">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('yes_no')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode==''}">
		                        <p class="form-control">${fns:getDictLabel(targetInfo.isPowerplant, 'yes_no', '')}</p>
		                    </c:if>
						</div>

						<div class="form-group suspend-cardForm">
							<label class="control-label">是否机组填报：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:select path="isCrew" class="form-control">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('yes_no')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode==''}">
		                        <p class="form-control">${fns:getDictLabel(targetInfo.isCrew, 'yes_no', '')}</p>
		                    </c:if>
						</div>

						<div class="form-group suspend-cardForm">
							<label class="control-label">是否必需：</label>
                            <c:if test="${targetInfo.authMode == 'edit'}">
								<form:select path="isMust" class="form-control">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('yes_no')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode==''}">
		                        <p class="form-control">${fns:getDictLabel(targetInfo.isMust, 'yes_no', '')}</p>
		                    </c:if>
						</div>

						<div class="form-group suspend-cardForm">
							<font color="red">*</font> <label class="control-label">是否使用：</label>
							 <c:if test="${targetInfo.authMode == 'edit'}">
							<form:select path="isUsed" class="form-control required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('yes_no')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode==''}">
		                        <p class="form-control">${fns:getDictLabel(targetInfo.isUsed, 'yes_no', '')}</p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font><label class="control-label">开始日期：</label> 
							 <c:if test="${targetInfo.authMode == 'edit'}">
							     <input
									name="beginDate" type="text" readonly="readonly" maxlength="20"
									class="form-control icon-sameAttr16 defined-calendar required"
									value="<fmt:formatDate value="${targetInfo.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode=='' }">
		                        <p class="form-control"><fmt:formatDate value="${targetInfo.beginDate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm">
							<font color="red">*</font><label class="control-label">结束日期：</label> 
							<c:if test="${targetInfo.authMode == 'edit'}">
							<input name="endDate"
								type="text" readonly="readonly" maxlength="20"
								class="form-control icon-sameAttr16 defined-calendar required"
								value="<fmt:formatDate value="${targetInfo.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode==''}">
		                        <p class="form-control"><fmt:formatDate value="${targetInfo.endDate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		                    </c:if>
						</div>
						<div class="form-group suspend-cardForm"></div>
						<div class="form-group suspend-cardForm"></div>
						<div class="form-group form-inline-align">
							<label class="control-label">备注：</label>
							<c:if test="${targetInfo.authMode == 'edit'}">
							<form:textarea path="remark" htmlEscape="false" rows="3"
								maxlength="4000" class="form-control" />
							</c:if>
							<c:if test="${targetInfo.authMode == 'view'||targetInfo.authMode==''}">
		                        <p class="form-control">${targetInfo.remark}</p>
		                    </c:if>
						</div>
					</div>
			</div>
            <c:if test="${formType!='view'}">
				<div class="toolbar-Onlybtn">
					<c:if test="${targetInfo.authMode=='edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</c:if>
					<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
		    </c:if>
		</form:form>
	</div>
	
</body>
</html>
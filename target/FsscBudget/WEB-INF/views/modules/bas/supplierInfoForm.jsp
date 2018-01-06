<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>供应商管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
	 	$("#submitForm").click(function(){
	 		if(!$("#inputForm").valid()){
					return;
				}
	 		$.ajax({
		   			url:'${ctx}'+"/bas/supplierInfo/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/bas/supplierInfo/list';
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
		<form:form id="inputForm" modelAttribute="supplierInfo"
			action="${ctx}/bas/supplierInfo/save" method="post"
			class="form-inline" role="form">
			<form:hidden path="id" />
			<sys:message content="${message}" />
			<div class="suspend-title">
					<span>基本信息</span> <a data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo1">
					</a>
			</div>
			  <div class="suspend-card">
			 	<div class="form-inline">
					<div class="form-group suspend-cardForm" >
						<font color="red">*</font> <label class="control-label">供应商编码：</label>
						 <c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.supplierNo}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="supplierNo" htmlEscape="false" maxlength="200"
								class="form-control  required" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						
						<font color="red">*</font> <label class="control-label">供应商名称：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.supplierName}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="supplierName" htmlEscape="false" maxlength="200"
								class="form-control  required" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">供应商英文名称：</label>
						 <c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.supplierEname}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="supplierEname" htmlEscape="false"
								maxlength="200" class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">供应商简称：</label>
						 <c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.simpleName}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="simpleName" htmlEscape="false" maxlength="200"
								class="form-control" />
						</c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<font color="red">*</font> <label class="control-label">供应商类型：</label>
						 <c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(supplierInfo.supplierType,'supplier_type','')}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:select path="supplierType" class="form-control required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('supplier_type')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<font color="red">*</font> <label class="control-label">状态：</label>
						 <c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(supplierInfo.status,'status','')}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:select path="status" class="form-control required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('status')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>
					</div>
					
					<div class="form-group suspend-cardForm">
						<label class="control-label">注册地址：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.registerAdress}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="registerAdress" htmlEscape="false"
								maxlength="200" class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">资质信息：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.qualifications}</p>
          				 </c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="qualifications" htmlEscape="false"
								maxlength="200" class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<font color="red">*</font><label class="control-label">默认语言：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(supplierInfo.language,'language','')}</p>
          				</c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:select path="language" class="form-control required">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('language')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">国家：</label>
						
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(supplierInfo.status,'status','')}</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:select path="national" class="form-control">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('country_arearegister')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">登记注册类型：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(supplierInfo.registerType,'regisier_type','')}</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:select path="registerType" class="form-control">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('regisier_type')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.registerMoney }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<label class="control-label">注册资金：</label>
							<form:input path="registerMoney" htmlEscape="false"
								maxlength="200" class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">注册资金币种：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(supplierInfo.registerMoneytype,'cur_type','')}</p>
          				</c:if>
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:select path="registerMoneytype" class="form-control">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('cur_type')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.businessLicenseno }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<label class="control-label">营业执照注册号：</label>
							<form:input path="businessLicenseno" htmlEscape="false"
								maxlength="200" class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">税务登记证：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.taxRegisterno }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="taxRegisterno" htmlEscape="false"
								maxlength="200" class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">公司法人名称：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.corporation }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="corporation" htmlEscape="false" maxlength="200"
								class="form-control" />
						</c:if>
					</div>
						 <div class="form-group suspend-cardForm">
           				 <label class="control-label">行业类型：</label>
           				 	<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.industryType}</p>
          					</c:if>
						
							<c:if test="${supplierInfo.authMode=='edit'}">
              					<sys:treeselect id="supplierInfo" name=""
               					value="${supplierInfo.industryType}" labelName="industryType"
               					 labelValue="${supplierInfo.industryType}" title="行业类型"
                				 url="/sys/industry/treeData"  cssClass="" allowClear="true" />
                			</c:if>
							</div>
					<!-- </div> -->

					<div class="form-group suspend-cardForm">
						<label class="control-label">机构类型：</label>
						
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${fns:getDictLabel(supplierInfo.orgType,'jglx','')}</p>
          				</c:if>
						
						<c:if test="${supplierInfo.authMode=='edit'}">
							<form:select path="orgType" class="form-control">
								<form:option value="" label="" />
								<form:options items="${fns:getDictList('jglx')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</c:if>
						
					</div>
					<div class="form-group suspend-cardForm">
						<font color="red">*</font><label class="control-label">机构注册时间：</label> 
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          					<p class="form-control"><fmt:formatDate value="${supplierInfo.orgRegisterdate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
          				</c:if>
						<c:if test="${supplierInfo.authMode=='edit'}">
							<input
							name="orgRegisterdate" type="text" readonly="readonly"
							maxlength="20"
							class="form-control icon-sameAttr16 defined-calendar required"
							value="<fmt:formatDate value="${supplierInfo.orgRegisterdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
						</c:if>
					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">通讯地址：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.telAdress }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="telAdress" htmlEscape="false" maxlength="200"
								class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">企业电话：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.orcTel }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="orcTel" htmlEscape="false" maxlength="50"
								class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">企业邮箱：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.orcEmail }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="orcEmail" htmlEscape="false" maxlength="50"
								class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
						<label class="control-label">企业传真：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.orcFax }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
						<form:input path="orcFax" htmlEscape="false" maxlength="50"
							class="form-control" />
						</c:if>

					</div>
					<div class="form-group suspend-cardForm">
					
						<label class="control-label">供应商旧版本：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.oldSupplierNo }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="oldSupplierNo" htmlEscape="false" maxlength="50"
								class="form-control" />
						</c:if>

					</div>
					
					<div class="form-group suspend-cardForm">
						<font color="red">*</font><label class="control-label">社会信用代码证：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.barNo }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="barNo" htmlEscape="false" maxlength="50"
								class="form-control required" />
						</c:if>
					</div>
					<!--新加字段 组织机构编码  -->
					<div class="form-group suspend-cardForm">
						<font color="red">*</font><label class="control-label">组织机构编码：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
          				 		<p class="form-control">${supplierInfo.orgNo }</p>
          				</c:if>
          				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:input path="orgNo" htmlEscape="false" maxlength="50"
								class="form-control required" />
						</c:if>
					</div>
						
					<%-- <div class="form-group suspend-cardForm">
						<label class="control-label">备注：</label>
						<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
         				 		<p class="form-control" style="width: 100%;float: none;display: inline;">${supplierInfo.remarks }</p>
         				</c:if>
         				
          				<c:if test="${supplierInfo.authMode=='edit'}">
							<form:textarea path="remarks" htmlEscape="false" rows="3"
								maxlength="4000" class="form-control" />
						</c:if>
					</div> --%>
					
					<div class="form-group form-inline-align suspend-cardForm" >
					<label class="control-label">备注：</label>
					<c:if test="${supplierInfo.authMode=='view' || supplierInfo.authMode==''}">
                        	<p class="form-control" style="width: 100%;float: none;display: inline;">${supplierInfo.remarks }</p>
                    </c:if>
                    <c:if test="${supplierInfo.authMode=='edit'}">
                       	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
                    </c:if>
				</div>
					
					
				</div>
		          
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
								<th>帐号</th>
								<th>帐户名称</th>
								<th>开户单位</th>
								<th>开户行名称</th>
								<th>帐户状态</th>
								<th>开户日期</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bankAccountList}" var="bankAccount">
								<tr>
									<td>${bankAccount.accountNo}</td>
									<td>${bankAccount.accountName}</td>
									<td>${bankAccount.accountUnit}</td>
									<td>${bankAccount.bankName}</td>
									<td>${bankAccount.accountStatus}</td>
									<td><fmt:formatDate value="${bankAccount.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			<c:if test="${formType!='view'}">
				<div class="toolbar-Onlybtn">
					<c:if test="${supplierInfo.authMode=='edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</c:if>
					<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
				</div>
			</c:if>
		</form:form>
	</div>
</body>
</html>
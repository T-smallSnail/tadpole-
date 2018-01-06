<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织架构管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	   $(document).ready(function() {
	    	$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/sys/org/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/sys/org/listDown';
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
	    	
	    	$("#orgN").blur(function(){
	    		var orgNo = $(this).val();
	    		if(orgNo==null||orgNo==""||orgNo==undefined){
	    			return;
	    		}
	    		
	    		$.ajax({
	    			url:'${ctx}'+"/sys/org/findOrgNo",
	    			data:{orgNo:orgNo},
	    			dataType:"json",
	    			type:"post",
	    			success:function(data){
	    				
	    				if(data.orgNo!=null||data.orgNo!=""||data.orgNo!=undefined){
	    					$.jBox.prompt('组织编码已存在！', '提示', 'info', {
								closed : function() {}
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
	<form:form id="inputForm" modelAttribute="org" action="${ctx}/sys/org/save" method="post" class="form-inline">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="suspend-card">
			<div class="form-inline">
				<div class="form-group suspend-cardForm">
				    <font color="red">*</font> 
					<label class="control-label">组织编码：</label>
					 <c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.orgNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input id="orgNo" type="text"  class="form-control required" path="orgNo" placeholder=""/>
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
				    <font color="red">*</font> 
					<label class="control-label">组织名称：</label>
					 <c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.name}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="name" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
				    <font color="red">*</font> 
					<label class="control-label">组织英文名：</label>
					 <c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.orgEgnName}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="orgEgnName" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
				    <font color="red">*</font> 
					<label class="control-label">组织简称：</label>
				 	<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.simpleName}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="simpleName" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
				    <font color="red">*</font>
					<label class="control-label">所属行业：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${fns:getDictLabel(org.belongIndustry, 'belong_industry', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        	<form:select path="belongIndustry" class="form-control required">
	                        	<form:option value="" label=""/>
							<form:options items="${fns:getDictList('belong_industry')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select> 
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">企业性质：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${fns:getDictLabel(org.businessNature, 'business_nature', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        	<form:select path="businessNature" class="form-control required">
	                        	<form:option value="" label=""/>
							<form:options items="${fns:getDictList('business_nature')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select> 
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">企业状态：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${fns:getDictLabel(org.businessStatus, 'business_status', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        	<form:select path="businessStatus" class="form-control required">
	                        	<form:option value="" label=""/>
							<form:options items="${fns:getDictList('business_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select> 
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">登记注册类型：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${fns:getDictLabel(org.registerType, 'regisier_type', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        	<form:select path="registerType" class="form-control required">
	                        	<form:option value="" label=""/>
							<form:options items="${fns:getDictList('regisier_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select> 
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">本企业上市情况：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${fns:getDictLabel(org.marketStatus, 'market_status', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        	<form:select path="marketStatus" class="form-control required">
	                        	<form:option value="" label=""/>
							<form:options items="${fns:getDictList('market_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select> 
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">主营产业：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.mainProduct}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
                    <sys:treeselect id="mainProduct" name="" value="${org.mainProduct}" labelName="mainProduct" labelValue="${org.mainProduct}"
					title="菜单" url="/sys/dict/treeDataProduct?type=main_product"  cssClass="required"/>
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">上级组织编码：</label>
				 	<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.parentNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="parentNo" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">上级组织名称：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.parentName}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="parentName" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">国家地区：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${fns:getDictLabel(org.countryArearegister, 'country_arearegister', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                      <form:select path="countryArearegister" class="form-control required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('country_arearegister')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
                    </c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">注册地址：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.registerAdrss}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="registerAdrss" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">经营地址：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.manageAdress}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="manageAdress" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">行政组织：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
	                        <p class="form-control">${org.adminManage}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text"  class="form-control required" path="adminManage" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">是否成本中心：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${fns:getDictLabel(org.isCost, 'yes_no', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
                   	<form:select path="isCost" class="form-control required">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">是否利润中心：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${fns:getDictLabel(org.isGain, 'yes_no', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
                       	<form:select path="isGain" class="form-control required">
                   	<form:option value="" label=""/>
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">组织机构类型 </label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${fns:getDictLabel(org.orgType, 'orgtype', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
               		<form:select path="orgType" class="form-control required">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('orgtype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<font color="red">*</font>
					<label class="control-label">组织机构状态：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${fns:getDictLabel(org.orgSts, 'org_sts', '')}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
   					<form:select path="orgSts" class="form-control required">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('org_sts')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">HR部门编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.HROrgNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="HROrgNo" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">核算组织编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.account}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="account" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">预算组织编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.budget}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="budget" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">财务组织编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.finance}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="finance" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">核算组织上级编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.accountPNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="accountPNo" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">预算组织上级编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.budgetPNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="budgetPNo" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">财务组织上级编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.financePNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="financePNo" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">上级成本中心编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.costPNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="costPNo" />
                    </c:if>
					
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">上级利润中心编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.gainPNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="gainPNo" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">法人代表：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.legalRepresentative}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="legalRepresentative" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">组织机构代码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.orgCode}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="orgCode" />
                    </c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">行政组织编码：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control">${org.comparAdminNo}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
	                        <form:input type="text" class="form-control" path="comparAdminNo" />
                    </c:if>
				</div>
				<div class="form-group form-inline-align" >
					<label class="control-label">备注：</label>
					<c:if test="${org.authMode=='view'  ||  org.authMode==''}">
                        	<p class="form-control" style="width: 100%;float: none;display: inline;">${org.remarks}</p>
                    </c:if>
                    <c:if test="${org.authMode=='edit'}">
                       	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="1000" class="form-control"/>
                    </c:if>
				</div>
			</div>
		</div>
				
					<div class="toolbar-Onlybtn">
						<c:if test="${org.authMode == 'edit'}">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
						</c:if>
						<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
					</div>
		</form:form>
	</div>
</body>
</html>
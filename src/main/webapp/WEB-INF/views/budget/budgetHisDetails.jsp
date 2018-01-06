﻿
<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="typeChange" class="com.budget.common.util.TypeChange" />
<html>
<head>
	<meta charset="UTF-8">
    <title>表单样式</title>
    <script src="<%=path%>/static/js/FormValidate.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=path%>/static/fsscAccount/fsscAccountIndex.css"/>
    <%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<script type="text/javascript">

$(document).ready(function(){
	
	

});

</script>

<body>
	<div style="width:98%;margin:4px auto;" class="layout-content" >
		<form id="inputForm"  action="${ctx}/bas/baseBudget" method="post" class="form-inline">
		<div class="suspend-title">预算变动详情</div>
		    
		    <div class="suspend-card">
		    
		    		<div class="form-group">
		                <label for="itemName">单据ID</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.claimId }" type="text" class="form-control required digits" />
		               <%--  <form:input type="text" class="form-control required digits" path="attachNumber"/> --%>
		            </div>
		            <div class="form-group">
		                <label for="itemName">单据编号</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.claimNo }" type="text" class="form-control required digits" />
		            </div>
		    
		    		<div class="form-group">
		                <label for="itemName">单据行ID</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.claimLineId }" type="text" class="form-control required digits" />
		               <%--  <form:input type="text" class="form-control required digits" path="attachNumber"/> --%>
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算主键ID</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.budgetId }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">操作类型</label>
		                <c:forEach var="type" items="${opTypelist}">						      
	                		<c:if test="${lmtBudgetHis.opType==type.code }">
		               			 <input readonly="readonly" id="type" value="${type.name}" type="text" class="form-control required digits" />
		          	 		</c:if>
		                </c:forEach>
		                
		            </div>
		            
		            <%-- <div class="form-group">
		                <label for="itemName">预算编码</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.budgetNo }" type="text" class="form-control required digits" />
		            </div> --%>
		            <div class="form-group">
		                <label for="itemName">预算名称</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.budgetName }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算科目编码</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.budgetSubjectCode }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算实际发生日期</label>
		                <input readonly="readonly"  value="<fmt:formatDate value="${lmtBudgetHis.budgetReallyDate}" pattern="yyyy-MM-dd"/>" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">来源系统编码</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.systemCode }" type="text" class="form-control required digits" />
		            </div>
		        	<div class="form-group">
		                <label for="itemName">来源系统名称</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.systemName }" type="text" class="form-control required digits" />
		               <%-- <form:input type="text" class="form-control required digits" path="attachNumber"/>
		                --%>
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">预算操作人ID</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.userId }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算操作人名称</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.userName }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">预算操作人所在公司ID</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.comId }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算科目所在公司名称</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.comName }" type="text" class="form-control required digits" />
		            </div>
		            <%-- 
		            <div class="form-group">
		                <label for="itemName">预算操作人所在部门ID</label>
		                <input readonly="readonly"  value="${lmtBudgetHis.deptId }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算操作人所在部门名称</label>
		                <input readonly="readonly"   type="text" value="${lmtBudgetHis.deptName }" class="form-control required digits" />
		            </div> --%>
		            
		            <div class="form-group">
		                <label for="itemName">预算修改时间</label>
		                <input readonly="readonly"  value="<fmt:formatDate value="${lmtBudgetHis.submitDate}" pattern="yyyy-MM-dd"/>" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">变动金额</label>
		                <input readonly="readonly"  value="${typeChange.longToString(lmtBudgetHis.changeAmount) }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算金额</label>
		                <input readonly="readonly"  value="${typeChange.longToString(lmtBudgetHis.budgetAmount) }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算已完成金额</label>
		                <input readonly="readonly"  value="${typeChange.longToString(lmtBudgetHis.occupiedAmount) }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算冻结金额</label>
		                <input readonly="readonly"  value="${typeChange.longToString(lmtBudgetHis.blockedAmount) }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算余额</label>
		                <input readonly="readonly"  value="${typeChange.longToString(lmtBudgetHis.budgetBalance) }" type="text" class="form-control required digits" />
		            </div>
		            
					<div class="btnline">
			            <div class="form-group">
			            </div>
			            <div class="form-group">
			               <input id="btnCancel" style="cursor:pointer" class="btn btn-main" type="button" value="返 回" onclick="history.go(-1)"/> 
			            </div>
		            </div>

		          </div>
		          
		          
		
		   </form>
		   
		   
		   
		   
  	 </div>
   	 <!-- 查询条件结束 -->
 
</body>

</html>


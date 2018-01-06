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
<title>选择事前申请编号</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<script src="<%=path%>/static/js/FormValidate.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="<%=path%>/static/fsscAccount/fsscAccountIndex.css" />
</head>


<body>
	<div style="width:98%;margin:4px auto;" class="layout-content" >
		<form id="inputForm"  action="${ctx}/bas/baseBudget" method="post" class="form-inline">
		<div class="suspend-title">预算详情</div>
		    
		    <div class="suspend-card">
		    
		    		<div class="form-group">
		                <label for="itemName">预算责任公司ID</label>
		                <input readonly="readonly" name="budgetName" value="${budget.compId }" type="text" class="form-control required digits" />
		               <%--  <form:input type="text" class="form-control required digits" path="attachNumber"/> --%>
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算责任公司名称</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.compName }" type="text" class="form-control required digits" />
		            </div>
		    
		    		<div class="form-group">
		                <label for="itemName">预算责任部门ID</label>
		                <input readonly="readonly" name="budgetName" value="${budget.budgetDeptId }" type="text" class="form-control required digits" />
		               <%--  <form:input type="text" class="form-control required digits" path="attachNumber"/> --%>
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算责任部门名称</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetDeptName }" type="text" class="form-control required digits" />
		            </div>
		            
		            <%-- <div class="form-group">
		                <label for="itemName">预算使用系统ID</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetSysId }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算使用系统</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetSysName }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算描述</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetDesc }" type="text" class="form-control required digits" />
		            </div> --%>
		            
		            <%-- <div class="form-group">
		                <label for="itemName">是否公开</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.isPublic }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">预算编码</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetNo }" type="text" class="form-control required digits" />
		            </div>
		        	<div class="form-group">
		                <label for="itemName">预算名称</label>
		                <input readonly="readonly" name="budgetName" value="${budget.budgetName }" type="text" class="form-control required digits" />
		                <form:input type="text" class="form-control required digits" path="attachNumber"/>
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">预算项目分类编码</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetTypeCode }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算项目分类名称</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetTypeName }" type="text" class="form-control required digits" />
		            </div> --%>
		            
		            <div class="form-group">
		                <label for="itemName">预算科目编码</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetSubjectCode }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算科目名称</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.budgetSubjectName }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">是否为部门预算</label>
		                <input readonly="readonly" name="budgetSubjectName" value="${budget.isDeptbudget eq 0?'否':'是'}" type="text" class="form-control required digits" />
		            </div>
		           <%--  <div class="form-group">
		                <label for="itemName">预算项目编码</label>
		                <input readonly="readonly" name="budgetDeptName" value="${budget.budgetProjectCode }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算项目名称</label>
		                <input readonly="readonly" name="budgetTypeName"  type="text" value="${budget.budgetProjectName }" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">排序号</label>
		                <input readonly="readonly" name="budgetDeptName" value="${budget.displayOrder }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">是否为父级预算</label>
		                <input readonly="readonly" name="budgetTypeName"  type="text" value="${budget.isParent }" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">父级预算</label>
		                <input readonly="readonly" name="budgetDeptName" value="${budget.parentBudgetId }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">父级预算名称</label>
		                <input readonly="readonly" name="budgetTypeName"  type="text" value="${budget.parentBudgetName }" class="form-control required digits" />
		            </div>
		             --%>
		            <div class="form-group">
		                <label for="itemName">预算金额</label>
		                <input readonly="readonly" name="budgetYear" value="${typeChange.longToString(budget.budgetAmount) }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算已完成金额</label>
		                <input readonly="readonly" name="budgetYear" value="${typeChange.longToString(budget.occupiedAmount) }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算冻结金额</label>
		                <input readonly="readonly" name="budgetYear" value="${typeChange.longToString(budget.blockedAmount) }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算余额</label>
		                <input readonly="readonly" name="budgetYear" value="${typeChange.longToString(budget.budgetBalance) }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">状态</label>
		                 <%-- <c:when test="${budget.status eq N}">
		               		 <input readonly="readonly" name="budgetYear" value="生效" type="text" class="form-control required digits" />
		           		</c:when>
		           		<c:otherwise>
		           			<input readonly="readonly" name="budgetYear" value="失效" type="text" class="form-control required digits" />
		           		</c:otherwise> --%>
		           		
		           		<input readonly="readonly" name="budgetYear" value="${budget.status eq 'N'?'生效':'失效' }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">预算年度</label>
		               
		                <input readonly="readonly" name="budgetYear" value="${budget.budgetYear }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算月份</label>
		                <input readonly="readonly" name="budgetYear" value="${budget.budgetMonth }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">预算开始生效日期</label>
		                <input readonly="readonly" name="budgetYear" value="<fmt:formatDate value="${budget.budgetValidPeriodStart}" pattern="yyyy-MM-dd"/>" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算结束生效日期</label>
		                <input readonly="readonly" name="budgetYear" value="<fmt:formatDate value="${budget.budgetValidPeriodEnd}" pattern="yyyy-MM-dd"/>"  type="text" class="form-control required digits" />
		                
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


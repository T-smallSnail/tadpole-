﻿
<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<jsp:useBean id="typeChange" class="com.budget.common.util.TypeChange" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>表单样式</title>
    <script src="<%=path%>/static/js/FormValidate.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=path%>/static/fsscAccount/fsscAccountIndex.css"/>
    <%@include file="/WEB-INF/views/include/head.jsp" %>

</head>
<body>
	<!-- 查询条件 -->
	<div style="width:98%;margin:4px auto;" class="layout-content" >
		<form id="inputForm"  action="${ctx}/bas/baseBudget" method="post" class="form-inline">
		<div class="suspend-title">查询条件</div>
		    
		    <div class="suspend-card">
		        	<div class="form-group">
		                <label for="itemName">预算名称</label>
		                <input name="budgetName" value="${searchForm.budgetName }" type="text" class="form-control required digits" />
		               <%--  <form:input type="text" class="form-control required digits" path="attachNumber"/> --%>
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算科目</label>
		                <input name="budgetSubjectName" value="${searchForm.budgetSubjectName }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算责任部门</label>
		                <input name="budgetDeptName" value="${searchForm.budgetDeptName }" type="text" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算项目类型</label>
		                <input name="budgetTypeName"  type="text" value="${searchForm.budgetTypeName }" class="form-control required digits" />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算年度</label>
		                <input name="budgetYear" value="${searchForm.budgetYear }" type="text" class="form-control required digits" />
		            </div>
		            
		            <div style="text-align:right;margin:0px auto;width:1100px;">
						<div class="btn-main-animateDiv">
							<div class="btn-main-animate" ></div>
							<button class='btn btn-main' id="search">查询</button>
						</div>
						<div class="btn-main-animateDiv">
							<div class="btn-main-animate" ></div>
							<button class='btn btn-main' id="clearAll">重置</button>
						</div>
					</div>
					
		          </div>
		          
		       
		        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		   </form>
  	 </div>
   	 <!-- 查询条件结束 -->
    
    <!-- 文件上传 -->
    <div style="width:98%;margin:10px auto;" class="layout-content">
    <div class="suspend-title">数据导入</div>
    	<form name="upload"  method="POST" id="importForm" action="${ctx}/bas/import" enctype="multipart/form-data" style="padding-left:0px;text-align:center;" onsubmit="loading('正在导入，请稍等...');">
			<div class="suspend-card">
			<div style="padding-top:10px;">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<th width="10%"><div align="center">列表导入</div></th>
						<th align="left" width="70%">
							<input id="uploadFile" type="file" id="templateExcel" name="file" class="" size="30"/>
							<input type="submit" name="submit3"  class='btn btn-main' value="Excel导入"/><br/>
							
						</th>
			            <th align="center" width="20%">																			
			            	<input class="btn btn-main" type="button" name="dtbutton" style="width:120px;" onclick="window.open('${ctx}/bas/import/template')" value="EXCEL模版下载">
						</th>
					</tr>
				</table>
			</div>
			</div>			
		</form>
    </div>
    
    
    <!-- 提示信息 -->
    <sys:message content="${message}"/>
    
    
    <!-- 查询结果 -->
    <div style="width:98%;margin:15px auto;">
    	<div class="suspend-title">数据列表</div>
    	
		      <!--  <div class="suspend-card ">  -->
		    	<div style="width:100%" >
		    	<!-- style="table-layout:fixed" -->
		    		<table class="table table-bordered table-striped table-hover" style="table-layout:fixed">
				      
				        <thead>
					        <tr>
					            <th>预算责任公司ID</th>
					            <th>预算责任部门</th>
					            <th>预算名称</th>
					            <!-- <th>预算科目</th>
					            <th>预算项目分类</th> -->
					            <th>预算金额</th>
					            <th>预算已完成金额</th>
					            <th>预算已冻结金额</th>
					            <th>预算金额</th>
					            <th width="60px">预算年度</th>
					            <th width="35px">月度</th>
					            <th >生效时间</th>
					            <th >失效时间</th>
					            <th width="45px">操作</th>
					            
					        </tr>
				        </thead>
				        <tbody>
					        <c:forEach items="${page.list}" var="budget" varStatus="status">
					            <tr>
					                <!-- style="WORD-WRAP: break-word" width="20" -->
					                <td style="word-wrap:break-word;">${budget.compId}</td>
					                <td style="text-overflow:ellipsis;white-space: nowrap;overflow: hidden;">${budget.budgetDeptName}</td>
					                <td style="text-overflow:ellipsis;white-space: nowrap;overflow: hidden;">${budget.budgetName}</td>
					                <%-- <td style="text-overflow:ellipsis;white-space: nowrap;overflow: hidden;">${budget.budgetSubjectName }</td>
					                <td style="text-overflow:ellipsis;white-space: nowrap;overflow: hidden;">${budget.budgetTypeName }</td> --%>
					                
					                <%--<td>
					                 <c:if test="${budget.budgetTypeCode eq 1 }">
					         		       任务预算
					                </c:if>
					                <c:if test="${budget.budgetTypeCode eq 2 }">
					         		       部门预算
					                </c:if>
					                </td>--%>
					                
					                <td style="word-wrap:break-word;">${typeChange.longToString(budget.budgetAmount)}</td>
					                <td style="word-wrap:break-word;">${typeChange.longToString(budget.occupiedAmount)}</td>
					                <td style="word-wrap:break-word;">${typeChange.longToString(budget.blockedAmount)}</td>
					                <td style="word-wrap:break-word;">${typeChange.longToString(budget.budgetBalance)}</td>
					                <td >${budget.budgetYear }</td>
					                <td >${budget.budgetMonth }</td>
					                <td ><fmt:formatDate value="${budget.budgetValidPeriodStart}" pattern="yyyy-MM-dd" /></td>
					                <td ><fmt:formatDate value="${budget.budgetValidPeriodEnd}" pattern="yyyy-MM-dd" /></td>
					                <td ><a href="${ctx}/bas/form?id=${budget.id}" <%-- onclick="openBeforeApply(${budget.id})" --%>>查看</a></td>
					            <input type="hidden" value="${budget.id}" />
					            </tr>
					        </c:forEach>
		       			 </tbody>
		   			 </table>
		   			  <div class="pagination">${page}</div>
		    	</div>
			<!-- </div> -->
    </div>
    
   
    
    
</body>

<script type="text/javascript">

	//弹出详情页
	function openBeforeApply(id){
	   //window.open("searchT0308form.jsp");
	   
	   window.open('${ctx}/bas/form?id='+id, 'newwindow', 'height=600%, width=1000%, top=130%, left=250%, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');   //该句写成一行代码
			//${ctx}/bas/form?id=${budget.id}
	}

	//清除所有表单数据	 	
		/* function clearAll(){ */
		$("#clearAll").click(function() {
		
		$(':input','#inputForm') 
        .not(':button, :submit, :reset, :hidden') 
        .val('') 
        .removeAttr('checked') 
        .removeAttr('selected');
		});
		
		
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			//$("#inputForm").attr("action","${ctx}/bas/baseBudget");
			$("#inputForm").submit();
	    	return false;
	    }


</script>

</html>


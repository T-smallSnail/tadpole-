﻿
<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
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
<body>
	<!-- 查询条件 -->
	<div style="width:98%;margin:4px auto;">
		<form id="inputForm"  action="${ctx}/budgetHis/list" method="post" class="form-inline">
			
			<div class="suspend-title">查询条件</div>
		    
		    <div class="suspend-card">
		       
		        	<%-- <div class="form-group">
		                <label for="itemName">预算名称</label>
		                <input name="budgetName" value="${searchForm.budgetName }" type="text" class="form-control " />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算编号</label>
		                <input name="budgetNo" value="${searchForm.budgetNo }" type="text" class="form-control " />
		            </div> 
		            <div class="form-group">
		                <label for="itemName">预算责任部门</label>
		                <input name="deptName" value="${searchForm.deptName }" type="text" class="form-control " />
		            </div>
		            
		            <div class="form-group">
		                <label for="itemName">预算操作人</label>
		                <input name="budgetYear" value="${searchForm.userName }" type="text" class="form-control " />
		            </div>
		            
		            --%>
		            
		            <div class="form-group">
		                <label for="itemName">单据编号</label>
		                <input  name="claimNo" value="${searchForm.claimNo }" type="text"   class="form-control"/>
		            </div>
		            <div class="form-group">
		            	<div class="dropdown">
			                <label for="itemName">操作状态</label>
							<%-- <select name="opType" id="opType" style="width:64.6%">
							  <option value="">请选择</option>
						      <c:forEach var="type" items="${opTypelist}">
						      <option value="${type.code}">${type.name}</option>
						      </c:forEach>
						    </select> --%>
						    <form:select path="searchForm.opType" class=" form-control icon-sameAttr16 defined-pulldown"  style="text-align:left;">
		                        <option value="">请选择</option>
		                        <form:options items="${opTypelist}" itemLabel="name" itemValue="code" htmlEscape="false"/>
		                    </form:select>
						</div>
		            </div>
		            <div class="form-group">
		                <label for="itemName">变动金额</label>
		                <input id="changeAmounts" name="changeAmounts" value="${searchForm.changeAmounts }" onkeyup="value=value.replace(/[^\d.]/g,'')" type="text" class="form-control " />
		            </div>
		            <div class="form-group">
		                <label for="itemName">预算实际发生日期</label>
		                <input id="budgetReallyDate" name="budgetReallyDate"  type="text"  maxlength="20" class="form-control icon-sameAttr16 defined-calendar required"
							   value="<fmt:formatDate value="${searchForm.budgetReallyDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true});"/>
		            </div>
		            
		           <%--  <div class="form-group">
		                <label for="itemName">来源系统</label>
		                <input name="systemName" value="${searchForm.systemName }" type="text" class="form-control " />
		            </div> --%>
		            
		            <div  class="form-group"></div>
		            <div  class="form-group">
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
    
    <!-- 查询结果 -->
    <div style="width:98%;margin:15px auto;">
    <div class="suspend-title">查询结果</div>
		    <div class="panel-defined">
		       
		    	<div>
		    		<table class="table table-bordered table-striped table-hover">
				        <thead>
					        <tr>
					           	<th>单据编码</th>
					           	<th>预算ID</th>
					            <!-- <th>预算编号</th> -->
					            <th>预算名称</th>
					            <!-- <th>公司</th> -->
					            <!-- <th>部门</th> -->
					            <th>预算操作状态</th>
					            <th>变动金额</th>
					            <th>预算金额</th>
					            <th>预算已完成金额</th>
					            <th>预算已冻结金额</th>
					            <th>预算余额</th>
					            <th>预算实际发生日期</th>
					            <!-- <th>来源系统名称</th> -->
					            <!-- <th>操作人</th> -->
					            <!-- <th>接口调用时间</th> -->
					            <th>操作</th>
					        </tr>
				        </thead>
				        <tbody>
					        <c:forEach items="${page.list}" var="budgetHis" varStatus="status">
					            <tr>
					                <td>${budgetHis.claimNo}</td>
					                <td>${budgetHis.claimLineId}</td>
					                <%-- <td>${budgetHis.budgetNo}</td> --%>
					                <td>${budgetHis.budgetName }</td>
					                <%-- <td>${budgetHis.comName}</td> --%>
					                <%-- <td>${budgetHis.deptName}</td>--%>
					                <td>
					                	<c:forEach var="type" items="${opTypelist}">						      
					                	<c:if test="${budgetHis.opType==type.code }">
						         		       ${type.name}
						                </c:if>
						                </c:forEach>
					                </td> 
					                <td>${typeChange.longToString(budgetHis.changeAmount)}</td>
					                <td>${typeChange.longToString(budgetHis.budgetAmount) }</td>
					                <td>${typeChange.longToString(budgetHis.occupiedAmount) }</td>
					                <td>${typeChange.longToString(budgetHis.blockedAmount) }</td>
					                <td>${typeChange.longToString(budgetHis.budgetBalance) }</td>
					                <td><fmt:formatDate value="${budgetHis.budgetReallyDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					                <%-- <td>${budgetHis.systemName }</td> --%>
					                <%-- <td>${budgetHis.userName }</td> --%>
					                <%-- <td><fmt:formatDate value="${budgetHis.submitDate}" pattern="yyyy-MM-dd" /></td> --%>
					           		<td><a href="${ctx}/budgetHis/form?id=${budgetHis.id}">详情</a></td>
					            </tr>
					        </c:forEach>
		       			 </tbody>
		   			 </table>
		   			  <div class="pagination">${page}</div>
		   			 
		    	</div>
			</div>
    </div>
    
    <!-- 文件上传 -->
    
    <sys:message content="${message}"/>
    
</body>

<script type="text/javascript">

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


		 $("#search").click(function(){
			var changeAmounts=$("#changeAmounts").val();
			var result=false;
			if(changeAmounts!=""&&(typeof(changeAmounts)!="undefined" )){
				var reg = new RegExp("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$");
				if(!reg.test(changeAmounts)){
			    	$.jBox.alert("变动金额格式输入错误！！", '错误提示');
			    }else{
			    	result=true;
			    }
			}else{
				result=true;
			}
				
			return result;
		}) 
		
</script>
</html>


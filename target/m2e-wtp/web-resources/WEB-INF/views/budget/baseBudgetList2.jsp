<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<jsp:useBean id="typeChange" class="com.budget.common.util.TypeChange" />
<!DOCTYPE HTML >
<html>
<head>
    <meta charset="UTF-8">
    <title>表单样式</title>
    <%@include file="/WEB-INF/views/include/head.jsp" %>
    <script src="<%=path%>/static/js/common/FormValidate.js?version=${fsscVersion}" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=path%>/static/css/fsscAccountIndex.css"/>
    <link href="<%=path%>/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script src="${ctxStatic}/pop/pop.js?version=${fsscVersion}" type="text/javascript"></script>
	
    <script type="text/javascript" src="<%=path%>/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="<%=path%>/static/js/bootstrap-datetimepicker.fr.js" charset="UTF-8" ></script>
	<style>
		#compIdName{
			padding-left:6px;
		}
		
		
	</style>
</head>
<body>
	<!-- 查询条件 -->
	<div style="width:98%;margin:4px auto;" class="layout-content" >
		<form:form id="inputForm" modelAttribute="lmtBudget" action="${ctx}/bas/baseBudget" method="post" class="form-inline">
		<div class="suspend-title">查询条件</div>
		    
		    <div class="suspend-card">
		    
		    		<!-- 预算公司 -->
		        	<div class="form-group">
		                <label for="compId">预算责任公司</label>
		            	   <sys:asynctreeselect id="compId" name="company.orgNo"
												value="${lmtBudget.compId}" labelName="company.name"
												labelValue="${lmtBudget.compName}" title="公司"  
												url="/sys/org/asynctreeDataCompany?type=4" 
												 />
												
		            </div>
		            
		           <%--  <div class="form-group suspend-cardForm">
						<label for="budgetDeptId">归属部门</label>
						<form:hidden path="budgetDeptId" />
						<form:input path="budgetDeptName" type="text" class="form-control readonlyBcff icon-sameAttr16 defined-search" readOnly="true"
			 			onclick="openPopAssignment('${ctx}/account/common/popWindow/orgIndex?isCost=1','选择部门',getMoneyDeptDate)" />
					</div> --%>
		            
		            
		            <!-- 预算科目 -->
		             <div class="form-group suspend-cardForm" >
		                <div class="dropdown">
		                    <label for="budgetSubjectCode">预算科目</label>
		                    <form:select path="budgetSubjectCode" class=" form-control icon-sameAttr16 defined-pulldown"  style="text-align:left;">
		                        <option value="">请选择预算科目</option>
		                        <form:options items="${allBudgetSub}" itemLabel="budgetName" itemValue="budgetNo" htmlEscape="false"/>
		                    </form:select>
		
		                </div>
          		 	 </div>
		           <!-- 预算年份 -->
		           <div class="form-group ">
               			 <label for="dtp_input1" style="margin-right:5px;" class=" control-label">预算年度</label>
			                <div style="width:63.5%" id="timerPickerId" class="input-group date form_datetime"  data-date-format="yyyy" data-link-field="dtp_input1">
			                    
			                    <input name="year" type="text" maxlength="20" class="form-control icon-sameAttr16 defined-calendar required"
								value="${lmtBudget.budgetYear}" />
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
			                </div>
							<!-- <input type="hidden" id="dtp_input1" value="" /><br/> -->
          			  </div>
		        
		         
		         
		            <div style="text-align:right;margin:12px auto;width:1100px;">
						<div class="btn-main-animateDiv">
							<div class="btn-main-animate" ></div>
							<button class='btn btn-main' type="submit" id="dd">查询</button>
						</div>
						<div class="btn-main-animateDiv">
							<div class="btn-main-animate" ></div>
							<button class="btn btn-red" type="button" id="clearAll">重置</button>
						</div>
					</div>
					
		          </div>
		          
		       
		        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		   </form:form>
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
					            <!-- <th>预算责任公司ID</th> -->
					            <th>预算责任公司</th>
					            <!-- <th>部门</th> -->
					            <th>预算科目ID</th>
					            <th>预算科目</th>
					            <th>预算金额</th>
					            <th>预算已完成金额</th>
					            <th>预算已冻结金额</th>
					            <th>预算金额</th>
					            <th width="60px">预算年度</th>
					            <!-- <th width="35px">期间</th> -->
					           <!--  <th>预算失效状态</th> -->
					         
					            <th width="45px">操作</th>
					            
					        </tr>
				        </thead>
				        <tbody>
					        <c:forEach items="${page.list}" var="budget" varStatus="status">
					            <tr>
					                <!-- style="WORD-WRAP: break-word" width="20" -->
					                <%-- <td style="word-wrap:break-word;">${budget.compId}</td> --%>
					                <td style="text-overflow:ellipsis;white-space: nowrap;overflow: hidden;" title="${budget.compName}">${budget.compName}</td>
					                <input type="hidden" value="${budget.compId}"/>
					             	<%-- <td>${budget.budgetDeptName}</td> --%>
					                <td style="text-overflow:ellipsis;white-space: nowrap;overflow: hidden;">${budget.budgetSubjectCode }</td>
					                <td style="text-overflow:ellipsis;white-space: nowrap;overflow: hidden;">${budget.budgetSubjectName }</td>
					                
					                
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
					                <%-- <td >${budget.budgetPeriod }</td> --%>
					                <%-- <td>
					                 <c:if test="${budget.status eq 'Y' }">
					         		       失效
					                </c:if>
					                <c:if test="${budget.status eq 'N' }">
					         		       未失效
					                </c:if>
					                </td> --%>
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
//归属部门回显信息
function getMoneyDeptDate(data) {
	alert(12);
	data = $(data);
	if(data==undefined||data.length==0){
		return;
	}
	var obj = {
  			"officeId":data.find("td:first-child").text(),     //组织机构编码
  			"officeName":data.find("td:nth-child(2)").text(),  //组织机构名称
  			"vaule":data.find("input").val()                   //选中行的隐藏域(id)
    	}
	$('#budgetDeptName').val(obj.officeName);
	$('#budgetDeptId').val(obj.officeId);
	top.$.jBox.close();
}


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
        .not(':button, :submit, :reset') 
        .val('') 
        .removeAttr('checked') 
        .removeAttr('selected');
		
		//清除预算科目
		$('#budgetSubjectCode').prev().find("span:first").text($('#budgetSubjectCode option:selected').text());
		});
		
		
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			//$("#inputForm").attr("action","${ctx}/bas/baseBudget");
			$("#inputForm").submit();
	    	return false;
	    }

		  $('#timerPickerId').datetimepicker({
      		autoclose: 1,
      		startView: 4,
      		forceParse: 0,
      	    showMeridian: 1,
      		minView:4
      	});
		 var arrows=$("div.datetimepicker-years").find("thead .glyphicon");
		 arrows.eq(0).addClass("icon-arrow-left");
		 arrows.eq(1).addClass("icon-arrow-right");

</script>

</html>


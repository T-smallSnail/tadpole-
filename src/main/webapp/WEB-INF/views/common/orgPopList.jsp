<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#contentTable td").click(function() {
			$('.dbe8fc').removeClass('dbe8fc');
			$(this).parent('tr').find('td').addClass('dbe8fc');
			$('#delBtn').addClass('text-corEC6868');
		});

		$("#contentTable tbody").on("click","tr",function(){
			var tarFrame=getPrevFrame("getMoneyDeptDate")//获取当前的frameName
			if(tarFrame){
				if('${org.isGain}'== '1'){
					tarFrame.getProfitCenterDate($(this));
				}else if('${org.isCost}'=='1'){
					tarFrame.getMoneyDeptDate($(this));
				}else if('${org.isGain}'=='2' && '${org.isCost}'=='2'){
					tarFrame.getOrgDate($(this));
				}
			}
		});
	});
	function page(n, s) {
		if (n) $("#pageNo").val(n);
		if (s) $("#pageSize").val(s);
		$("#searchForm").attr("action", "${ctx}/account/common/popWindow/orgList?isGain=${org.isGain}&isCost=${org.isCost}");
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body>
<style>
@media screen and (max-width: 1000px) {
	
.form-inline .form-group{
	width: 44%;
	margin-top: 12px;
	text-align: right;
	position: relative;
}
.form-inline .form-group input{
	width: 55%;
}
.form-inline .form-inline-align{
	width: 93.4%;
}

}
</style>

		<form:form id="searchForm" modelAttribute="org" 
			action="${ctx}/account/common/popWindow/orgList" method="post"
			class="breadcrumb form-search form-inline ">
			<input id="parentNo" name="parentNo" type="hidden" value="${org.parentNo}" />
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
			<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}"
				callback="page();" />
			<div class="form-group">
				<label>组织机构名称</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="form-control" />
			</div>
			<div class="form-group">
				<label>组织机构编码</label>
				<form:input path="orgNo" htmlEscape="false" maxlength="50" class="form-control" />
			</div>
			<div class="form-group form-inline-align">
		    	<!-- <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();" /> -->
		    	<button  id="btnSubmit"  class="btn btn-main" onclick="return page();">查询</button>
		    </div>		    
		</form:form>
		<div class="pr" style="width: 98%;margin: 0 auto;">
			<sys:message content="${message}" />
			<div class="daiding">
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed table-hover">
			<thead>
				<tr>
					<th align="center">统计编码</th>
					<th align="center">组织机构名称</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="org">
					<tr>
						<td>${org.orgNo}</td>
						<td>${org.name}</td>
						<input type="hidden" value="${org.orgNo}" />
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
		<div class="pagination">${page}</div>
</body>
</html>
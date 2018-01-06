<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/"+"static/ecm/execCallBack.html";		
%>
<html>
<head>
	<title>测试缓存接口</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
		}
	</script>
</head>
<body>	
	<shiro:hasPermission name="ecm:ecmOperate:edit">
		<a href="${ctx}/test/testCacheManager/testGetEmployee">employee</a><br>
		<a href="${ctx}/test/testCacheManager/testGetOrg">org</a><br>
		<a href="${ctx}/test/testCacheManager/testGetTarget">target</a><br>
		<a href="${ctx}/test/testCacheManager/testGetProjectInfo">project</a><br>
		<a href="${ctx}/test/testCacheManager/testGetBankAccount">bankAccount</a><br>
		<a href="${ctx}/test/testCacheManager/testGetBudgetSubject">budget</a><br>
		<a href="${ctx}/test/testCacheManager/testGetJob">job</a><br>
		<a href="${ctx}/test/testCacheManager/testGetSupplyInfo">supplier</a><br>
		<a href="${ctx}/test/testCacheManager/testGetCustomInfo">customer</a><br>
		<a href="${ctx}/test/testCacheManager/testGetAccountSub">accountSub</a><br>
		<a href="${ctx}/test/testCacheManager/testGetDept">dept</a><br>
		
	</shiro:hasPermission>
</body>
</html>
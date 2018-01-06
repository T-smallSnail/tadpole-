<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>批量用户角色添加</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>
	
	<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>
</head>
<body>
	<form action="${ctx}/sys/user/importUserInfo" method = "post">
		<font style = "color:red">*</font><input type = "text" name = "filePath" placeholder = "请输入文件路径"/><br/>
		<font style = "color:red">*</font><input type = "text" name = "roleIndex" placeholder = "请输入角色名称下标"/><br/>
		<font style = "color:red">*</font><input type = "text" name = "userIndex" placeholder = "请输入用户编码下标"/><br/>
		<input type = "submit" value = "确定"> 
	</form>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	String error = (String)request.getAttribute("error");
	String message = (String)request.getAttribute("message");
	
	if(null == error && message == null){
		error = request.getParameter("error");
		message = request.getParameter("message");
	}
	
	error = (null == error || "".equals(error) || "null".equals(error)) ? "" : error;
	message = (null == message || "".equals(message) || "null".equals(message)) ? "" : message;
	
	String errMsg = "".equals(error) ? message : error;
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>系统错误页面</title>
<style>
*{ margin:0; padding:0; font-family:Microsoft YaHei; font-size:14px;}
.red{ color:#F00;}
.blue{ color:#03F;}
.fw600{ font-weight:600;}
.fs18{ font-size:18px;}
.plr2{ padding:0 2px;}

.errorW{ width:600px; height:500px; margin:0 auto;}
.errorW .img{ width:200px; height:168px; margin:0 auto; padding:80px 0 20px;}
.errorW h1{ width:600px; height:32px; line-height:32px; text-align:center; padding:10px 0; font-size:20px; color:#444; font-weight:600;}
.errorW p{ width:600px; height:32px; line-height:32px; text-align:center; padding:5px 0;}
.errorW .p_red a{ color:#f00; font-size:18px; font-weight:600; padding:0 2px; text-decoration:none;}
.errorW .p_red a:hover{ color:#C00; font-size:18px; font-weight:600; padding:0 2px; text-decoration:none;}
.errorW .p_blue a{ color:#09F; font-size:18px; font-weight:600; padding:0 2px; text-decoration:none;}
.errorW .p_blue a:hover{ color:#00F; font-size:18px; font-weight:600; padding:0 2px; text-decoration:none;}
</style>
</head>

<body>
<div class="errorW">
   <div class="img">
      <img src="uias/images/sj.gif" width="200" height="168" />
   </div>
   <h1><%=errMsg%></h1>
   
   
</div>

</body>
</html>
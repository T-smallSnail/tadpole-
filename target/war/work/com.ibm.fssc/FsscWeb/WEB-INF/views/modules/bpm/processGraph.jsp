<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://eos.primeton.com/tags/workflow/base" prefix="wfBase"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>流程图显示</title>
    <script src="${ctxStatic}/../workflow/wfcomponent/web/js/Graphic.js"></script>
</head>
<body>
	<wfBase:processGraph processInstID="${processInsId}" zoomQuotiety="1"/>
</body>
</html>

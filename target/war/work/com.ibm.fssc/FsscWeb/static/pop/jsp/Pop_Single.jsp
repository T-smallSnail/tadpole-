<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.Map" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>详情</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${ctxStatic}/pop/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../bootstrap/css/bootstrapCopy.css" />
		<link rel="stylesheet" href="../definedCss/shuttleBoxIndex.css" />
		<script src="../bootstrap/js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="../styleInteractionJs/styleInteraction.js" type="text/javascript"></script>
	</head>
	
	<body class="body_bg" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-923" data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_Single.jsp">
	<style data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-923" data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_Single.jsp">
	.layout-pop{width:98%;margin:0 auto;}
	.layout-pop .layout-pop-top{width:100%;}
	.layout-pop .layout-pop-bottom{width:100%;}
	
	</style>
	
		<s:form method="post" theme="simple" name="cms_form" action="#">
		
			<div class="overall-layoutSEO">
				<div class="layout-pop-top">
					<div class="panel-defined-content ">
							<%@ include file="Pop_query.jsp"%>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="layout-pop-bottom" style="margin-top:20px;">
						<div class="suspend-title">信息列表</div>
						<div class="panel-defined-content ">
							<%@ include file="Pop_list.jsp"%>
						</div>  
				</div>
			</div>
		</s:form>
	</body>
</html>
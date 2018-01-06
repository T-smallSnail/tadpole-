<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html style=“background: #eff2f5;”>
<head>
	<title>${fns:getConfig('productName')}</title>
	<meta name="decorator" content="blank"/>
    <link rel="Stylesheet" href="${ctxStatic}/jerichotab/css/jquery.jerichotab.css" />
    <link rel="stylesheet" href="${ctxStatic}/sysStyle/loginIndex.css" />
    <script type="text/javascript" src="${ctxStatic}/jerichotab/js/jquery.jerichotab.js"></script>
    <!-- 引入该页面的css -->
</head>
	<body>
		<div class="index-container">
			<div class="index-header">
				<img class="index-logo" src="${ctxStatic}/sysImages/logo.png"/>
				<!--<h1>财务集中管控平台</h1>-->
				<div class="index-header-left">
					<ul>
						<li><i class="icon-sameAttr20 defined-personal"></i><a href="#">王莉莉</a></li>
						<li><i class="icon-sameAttr20 defined-exit"></i><a href="#">退出</a></li>
					</ul>
				</div>
			</div>
			<div class="index-content">
				<!--	<div class="panel ">-->
						<div class="panel panel-colordcd6b3">
							<div class="panel-heading">合同系统</div>
							<div class="panel-content">
								<div class="panel-same">
									<div class="panel-same-top">
										<p>在这里，您可以进行合同系统相关的操作，我们为您打造最好的报账系统，</p>
									</div>
									<div class="panel-same-bottom">
										<a href="http://10.50.1.9:7001/FsscContract/uias_login.do?appCode=cgdchtxtce&gotoUrl=" target="_blank">
											<p class="color52c4f4">进入系统</p>
									    </a>
									</div>
										
								</div>
							</div>
						</div>
						<div class="panel panel-colorbedcb3">
							<div class="panel-heading">报账系统</div>
							<div class="panel-content">
								<div class="panel-same">
									<div class="panel-same-top">
										<p>在这里，您可以进行报账系统相关的操作，我们为您打造最好的报账系统，</p>
									</div>
									<div class="panel-same-bottom">
										<a href="http://10.50.1.11:7001/FsscAccount/uias_login.do?appCode=cgdcbzxt&gotoUrl=" target="_blank">
											<p class="color52c4f4">进入系统</p>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-colorb3cedc">
						<div class="panel-heading">影像系统</div>
						<div class="panel-content">
							<div class="panel-same">
								<div class="panel-same-top">
									<p>在这里，您可以进行合同系统相关的操作，我们为您打造最好的报账系统，</p>
								</div>
								<div class="panel-same-bottom">
									<a href="http://10.50.1.7:7001/FsscMedia/uias_login.do?appCode=cgdcyx&gotoUrl=" target="_blank">
										<p class="color52c4f4">进入系统</p>
									</a>
								</div>
							</div>
						</div>
					</div>
				
					<div class="panel panel-colorb8b3dc">
						<div class="panel-heading">资金系统</div>
						<div class="panel-content">
							<div class="panel-same">
								<div class="panel-same-top">
									<p>在这里，您可以进行资金系统相关的操作，我们为您打造最好的报账系统，</p>
								</div>
								<div class="panel-same-bottom">
									<a href="http://10.50.9.32:7190/web/uias_login.do?appCode=cgdczjxt&gotoUrl=" target="_blank">
										<p class="color52c4f4">进入系统</p>
									</a>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</body>
</html>
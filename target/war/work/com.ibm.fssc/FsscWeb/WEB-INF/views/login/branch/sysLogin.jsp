<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="decorator" content="blank"/>
	<style type="text/css">
      html,body,table{background-color:#f5f5f5;width:100%;text-align:center;}.form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
      .form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
      .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      .form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
      .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
      
      
      #contentTable{
      	cellSpacing: 0;
      	cellPadding: 0;
      }
      
      
      #contentTable a{
      	width: 160px; 
      	height: 160px; 
      	cursor: pointer;
      	margin: 0px auto;
      	line-height: 160px;
      	font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;
      	font-size:36px;
      	color:#0663a2;
      	text-decoration:none;
      	display: block;
      }
      
      #logout {
      	width: 100px; 
      	height: 30px; 
      	background: #00BFFF; 
      	float: right; 
      	margin-right: 50px; 
      	line-height: 30px;
      	font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;
      	font-size:20px;
      	color:#0663a2;
      	cursor: pointer;
      	display: none;
      }
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#logout").click(function() {
				var sessionId = $("#sessionId").val();
				$.ajax({
				      url: 'http://10.50.8.20:9090/UIAS/uias/shotOff?sessionId=' + sessionId + '&jsoncallback=?',
				      dataType: "jsonp",
				      type: 'get',
				      success: function(data) {
				      	  if (data.success == true) {
				              alert("操作成功");
						      window.location.href="http://10.121.55.94:8080/FsscWeb/uias_login.do?appCode=cgdcgxhx&gotoUrl=";
				          } else {
				              alert("操作失败");
				          }
				      }
				  });
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
	/*	if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		} */
	</script>
</head>
<body>
	<div class="header">
	</div>
	<input type="hidden" id="sessionId" value="${sessionId}"/>
	<div id="logout">退出</div>
	<input id="userCode" value="${userCode}" type="hidden" />
	<div style="width: 800px; height: 300px; margin: 0px auto;">
		<table id="contentTable">
			<tr>
				<td width="25%">
					<div style="display: none">thinkgem/admin</div>
					<a href="http://10.50.1.9:8080/FsscContract" style="background: #FFEFDB;">合同系统</a>
				</td>
				<td width="25%">
					<a href="http://10.50.1.10:8080/FsscAccount" style="background: #FFE4E1;">报账系统</a>
				</td>
				<td width="25%">
					<a href="http://10.121.55.26:8000/web/" style="background: #F0FFF0;">资金系统</a>
				</td>
				<td width="25%">
					<div style="display: none">admin/admin</div>
					<a href="http://10.50.1.7:8080/EIS-SYS" style="background: #E0FFFF;">影像系统</a>
				</td>
			</tr>
		</table>
	</div>
	<div class="footer">
		Copyright &copy; 2012-${fns:getConfig('copyrightYear')} <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a> - Powered By <a href="http://jeesite.com" target="_blank">JeeSite</a> ${fns:getConfig('version')} 
	</div>
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>
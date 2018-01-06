<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="decorator" content="blank"/>
	<style type="text/css">
      html,body,table{width:100%;text-align:center;}.form-signin-heading{font-family:'微软雅黑',Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
      .form-signin{position:relative;text-align:left;width:300px;height: 375px;padding:50px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
      -webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 24px 11px -12px rgba(0,0,0,.05);}
      .form-signin .checkbox{color:#585858;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      .form-signin .input-block-level{width:81%;font-size:16px;height:auto;margin-bottom:15px;padding:14px;*width:283px;*padding-bottom:0;_padding:14px 14px 9px 14px;border-top-left-radius: 0px;border-bottom-left-radius: 0px;}
      .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>
<body>
	<input type="hidden" value="loginPage"/>
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	
		
	<div class="login-container"><!-- login-container start -->
		<div class="login-header" >
			<div class="login-div">
				<img class="login-logo" src="${ctxStatic}/sysImages/logo.png"/>
				
			</div>
			<div class="login-info">
				<div class="login-infoBj"></div>
				<div class="login-infoWe">
					<span>财务集中管控平台</span>我们竭力为您打造最好的管理系统，更好的提高您的工作效率！
				</div>
				
			</div>
		</div>
		
		<div class="login-left">
			<div class="login-left-content">
				<h1>中国国电，欢迎您</h1>
				<p>在这里您可以进行财务集中管控平台相关操作。</p>
			</div>
			
		</div>
		<div class="login-right">
		
			<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
					<div class="form-group">
						<div class="login-defined"><i class="icon-sameAttr20 defined-loginUser"></i></div>
						<input type="text" id="username" name="username" class="input-block-level required" value="${username}" placeholder="用户名">
					</div>
					<div class="form-group">
						<div class="login-defined"><i class="icon-sameAttr20 defined-loginKey"></i></div>
						<input type="password" id="password" name="password" class="input-block-level required"  placeholder="密码">
					</div>
					
					
					<c:if test="${isValidateCodeLogin}">
					<div class="validateCode">
						<label class="input-label mid" for="validateCode">验证码</label>
						<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
					</div>
					</c:if>
					<%--<label for="mobile" title="手机登录"><input type="checkbox" id="mobileLogin" name="mobileLogin" ${mobileLogin ? 'checked' : ''}/></label> --%>

					<div class="form-group" id="login-checkbox">
						<div class="checkbox">
							<label class="check-click" for="rememberMe" title="下次不需要再登录">
								<i class='icon-sameAttr16 defined-checkbox'></i>
								<input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> <span>保存密码</span>
							</label>
						</div>
					</div>
					<input class="btn btn-login" type="submit" value="登 录"/>&nbsp;&nbsp;
					
					<div class="login-forget"><a href="#">忘记密码了？</a>
						<br><a href="login?locale=zh_CN">中文</a> | <a href="login?locale=en_US">english</a></br>
					<%-- <div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button> --%>
				<label id="loginError" color="red" class="error">    <font color="red">${message}</font> </label>
	
					</div>
				
			</form>
	  
			<div class="login-right-footer">
				中国国电版权所有&#169;
			</div>
	
			
		</div>
		
	</div><!-- login-container end -->
	
	
	<!-- 复选框点击交互 -->
	<script>
		$("#login-checkbox .checkbox .check-click i").click(function(){
			if($(this).hasClass('checkbox-active')){
				$(this).removeClass('checkbox-active').addClass('defined-checkbox');
			}else{
				$(this).addClass('checkbox-active').removeClass('defined-checkbox');
			}
		});
	</script>
	
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>
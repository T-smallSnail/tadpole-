<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>mqmessage管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#submitForm").click(function(){
			if(!$("#inputForm").valid()){
				return;
			}
			$.ajax({
	   			url:'${ctx}'+"/sys/mqMsgSend/send",
	   			data:{'id' : $('#id').val()},
	   			dataType:"json",
	   			type:"post",
	   			success:function(data){
	   			 if (data && data == "success") {
					/* window.location=ctx + '/sys/employee/list'; */
					$.jBox.prompt('消息已经发送，请稍后查询结果。', '提示', 'info', {
						closed : function() {
							$.jBox.tip("正在处理，请稍候....", "loading");
							location.href = ctx + '/sys/mqMsgSend/list';
						}
					});
	   				}
	   			},
	         error: function(XMLHttpRequest, textStatus, errorThrown) {
	             alert(XMLHttpRequest.responseText);
	         },
	         complete: function(XMLHttpRequest, textStatus) {
	             this; // 调用本次AJAX请求时传递的options参数
	         }
	   		});
		});
	});
	</script>
</head>
<body>
    <div class="layout-content">
	<form:form id="inputForm" modelAttribute="mqMsgSend" action="${ctx}/sys/mqMsgSend/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="suspend-card">
		
		<div class="form-group suspend-cardForm">
			<label class="control-label">客户编码：</label>
			<div class="controls">
				<p class="form-control">${mqMsgSend.clientId}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">操作码：</label>
			<div class="controls">
				<p class="form-control">${mqMsgSend.operationCode}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">请求标志：</label>
			<div class="controls">
				<p class="form-control">${mqMsgSend.reqId}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">主题：</label>
			<div class="controls">
				<p class="form-control">${mqMsgSend.topic}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">消息：</label>
			<div class="controls">
				<p class="form-control">${mqMsgSend.message}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">验证：</label>
			<div class="controls">
				<p class="form-control">${mqMsgSend.valid}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">过期时间：</label>
			<div class="controls">
				<p class="form-control"><fmt:formatDate value="${mqMsgSend.expiredate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">状态：</label>
			<div class="controls">
			<p class="form-control">${mqMsgSend.status}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">失败次数：</label>
			<div class="controls">
			<p class="form-control">${mqMsgSend.failTimes}</p>
			</div>
		</div>
		<div class="form-group suspend-cardForm">
			<label class="control-label">备注：</label>
			<div class="controls">
			<p class="form-control">${mqMsgSend.remarks}</p>
			</div>
		</div>
		<div class="toolbar-Onlybtn">
		    <shiro:hasPermission name="sys:mqMsgSend:edit">
			<button type="button" class="btn btn-main " id="submitForm">发送消息</button>
			<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
			</shiro:hasPermission>
		</div>
		</div>
	</form:form>
	</div>
</body>
</html>
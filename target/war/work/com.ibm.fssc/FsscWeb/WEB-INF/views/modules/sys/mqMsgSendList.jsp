<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>mqmessage管理</title>
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
	<form:form id="searchForm" modelAttribute="mqMsgSend" action="${ctx}/sys/mqMsgSend/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>主题：</label> <form:input path="topic"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li><label>消息内容：</label> <form:input path="message"
					htmlEscape="false" maxlength="50" class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="pr">
	<sys:message content="${message}"/>
	<div class="daiding">
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
					<th>客户编码</th>
					<th>操作码</th>
					<th>请求标志</th>
					<th>主题</th>
					<th>消息</th>
					<th>验证</th>
					<th>过期时间</th>
					<th>更新时间</th>
					<th>失败次数</th>
					<th>状态</th>
					<th>备注</th>
					<shiro:hasPermission name="sys:mqMsgSend:edit">
						<th>操作</th>
					</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="mqMsgSend">
			<tr>
				<td>
					${mqMsgSend.clientId}
				</td>
				<td>
					${mqMsgSend.operationCode}
				</td>
				<td>
					${mqMsgSend.reqId}
				</td>
				<td>
					${mqMsgSend.topic}
				</td>
				<td>
					${mqMsgSend.message}
				</td>
				<td>
					${mqMsgSend.valid}
				</td>
				<td>
					<fmt:formatDate value="${mqMsgSend.expiredate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${mqMsgSend.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${mqMsgSend.failTimes}
				</td>
				<td>
					${mqMsgSend.statusStr}
				</td>
				<td>
					${mqMsgSend.remarks}
				</td>
				<shiro:hasPermission name="sys:mqMsgSend:edit">
				<td>
    				<a href="${ctx}/sys/mqMsgSend/form?id=${mqMsgSend.id}">详情</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>
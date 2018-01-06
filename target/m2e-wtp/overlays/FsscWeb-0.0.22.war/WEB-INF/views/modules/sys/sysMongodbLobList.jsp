<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>mongo管理</title>
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
	<form:form id="searchForm" modelAttribute="sysMongodbLob" action="${ctx}/sys/sysMongodbLob/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
					
			<li>	<label>开始日期：</label><input id="beginDate" name="beginDate"
				type="text" readonly="readonly" maxlength="140"
				class="input-mini Wdate"
				value="<fmt:formatDate value="${sysMongodbLob.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			<li/>
			<li> <label>结束日期：</label><input
				id="endDate" name="endDate" type="text" readonly="readonly"
				maxlength="140" class="input-mini Wdate"
				value="<fmt:formatDate value="${sysMongodbLob.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />&nbsp;&nbsp;&nbsp;
			</li>
			<li><label>级别：</label>
				<form:select path="level" class="input-medium">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('mongo_level')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>创建时间</th>
				<th>类名称</th>
				<th>类方法</th>
				<th>级别</th>
				<th>host</th>
				<th>msg</th>
			
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysMongodbLob">
			<tr>
				<td>
					<fmt:formatDate value="${sysMongodbLob.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sysMongodbLob.fileName}
				</td>
				<td>
					${sysMongodbLob.method}
				</td>
				<td>
					${sysMongodbLob.level}
				</td>
				<td>
					${sysMongodbLob.host}
				</td>
			
				<td  class="msg" style="position:relative;">
				 ${(sysMongodbLob.message!=null&&sysMongodbLob.message.length()>100)?(sysMongodbLob.message.substring(0,100).concat("...")):sysMongodbLob.message}
				 <c:if  test="${(sysMongodbLob.message!=null&&sysMongodbLob.message.length()>100)}">
 					<div  style="display:none;width:100%;position:absolute;top:0;left:0;background:white;padding:4px 5px;min-height:100%;z-index:999;">
						${sysMongodbLob.message}
					</div>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	<script>
		$("#contentTable tbody").on("mouseover","td.msg",function(ev){
			$(this).find("div").show();
		});
		$("#contentTable tbody").on("mouseout","td.msg",function(ev){
			$(this).find("div").hide();
		});
	</script>
</body>
</html>
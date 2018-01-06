<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>POP单选配置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
	$(document).ready(function() {
    	$("#submitForm").click(function(){
    		if(!$("#inputForm").valid()){
				return;
			}
    		$.ajax({
	   			url:'${ctx}'+"/sys/popSingle/save",
	   			data:$("#inputForm").serialize(),
	   			dataType:"json",
	   			type:"post",
	   			success:function(data){
	   			 if (data && data == "success") {
					/* window.location=ctx + '/sys/employee/list'; */
					$.jBox.prompt('保存成功。', '提示', 'info', {
						closed : function() {
							$.jBox.tip("正在处理，请稍候....", "loading");
							location.href = ctx + '/sys/popSingle/list';
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
    	$("#inputForm").on("mouseover","i.defined-info",function(){
    		$.jBox.tip(this.getAttribute("data-info"),"info",{width:500});
    	});

   });
	function calltest(){
		
	}
	</script>
	<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>
</head>
<body>
<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="popSingle" action="${ctx}/sys/popSingle/save" method="post" class="form-inline">
		<div class="suspend-card">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>		
				<div class="form-group suspend-cardForm">
					<font color="red">*</font> <label class="control-label">场景编号：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
   				 		<p class="form-control">${popSingle.sceneId}</p>
       				</c:if>
       				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="sceneId" htmlEscape="false" maxlength="30" class="required form-control" placeholder="查询场景数据的函数参数"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">场景描述：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.sceneDesc}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="sceneDesc" htmlEscape="false" maxlength="100" class="form-control" placeholder="场景功能描述"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">列表名称：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.colName}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="colName" htmlEscape="false" maxlength="50" class="form-control" placeholder="SQL语句查询的列名"/>
					<i class='icon-sameAttr16 defined-info' data-info="对应sql语句查询的列名（自定义）（多个列名用“,”隔开），如：sql是select user_no,user_name from SYS_USER 那么列表名称可为：用户编码，用户名称"></i>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">查询显示名称：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.queryDisname}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="queryDisname" htmlEscape="false" maxlength="50" class="form-control" placeholder="field1,field2,..."/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font><label class="control-label">查询列表语句：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.sql}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:textarea path="sql" htmlEscape="false" rows="2" maxlength="500" class="required form-control" placeholder="查询所需数据sql语句（如果需要动态传参需与动态and相结合）"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font><label class="control-label">数据库对应关系：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.dbBeanRel}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:textarea path="dbBeanRel" htmlEscape="false" rows="2" maxlength="200" class="required form-control" placeholder="user_no-sql,login_name-sceneDesc"/>
					<i class='icon-sameAttr16 defined-info' data-info="格式为 数据库字段名称-父页面属性名（多个数据用“,”隔开，数据库字段必须小写）"></i>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">查询name值：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.queryName}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="queryName" htmlEscape="false" maxlength="50" class="form-control" placeholder="name1,name2,.."/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font><label class="control-label">页数：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.pageNo}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="pageNo" htmlEscape="false" maxlength="30" class="required form-control" placeholder="每页显示数据的数量"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">动态and：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.dynAnd}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="dynAnd" htmlEscape="false" maxlength="200" class="form-control" placeholder="例：sceneId-user_no=#sceneId#;..."/>
					<i class='icon-sameAttr16 defined-info' data-info="指定参数查询：传参页面属性-数据库字段=#传参页面属性#
模糊参数查询：传参页面属性-数据库字段 like #传参页面属性@#
（多个参数用“;”隔开，如果查询name值需与查询name值相对应）
"></i>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">动态or：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.dynOr}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="dynOr" htmlEscape="false" maxlength="200" class="form-control"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">排序：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.orderby}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="orderby" htmlEscape="false" maxlength="50" class="form-control" placeholder="order by filedname/desc"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">隐藏列数：</label>
					<c:if test="${popSingle.authMode=='view' || popSingle.authMode==''}">
			 			<p class="form-control">${popSingle.hiddenCol}</p>
	   				</c:if>
	   				<c:if test="${popSingle.authMode=='edit'}">
						<form:input path="hiddenCol" htmlEscape="false" maxlength="50" class="form-control" placeholder="如1,2 隐藏查询到的数据第1、2列	,多个用”,“隔开"/>
					</c:if>
				</div>
		</div>
		<c:if test="${formType!='view'}">
			<div class="toolbar-Onlybtn">
				<c:if test="${popSingle.authMode=='edit'}">
					<button type="button" class="btn btn-main " onclick="func_popSingle('ASD111','colName','')">测试</button>
					<button type="button" class="btn btn-main " id="submitForm">保存</button>
				
				</c:if>
				<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
			</div>
		</c:if>
	</form:form>
</div>
</body>
</html>

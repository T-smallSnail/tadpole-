<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通用树配置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
	    	$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/sys/treeConf/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/sys/treeConf/list';
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
	    	//提示事件
	    	$("#inputForm").on("mouseover","i.defined-info",function(){
    			$.jBox.tip(this.getAttribute("data-info"),"info",{width:500});
    		});
	   });
	</script>
</head>
<body>
<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="treeConf" action="${ctx}/sys/treeConf/save" method="post" class="form-inline">
		<div class="suspend-card">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font><label class="control-label">场景编号：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.sceneId}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="sceneId" htmlEscape="false" maxlength="20" class="required form-control" placeholder="查询场景数据的函数参数"/>
					</c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">场景描述：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.sceneDesc}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="sceneDesc" htmlEscape="false" maxlength="4000" class="form-control" placeholder="场景功能描述"/>
					</c:if>
				</div>
				<div class="form-group suspend-cardForm">
					<label class="control-label">选择模式：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.selectType}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="selectType" htmlEscape="false" maxlength="50" class="form-control" placeholder="[1单选/2多选]"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">参数：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.params}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="params" htmlEscape="false" maxlength="200" class="form-control" placeholder="PageID-id，PageName-name"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">查询语句：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.sql}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="sql" htmlEscape="false" maxlength="4000" class="form-control" placeholder="查询列表名称：编号，父编号，名称"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">点击触发方法：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.triFunc}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="triFunc" htmlEscape="false" maxlength="50" class="form-control" placeholder="onClick单选选中/onDblClick双击选中"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">节点触发级别：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.triLev}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="triLev" htmlEscape="false" maxlength="50" class="form-control" placeholder="c – 只能选择没有子节点的节点"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">动态传参配置：</label>
					<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
   				 		<p class="form-control">${treeConf.whereCaulse}</p>
       				</c:if>
       				<c:if test="${treeConf.authMode=='edit'}">
						<form:input path="whereCaulse" htmlEscape="false" maxlength="50" class="form-control"/>
					</c:if>
					<i class='icon-sameAttr16 defined-info' data-info="格式为  页面属性名称-数据库字段=#页面属性名称#，如有多参用”,“隔开，并将树节点参数放在最后，如下新增wherecaulse字段图解"></i>
				</div>
				
				
				<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
		 			<div class="form-group suspend-cardForm" >
						<label>备注：</label>
				 		<p class="form-control" >${treeConf.remarks}</p>
   				</c:if>
   				<c:if test="${treeConf.authMode=='view' || treeConf.authMode==''}">
		 			<div class="form-group form-inline-align" >
						<label>备注：</label>
				 		<p class="form-control" >${treeConf.remarks}</p>
   				</c:if>
   				<c:if test="${treeConf.authMode=='edit'}">
   					<div class="form-group form-inline-align" >
						<label class="control-label">备注：</label>
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="4000" class="form-control"/>
				</c:if>
					</div>
				
		</div>
		
		<c:if test="${formType!='view'}">
			<div class="toolbar-Onlybtn">
				<c:if test="${treeConf.authMode=='edit'}">
					<button type="button" class="btn btn-main " id="submitForm">保存</button>
				</c:if>
				<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
			</div>
		</c:if>
		
	</form:form>
</div>
</body>
</html>
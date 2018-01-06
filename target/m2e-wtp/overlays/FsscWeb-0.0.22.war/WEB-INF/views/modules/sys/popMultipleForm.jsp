<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>

	<title>POP多选配置管理</title>
	<meta name="decorator" content="default"/>
	
	<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
    	$("#submitForm").click(function(){
    		if(!$("#inputForm").valid()){
				return;
			}
    		$.ajax({
	   			url:'${ctx}'+"/sys/popMultiple/save",
	   			data:$("#inputForm").serialize(),
	   			dataType:"json",
	   			type:"post",
	   			success:function(data){
	   			 if (data && data == "success") {
					/* window.location=ctx + '/sys/employee/list'; */
					$.jBox.prompt('保存成功。', '提示', 'info', {
						closed : function() {
							$.jBox.tip("正在处理，请稍候....", "loading");
							location.href = ctx + '/sys/popMultiple/list';
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
	function popMultiBox(){
		var boxLoaded=function(){
			$(".jbox-content").css("overflow-y","hidden");
		};
		func_popMultipleCheckbox('ZXC002','sceneId,colName',boxLoaded);
	}
	</script>
</head>
<body>
<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="popMultiple" action="${ctx}/sys/popMultiple/save" method="post" class="form-inline">
		<div class="suspend-card">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>		
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font><label class="control-label">场景编号：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.sceneId}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:input path="sceneId" htmlEscape="false" maxlength="30" class="form-control required" placeholder="查询场景数据的函数参数"/>
					</c:if>	
						<!-- <input id="btnSubmit" class="btn" type="button" onclick="func_popMultipleCheckbox('ZXC002','sceneId,colName')"  value="测试多选挑勾"/>
						测试当前用户相同角色的同部门的人员
						start
						<input id="staticSubmit" class="btn" type="button" onclick="func_popMultipleCheckbox('STATIC','roleNoSta')"  value="测试STATIC"/>
						<input name="roleNoSta" type="hidden" value="10"/>
						end
						
						测试穿梭框
						start
						<input id="scene" type="hidden" value="ZXC002"/>
						<input id="queryparms" type="hidden" value="sceneId,colName"/>
						<input id="weiyi" class="btn"  type="button"   value="测试多选左右"/>
						end -->
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">场景描述：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.sceneDesc}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:input path="sceneDesc" htmlEscape="false" maxlength="100" class="form-control" placeholder="场景功能描述"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font><label class="control-label">查询列表语句：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.sql}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:textarea path="sql" htmlEscape="false" rows="2" maxlength="500" class="form-control required" placeholder="查询所需数据sql语句（如果需要动态传参需与动态and相结合）"/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<font color="red">*</font><label class="control-label">数据库对应关系：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.dbBeanRel}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:textarea path="dbBeanRel" htmlEscape="false" rows="2" maxlength="200" class="form-control required" placeholder="user_no-sql,login_name-sceneDesc"/>
					<i class='icon-sameAttr16 defined-info' data-info="格式为 数据库字段名称-父页面属性名（多个数据用“,”隔开，数据库字段必须小写）"></i>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">列表显示名称：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.colName}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:input path="colName" htmlEscape="false" maxlength="50" class="form-control" placeholder="field1,field2,..."/>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">动态or：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.dynOr}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:input path="dynOr" htmlEscape="false" maxlength="200" class="form-control" />
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">动态and：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.dynAnd}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:input path="dynAnd" htmlEscape="false" maxlength="200" class="form-control" placeholder="例：sceneId-user_no=#sceneId#;..."/>
					<i class='icon-sameAttr16 defined-info' data-info="指定参数查询：传参页面属性-数据库字段=#传参页面属性#
模糊参数查询：传参页面属性-数据库字段 like #传参页面属性@#
（多个参数用“;”隔开，如果查询name值需与查询name值相对应）
"></i>
					</c:if>
				</div>
				
				<div class="form-group suspend-cardForm">
					<label class="control-label">排序：</label>
					<c:if test="${popMultiple.authMode=='view' || popMultiple.authMode==''}">
   				 		<p class="form-control">${popMultiple.orderby}</p>
       				</c:if>
       				<c:if test="${popMultiple.authMode=='edit'}">
						<form:input path="orderby" htmlEscape="false" maxlength="50" class="form-control" placeholder="order by filedname/desc"/>
					</c:if>
			</div>
		</div>
		<c:if test="${formType!='view'}">
			<div class="toolbar-Onlybtn">
				<c:if test="${popMultiple.authMode=='edit'}">
					<button type="button" class="btn btn-main " onclick="popMultiBox()" >测试多选</button>
					<button type="button" class="btn btn-main " id="submitForm">保存</button>
				</c:if>
				<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
			</div>
		</c:if>
	</form:form>
</div>
<script type="text/javascript">
	var scene  = $("#scene").val();
	var queryparms = $("#queryparms").val();
	$("#weiyi").addMultiselect({"scene":scene,"queryparms":queryparms});
</script>
</body>
</html>
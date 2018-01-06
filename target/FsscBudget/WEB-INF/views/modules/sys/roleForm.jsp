<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#roleName").focus();
			/* $("#inputForm").validate({
				rules: {
					name: {remote: "${ctx}/sys/role/checkName?roleName=" + encodeURIComponent("${role.roleName}")},
					enname: {remote: "${ctx}/sys/role/checkEnname?enname=" + encodeURIComponent("${role.enname}")}
				},
				messages: {
					name: {remote: "角色名已存在"},
					enname: {remote: "英文名已存在"}
				},
				submitHandler: function(form){
					var ids = [], nodes = tree.getCheckedNodes(true);
					for(var i=0; i<nodes.length; i++) {
						ids.push(nodes[i].id);
					}
					$("#menuIds").val(ids);
					var ids2 = [], nodes2 = tree2.getCheckedNodes(true);
					for(var i=0; i<nodes2.length; i++) {
						ids2.push(nodes2[i].id);
					}
					$("#officeIds").val(ids2);
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			}); */

			$("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		var ids = [], nodes = tree.getCheckedNodes(true);
				for(var i=0; i<nodes.length; i++) {
					ids.push(nodes[i].id);
				}
				$("#menuIds").val(ids);
				
	    		$.ajax({
		   			url:'${ctx}'+"/sys/role/save",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data) {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt(data.message, '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/sys/role/';
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
			
			
			
			
			
			
			var setting = {
				check:{enable:true,nocheckInherit:true},
				view:{selectedMulti:false},
				data:{simpleData:{enable:true}},
				callback:{beforeClick:function(id, node){
						tree.checkNode(node, !node.checked, true, true);
						return false;
					}}};
			
			// 用户-菜单
			var zNodes=[
					<c:forEach items="${menuList}" var="menu">{id:"${menu.id}", pId:"${not empty menu.parent.id?menu.parent.id:0}", name:"${not empty menu.parent.id?menu.name:'权限列表'}"},
		            </c:forEach>];
			// 初始化树结构
			window.tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
			//console.log(window.tree)
			// 不选择父节点
			tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
			// 默认选择节点
			var ids = "${role.menuIds}".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", ids[i]);
				try{tree.checkNode(node, true, false);}catch(e){}
			}
			// 默认展开全部节点
			tree.expandAll(true);
			
			// 用户-机构
			var zNodes2=[
					<c:forEach items="${officeList}" var="office">{id:"${office.orgNo}", pId:"${not empty office.parent?office.parent.orgNo:0}", name:"${office.name}"},
		            </c:forEach>];
		            
			// 初始化树结构
			var tree2 = $.fn.zTree.init($("#officeTree"), setting, zNodes2);
			// 不选择父节点
			tree2.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
			// 默认选择节点
			var ids2 = "${role.officeIds}".split(",");
			for(var i=0; i<ids2.length; i++) {
				var node = tree2.getNodeByParam("id", ids2[i]);
				try{tree2.checkNode(node, true, false);}catch(e){}
			}
			// 默认展开全部节点
			tree2.expandAll(false);
			// 刷新（显示/隐藏）机构
			refreshOfficeTree();
			$("#dataScope").change(function(){
				refreshOfficeTree();
			});
		});
		function refreshOfficeTree(){
			if($("#dataScope").val()==9){
				$("#officeTree").show();
			}else{
				$("#officeTree").hide();
			}
		}
	</script>
</head>
<body>
<style>
	.help-info{margin-left:13%;}
</style>
<div class="overall-layoutSEO">
	<form:form id="inputForm" modelAttribute="role" action="${ctx}/sys/role/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="suspend-card">
			<div class="form-group form-inline-align">
				<label class="control-label"><font color="red">*</font>归属机构：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${role.org.name}</p>
	              	</c:if>
	                <c:if test="${role.authMode=='edit'}">
	                     <sys:asynctreeselect id="org" name="org.orgNo" value="${role.org.orgNo}" labelName="org.name" labelValue="${role.org.name}"
						title="机构" url="/sys/org/asynctreeDataCompany?type=4" cssClass="required"/>
	                </c:if>
			</div>
			<div class="form-group form-inline-align">
				<label class="control-label"><font color="red">*</font>角色名称：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${role.roleName}</p>
	                </c:if>
	                <c:if test="${role.authMode=='edit'}">
		                        <form:input type="text" path="roleName"  class="form-control required"/>
	                </c:if>
			</div>
			<div class="form-group form-inline-align">
				<label class="control-label"><font color="red">*</font>角色编码：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${role.roleNo}</p>
	                </c:if>
	                <c:if test="${role.authMode=='edit'}">
		                        <form:input type="text"  path="roleNo" class="form-control required" />
	                </c:if>
			</div>
			<div class="form-group form-inline-align">
				<label class="control-label"><font color="red">*</font>英文名称：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${role.enname}</p>
	                </c:if>
	                <c:if test="${role.authMode=='edit'}">
		                        <form:input type="text"  path="enname" class="form-control" />
	                </c:if>
			</div>
			<div class="form-group form-inline-align">
				<label class="control-label"><font color="red">*</font>角色类型：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${role.roleType}</p>
	                </c:if>
	            <div class="form-control">
	                <c:if test="${role.authMode=='edit'}">
	                    <form:select path="roleType" class="form-control required ">
	                      	<form:option value="" label=""/>
						    <form:options items="${fns:getDictList('roleType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select> 
	               	</c:if>
	           
					<span class="help-inline help-info" title="activiti有3种预定义的组类型：security-role、assignment、user 如果使用Activiti Explorer，需要security-role才能看到manage页签，需要assignment才能claim任务">
						工作流组用户组类型（任务分配：assignment、管理角色：security-role、普通角色：user）</span>
			    </div>
			</div>
			<div class="form-group form-inline-align">
				<label class="control-label">是否系统数据：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${fns:getDictLabel(role.sysData, 'yes_no', '')}</p>
	                </c:if>
	                <div class="form-control">
	                <c:if test="${role.authMode=='edit'}">
	                      	<form:select path="sysData" class="form-control">
	                      	<form:option value="" label=""/>
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select> 
	                </c:if>
					<span class="help-inline help-info">“是”代表此数据只有超级管理员能进行修改，“否”则表示拥有角色修改人员的权限都能进行修改</span>
				 </div>
			  </div>
			<div class="form-group form-inline-align">
				<label class="control-label">是否可用</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${fns:getDictLabel(role.useAble, 'yes_no', '')}</p>
	                </c:if>
	                <div class="form-control">
	                <c:if test="${role.authMode=='edit'}">
	                      	<form:select path="useAble" class="form-control">
	                      	<form:option value="" label=""/>
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select> 
	                </c:if>
	                
					<span class="help-inline help-info">“是”代表此数据可用，“否”则表示此数据不可用</span>
				 </div>
				</div>
			<div class="form-group form-inline-align">
				<label class="control-label">数据范围：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
		                        <p class="form-control">${fns:getDictLabel(role.dataScope, 'sys_data_scope', '')}</p>
	                </c:if>
	                <div class="form-control">
	                <c:if test="${role.authMode=='edit'}">
	                      	<form:select path="dataScope"  class="form-control">
	                      	<form:option value="" label=""/>
						<form:options items="${fns:getDictList('sys_data_scope')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select> 
	                </c:if>
					<span class="help-inline help-info">特殊情况下，设置为“按明细设置”，可进行跨机构授权</span>
					</div>
				</div>
				<div class="form-group form-inline-align">
				<label class="control-label">备注：</label>
					<c:if test="${role.authMode=='view'  ||  role.authMode==''}">
	                        	<p class="form-control" >${role.remarks}&nbsp&nbsp&nbsp&nbsp</p>
	                </c:if>
	                <c:if test="${role.authMode=='edit'}">
	                       	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
	                </c:if>
			</div>
			<div class="form-group form-inline-align">
				<label class="control-label">角色授权：</label>
					<div id="menuTree" class="ztree" style="margin-top:3px;float:left;" ></div>
					<form:hidden path="menuIds"/>
					<div id="officeTree" class="ztree" style="margin-left:100px;margin-top:3px;float:left;"></div>
					<form:hidden path="officeIds"/>
			</div>
			<div style="clear:both;"></div>
			
		
		</div>
		<div class="toolbar-Onlybtn">
			<c:if test="${(role.sysData eq fns:getDictValue('是', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('是', 'yes_no', '1'))}">
				 <c:if test="${role.authMode=='edit'}">
					<shiro:hasPermission name="sys:role:edit">
						<button type="button" class="btn btn-main " id="submitForm">保存</button>
					</shiro:hasPermission>
                </c:if>
			</c:if>
			<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
		</div>
		
	</form:form>
</div>
</body>
</html>
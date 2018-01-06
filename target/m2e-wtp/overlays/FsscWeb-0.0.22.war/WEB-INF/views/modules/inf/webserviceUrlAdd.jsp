<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>接口地址添加</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#value").focus();
            $("#inputForm").validate({
                submitHandler: function(form){
                    var id = $("#id").val();
                    console.log(id);
                    if(id == '' || id == 'undefined') {
                        if(!verificateName()) {
                            return false;
                        }
                    }
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
            });
            
            $("#submitForm").click(function(){
	    		if(!$("#inputForm").valid()){
					return;
				}
	    		$.ajax({
		   			url:'${ctx}'+"/web/saveUrl",
		   			data:$("#inputForm").serialize(),
		   			dataType:"json",
		   			type:"post",
		   			success:function(data){
		   			 if (data && data == "success") {
						/* window.location=ctx + '/sys/employee/list'; */
						$.jBox.prompt('保存成功。', '提示', 'info', {
							closed : function() {
								$.jBox.tip("正在处理，请稍候....", "loading");
								location.href = ctx + '/web/index';
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

        function verificateName() {
            var name = $("#name").val();
            var canSave = true;
            $.ajax({
                async:false,
                url: ctx + "/web/checkName",
                type: "POST",
                dataType: "json",
                data: {
                    'name' : $("#name").val()
                },
                success: function(data){
                    if(data.result == "approve") {
                        $("#rejectUse").attr("hidden", "hidden");
                        $("#canUse").removeAttr("hidden");
                    } else {
                        canSave = false;
                        $("#canUse").attr("hidden", "hidden");
                        $("#rejectUse").removeAttr("hidden");
                    }
                }
            });
            return canSave;
        }
    </script>
</head>
<body>
<div class="overall-layoutSEO">
<input id="id" hidden="hidden" value="${webserviceUrl.id}">
<br/>
<form:form id="inputForm" modelAttribute="webserviceUrl" action="${ctx}/web/saveUrl" method="post" class="form-inline">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="suspend-card">
    <div class="form-group suspend-cardForm">
        <div class="controls">
        	<label class="control-label"><font style="color: red;">(名称不能重复)</font>名称:</label>
            <c:if test="${webserviceUrl.authMode == 'view'||webserviceUrl.authMode==''}">
	        	<p class="form-control">${webserviceUrl.name}</p>
		    </c:if>
            <c:if test="${webserviceUrl.authMode == 'edit'}">
		           <form:input id="name" path="name" htmlEscape="false" class="required"/> 
		          
		            <input id=" verificated" class="btn btn-primary" type="button" value="校验" onclick="verificateName()"/>
		            <span id="canUse" style="color: #00aa00" hidden="hidden">
		                <img src="${ctxStatic}/sysImages/icon-success.png" height="20" width="20">
		            </span>
		            <span id="rejectUse" style="color: red" hidden="hidden">该名称已被使用!!!</span>
            </c:if>
        </div>

    </div>
    <div class="form-group suspend-cardForm">
        <label class="control-label">服务端类型:</label>
        <%-- <div class="controls">
            <form:input path="serverType" htmlEscape="false" class="required"/>
        </div> --%>
        <c:if test="${webserviceUrl.authMode == 'view'||webserviceUrl.authMode==''}">
	        <p class="form-control">${webserviceUrl.serverType}</p>
	    </c:if>
	    <c:if test="${webserviceUrl.authMode == 'edit'}">
			<form:input path="serverType" htmlEscape="false" maxlength="200"	class="form-control" />
		</c:if>
    </div>
    <div class="form-group suspend-cardForm">
        <label class="control-label">url地址:</label>
        <%-- <div class="controls">
            <form:input path="urlAddress" htmlEscape="false" class="required"/>
        </div> --%>
        <c:if test="${webserviceUrl.authMode == 'view'||webserviceUrl.authMode==''}">
	        <p class="form-control">${webserviceUrl.urlAddress}</p>
	    </c:if>
	    <c:if test="${webserviceUrl.authMode == 'edit'}">
			<form:input path="urlAddress" htmlEscape="false" maxlength="200"	class="form-control" />
		</c:if>
    </div>
    <div class="form-group suspend-cardForm">
        <label class="control-label">命名空间:</label>
        <%-- <div class="controls">
            <form:input path="namespace" htmlEscape="false" class="required"/>
        </div> --%>
        <c:if test="${webserviceUrl.authMode == 'view'||webserviceUrl.authMode==''}">
	        <p class="form-control">${webserviceUrl.namespace}</p>
	    </c:if>
	    <c:if test="${webserviceUrl.authMode == 'edit'}">
			<form:input path="namespace" htmlEscape="false" maxlength="200"	class="form-control" />
		</c:if>
    </div>
    <div class="form-group form-inline-align" style="text-align:right;">
        <label class="control-label">备注:</label>
        <%-- <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="3" class="input-xlarge"/>
        </div> --%>
       	<c:if test="${webserviceUrl.authMode == 'view'||webserviceUrl.authMode==''}">
	        <p class="form-control" >${webserviceUrl.remarks}</p>
	    </c:if>
	    <c:if test="${webserviceUrl.authMode == 'edit'}">
			<%-- <form:textarea path="remarks" htmlEscape="false" maxlength="200" class="form-control" /> --%>
			<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="4000" class="form-control"/>
		</c:if>
    </div>
	<div class="toolbar-Onlybtn">
		<c:if test="${webserviceUrl.authMode == 'edit'}">
			<button type="button" class="btn btn-main " id="submitForm">保存</button>
		</c:if>
			<button type="button" class="btn btn-main " onclick="history.go(-1)">返回</button>
	</div>
	</div>
</form:form>
</div>
</body>
</html>
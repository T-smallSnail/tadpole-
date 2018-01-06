<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="隐藏域值（ID）"%>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="输入框名称（Name）"%>
<%@ attribute name="labelValue" type="java.lang.String" required="true" description="输入框值（Name）"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题"%>
<%@ attribute name="url" type="java.lang.String" required="true" description="树结构数据地址"%>
<%@ attribute name="checked" type="java.lang.Boolean" required="false" description="是否显示复选框，如果不需要返回父节点，请设置notAllowSelectParent为true"%>
<%@ attribute name="extId" type="java.lang.String" required="false" description="排除掉的编号（不能选择的编号）"%>
<%@ attribute name="isAll" type="java.lang.Boolean" required="false" description="是否列出全部数据，设置true则不进行数据权限过滤（目前仅对Office有效）"%>
<%@ attribute name="notAllowSelectRoot" type="java.lang.Boolean" required="false" description="不允许选择根节点"%>
<%@ attribute name="notAllowSelectParent" type="java.lang.Boolean" required="false" description="不允许选择父节点"%>
<%@ attribute name="module" type="java.lang.String" required="false" description="过滤栏目模型（只显示指定模型，仅针对CMS的Category树）"%>
<%@ attribute name="selectScopeModule" type="java.lang.Boolean" required="false" description="选择范围内的模型（控制不能选择公共模型，不能选择本栏目外的模型）（仅针对CMS的Category树）"%>
<%@ attribute name="allowClear" type="java.lang.Boolean" required="false" description="是否允许清除"%>
<%@ attribute name="allowInput" type="java.lang.Boolean" required="false" description="文本框可填写"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="smallBtn" type="java.lang.Boolean" required="false" description="缩小按钮显示"%>
<%@ attribute name="hideBtn" type="java.lang.Boolean" required="false" description="是否显示按钮"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled"%>
<%@ attribute name="dataMsgRequired" type="java.lang.String" required="false" description=""%>
<%@ attribute name="queryParms" type="java.lang.String" required="false" description="动态传入参数属性,多个用','分割"%>
<%@ attribute name="callBack" type="java.lang.String" required="false" description="回调函数"%>
<div class="input-append ">
	<input id="${id}Id" name="${name}" class="${cssClass}" type="hidden" value="${value}"/>
	<input id="${id}Name" name="${labelName}" ${allowInput?'':'readonly="readonly"'} callBack="${callBack}" type="text" value="${labelValue}" data-msg-required="${dataMsgRequired}"
		class="${cssClass} form-control icon-sameAttr16   defined-search  readonlyBcff"  style="${cssStyle} border-radius:4px;  width: 100%;  background-size: 16px 16px; background-position: 96% 6px;"/>
		
	<a id="${id}Button" href="javascript:" class="<%-- btn ${disabled} ${hideBtn ? 'hide' : ''} --%>" style="<%-- ${smallBtn?'padding:4px 2px;':''} --%>">&nbsp;<!-- <i class="icon-search"></i> -->&nbsp;</a>&nbsp;&nbsp;
</div>
<script type="text/javascript">
	$("#${id}Button, #${id}Name").click(function(){
		// 是否限制选择，如果限制，设置为disabled
		if ($("#${id}Button").hasClass("disabled")){
			return true;
		}
		var parms = returnParms("${queryParms}");
		var callBack = "${callBack}";
		// 正常打开
		top.$.jBox.open("iframe:${ctx}/tag/asynctagTreeselect?url="+encodeURIComponent("${url}")+"&module=${module}&checked=${checked}&extId=${extId}&isAll=${isAll}&queryParms="+parms, "选择${title}", 400, 560, {opacity: 0.5,
			ajaxData:{selectIds: $("#${id}Id").val()},buttons:{"确定":"ok", ${allowClear?"\"清除\":\"clear\", ":""}"关闭":true}, submit:function(v, h, f){
				if (v=="ok"){
					var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
					var ids = [], names = [], nodes = [];
					if ("${checked}" == "true"){
						nodes = tree.getCheckedNodes(true);
					}else{
						nodes = tree.getSelectedNodes();
					}
					for(var i=0; i<nodes.length; i++) {//<c:if test="${checked && notAllowSelectParent}">
						if (nodes[i].isParent){
							continue; // 如果为复选框选择，则过滤掉父节点
						}//</c:if><c:if test="${notAllowSelectRoot}">
						if (nodes[i].level == 0){
							top.$.jBox.tip("不能选择根节点（"+nodes[i].name+"）请重新选择。");
							return false;
						}//</c:if><c:if test="${notAllowSelectParent}">
						if (nodes[i].isParent){
							top.$.jBox.tip("不能选择父节点（"+nodes[i].name+"）请重新选择。");
							return false;
						}//</c:if><c:if test="${not empty module && selectScopeModule}">
						if (nodes[i].module == ""){
							top.$.jBox.tip("不能选择公共模型（"+nodes[i].name+"）请重新选择。");
							return false;
						}else if (nodes[i].module != "${module}"){
							top.$.jBox.tip("不能选择当前栏目以外的栏目模型，请重新选择。");
							return false;
						}//</c:if>
						ids.push(nodes[i].id);
						names.push(nodes[i].name);//<c:if test="${!checked}">
						break; // 如果为非复选框选择，则返回第一个选择  </c:if>
					}
					$("#${id}Id").val(ids.join(",").replace(/u_/ig,""));
					$("#${id}Name").val(names.join(","));
					
					//回调函数不为NULL
					if(null != callBack && callBack != '' ){
					    var func=eval(callBack);
					    new func();
					}
				      
				}//<c:if test="${allowClear}">
				else if (v=="clear"){
					$("#${id}Id").val("");
					$("#${id}Name").val("");
                }//</c:if>
				if(typeof ${id}TreeselectCallBack == 'function'){
					${id}TreeselectCallBack(v, h, f);
				}
			}, loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
				$(".jbox-state>div", top.document).css("width","100%");
			}
		});
	});
	
function returnParms(query_parm) {

	var isEmpty = true;
	var val = "";
	var parms = "";
	var parmId ="";
	if (query_parm.indexOf(",") > 0) {	// where 后面有多个查询条件的
		var arr = query_parm.split(",");	// a@,b
		for (var i = 0; i < arr.length; i++) {
			
			val = document.getElementsByName(arr[i])[0].value;
			if (val != null && val != "" && typeof(val) != 'undefined') {
				val = val.replace(/\,/g, "");
				
				parms += arr[i] + "=" + val;
				parms += ",";
				isEmpty = false;
				if (isHadChineseChart(val)) {
					var len = getStrLength(val);
					if (len < 4) {
						sAlert("请输入最少两个汉字进行查询!");
						return false;
					}
				}
			}
		}
		if (isEmpty) {
			// sAlert("请在相应页面属性输入值后，再点击放大镜查询!");
			// return false;
		}
		parms = parms.substring(0,parms.length-1); 
	} else {// 只有一个查询条件的
		if (query_parm != "") {
			if (query_parm.indexOf("@") > 0) {
				val = document.getElementsByName(query_parm.split("@")[0])[0].value;
			} else {
				val = document.getElementsByName(query_parm)[0].value;
				val = val.replace(/\,/g, "");
			}
			if (val == "") {
				// sAlert("请在相应页面属性输入值后，再点击放大镜查询!");
				// return false;
			} else {
				parms = query_parm + "=" + val;
			}
		}
	}
	
	return parms;
}

function isHadChineseChart(str){
	if(/.*[\u4e00-\u9fa5]+.*$/.test(str)){
		return true;
	}
	return false;
}
</script>
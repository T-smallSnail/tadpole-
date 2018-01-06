<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.thinkgem.jeesite.modules.sys.entity.TreeConf"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	TreeConf treeconf = (TreeConf) request.getAttribute("treeconf");
	String tri_func = treeconf.getTriFunc();
	String tri_lev = treeconf.getTriLev();
	String select_type = treeconf.getSelectType();
	String parms = treeconf.getParams();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>通用树配置测试</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.js"></script>
<script src="${ctxStatic}/pop/pop.js" type="text/javascript"></script>


<link rel="stylesheet" type="text/css"
	href="<%=basePath%>static/bootstrap/2.3.1/css_cerulean/bootstrap.css">

<script type="text/javascript">
	var parms = "<%=parms%>";

	function func_PopTree(scene_id) {
		// 是否限制选择，如果限制，设置为disabled
		if ($("#companyButton").hasClass("disabled")) {
			return true;
		}
		// 正常打开	
		top.$.jBox.open("iframe:/FsscWeb/a/sys/treeConf/treeselect?url="
				+ encodeURIComponent("/sys/treeConf/treeData") + "&sceneId="
				+ scene_id + "&module=&checked=&extId=&isAll=", "选择部门", 300,
				420, {
					ajaxData : {
						selectIds : $("#addressId").val()
					},
					buttons : {
						"确定" : "ok",
						"清除" : "clear",
						"关闭" : true
					},
					submit : function(v, h, f) {
						if (v == "ok") {
							var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
							var ids = [], names = [], nodes = [];
							if ("" == "true") {
								nodes = tree.getCheckedNodes(true);
							} else {
								nodes = tree.getSelectedNodes();
							}
							for (var i = 0; i < nodes.length; i++) {//
								if (nodes[i].isParent) {
									top.$.jBox.tip("不能选择父节点（" + nodes[i].name
											+ "）请重新选择。");
									return false;
								}//
								ids.push(nodes[i].id);
								names.push(nodes[i].name);//
								break; // 如果为非复选框选择，则返回第一个选择  
							}

							if ("" != parms && parms != null) {
								var params_arr = parms.split(",");
								for (var i = 0; i < params_arr.length; i++) {
									if ('id' == params_arr[i].split("-")[1]) {
										$('#' + params_arr[i].split("-")[0])
												.val(
														ids.join(",").replace(
																/u_/ig, ""));
									}
									if ('name' == params_arr[i].split("-")[1]) {
										$('#' + params_arr[i].split("-")[0])
												.val(names.join(","));
									}
								}
							}
						} else if (v == "clear") {
							if ("" != parms && parms != null) {
								var params_arr = parms.split(",");
								for (var i = 0; i < params_arr.length; i++) {
									if ('id' == params_arr[i].split("-")[1]) {
										$('#' + params_arr[i].split("-")[0])
												.val("");
									}
									if ('name' == params_arr[i].split("-")[1]) {
										$('#' + params_arr[i].split("-")[0])
												.val("");
									}
								}
							}
						}
						if (typeof orgTreeselectCallBack == 'function') {
							orgTreeselectCallBack(v, h, f);
						}
					},
					loaded : function(h) {
						$(".jbox-content", top.document).css("overflow-y",
								"hidden");
					}
				});
	}
</script>

</head>

<body>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;id:
	<input type="text" id="areaId" style="width: 180px; padding: 13px"
		name="areaId" disabled="true" />
	<br /> 行政地址:
	<input type="text" value="" style="width: 180px; padding: 13px"
		id="address" readonly name="address" />
	<a id="companyButton" href="javascript:func_PopTree('${sceneId}','')"
		class="btn" style="padding: 4px">&nbsp;<i class="icon-search"></i>&nbsp;
	</a>
</body>
</html>

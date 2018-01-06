<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据选择</title>
	<meta name="decorator" content="blank"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
	 $(window).load(function(){
		 $("#tree").mCustomScrollbar({
			 advanced:{
				updateOnContentResize:true, /*auto-update scrollbars on content resize (for dynamic content): boolean*/
				autoExpandHorizontalScroll:false, /*auto-expand width for horizontal scrolling: boolean*/
				autoScrollOnFocus:true, /*auto-scroll on focused elements: boolean*/
				normalizeMouseWheelDelta:true /*normalize mouse-wheel delta (-1/1)*/
			}});
         
     });
		var key, lastValue = "", nodeList = [], type = getQueryString("type", "${url}");
	/* 	alert("${ctx}${url}"); */
		var tree, setting = {view:{selectedMulti:false,dblClickExpand:false},check:{enable:"${checked}",nocheckInherit:true},
				async:{enable:(type==4),url:"${ctx}${url}${fn:indexOf(url,'?')==-1?'?':'&'}&extId=${extId}&isAll=${isAll}&module=${module}&queryParms=${queryParms}",autoParam:["id","pId" ,"name=n", "level=lv"]},
				data:{simpleData:{enable:true}},callback:{
					onClick:function(event, treeId, treeNode){
					/* 	tree.expandNode(treeNode); */
					},onAsyncSuccess: zTreeOnAsyncSuccess
				}
			};
	 
		function expandNodes(nodes) {
			if (!nodes) return;
			for (var i=0, l=nodes.length; i<l; i++) {
				tree.expandNode(nodes[i], true, false, false);
				if (nodes[i].isParent && nodes[i].zAsync) {
					expandNodes(nodes[i].children);
				}
			}
		}
		$(document).ready(function(){
	/* 		$.get("${ctx}${url}${fn:indexOf(url,'?')==-1?'?':'&'}&extId=${extId}&isAll=${isAll}&module=${module}&queryParms=${queryParms}&t="
					+ new Date().getTime(), function(zNodes){  */
				// 初始化树结构
				tree = $.fn.zTree.init($("#tree"), setting);
				
				// 默认展开一级节点
			/* 	var nodes = tree.getNodesByParam("level", 0);
				for(var i=0; i<nodes.length; i++) {
					tree.expandNode(nodes[i], true, false, false);
				}
				//异步加载子节点（加载用户）
				var nodesOne = tree.getNodesByParam("isParent", true);
				for(var j=0; j<nodesOne.length; j++) {
					tree.reAsyncChildNodes(nodesOne[j],"!refresh",true);
				}
				selectCheckNode(); */
			/* }); */
			key = $("#key");
			key.bind("focus", focusKey).bind("blur", blurKey).bind("change cut input propertychange", searchNode);
			key.bind('keydown', function (e){if(e.which == 13){searchNode();}});
			setTimeout("search();", "300");
		});
		
		// 默认选择节点
		function selectCheckNode(){
			var ids = "${selectIds}".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", (type==3?"u_":"")+ids[i]);
				if("${checked}" == "true"){
					try{tree.checkNode(node, true, true);}catch(e){}
					tree.selectNode(node, false);
				}else{
					tree.selectNode(node, true);
				}
			}
		}
	  	function focusKey(e) {
			if (key.hasClass("empty")) {
				key.removeClass("empty");
			}
		}
		function blurKey(e) {
			if (key.get(0).value === "") {
				key.addClass("empty");
			}
			searchNode(e);
		}
		
		//搜索节点
		function searchNode() {
			// 取得输入的关键字的值
			var value = $.trim(key.get(0).value);
			
			// 按名字查询
			var keyType = "name";<%--
			if (key.hasClass("empty")) {
				value = "";
			}--%>
			
			// 如果和上次一次，就退出不查了。
			if (lastValue === value) {
				return;
			}
			
			// 保存最后一次
			lastValue = value;
			
			var nodes = tree.getNodes();
			// 如果要查空字串，就退出不查了。
			if (value == "") {
				showAllNode(nodes);
				return;
			}
			hideAllNode(nodes);
			nodeList = tree.getNodesByParamFuzzy(keyType, value);
			updateNodes(nodeList);
		}
		
		//隐藏所有节点
		function hideAllNode(nodes){			
			nodes = tree.transformToArray(nodes);
			for(var i=nodes.length-1; i>=0; i--) {
				tree.hideNode(nodes[i]);
			}
		}
		
		//显示所有节点
		function showAllNode(nodes){			
			nodes = tree.transformToArray(nodes);
			for(var i=nodes.length-1; i>=0; i--) {
				/* if(!nodes[i].isParent){
					tree.showNode(nodes[i]);
				}else{ */
					if(nodes[i].getParentNode()!=null){
						tree.expandNode(nodes[i],false,false,false,false);
					}else{
						tree.expandNode(nodes[i],true,true,false,false);
					}
					tree.showNode(nodes[i]);
					showAllNode(nodes[i].children);
				/* } */
			}
		}
		
		//更新节点状态
		function updateNodes(nodeList) {
			tree.showNodes(nodeList);
			for(var i=0, l=nodeList.length; i<l; i++) {
				
				//展开当前节点的父节点
				tree.showNode(nodeList[i].getParentNode()); 
				//tree.expandNode(nodeList[i].getParentNode(), true, false, false);
				//显示展开符合条件节点的父节点
				while(nodeList[i].getParentNode()!=null){
					tree.expandNode(nodeList[i].getParentNode(), true, false, false);
					nodeList[i] = nodeList[i].getParentNode();
					tree.showNode(nodeList[i].getParentNode());
				}
				//显示根节点
				tree.showNode(nodeList[i].getParentNode());
				//展开根节点
				tree.expandNode(nodeList[i].getParentNode(), true, false, false);
			}
		}
		
		// 开始搜索
		function search() {
			$("#search").slideToggle(200);
			$("#txt").toggle();
			$("#key").focus();
		}
		var firstAsyncSuccessFlag = 0;  
		function zTreeOnAsyncSuccess(event, treeId, msg) { 
		if (firstAsyncSuccessFlag == 0) {    
		                 var zTree = $.fn.zTree.getZTreeObj("tree");  
		                 //调用默认展开第一个结点    
		                 var selectedNode = zTree.getSelectedNodes();    
		                 var nodes = zTree.getNodes();    
		                 zTree.expandNode(nodes[0], true);    
		                
		                 var childNodes = zTree.transformToArray(nodes[0]);    
		               /*   zTree.expandNode(childNodes[1], true);     */
		                   
		                 var childNodes1 = zTree.transformToArray(childNodes[1]);    
		                 zTree.checkNode(childNodes1[1], true, true);    
		                 zTree.selectNode(childNodes1[1]); //选中第一个父节点下面第一个子节点  
		                 zTree.expandNode(childNodes1[1], true);   
		                 zTree.setting.callback.onClick(null, zTree.setting.treeId, childNodes1[1]);//点击第一个父节点下面第一个子节点  
		                 var childNodes2 = zTree.transformToArray(childNodes1[1]);   
		                 zTree.checkNode(childNodes2[1], true, true);  
		                 firstAsyncSuccessFlag = 1;    
		                
		     }    
		} 
	</script>
</head>
<body>

	<div id="search" class="form-search hide" style="padding:10px 0 0 13px; position:relative;">
		<label for="key" class="control-label" style="padding:5px 5px 3px 0;">关键字：</label>
		<input type="text" class="empty" id="key" name="key" maxlength="50" style="width:110px;">
		<button class="btn btn-auxiliaty" id="btn" onclick="searchNode()">搜索</button>
		<div style="position:absolute;right:8px;top:5px;cursor:pointer;" onclick="search();">
			<!-- <i class="icon-search"></i><label id="txt">搜索</label> -->
			<i ></i><label id="txt">搜索</label>
		</div>
	</div>
	<div id="tree" class="ztree" style="padding:15px 20px;"></div>
</body>






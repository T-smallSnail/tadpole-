<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<style type="text/css">
		.ztree {overflow:auto;margin:0;margin-top:10px;padding:10px 0 0 10px;}
	</style>
</head>
<body>
	<sys:message content="${message}"/>
	<div id="content" class="row-fluid">
		<div id="left" class="accordion-group">
			<div class="accordion-heading">
		    	<a class="accordion-toggle">组织机构<i class="icon-refresh pull-right" onclick="refreshTree();"></i></a>
		    </div>
			<div id="ztree" class="ztree"></div>
		</div>
		<div id="openClose" class="close">&nbsp;</div>
		<div id="right">
			<iframe id="officeContent" src="${ctx}/sys/user/list" width="100%" height="91%" frameborder="0"></iframe>
		</div>
	</div>
	<script type="text/javascript">
	 $(window).load(function(){
		 $("#ztree").mCustomScrollbar({
			 advanced:{
				updateOnContentResize:true, /*auto-update scrollbars on content resize (for dynamic content): boolean*/
				autoExpandHorizontalScroll:false, /*auto-expand width for horizontal scrolling: boolean*/
				autoScrollOnFocus:true, /*auto-scroll on focused elements: boolean*/
				normalizeMouseWheelDelta:true /*normalize mouse-wheel delta (-1/1)*/
			}});
         
     });
		var tree, setting = {view:{selectedMulti:false,dblClickExpand:false},check:{enable:false,nocheckInherit:true},
				async:{enable:true, url:"${ctx}/sys/org/asynctreeData",autoParam:["id", "name=n", "level=lv"]},
				data:{simpleData:{enable:true}},callback:{
					onClick:function(event, treeId, treeNode){
						var id = treeNode.id == '0' ? '' :treeNode.id;
						$('#officeContent').attr("src","${ctx}/sys/user/list?company.orgNo="+id+"&company.name="+encodeURI(treeNode.name));
					},
				onAsyncSuccess:  zTreeOnAsyncSuccess
				}
			};
		$(document).ready(function(){
			tree = $.fn.zTree.init($("#ztree"), setting);
			
		});
		var firstAsyncSuccessFlag = 0;  
		function zTreeOnAsyncSuccess(event, treeId, msg) { 
		if (firstAsyncSuccessFlag == 0) {    
		                 var zTree = $.fn.zTree.getZTreeObj("ztree");  
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
		 
		var leftWidth = 300; // 左侧窗口大小
		var htmlObj = $("html"), mainObj = $("#main");
		var frameObj = $("#left, #openClose, #right, #right iframe");
		function wSize(){
			var strs = getWindowSize().toString().split(",");
			htmlObj.css({"overflow-x":"hidden", "overflow-y":"hidden"});
			mainObj.css("width","auto");
			frameObj.height(strs[0] - 5);
			var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
			$("#right").width($("#content").width()- leftWidth - $("#openClose").width() -5);
			$(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
			
		}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>
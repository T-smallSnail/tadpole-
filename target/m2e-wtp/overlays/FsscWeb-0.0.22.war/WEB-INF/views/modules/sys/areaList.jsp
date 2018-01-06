<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>区域管理</title>
<meta name="decorator" content="default" />
<%@include file="/WEB-INF/views/include/treetable.jsp"%>
<script type="text/javascript">
		var dataSon=[],grandSon=[];		
		$(document).ready(function() {
			$("#treeTable").on("click","tr",function(){
				var trs=$(this).siblings();
				trs.removeClass('dbe8fc');
				$(this).addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, rootId = "0";
			for(var i in data){
				if(data[i].parentId=="000000"||data[i].parentId=="0")dataSon.push(data[i]);
				else grandSon.push(data[i]);				
			}
			addRow("#treeTableList", tpl, dataSon, rootId, true);
			var options={
					beforeExpand:function($treeTable, id){
						if ($('.' + id, $treeTable).length) { return; }
			            //这里的html可以是ajax请求
			           addChilds($treeTable,tpl,grandSon,id);
					},
					expandLevel:1,
					theme:"default"
			};
			$("#treeTable").treeTable(options);
			
		/* 	$("#treeTable td").click(function() {
				$('.dbe8fc').removeClass('dbe8fc');
				$(this).parent('tr').find('td').addClass('dbe8fc');
				$('#delBtn').addClass('text-corEC6868');
			});
				 */
					$("#delBtn").bind("click", {'url' : "${ctx}/sys/area/delete", 'tableId' : 'treeTable'}, operation.dele);
			/* $("#newBtn").bind("click", {'url' : "${ctx}/sys/area/form", 'title' : "新增", 'width' : 1200, 'height' : 600}, operation.open);
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/area/delete", 'tableId' : 'treeTable'}, operation.dele);
			 */
		});
		function addChilds($treeTable,tpl,data,pid){
			var leftData=[];
			var parentNode=$("#"+pid);
			for (var i=0; i<data.length; i++){
				var row = data[i];
				var hasChild=false;
				for(var j in grandSon){
					if(grandSon[j].parentId==row.id){
						hasChild=true;
						break;
					}
				}
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$treeTable.addChilds(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, row.type)
						}, pid:pid, row: row,hasChild:hasChild?hasChild:""
					}));
				}else leftData.push(row);
			}
			grandSon=leftData;
		}
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				var hasChild=false;
				for(var j in grandSon){
					if(grandSon[j].parentId==row.id){hasChild=true;break;}
				}
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, row.type)
						}, pid: (root?0:pid), row: row,hasChild:hasChild?hasChild:""
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
		 function addLine(){
		    	window.location.href="${ctx}/sys/area/form?authMode=edit";
		    }
	</script>
</head>
<body>
	<sys:message content="${message}" />
	<div class="pr">
		<sys:message content="${message}" />
		<div class="only-textBtnDiv">
			<ul class="nav nav-tabs only-textBtn">
				<li id="delBtn">删除</li>
				<li onclick="addLine()" class="text-active">添加</li>
			</ul>
		</div>
		<div class="daiding">
			<table id="treeTable"
				class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<tr>
						<th>区域名称</th>
						<th>区域编码</th>
						<th>区域类型</th>
						<th>备注</th>
						<shiro:hasPermission name="sys:area:edit">
							<th>操作</th>
						</shiro:hasPermission>
					</tr>
				</thead>
				<tbody id="treeTableList"></tbody>
			</table>
		</div>
	</div>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}" hasChild="{{hasChild}}" class="{{pid}}">
			<td><a href="${ctx}/sys/area/form?id={{row.id}}&authMode=view">{{row.name}}</a></td>
			<td>{{row.code}}</td>
			<td>{{dict.type}}</td>
			<td>{{row.remarks}}</td>
			<shiro:hasPermission name="sys:area:edit"><td>
				<a href="${ctx}/sys/area/form?id={{row.id}}&authMode=edit">修改</a>
				<a href="${ctx}/sys/area/form?parent.id={{row.id}}">添加下级区域</a>
			</td></shiro:hasPermission>
			<input type="hidden" value="{{row.id}}" />
		</tr>
	</script>
</body>
</html>
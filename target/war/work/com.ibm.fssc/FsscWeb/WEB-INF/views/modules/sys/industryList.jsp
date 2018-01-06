<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>行业信息管理</title>
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
			var data = ${fns:toJson(list)}, rootId = "";
			for(var i in data){
				if(data[i].pindustryNo=="5059"||data[i].industryNo=="5059")dataSon.push(data[i]);
				else grandSon.push(data[i]);				
			}
			addRow("#treeTableList", tpl, dataSon, rootId, true);
			var options={
					beforeExpand:function($treeTable, id){
						if ($('.' + id, $treeTable).length) { return; }
			            //这里的html可以是ajax请求
			           addChilds($treeTable,tpl,grandSon,id);
					},
					expandLevel:2,
					theme:"default"
			};
			$("#treeTable").treeTable(options);
			$("#delBtn").bind("click", {'url' : "${ctx}/sys/industry/delete", 'tableId' : 'treeTable'}, operation.dele);
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		/* grandson nodes */
		function addChilds($treeTable,tpl,data,pid){
			var leftData=[];
			for (var i=0; i<data.length; i++){
				var row = data[i];
				var hasChild=false;
				for(var j in grandSon){
					if(grandSon[j].pindustryNo==row.industryNo){
						hasChild=true;
						break;
					}
				}
				if ((${fns:jsGetVal('row.pindustryNo')}) == pid){
					$treeTable.addChilds(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, row.type)
						}, pid:pid, row: row,hasChild:hasChild?hasChild:""
					}));
				}else leftData.push(row);
			}
			grandSon=leftData;
		}
		/* initial nodes */
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				var hasChild=false;
				for(var j in grandSon){
					if(grandSon[j].pindustryNo==row.industryNo){hasChild=true;break;}
				}
				if ((${fns:jsGetVal('row.pindustryNo')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('belong_industry'))}, row.type)
						}, pid: (root?"":pid), row: row,hasChild:hasChild?hasChild:""
					}));
					addRow(list, tpl, data, row.industryNo);
				}
			}
		}
		  //新增明细行
	    function addLine(){
	    	window.location.href="${ctx}/sys/industry/form?authMode=edit";
	    }
	</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/industry/">行业信息列表</a></li>
		<shiro:hasPermission name="sys:industry:edit"><li><a href="${ctx}/sys/industry/form">行业信息添加</a></li></shiro:hasPermission>
	</ul> --%>
	<%-- <form:form id="searchForm" modelAttribute="industry"
		action="${ctx}/sys/industry/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>行业编号：</label> <form:input path="industryNo"
					htmlEscape="false" maxlength="60" class="input-medium" /></li>
			<li><label>行业名称：</label> <form:input path="industryName"
					htmlEscape="false" maxlength="200" class="input-medium" /></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form> --%>
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
						<th>行业编号</th>
						<th>行业名称</th>
						<th>上级行业编号</th>
						<th>类型</th>
						<th>更新日期</th>
						<th>标识</th>
						<shiro:hasPermission name="sys:industry:edit">
							<th>操作</th>
						</shiro:hasPermission>
					</tr>
				</thead>
				<tbody id="treeTableList"></tbody>
			</table>
		</div>
	</div>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.industryNo}}" pId="{{pid}}"  hasChild="{{hasChild}}">
			<td><a href="${ctx}/sys/industry/form?id={{row.id}}&authMode=view">
				{{row.industryNo}}
			</a></td>
			<td>
				{{row.industryName}}
			</td>
			<td>
				{{row.pindustryNo}}
			</td>
			<td>
				{{row.type}}
			</td>
			<td>
				{{row.updateDate}}
			</td>
			<td>
				{{row.remarks}}
			</td>
			<shiro:hasPermission name="sys:industry:edit"><td>
				<a href="${ctx}/sys/industry/form?id={{row.id}}&authMode=edit">修改</a>
				<a href="${ctx}/sys/industry/form?parent.id={{row.id}}">添加下级行业</a> 
			</td></shiro:hasPermission>
			<input type="hidden" value="{{row.id}}"/>
		</tr>
	</script>
</body>
</html>
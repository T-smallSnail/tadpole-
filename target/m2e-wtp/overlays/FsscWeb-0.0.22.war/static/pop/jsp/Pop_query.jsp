<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<link rel="stylesheet" href="${ctxStatic}/pop/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="${ctxStatic}/pop/definedCss/shuttleBoxIndex.css" />
		<script src="${ctxStatic}/pop/bootstrap/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<style data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-926" data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_query.jsp">
.form-inline .form-control{
	float: none;
	width: 50%;
}

</style>
	<s:form method="post" theme="simple" name="cms_form" action="#" class="form-inline"  role="form">
	
			<div  style="float;width:77%;" id="queryInputDiv">
				
			</div>
			
			<div style="float: left;margin-top:12px;margin-left: 15px;">
				 <input class="btn btn-main" type="button" value="查询" onclick="query()"  style="float: right" />
			</div>
			<!-- <label id="queryDisName"></label>
			<input type="search" id="searchInput" class="form-control icon-sameAttr16 "  placeholder="搜索" style="width: 77%;float:none;"/>
			 <input class="btn btn-primary" type="button" value="查询" onclick="query()"  style="float: right" />
		 -->
	
	</s:form>
	<script type="text/javascript">
	var pageInit=true;
	var queryName="";
	//获取注入
	function query() {
		/*override the query function  */
		queryOptions.isInit="true";
		queryOptions.params="";
		var queryNames=queryName.split(",");
		var queryInputs=$("#queryInputDiv").find("input");
		for(var i=0;i<queryNames.length;i++){
			var value=queryInputs[i].value.trim();
			if(i==0)queryOptions.params+=queryNames[i]+"="+value;
			else
			queryOptions.params+=","+queryNames[i]+"="+value;
		}
		execQuery(queryOptions); 
		
	}
</script>

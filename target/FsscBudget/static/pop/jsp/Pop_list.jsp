<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${ctxStatic}/pop/bootstrap/js/jquery-1.8.3.min.js" type="text/javascript"></script>

<style data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-924" data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_list.jsp">
	#tabPage .count-size,#tabPage .count-size:hover,#tabPage .count-size:focus{color: #999999;font-size:14px;background: transparent;border:none; }
	.pagination{margin:0px;}
	.pagination a{font-size: 14px;padding: 4px 9px !important;}
	.pagination .pagination-li a,.pagination .pagination-li a:hover,.pagination .pagination-li a:focus{background:#2EA1F8;color:#fff;border-color:#2EA1F8;}
    .pagination .pagination-li .disableHref,.pagination .pagination-li .disableHref:hover,.pagination .pagination-li .disableHref:focus{background:#2EA1F8;border-color:#ddd;}
    .pagination .pagination-li .disableHref:hover span,.pagination .pagination-li .disableHref:focus span{background: url(../sysImages/icon-greyPagePrev.png) no-repeat;}


	.pagination .page-liPrev a,.pop-layout .pagination .page-liNext a{margin:0px;}
	#tabPage{width:100%;}
	#tabPage nav{float:right;padding-right: 1%;}
	.pagination li a{background: transparent;color: #999999;}
	.pagination li a:hover , .pagination li a:focus{background: transparent;}
</style>

		<table id="tablist" class="table table-bordered table-striped table-hover" style="background:#fff;">
		</table>

	<div id="tabPage" >
			<nav aria-label="Page navigation">
				<ul class="pagination  pagination-sm">
					<li class="pagination-li"><span class="count-size"> 当前 <span id="currentSpan"></span> 页/ <span id="totalPage"></span> 页 , 共 <span id="sizeSpan"></span> 条</span></li>
					<li class="page-liPrev">
						<a href="#" aria-label="Previous"  id="back" onclick="func_back()">
							<span aria-hidden="true" class='icon-sameAttr16 defined-greyPagePrev'></span>
						</a>
					</li>
					<li class="pagination-li"><a id="currentSA"></a></li>
					<li class="page-liNext">
						<a href="#" aria-label="Next" id="next" onclick="func_next()" style="margin-left: -2px;">
							<span aria-hidden="true" class='icon-sameAttr16 defined-greyPageNext'></span>
						</a>
					</li>
					
				</ul>
			</nav>
	</div>
<script type="text/javascript">
var pageSize = 0;
var currPage = 1;
var startNum =1;
var endNum = 1;
var totalPage =1;
var sql = "";
var db_rel="";
var queryOptions=JSON.parse(sessionStorage.getItem("queryOptions"));
var scene_id=queryOptions.scene_id;
var tarFrame=getPrevFrame()//获取当前的frameName
/*the query execution function */
  function execQuery(params){
	 $.ajax( {
			type : "POST", //请求方式
			url : "${ctx}/sys/popSingle/findByPopSingle", //请求路径
			data : params,
			dataType : 'json',
			success : function(result) {
				if(result){
					var tableContent=result.table;
					var pageInfo=result.pageInfo;
					db_rel=pageInfo.rel;
					if(pageInit){
						queryName=pageInfo.query_name;
						var disName=pageInfo.disName;
						var labStr="";
						debugger;
						if(queryName.indexOf(",")>-1){
							var labs=disName.split(",");
							for(var i=0;i<labs.length;i++){
								labStr+='<div class="form-group " style="float:left;">'+
								'<label>'+labs[i]+'</label>'+
								'<input type="search" class="form-control icon-sameAttr16 defined-search"  placeholder="搜索" />'
								+'</div>';
							}
						}else{
							labStr='<div class="form-group "  style="float:left;width:100%;">'+
							'<label>'+disName+'</label>'+
							'<input type="search" class="form-control icon-sameAttr16 defined-search"  placeholder="搜索"  style="width: 70%;float:none;"/>'
							+'</div>';
						}
						$("#queryInputDiv").html(labStr);
						top.jBox.getBox().find("div.jbox-title").text(pageInfo.sceneDesc);
						pageSize=parseInt(pageInfo.pageSize);
						endNum=startNum+pageSize;
						pageInit=false;
						queryOptions.query_sql=pageInfo.query_sql;
					}
					totalPage=parseInt(pageInfo.totalPage);
					$("#tablist").html(tableContent);
					$("#currentSA").text(currPage);
					$("#currentSpan").text(currPage);
					$("#totalPage").text(pageInfo.totalPage);
					$("#sizeSpan").text(pageInfo.size);
					if (currPage>= parseInt(totalPage)) {
						$("#next").addClass("disableHref");
					}else $("#next").removeClass("disableHref");
					if(currPage==1)$("#back").addClass("disableHref");
					else $("#back").removeClass("disableHref");
				}
			},
			error:function(err){
				console.log("error",err);
			}
		}); 
}
 
	function func_pageQuery() {
		currPage = $("#nowPageNo").val();
		queryOptions.startNum=startNum = pageSize * (currPage - 1) + 1;
		queryOptions.isInit="false";
		execQuery(queryOptions);
    }
   
    function func_pageClick(pageVal){
        currPage = pageVal;
        queryOptions.startNum =startNum = pageSize * (currPage - 1) + 1;
        queryOptions.isInit="false";
		execQuery(queryOptions);
    }

	function func_back() {
		if (currPage == 1) {
			return;
		} else {
			currPage = currPage - 1;
			queryOptions.startNum =startNum= startNum - pageSize;
			queryOptions.endNum=endNum = endNum - pageSize;
			queryOptions.isInit="false";
			execQuery(queryOptions);
		}
	}
	function func_next() {
		if (currPage >=totalPage) {
			return;
		} else {
			currPage =currPage + 1;
			queryOptions.startNum =startNum=startNum + pageSize;
			queryOptions.endNum =endNum = endNum+pageSize;
			queryOptions.isInit="false";
			execQuery(queryOptions);
		}
	}
/**
 * 日志方法注册，解决IE9下console.log不兼容的问题
 **/
var console=window.console||{
	log:function(){return false;}
};
/**
 * pop弹出框注入依赖窗体
 **/
function setPrevFrame(){
	top.prevIframeId_G.push(window);
}
function getPrevFrame(member){
	var prevFrame=top.prevIframeId_G.pop();;
	if(member){
		if(prevFrame[member])return prevFrame;
		return getPrevFrame(member);
	}
	return prevFrame;
}
/* 
 * 页面初始化
 */
	$(function() {
		queryOptions.isInit="true";
		execQuery(queryOptions);
		$("#tablist").on("hover","tbody tr",function() {
			$(this).addClass("trHover");
		}, function() {
			$(this).removeClass("trHover");
		});
		
		$("#tablist").on("click","tbody tr",function() {
			var isIe = true;
			var db_rel_arr = db_rel.split(",");
			var value = "";	
			var contlist = "";	//cont返回数据
		
			for (var i = 0; i < db_rel_arr.length; i++) {
				var db_r_arr_split = db_rel_arr[i].split("-");
				var colName = db_r_arr_split[0];
				value = $(this).children("#" + db_r_arr_split[0]).text();
				value = $.trim(value);
				try{
					var name=tarFrame.document.getElementById(db_r_arr_split[1]);
					if(name.tagName=="INPUT"){
					    name.value=value;
                    }else{
					    $(name).find("input").val(value);
                    }
					
				}catch(e){
					if(console)console.log("exception:",e);
				}
			}
			top.$.jBox.close(top.jBox.getBox(0).attr("id"));

		});
	});
	
	
</script>

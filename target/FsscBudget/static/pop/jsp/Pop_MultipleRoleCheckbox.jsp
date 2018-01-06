<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.thinkgem.jeesite.common.utils.DBUtils"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.sql.ResultSet,java.sql.PreparedStatement"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Pop页列表</title>
<link rel="Stylesheet"
	href="${ctxStatic}/pop/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="${ctxStatic}/pop/bootstrap/css/bootstrapCopy.css" />
<link rel="stylesheet"
	href="${ctxStatic}/pop/definedCss/shuttleBoxIndex.css" />
<script src="${ctxStatic}/pop/bootstrap/js/jquery-1.8.3.min.js"
	type="text/javascript"></script>
</head>
<%
		Map<String,String> map= (Map<String,String>)session.getAttribute("popMultipleMap");
		String clo_name = map.get("col_name");
		String sql = map.get("sql");
		String db_bean_rel = map.get("rel");//cif_no-cifno,cif_name-cifname
		String parms = map.get("parms");
%>
<body class="body_bg" data-genuitec-lp-enabled="false"
	data-genuitec-file-id="wc2-922"
	data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_MultipleCheckbox.jsp">
	<style data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-922"
		data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_MultipleCheckbox.jsp">
#tablist {
	width: 98%;
	margin: 0 auto 15px;
}

#tablist th, #tablist td {
	padding: 4px;
}
</style>

	<div class="overall-layoutSEO">
		<div class="suspend-title">信息列表</div>
		<s:form method="post" theme="simple" name="cms_form"
			action="PopParmConfActionInsert.action">

				<div class="pop-mucheckbox-bottom" class='pr'>
					<div class="only-textBtnDiv">
						<div class="btn-group only-textBtn">
							<button type="button" class="btn-no " id="selectall" name="selectall">全选</button>
							<button type="button" class="btn-no " onclick="func_clean()">清除</button>
							<button type="button" class="btn-no " id="fanall" name="fanall">反选</button>
							<button type="button" class="btn-no " action="保存" onclick="javascript:confirm(this.form)">确认</button>
						</div>
					</div>
				<div>
					<table id="tablist" width="100%" border="0" align="center"
						cellspacing="1"
						class="table table-bordered table-striped table-hover">
						<!--  我不知道这是啥，感觉没啥用，所以注释掉了
								<%String[] clo_name_arr = clo_name.split(",");
					int clo_name_len = clo_name_arr.length;
					for (int i = 0; i < clo_name_len; i++) {%>
								<colgroup></colgroup>
								<%}%>
								<colgroup></colgroup>
							-->
						<thead>
							<tr>
								<%
									for (int i = 0; i < clo_name_len; i++) {
								%>
								<th scope="col" align="center"><%=clo_name_arr[i]%></th>
								<%
									}
								%>
								<th scope="col" align="center"></th>
							</tr>
						</thead>
	
	
						<tbody id="tab">
	
							<%
								Connection conn = null;
									PreparedStatement ps = null;
									ResultSet rs = null;
									try {
										conn = DBUtils.getConn();
										ps = conn.prepareStatement(sql);
										rs = ps.executeQuery();
										int len = rs.getMetaData().getColumnCount();
										String[] rel_arr = db_bean_rel.split(",");//对应关系数据 cif_no-username
										String[] rel_arr_split = null;
										int rel_len = rel_arr.length;
										int flag = 0;
										String value = "";
										java.util.List list = new java.util.ArrayList();
										while (rs.next()) {
							%>
							<tr id="tr">
								<%
									for (int i = 0; i < len; i++) {//一行 几列的值
								%>
	
								<td align="center"
									id='<%=rs.getMetaData().getColumnName(i + 1).toLowerCase()%>'><%=rs.getObject(i + 1)%></td>
								<%
									//value += rs.getMetaData().getColumnName(i + 1).toLowerCase()+"-"+rs.getObject(i + 1)+"#";
												}
												for (int i = 0; i < rel_len; i++) {
													rel_arr_split = rel_arr[i].split("-");
													value += rel_arr_split[1] + "-" + rs.getObject(rel_arr_split[0]) + "#";
												}
												list.add(value);
												value = "";
												//System.out.println(value);
								%>
								<td align="center" width="12%" style="text-align: center;"><input
									type="checkbox" id="pop_box" name="pop_box" desc=''
									value='<%=list.get(flag)%>' /></td>
							</tr>
							<%
								flag++;
										}
									} catch (Exception e) {
										e.printStackTrace();
									} finally {
										DBUtils.closeResultset(rs);
										DBUtils.closeStatement(ps);
										DBUtils.closeConnection(conn);
									}
							%>
	
						</tbody>
					</table>

				</div>
			</div>




		</s:form>
	</div>
</body>
</html>


<script type="text/javascript">
	$(document).ready(function() {
	    debugger;
		var colvals = '<%=db_bean_rel%>';
		var colval = "";
		var c = colvals.split(",");
		if(c.length>1){
			colval = c[0].split("-");
		}
		var parentval = window.parent.document.getElementsByName(colval[1]);
        if(parentval!==undefined && parentval!==""){
			var idList = parentval[0].value;
            var arr = [];
            if(idList.indexOf("@") > 0){
                arr = idList.split("@");
            } else if(idList.indexOf(",") > 0){
                arr = idList.split(",");
            } else {
                arr[0] = idList;
            }
            var pararrs ="";
            var parvalues = [];
            $("input[name='pop_box']").each(function() {
                pararrs = $(this).val().split("#");
                parvalues = pararrs[0].split("-");
                for (var k = 0; k < arr.length; k++) {
                    if (arr[k] == parvalues[1]) {
                        $(this).attr("checked", true);
                    }
                }
            });
		}
	});

	function allCheck() {
		var obj = document.getElementsByTagName("input");
		if (document.getElementById("all").checked == true) {
			for (var i = 0; i < obj.length; i++) {
				obj[i].checked = true;
			}

		} else {
			for (var i = 0; i < obj.length; i++) {
				obj[i].checked = false;
			}
		}
	}
	//全选
	$("#selectall").click(function() {
		$("input[name='pop_box']").each(function() {
			$(this).attr("checked", true);
		});
	});

	//反选
	$("#fanall").click(function() {
		$("input[name='pop_box']").each(function() {
			if ($(this).attr("checked")) {
				$(this).attr("checked", false);
			} else {
				$(this).attr("checked", true);
			}
		});
	});

	function inverse() {
		var obj = document.getElementsByTagName("input");
		if (document.getElementById("inverse").checked == true) {
			for (var i = 0; i < obj.length; i++) {

				if (obj[i].checked) {
					obj[i].checked = false;
				} else {
					obj[i].checked = true;
				}
			}

		} else {
			for (var i = 0; i < obj.length; i++) {
				obj[i].checked = false;
			}
		}
	}

	function confirm(frm) {
		var obj = $("input[name='pop_box']");
		var isIe = true;
		var agent = navigator.userAgent.toLowerCase();
		if (agent.indexOf("chrome") > 0 || agent.indexOf("firefox") > 0) {
			isIe = false;
		}
		var total = obj.length;
		var name_val = "";
		var arr;
		var par_name = "";
		var arr_split;
		var parms = "<%=parms%>";
		var parms_arr;
		
		var colvals = '<%=db_bean_rel%>';
		var cols = colvals.split(",");
		var len= cols.length;
		var beforeparObj;
		
		for(var i = 0;i<len ;i++){
			var name = cols[i].split("-")[1];
			if (window.dialogArguments) {
				beforeparObj = window.dialogArguments.document.getElementsByName(name);
			} else {
				beforeparObj = window.parent.document.getElementsByName(name);
			}
			beforeparObj[0].value="";
		}
		if (parms.indexOf(",") > 0) {
			parms_arr = parms.split(",");
			for (var i = 0; i < parms_arr.length - 1; i++) {

				document.getElementsByName(parms_arr[i].split("=")[0])[0].value = "";
			}
		}
		var isNew = false;
		for (var i = 0; i < total; i++) {
			if (obj[i].checked && obj[i].value != "") {
				name_val = obj[i].value;

				arr = name_val.split("#");
				for (var j = 0; j < arr.length - 1; j++) {

					arr_split = arr[j].split("-");
					//alert("arr_split[0]:"+arr_split[0]+",arr_split[1]:"+arr_split[1]);
					var parObj;
					if (window.dialogArguments) {
						parObj = window.dialogArguments.document.getElementsByName(arr_split[0]);
					} else {
						parObj = window.parent.document.getElementsByName(arr_split[0]);
					}
					if (parObj != null && typeof (parObj) != "undefined" && parObj.length > 0) {
						if (!isNew) {
							parObj[0].value = "";
							isNew = true;
						}
						if (typeof (parObj[0]) != "undefined")
							//如果原本存在值则用,进行分割
							if (parObj[0].value != null && parObj[0].value != "")
								parObj[0].value += "," + arr_split[1];
							else{
								parObj[0].value = arr_split[1];
							}
							else {
								alert("主界面中不存在" + arr_split[0] + "字段，无法赋值。请仔细检查配置");
							}
					} else {
						alert("没有在主界面中拿到" + arr_split[0] + "对象的值");
					}
				}
			}
		}
		parent.jBox.close();
	}
	//清除
	function func_clean() {
		$("input[name='pop_box']").attr("checked", false);
		var colvals = '<%=db_bean_rel%>';
		var cols = colvals.split(",");
		var len= cols.length;
		var parObj;
		
		for(var i = 0;i<len ;i++){
			var name = cols[i].split("-")[1];
			if (window.dialogArguments) {
				parObj = window.dialogArguments.document.getElementsByName(name);
			} else {
				parObj = window.parent.document.getElementsByName(name);
			}
			parObj[0].value="";
		}
	}
</script>

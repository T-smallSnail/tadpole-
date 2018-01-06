<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.thinkgem.jeesite.common.utils.DBUtils"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet,java.sql.PreparedStatement"%>
<%-- <%@ include file="/WEB-INF/views/include/taglib.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<link rel="Stylesheet" href="../bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="../bootstrap/css/bootstrapCopy.css" />
		<link rel="stylesheet" href="../definedCss/shuttleBoxIndex.css" />
		<script src="../bootstrap/js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="../styleInteractionJs/styleInteraction.js" type="text/javascript"></script>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"8123",secure:"8124"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
	<%
		String sql = request.getParameter("sql");
		sql = sql.replaceAll("@", "%");
		System.out.println("POP多选查询SQL:" + sql);
		String db_bean_rel = request.getParameter("rel");
		String [] rel_arr = null;
		String [] lab_arr = null;
		String label = "";
		String entity = "";
		if( db_bean_rel.indexOf(",")>-1 ){
			rel_arr = db_bean_rel.split(",");
			lab_arr = rel_arr[0].split("-");
			label = lab_arr[0];
			entity = lab_arr[1];
		}else{
			lab_arr = db_bean_rel.split("-");
			label = lab_arr[0];
			entity = lab_arr[1];
		}
		String entity_val = request.getParameter("entity_val");
		String[] entity_val_arr = new String[]{};
		if( entity_val!=null && !"".equals(entity_val) ){
			if( entity_val.indexOf("@") > -1 ){
				entity_val_arr = entity_val.split("@");
			}else{
				entity_val = entity_val+"@";
			}
		}
		String count_size = request.getParameter("size");
		java.util.Map<String,Object> map = new  java.util.HashMap<String,Object>();
	%>

	<script type="text/javascript">
$(document).ready(function() {
	var totalLen = $("#left_parm option").length;
	/* $("#total").val(totalLen); */
	$("#total").html(totalLen);
	
	$("#left_parm").dblclick(function() {
		func_left_parm();
	});
	$("#right_parm").dblclick(function() {
		func_right_parm();
	});
	var choLen = $("#right_parm option").length;
	/* $("#cho").val(choLen); */
	$("#cho").html(choLen);
});
	
function func_left_parm() {
	
	$('#left_parm option:selected').appendTo('#right_parm');
	var choLen = $("#right_parm option").length;
	var totalLen = $("#left_parm option").length;
	$("#cho").html(choLen);
	$("#total").html(totalLen);
}

function func_right_parm() {
	$('#right_parm option:selected').appendTo('#left_parm');
	var choLen = $("#right_parm option").length;
	var totalLen = $("#left_parm option").length;
	$("#cho").html(choLen);
	$("#total").html(totalLen);
}
function func_close() {
	window.close();
}

function func_match() {
	var obj = $("#left_parm option");
	obj.attr("selected",false);
	var val = $("#condition").val();
	var len = 0;
	if (val != "") {
		var allOptions = $("#left_parm").children();
		$(allOptions).each(function(i) {
			if ($(allOptions[i]).html().indexOf(val) <= -1) {
				$("#left_parm").append(allOptions[i]);
				//$("#left_parm option").eq(0).attr('selected', 'true');
			}else{
				len++;
			}
		});
	}
	for( var j=0;j<len;j++ ){
		$("#left_parm option").eq(j).attr('selected', 'true');
	}
}

function func_match_right() {
	var obj = $("#right_parm option");
	obj.attr("selected",false);
	var val = $("#rcondition").val();
	var len = 0;
	if (val != "") {
		var allOptions = $("#right_parm").children();
		$(allOptions).each(function(i) {
			if ($(allOptions[i]).html().indexOf(val) <= -1) {
				$("#right_parm").append(allOptions[i]);
				//$("#right_parm option").eq(0).attr('selected', 'true');
			}else{
				len++;
			}
		});
	}
	for( var j=0;j<len;j++ ){
		$("#right_parm option").eq(j).attr('selected', 'true');
	}
}

function func_save(){
	var right_val = "";
	var right_text = "";
	var entity = "<%=entity%>";
	$("#right_parm option").each(function() {
		right_val += $(this).val() + "@";
		right_text += $(this).text() + "@";
	});
	right_val = right_val.substr(0,right_val.length-1);
	right_text = right_text.substr(0,right_text.length-1);
	window.parent.dialogArguments.document.getElementsByName(entity)[0].value = right_val;
	window.returnValue="success";
	window.close();

}

</script>
	<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-921" data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_Multiple.jsp">
		<div class="overall-layoutSEO" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-921" data-genuitec-path="/FsscWeb/src/main/webapp/static/pop/jsp/Pop_Multiple.jsp">
			<div class="shuttle-box">
				<div class="shuttle-box-top">
					<span class="shuttle-box-topTitle fl"> 
						待选择列表(<span  id="total" name="total" style="width: 35px" readonly></span>)
					</span>
					<span class="shuttle-box-topTitle fr">
						已选择列表(<span  id="cho" name="cho" style="width: 35px" readonly></span>)
					</span>
				</div>
				<div class="shuttle-box-content">
					<div class="shuttle-box-contentRight">
						<div class="shuttle-box-contentRLtop">
							<div class="form-inline">
								<div class="form-group form-inline-align">
									<input type="search" id="condition"class="form-control icon-sameAttr16 defined-search"onkeyup="func_match()" placeholder="搜索" /> 
								</div>
							</div>
						</div>
						<div class="shuttle-box-contentRLbottom">
							<select name="left_parm" id="left_parm" size="23" multiple="multiple" class="shuttleBox-ele">
										<%
											Connection conn = null;
												PreparedStatement ps = null;
												ResultSet rs = null;
												try {
													conn = DBUtils.getConn();
													ps = conn.prepareStatement(sql);
													rs = ps.executeQuery();
													int len = rs.getMetaData().getColumnCount();
													String val = "";
													String label_val = "";
													while (rs.next()) {
														for (int i = 0; i < len; i++) {//一行 几列的值
															val += "-" + rs.getObject(i + 1);
														}
														label_val = (String) rs.getObject(label);
														map.put(label_val, val.replaceFirst("-", ""));
														if (entity_val.indexOf(label_val + "@") == -1) {
														%>
														<option value="<%=label_val%>"><%=val.replaceFirst("-", "")%></option>
														<%
											}
														val = "";
													}
												} catch (Exception e) {
													e.printStackTrace();
												} finally {
													DBUtils.closeResultset(rs);
													DBUtils.closeStatement(ps);
													DBUtils.closeConnection(conn);
												}
										%>
							</select>
						</div>
					</div>

					<div class="shuttle-box-contentMiddle">
						<button class="shuttle-box-btn shuttle-boxBtn-active" onclick="func_left_parm()">&#62;</button>
						<button class="shuttle-box-btn shuttle-boxBtn-active" onclick="func_right_parm()">&#60;</button>
					</div>

					<div class="shuttle-box-contentLeft">
						<div class="shuttle-box-contentRLtop">
							<div class="form-inline">
								<div class="form-group form-inline-align">
									<input type="search" id="rcondition" class="form-control icon-sameAttr16 defined-search" onkeyup="func_match_right();"placeholder="搜索" /> 
								
								</div>
							</div>
						</div>
						<div class="shuttle-box-contentRLbottom">
							<select name="right_parm" id="right_parm" size="23" multiple="multiple"  class="shuttleBox-ele">
							</select>
						</div>
					</div>
				</div>
				<div class="shuttle-box-bottom">
					<div class="main-animateDiv">
						<div class="btn-main-animateDiv">
							<button onclick="func_save()" class='btn btn-main'>确定</button>
						</div>
					</div>
					<div class="main-animateDiv">
						<div class="btn-main-animateDiv">
							<button onclick="func_close()" class='btn btn-auxiliaty'>关闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
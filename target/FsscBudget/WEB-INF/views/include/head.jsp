<%@ page contentType="text/html;charset=UTF-8" %><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://jeesite.com/"/>
<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />
<!--[if lte IE 7]><link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
<link href="${ctxStatic}/jquery-select2/3.4/select2.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
<%-- <script src="${ctxStatic}/styleInteractionJs/styleInteraction.js?version=${fsscVersion}" type="text/javascript"></script> --%><!-- 合并到jeesite.js文件中 -->
<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.js?version=${fsscVersion}" type="text/javascript"></script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.src.js?version=${fsscVersion}" type="text/javascript"></script>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="${ctxStatic}/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet"/>
<script src="${ctxStatic}/mCustomScrollbar/demo/js/uncompressed/jquery.mCustomScrollbar.js" type="text/javascript"></script>
<script src="${ctxStatic}/mCustomScrollbar/demo/js/uncompressed/jquery.mousewheel.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/common/jeesite.js?version=${fsscVersion}" type="text/javascript"></script>
<%-- <link rel="Stylesheet" href="${ctxStatic}/sysStyle/mainStyle.min.css?version=${fsscVersion}" /> --%><!-- 合并到jeesite.css文件中 -->
<c:set var="loginPageUrl" value="${fns:getLoginUrl()}"/>
<script type="text/javascript">
var ctx = '${ctx}', ctxStatic='${ctxStatic}';
window.time_out_homepage= "${loginPageUrl}";
</script>
<%-- <link rel="Stylesheet" href="${ctxStatic}/sysStyle/sysIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/bootstrapCopy.css?version=${fsscVersion}" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/alertIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/btnIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/formIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/iconIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/otherIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/tableIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/SEOIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/SEOotherIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/unitIndex.css" /><!-- 合并到mainStyle.css文件中 -->
<link rel="Stylesheet" href="${ctxStatic}/sysStyle/uploadIndex.css?version=${fsscVersion}" /> --%><!-- 合并到mainStyle.css文件中 -->



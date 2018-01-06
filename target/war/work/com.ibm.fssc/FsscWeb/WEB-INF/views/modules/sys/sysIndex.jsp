<%@ page contentType="text/html;charset=UTF-8" import="java.util.ResourceBundle"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
    String path = request.getContextPath();
    // properties 配置文件名
    ResourceBundle res = ResourceBundle.getBundle("jeesite");
    
    response.setHeader("Cache-Control","no-cache");   
    response.setHeader("Pragma","no-cache");   
    response.setDateHeader ("Expires", -10);   
%>
<html>
<head>
	<title>${fns:getConfig('productName')}</title>
	<meta name="decorator" content="blank"/>
    <link rel="Stylesheet" href="${ctxStatic}/jerichotab/css/jquery.jerichotab.css" />
    <script type="text/javascript" src="${ctxStatic}/jerichotab/js/jquery.jerichotab.js?version=${fsscVersion}"></script>
    <!-- 引入该页面的css -->
	<style type="text/css">
	 	html { overflow-y: hidden; }
		body {position:absolute;left:0;width:100%;top:0;height:100%;} 
		#main {padding:0;margin:0;overflow:hidden;}
		#header {position:static;} 
		/*修改left导航条样式*/
		#left{position:relative;top:0;bottom:30px;}
		.left-footer{position:absolute; width:100%;}
		#menu-bar{overflow:auto;}
		.mCSB_container{margin-right:0px;}
		/* #right{overflow:hidden;} */
		/*----------------------------*/
		#footer {margin:8px 0 0 0;padding:3px 0 0 0;font-size:11px;text-align:center;border-top:2px solid #0663A2;}
		#footer, #footer a {color:#999;} #left{overflow-x:hidden;overflow-y:auto;} #left .collapse{position:static;}
		#userControl>li>a{/*color:#fff;*/text-shadow:none;} #userControl>li>a:hover, #user #userControl>li.open>a{background:transparent;}
		/*遮罩层样式*/
		.mask {position: absolute;top: 0px; filter: alpha(opacity=70); background-color: #777;z-index: 1000; left: 0px;opacity:0.5; -moz-opacity:0.5;}
	</style>
	<script type="text/javascript">
		/*版本号: 2017-4-10*/
		//兼容Ie重写trim方法
		String.prototype.trim = function () {  
    		return this.replace(/(^\s*)|(\s*$)/g, "");  
		}
		 //获取URL参数方法
	    function getString(name) {
	       urlparams = window.location.search;
	       //urlparams = "?typeId=test&url=fack"
	       var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	       var r = urlparams.substr(1).match(reg);
	       if (r != null) return r[2];
	       return null;
	    }
		 
		//获取url
	    function getUrlString() {
		       urlparams = window.location.search;
		       var index = urlparams.indexOf("url=");
		       var urlStr = null;
		       if (index >= 0) {
		    	   urlStr = urlparams.substr(index + 4);
		       }
		       return urlStr;
		}
		
		//判断增加tab标签回掉函是否调用的全局变量
	   var my_flag = false;
	 	//弹框存放父iframes数组
	    var prevIframeId_G = [];
	    
		 
        $(document).ready(function() { 
        	var tabTitleHeight = 30; // 页签的高度
        	var headerHeight=$("#header").height();
            $.fn.initJerichoTab({ 
                renderTo: '#right', uniqueId: 'jerichotab',
                contentCss: { 'height': $('#right').height() - tabTitleHeight },
                tabs: [], loadOnce: true, tabWidth: 110, titleHeight: tabTitleHeight
            });
            var menuId = "#menu-bar";
            $.get("${ctx}/sys/menu/tree?parentId=1", function(data){
            	
                if (data.indexOf("id=\"loginForm\"") != -1){
                    alert('未登录或登录超时。请重新登录，谢谢！');
                    top.location = "${ctx}";
                    return false;
                } 
                $("#left .accordion").hide();
                $(".left-personal").after(data);
              //设置左侧导航条高度
    			$("#menu-bar").height($(document).height()-146.8);
                // 链接去掉虚框
                $(menuId + " a").bind("focus",function() {
                    if(this.blur) {this.blur()};
                });
                // 二级标题
               	/* $(menuId + " .accordion-heading a").click(function(){
                   $(menuId + " .accordion-toggle i").removeClass('icon-chevron-down').addClass('icon-chevron-right');
                   if(!$($(this).attr('data-href')).hasClass('in')){
                       $(this).children("i").removeClass('icon-chevron-right').addClass('icon-chevron-down');
                    }
               }); */
                // 二级内容
                $(menuId + " .accordion-body a").click(function(){
                    $(menuId + " li").removeClass("active");
                    $(menuId + " li i").removeClass("icon-white");
                    $(this).parent().addClass("active");
                    $(this).children("i").addClass("icon-white");
                    
                });
                // 展现三级
                $(menuId + " .accordion-inner a").click(function(){
                	var self = $(this);
                    var href = $(this).attr("data-href");
                    if($(href).length > 0){
                        if($(menuId + " .accordion-inner a").hasClass("hasToggled")) {
                            $(menuId + " .accordion-inner a").removeClass("hasToggled");
                            $(href).toggle(200).parent().toggle(200);
                        } else {
                            $(menuId + " .accordion-inner a").addClass("hasToggled");
                            $(href).toggle(200).parent().toggle(200);
                        }
                        return false;
                    }
                   
                    return addTab(self);
                     
                   
                });
              //增加自定义滚动条样式
              $("#menu-bar").mCustomScrollbar({
		    		advanced:{
						updateOnContentResize:true, /*auto-update scrollbars on content resize (for dynamic content): boolean*/
						autoExpandHorizontalScroll:false, /*auto-expand width for horizontal scrolling: boolean*/
						autoScrollOnFocus:true, /*auto-scroll on focused elements: boolean*/
						normalizeMouseWheelDelta:true,/*normalize mouse-wheel delta (-1/1)*/
					},
					autoHideScrollbar:true
	    		});	
                //判断外部链接hash传参跳转
               	var typeId = getString("typeId");
            	var url = getUrlString();
               	var tabName = decodeURI(getString("tabName"));
                if(typeId){
                	//根据参数跳转页面
               		var typeArr = typeId.split("@");
                	if(typeArr[0]){
                		$(".in").removeClass("in");
                		$("[data-href='#"+typeArr[0]+"']").click();
                		$("#"+typeArr[0]+">.accordion-inner>ul>li:eq("+typeArr[1]+")>a").click();
                		if(typeArr.length>2){
                			$("#"+typeArr[0]+">.accordion-inner>ul>li:eq("+typeArr[1]+")>ul>li:eq("+typeArr[2]+")>a").click();
                		}
                	}
                	//console.log($("#"+typeArr[0]+">.accordion-inner>ul>li:eq("+typeArr[1]+")>a"));
                	//console.log(getString("typeId"));
		 			//console.log(getString("url"));
                	
                }else{
                	// 默认选中第一个菜单
                    $(menuId + " .accordion-body a:first i").click();
                    $(menuId + " .accordion-body li:first li:first a:first").click();  
                }
                
                if (url) {
                	addTabs(url, tabName);
                }
            });
            // 初始化点击第一个一级菜单
            //$("#menu a.menu:first span").click();
            $("#userInfo .dropdown-menu a").mouseup(function(){
                return addTab($(this), true);
            });

            // 鼠标移动到边界自动弹出左侧菜单
            $("#openClose").mouseover(function(){
                if($(this).hasClass("open")){
                    $(this).click();
                   
                }
            });

            // 获取通知数目  <c:set var="oaNotifyRemindInterval" value="${fns:getConfig('oa.notify.remind.interval')}"/>
            /* function getNotifyNum(){
                $.get("${ctx}/oa/oaNotify/self/count?updateSession=0&t="+new Date().getTime(),function(data){
                    var num = parseFloat(data);
                    if (num > 0){
                        $("#notifyNum,#notifyNum2").show().html("("+num+")");
                    }else{
                        $("#notifyNum,#notifyNum2").hide()
                        
                    }
                });
            } */
            //getNotifyNum(); //<c:if test="${oaNotifyRemindInterval ne '' && oaNotifyRemindInterval ne '0'}">
            //setInterval(getNotifyNum, '${oaNotifyRemindInterval}'); //</c:if>

          
		 	$("#singleLogout").click(function() {

		 		var homepage= '<%=res.getString("portal_home_page")%>';
		 		var logoutUrl = '<%=res.getString("IAM_logout_page")%>';
		 		window.originalJqAjax({
			      url: "${ctx}/logout",
			      success: function(data) {
			      
			        $.ajax({
				      url: logoutUrl,
				      dataType: "jsonp",
				      type: 'get',
				      success: function(data) {
				      
				        //本系统和IAM都退出成功后的处理：跳转到portal页面
				        window.location.href=homepage;
				      },
				      complete: function(data) {
				      }
				    });
			      },
			      complete: function(data) {
			      }
			    });
		 	});
        });
        function addTab($this, refresh){
        	//判断是否tabs中是否存在已有标签，如果已经存在，则在已有标签页中打开
            if($(".tabs").find("[name='"+$this.text().trim()+"']").length>0){
            	$(".tabs").find(".tab_selected").removeClass("tab_selected").addClass("tab_unselect");
            	$("[name='"+$this.text().trim()+"']").removeClass("tab_unselect").addClass("tab_selected");
            	$("#jerichotab_contentholder").find(".curholder").removeClass("curholder").addClass("holder").css("display","none");
            	var idNum = $("[name='"+$this.text().trim()+"']").attr("id").split("_")[1];
            	//console.log(idNum);
            	$("#jerichotabholder_"+idNum).removeClass("holder").addClass("curholder").css("display","block");
            	return false;
            	//如果没有已存在页面则打开新标签
            }else{
            	 if($(".tab_pages .tabs ul").children('li').length > 9) {
                     $.jBox.tip("最多只能打开10个标签页", 'warning');
                     return false;
     			}
                 //$(".jericho_tab").show();
                 $("#mainFrame").hide();
                 $.fn.jerichoTab.addTab({
                     tabFirer: null,
                     title: $this.attr("data-title"),
                     closeable: true,
                     data: {
                         dataType: 'iframe',
                         dataLink: $this.attr('href')
                     }
                 }).loadData(refresh);
                 //修改tap点击隐藏其余tap的关闭按钮需求
             	//$('.jericho_tab .tab_unselect').childrens(".tab_close").hide();
                  /* setTimeout(function(){
                 	 setTapStyle();
                 },100);  */
             	//---------------------------------------------------------
                 return false;
            }
        }
  	function addTabs(url, name){
  	//判断是否tabs中是否存在已有标签，如果已经存在，则在已有标签页中打开
        if($(".tabs").find("[name='"+name+"']").length>0){
        	$(".tabs").find(".tab_selected").removeClass("tab_selected").addClass("tab_unselect");
        	$("[name='"+name+"']").removeClass("tab_unselect").addClass("tab_selected");
        	$("#jerichotab_contentholder").find(".curholder").removeClass("curholder").addClass("holder").css("display","none");
        	var idNum = $("[name='"+name+"']").attr("id").split("_")[1];
        	//console.log(idNum);
        	$("#jerichotabholder_"+idNum).removeClass("holder").addClass("curholder").css("display","block");
        	$(document).find("#jerichotabiframe_"+idNum).attr("src", url);
        	
        	return false;
        	//如果没有已存在页面则打开新标签
        }else{
        	 if($(".tab_pages .tabs ul").children('li').length > 9) {
                 $.jBox.tip("最多只能打开10个标签页", 'warning');
                 return false;
             }
             $("#mainFrame").hide();
             $.fn.jerichoTab.addTab({
                 tabFirer: null,
                 title: name,
                 closeable: true,
                 data: {
                     dataType: 'iframe',
                     dataLink: url
                 }
             }).loadData(true);
             return false;
        	}
        }
  	//新增addtabs回调函数方法
  	function addTabsCallback(url, name,callback){
  	  	//判断是否tabs中是否存在已有标签，如果已经存在，则在已有标签页中打开
  	        if($(".tabs").find("[name='"+name+"']").length>0){
  	        	$(".tabs").find(".tab_selected").removeClass("tab_selected").addClass("tab_unselect");
  	        	$("[name='"+name+"']").removeClass("tab_unselect").addClass("tab_selected");
  	        	$("#jerichotab_contentholder").find(".curholder").removeClass("curholder").addClass("holder").css("display","none");
  	        	var idNum = $("[name='"+name+"']").attr("id").split("_")[1];
  	        	//console.log(idNum);
  	        	$("#jerichotabholder_"+idNum).removeClass("holder").addClass("curholder").css("display","block");
  	        	return false;
  	        	//如果没有已存在页面则打开新标签
  	        }else{
  	        	 if($(".tab_pages .tabs ul").children('li').length > 9) {
  	                 $.jBox.tip("最多只能打开10个标签页", 'warning');
  	                 return false;
  	             }
  	             $("#mainFrame").hide();
  	             $.fn.jerichoTab.addTab({
  	                 tabFirer: null,
  	                 title: name,
  	                 closeable: true,
  	                 data: {
  	                     dataType: 'iframe',
  	                     dataLink: url
  	                 },
  	                 closeCallback:callback
  	             }).loadData(true);
  	             return false;
  	        	}
  	        }
 	function userSwitch(url){
 		$.jBox("iframe:"+url, {
		    title: "用户切换",
		    width: 1200,
		    height: 560,
		    showScrolling: true,
		    buttons: { '关闭': true }
		});
 		
 	}
	 

	</script>
</head>
<body>
	<div id="main">
	    <div class="container-fluid">
			<div id="content" class="row-fluid">
				<div id="left" class="nav-left" style="overflow: hidden;" >
					<div class="left-personal">
						<img id="header-logo" src="${ctxStatic}/sysImages/logo.png"/>
						<h1>报账系统</h1>
					</div>
					<div class="left-footer">
						<div id="singleLogout" style="cursor:pointer">
							<i class='icon-sameAttr20 defined-logoutSEO'></i>
							<span>退出登录</span>
						</div> 
					</div>
				</div>
				<!-- 左侧left菜单栏收起按钮 -->
				<div id="openClose" class="close">&nbsp;</div>
				<!-- 左侧left菜单栏收起按钮 -->
				<div class="content-right" id="right">
					<div id="header" class="navbar navbar-fixed-top" >
						<div class="navbar-inner">
							
						<!-- 右侧小menu star -->
							<ul id="userControl" class="nav pull-right">
								<li class="personal-privateAttr" >
									<a href="${ctx}/sys/user/info" title="个人的">
									<i class="icon-sameAttr30 defined-personal"></i>${fns:getUser().userName}
									</a>
								</li>		
							
								<li id="userInfo" class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" onclick="userSwitch('${ctx}/sys/user/switchList')" title="单位切换">
										<i class="sameIconAtrr defined-departchange"></i>单位切换<span id="notifyNum" class="label label-info hide"></span>
									</a>								
								</li>
								<!-- 页签打开模式  -->
								<li id="themeSwitch" class="dropdown">
									<ul class="dropdown-menu">
										<c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
										<li><a href="javascript:cookie('tabmode','${tabmode eq '1' ? '1' : '1'}');location=location.href">${tabmode eq '1' ? '开启' : '开启'}页签模式</a></li>

									</ul>
								</li>
								
								<!-- 页签打开模式  -->
						<%-- 		<li>
									<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/index-${fnc:getCurrentSiteId()}.html" target="_blank" title="关于">
										<i class="sameIconAtrr defined-helpIndex"></i>帮助
									</a>
								</li>  --%>
							</ul><!-- #userControl end -->
						<!-- 右侧小menu end -->
									</ul>										
								</li>								
								<!-- 页签打开模式  -->						
							</ul>
							<!-- #userControl end -->
						
						</div>
				    </div>
					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"> 
		var leftWidth = 220; // 左侧窗口大小
		var tabTitleHeight = 33; // 页签的高度
		var htmlObj = $("html"), mainObj = $("#main");
		var headerObj = $("#header");
		//var frameObj = $("#left, #openClose, #right, #right iframe");
		var frameObj = $("#left,#openClose, #right, #right iframe"); //去掉openClose，为了调整该样式
		var frameObj2 = $("#right, #right iframe");
		function wSize(){
			var minHeight = 500, minWidth = 980;
			var strs = getWindowSize().toString().split(","); //获得屏幕的宽度
			htmlObj.css({"overflow-x":strs[1] < minWidth ? "auto" : "hidden", "overflow-y":strs[0] < minHeight ? "auto" : "hidden"});
			mainObj.css("width",strs[1] < minWidth ? minWidth -  10 : "auto");
			frameObj.height((strs[0] < minHeight ? minHeight : strs[0])  - (strs[1] < minWidth ? 42 : 28)+ tabTitleHeight-5);
			//frameObj.height($(document).height()-tabTitleHeight);			
			//修改right框值
			frameObj2.height((strs[0] < minHeight ? minHeight : strs[0])  - (strs[1] < minWidth ? 42 : 28)-tabTitleHeight);
			$("#openClose").height($("#openClose").height());    ////去掉openClose，为了调整该样式
			$(".jericho_tab iframe").height($("#right").height() - tabTitleHeight);  
			wSizeWidth();
		}
		function wSizeWidth(){
			if (!$("#openClose").is(":hidden")){
				var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
				$("#right").width($("#content").width() - leftWidth - $("#openClose").width() -9);
			}else{
				$("#right").width("100%");
			}
		} 
		function openCloseClickCallBack(b){
			$.fn.jerichoTab.resize();
		} 
		
// 		author:wangpeng;
//		子页面遮罩层调用方法
//		显示遮罩层：parent.mask.showMask()
//		隐藏遮罩层：parent.mask.hideMask()
		function maskShow() {
			if($("#mask").length==0){
				$("body").append('<div id="mask" class="mask" style="display:none;"></div>');
			}
			$("#mask").css("height",$(document).height());
			$("#mask").css("width",$(document).width());
			$("#mask").show();
}
		function hideMask() {
			$("#mask").hide();
}
		var mask = {
			//显示遮罩层
			"showMask":function(){
				if($("#mask").length==0){
					$("body").append('<div id="mask" class="mask" style="display:none;"></div>');
				}
				$("#mask").css("height",$(document).height());
				$("#mask").css("width",$(document).width());
				$("#mask").show();
			},
			//隐藏遮罩层
			"hideMask":function(){ 
				$("#mask").hide();
			},
			//获取父级元素宽高
			"getParentWidth":function(){
				var width = $(document).width(),height = $(document).height();
				return [width,height];
				
			}
		}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>
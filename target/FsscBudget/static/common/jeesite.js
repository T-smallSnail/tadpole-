/*!
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 * 
 * 通用公共方法
 * @author ThinkGem
 * @version 2014-4-29
 */
$(document).ready(function() {
	try{
		// 链接去掉虚框
		$("a").bind("focus",function() {
			if(this.blur) {this.blur()};
		});
		//所有下拉框使用select2			before
		/*$("select").select2();*/
		
		//pop穿梭框剔除select		now
		$("select:not(.shuttleBox-ele)").select2();
		
	}catch(e){
		// blank
	}
});

// 引入js和css文件
function include(id, path, file){
	if (document.getElementById(id)==null){
        var files = typeof file == "string" ? [file] : file;
        for (var i = 0; i < files.length; i++){
            var name = files[i].replace(/^\s|\s$/g, "");
            var att = name.split('.');
            var ext = att[att.length - 1].toLowerCase();
            var isCSS = ext == "css";
            var tag = isCSS ? "link" : "script";
            var attr = isCSS ? " type='text/css' rel='stylesheet' " : " type='text/javascript' ";
            var link = (isCSS ? "href" : "src") + "='" + path + name + "'";
            document.write("<" + tag + (i==0?" id="+id:"") + attr + link + "></" + tag + ">");
        }
	}
}

// 获取URL地址参数
function getQueryString(name, url) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    if (!url || url == ""){
	    url = window.location.search;
    }else{	
    	url = url.substring(url.indexOf("?"));
    }
    r = url.substr(1).match(reg)
    if (r != null) return unescape(r[2]); return null;
}

//获取字典标签
function getDictLabel(data, value, defaultValue){
	for (var i=0; i<data.length; i++){
		var row = data[i];
		if (row.value == value){
			return row.label;
		}
	}
	return defaultValue;
}

// 打开一个窗体
function windowOpen(url, name, width, height){
	var top=parseInt((window.screen.height-height)/2,10),left=parseInt((window.screen.width-width)/2,10),
		options="location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,"+
		"resizable=yes,scrollbars=yes,"+"width="+width+",height="+height+",top="+top+",left="+left;
	window.open(url ,name , options);
}

// 恢复提示框显示
function resetTip(){
	top.$.jBox.tip.mess = null;
}

// 关闭提示框
function closeTip(){
	top.$.jBox.closeTip();
}

//显示提示框
function showTip(mess, type, timeout, lazytime){
	resetTip();
	setTimeout(function(){
		top.$.jBox.tip(mess, (type == undefined || type == '' ? 'info' : type), {opacity:0, 
			timeout:  timeout == undefined ? 2000 : timeout});
	}, lazytime == undefined ? 500 : lazytime);
}

// 显示加载框
function loading(mess){
	if (mess == undefined || mess == ""){
		mess = "正在提交，请稍等...";
	}
	resetTip();
	top.$.jBox.tip(mess,'loading',{opacity:0});
}

// 关闭提示框
function closeLoading(){
	// 恢复提示框显示
	resetTip();
	// 关闭提示框
	closeTip();
}

// 警告对话框
function alertx(mess, closed){
	top.$.jBox.info(mess, '提示', {closed:function(){
		if (typeof closed == 'function') {
			closed();
		}
	}});
	top.$('.jbox-body .jbox-icon').css('top','55px');
}

// 确认对话框
function confirmx(mess, href, closed){
	top.$.jBox.confirm(mess,'系统提示',function(v,h,f){
		if(v=='ok'){
			if (typeof href == 'function') {
				href();
			}else{
				resetTip(); //loading();
				location = href;
			}
		}
	},{buttonsFocus:1, closed:function(){
		if (typeof closed == 'function') {
			closed();
		}
	}});
	top.$('.jbox-body .jbox-icon').css('top','55px');
	return false;
}

// 提示输入对话框
function promptx(title, lable, href, closed){
	top.$.jBox("<div class='form-search' style='padding:20px;text-align:center;'>" + lable + "：<input type='text' id='txt' name='txt'/></div>", {
			title: title, submit: function (v, h, f){
	    if (f.txt == '') {
	        top.$.jBox.tip("请输入" + lable + "。", 'error');
	        return false;
	    }
		if (typeof href == 'function') {
			href();
		}else{
			resetTip(); //loading();
			location = href + encodeURIComponent(f.txt);
		}
	},closed:function(){
		if (typeof closed == 'function') {
			closed();
		}
	}});
	return false;
}

// 添加TAB页面
function addTabPage(title, url, closeable, $this, refresh){
	top.$.fn.jerichoTab.addTab({
        tabFirer: $this,
        title: title,
        closeable: closeable == undefined,
        data: {
            dataType: 'iframe',
            dataLink: url
        }
    }).loadData(refresh != undefined);
}

// cookie操作
function cookie(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + options.path : '';
        var domain = options.domain ? '; domain=' + options.domain : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
}

// 数值前补零
function pad(num, n) {
    var len = num.toString().length;
    while(len < n) {
        num = "0" + num;
        len++;
    }
    return num;
}

// 转换为日期
function strToDate(date){
	return new Date(date.replace(/-/g,"/"));
}

// 日期加减
function addDate(date, dadd){  
	date = date.valueOf();
	date = date + dadd * 24 * 60 * 60 * 1000;
	return new Date(date);  
}

//截取字符串，区别汉字和英文
function abbr(name, maxLength){  
 if(!maxLength){  
     maxLength = 20;  
 }  
 if(name==null||name.length<1){  
     return "";  
 }  
 var w = 0;//字符串长度，一个汉字长度为2   
 var s = 0;//汉字个数   
 var p = false;//判断字符串当前循环的前一个字符是否为汉字   
 var b = false;//判断字符串当前循环的字符是否为汉字   
 var nameSub;  
 for (var i=0; i<name.length; i++) {  
    if(i>1 && b==false){  
         p = false;  
    }  
    if(i>1 && b==true){  
         p = true;  
    }  
    var c = name.charCodeAt(i);  
    //单字节加1   
    if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {  
         w++;  
         b = false;  
    }else {  
         w+=2;  
         s++;  
         b = true;  
    }  
    if(w>maxLength && i<=name.length-1){  
         if(b==true && p==true){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         if(b==false && p==false){  
             nameSub = name.substring(0,i-3)+"...";  
         }  
         if(b==true && p==false){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         if(p==true){  
             nameSub = name.substring(0,i-2)+"...";  
         }  
         break;  
    }  
 }  
 if(w<=maxLength){  
     return name;  
 }  
 return nameSub;  
}

//用于页面操作按钮
var operation = {
		open : function(event) {
			var url = event.data.url;
			var title = event.data.title;
			var id = event.data.id;
			var width = event.data.width;
			var height = event.data.height;
			
			if (id != null && id != "") {
				url = "iframe:" + url + id;
			} else {
				url = "iframe:" + url;
			}
			parent.parent.$.jBox(url, {
				title : title,
				width : width,
				height : height,
				top : '5%',
				iframeScrolling: 'auto',
				buttons : {
					"保存" : "ok",
					"关闭" : true
				},
				submit : function(v, h, f) {
					if (v == "ok") {
						var iframe = h.find("iframe")[0];
						var tree = iframe.contentWindow.tree;
						var form = $(iframe).contents().find("#inputForm");
					    var valid = $(form).valid();
				        if (!valid) {
				    	    return false;
				        }
				        if (tree && form.find("#menuIds")) {
				        	operation.preDeal(tree, form);
			            }
				        
						operation.save(form);
					}
				},
				loaded: function (h) {
					top.$("#jbox-content").css("overflow-y","hidden");
				}
			});
		},
		edit : function(url, id, width, height) {
			//拼接url
			url = "iframe:" + url + id;
			parent.parent.$.jBox(url, {
				title : '修改',
				width : width,
				height : height,
				top : '5%',
				iframeScrolling: 'auto',
				buttons : {
					"保存" : "ok",
					"关闭" : true
				},
				submit : function(v, h, f) {
					if (v == "ok") {
						var iframe = h.find("iframe")[0];
						var tree = iframe.contentWindow.tree;
						var form = $(iframe).contents().find("#inputForm");
					    var valid = $(form).valid();
				        if (!valid) {
				    	    return false;
				        }
				        if (tree && form.find("#menuIds")) {
				        	operation.preDeal(tree, form);
				        }
						operation.save(form);
					}
				},
				loaded: function (h) {
					top.$(".jbox-content").css("overflow-y","hidden");
				}
			});
		},
		save : function(form) {
			  var saveUrl = form.attr("action");
			  var formData = form.serialize(); 
			  $.ajax({
				  type : "post",
				  url : saveUrl,
				  data : formData,
				  dataType : "json",
				  success : function(data) {
					  if (data && data == "success") {
						  alertx('保存成功！');
						  //刷新当前页
						  location.reload();
					  } else {
						  alertx('保存失败，请联系管理员');
					  }
				  }
			  });
		},
		dele : function(event) {
			var url = event.data.url;
			var tableId = event.data.tableId;
			var id =$("#"+tableId).find("tr.dbe8fc").find("input").val();
			var vname =document.getElementById(tableId).rows[0].cells[0].innerHTML;
			var name =$("#"+tableId).find("tr.dbe8fc").find("td:first").html();
			if (id == null || id == "") {
				alertx('请选择要删除的记录');
				return false;
			}

			$.jBox.confirm("确定要删除"+vname+"为" + name +"的记录吗？", "提示", function (v, h, f) {
			    if (v == 'ok')
			    	$.ajax({
						type : "post",
						url : url,
						data : {
							id : id
						},
						dataType : "json",
						success : function(data) {
							if (data && data == "success") {
								$.jBox.prompt('删除成功。', '提示', 'info', {
									closed : function() {
										$.jBox.tip("正在处理，请稍候....", "loading");
										location.href = location.href;
									}
								});
							} else {
								alertx('删除失败，请联系管理员');
							}
						}
					});
			    return true;
			});
		},
		preDeal : function(tree, form) {
	        var ids = [], nodes = tree.getCheckedNodes(true);
			for(var i=0; i<nodes.length; i++) {
				ids.push(nodes[i].id);
			}
			form.find("#menuIds").val(ids);
		}
    }



/*原styleInteractionJs文件内容*/




//样式交互
//公用函数————样式切换
	function tba(obj, cla) {
		obj.on("click", function () {
			obj.removeClass(cla);
			$(this).addClass(cla);
		})
	};

//公共函数，单选按钮样式交互
	function radioboxClick(obj) {
		$(obj+" .radiobox-click i").click(function(){
			if(!$(this).hasClass('radiobox-active')){
                $(obj+" .radiobox-active").removeClass('radiobox-active').addClass('defined-radiobox');
                $(this).removeClass('defined-radiobox').addClass('radiobox-active');
        	}
		});
		
		$(obj+" .radiobox-click span").click(function(){
			if(!$(this).prevAll('i').hasClass('radiobox-active')){
                $(obj+" .radiobox-active").removeClass('radiobox-active').addClass('defined-radiobox');
                $(this).prevAll('i').removeClass('defined-radiobox').addClass('radiobox-active');
        	}
		});

	}
//公共函数，多选按钮样式交互
	function checkboxClick(obj) {
		$(obj+".checkbox .check-click i").click(function(){
			if($(this).hasClass('checkbox-active')){
				$(this).removeClass('checkbox-active').addClass('defined-checkbox');
			}else{
				$(this).addClass('checkbox-active').removeClass('defined-checkbox');
			}
		});
		$(obj+".checkbox .check-click span").click(function(){
			if($(this).prevAll('i').hasClass('checkbox-active')){
				$(this).prevAll('i').removeClass('checkbox-active').addClass('defined-checkbox');
			}else{
				$(this).prevAll('i').addClass('checkbox-active').removeClass('defined-checkbox');
			}
		});

	}

//公共函数，输入金额样式交互
	function inputMoneyClick(obj) {
		$(obj+" .input-money input").focus(function(){
			$(this).parent('.input-money').addClass('focusOutline');
		})
		$(obj+" .input-money input").blur(function(){
			$(this).parent('.input-money').removeClass('focusOutline');
		})

	}
//公共函数，意见选择编辑样式交互
	function suedit(obj) {
		obj.on("mouseover", function () {
			$(this).children('i').removeClass('hide').addClass('show');
		});
		obj.on("mouseout", function () {
			$(this).children('i').removeClass('show').addClass('hide');
		});
	};
	
//增加意见事件绑定
	function submitProposal(inputElement){
		inputElement.focus(function(){
			$(this).siblings('.form-suggestSure').removeClass('hide')
		}).blur(function(){
			$(this).siblings('.form-suggestSure').addClass('hide');
		}).keyup(function(){
			if(!$('.form-suggestInput').val()){
				$(this).siblings('.form-suggestSure').css('color','#B6B6B6');
			}else{
				$(this).siblings('.form-suggestSure').css('color','#111');
				
			}
		});
	}

//可编辑事件绑定
	function editProposal(cls){
		cls.click(function(){
			$(this).siblings('.form-suggestLi').removeAttr("readonly").focus();
			$(this).siblings('.form-suggestLi').removeAttr("disabled").focus();
		})
	}

	//修改tab_title方法
	function setTabTitle(title,url){
		var datalink=url;
		$(".tab_selected").attr("name",title);
		$(".tab_selected").find(".tab_text").html(title).attr("title",title);
		$("[name='"+title+"']").find(".tab_text").attr("title",title);
		// 关闭重复title且未选中的 tab - 一般在待办处理时需要
		if($("li[name='" + title + "']").length > 1){
			$("li[name='" + title + "'].tab_unselect").find(".tab_close a").click();
			if(!datalink)datalink=$("li[name='" + title + "'].tab_unselect").attr("datalink");
		}
		$(".tab_selected").attr("datalink",datalink);
	}
	//选择框选值后自动填入隐藏域方法
	function setHiddenInput(name,Input){
		function setInput(){
			var value="";
			if($("[name='"+name+"']").is("select")){
				value =  $("[name='"+name+"']").find(":selected").text();
			}else if($("[name='"+name+"']").attr("type")=="checkbox"){
				$('input:checkbox[name="'+name+'"]:checked').each(function(){
					value +=$(this).val()+"@";
				})
			}else{
				value = $('input:radio[name="'+name+'"]:checked').val();
			}
		 if(value){
			 $("#"+Input).val(value);
		 }
			
		}
		$("[name='"+name+"']").change(function(){
			setInput();
		})
		setInput();
		
	}
	//控制图标向上向下交互
	function iconChange(obj) {
		$(obj).click(function(){
			$(this).find('.defined-bluePulldown').toggleClass("img-bluePullup");
		});
	}
	//点击更多展开内容--搜索页面
	function searchMore(obj) {
		$(obj).click(function(){
			$(this).find('.defined-bluePulldown').toggleClass("img-bluePullup");
			if($(this).parent('.seoPageContent-letterInfo').height()<=36){
				$(this).parent('.seoPageContent-letterInfo').animate({height: "70px"}, 300);
			 } else{
			 	$(this).parent('.seoPageContent-letterInfo').animate({height: "36px"}, 300);
			 }
		});
	}
	//loading方法url(images/jbox-content-loading.gif) no-repeat bottom center
	function globalLoading() {
		if(top.$("#mask2").length==0){
			top.$("body").append('<div id="mask2" class="mask" style="display:none;"><div class="defined-loading">11</div></div>');
		}
		top.$("#mask2").css("height",$(top.document).height());
		top.$("#mask2").css("width",$(top.document).width());
		top.$("#mask2").show();
		
	}
	function closeGlobalLoading() {
		top.$("#mask2").hide();
	}
	//监听加载状态改变
	document.onreadystatechange = completeLoading;
	//加载状态为complete时移除loading效果
	function completeLoading() {
	  if (document.readyState == "complete") {
		   closeGlobalLoading();
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

(function(){
	var _ajax=$.ajax;
	window.originalJqAjax=_ajax;
	$.ajax=function(options){
		options.complete=function(data){
			// ajax请求结束后关闭遮罩
			if(window.fsscCloseTip) {
				window.fsscCloseTip();
			}
			if(data) {
				data=data.responseText;
				if (data && data.indexOf("id=\"loginForm\"") != -1 && 
					data.indexOf("<input type=\"hidden\" value=\"loginPage\"/>") != -1) {
		    		alert("未登录或登录超时。请重新登录，谢谢！");
					top.location = time_out_homepage;
				}
			}
    	 };
	 	return _ajax(options);
	};
})();
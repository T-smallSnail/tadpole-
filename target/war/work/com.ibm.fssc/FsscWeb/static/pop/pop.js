/*版本号:PLATPOP112 2017-4-7*/
function func_popSingle(scene_id, query_parm, callFun) {
	var parms = returnParms(query_parm);
	sessionStorage.setItem("queryOptions",JSON.stringify({
		'scene_id' : scene_id,
		'params' : encodeURI(parms)
	}));
	  setPrevFrame();
	  var url=ctxStatic + "/pop/jsp/Pop_Single.jsp";
	  top.$.jBox("iframe:"+ url,{
		  title:"",
		  width:1050,
		  height:600,
		  top:25,
		  buttons: false,
		  closed: function () { 
			  if (typeof callFun == "function") {
					callFun.call();
				}
		  },
		  loaded:function(){
			  $(".jbox-content",top.document).css("overflow-y","hidden");
		  }
      });
	  
	  /////

}

function func_popMultipleCheckbox(scene_id, query_parm,boxLoaded) {
	var parms = returnParms(query_parm);
	if (parms != "") {
		if (parms == false) {
			return false;
		}
	}
	$.ajax({
		type : "POST",
		url : ctx + "/sys/popMultiple/findByPopMultiple",
		cache : false,
		data : {
			'scene_id' : scene_id,
			'parms' : encodeURI(parms)
		},
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : 'json',
		success : function(json) {
			var url = ctxStatic + "/pop/jsp/Pop_MultipleCheckbox.jsp";
			if(scene_id=='ZXC003'){
				url = ctxStatic + "/pop/jsp/Pop_MultipleRoleCheckbox.jsp";
			}


			function openbox(){
				$.jBox("iframe:"+ url,{	
					title:"",
					top:25,
					left:-60,
					  width:900,
					  height:600,
					  showScrolling: false,
					  draggable: false,
					  buttons: { '关闭': false},
					  closed: function () { 
						  if (typeof callFun == "function") {
								callFun.call();
							}
					  },
					  loaded:function(){
						  $(".jbox-content").css("overflow-y","hidden");
						  if(boxLoaded)boxLoaded();
						  
					  }
			    });
			}
			//判断left是否有可以折叠，如果可以折叠后再弹框
			if(parent.$("#openClose")&&parent.$("#openClose").hasClass("close")){
				parent.$("#openClose").click();
				setTimeout(openbox,"300");
			}else{
				openbox();
			}
		}
	});
}

function showNewDailogWindow(url, isView, width, height, config, ieConifg) {
	if (!width)
		width = screen.availWidth - 20;
	if (!height)
		height = screen.availHeight - 80;
	// var iTop = (screen.availHeight - 30 - 600) / 2; // 获得窗口的垂直位置;
	// var iLeft = (screen.availWidth - 10 - 900) / 2; // 获得窗口的水平位置;

	// var isIe = true;
	// var agent = navigator.userAgent.toLowerCase();
	// if (agent.indexOf("chrome") > 0 || agent.indexOf("firefox") > 0) {
	// 	isIe = false;
	// }
	// if (isIe) {
	// 	if (ieConifg)
	// 		config = ieConifg;
	// 	else if (isView)
	// 		config = "dialogWidth=25;dialogHeight=30;center:yes;help:no;minimize:no;maximize:no;border:thin;statusbar:no";
	// 	else if (!config)

	// 		config = "dialogWidth:"
	// 				+ width
	// 				+ "px;dialogHeight:"
	// 				+ height
	// 				+ "px;dialogLeft=0px;dialogTop=0px;center=no;resizable=no;scrollbars=no;status:yes;help:no;";
	// 	//显示遮罩层
	// 	parent.parent.maskShow();
	// 	var returnResult = window.showModalDialog(url, window, config);
	// 	//隐藏遮罩层
	// 	parent.parent.hideMask();
	// 	if (returnResult) {
	// 		return returnResult;
	// 	}
	// } else {

	// 	if (!config)
	// 		config = "status=no,width="
	// 				+ 900
	// 				+ "px,height="
	// 				+ 600
	// 				+ "px,menubar=no,scrollbars=no,top="
	// 				+ iTop
	// 				+ ",left="
	// 				+ iLeft
	// 				+ ",status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no";
	// 	//显示遮罩层
	// 	parent.parent.mask.showMask();
	// 	var returnResult = window.open(url, "_blank", config);
	// 	var loop = setInterval(function() {
	// 		if (returnResult.closed) {
	// 			//隐藏遮罩层
	// 			parent.parent.mask.hideMask();
	// 			clearInterval(loop);
	// 		}
	// 	},100);
		
	// }
	// debugger;
	$.jBox("iframe:"+ url,{	
		title:"",
		top:25,
		  width:width,
		  height:height,
		  buttons: { '关闭': true},
		  closed: function () { 
			  if (typeof callFun == "function") {
					callFun.call();
				}
		  }
    });
}

function returnParms(query_parm) {
	var isEmpty = true;
	var val = "";
	var parms = "";
	if (query_parm.indexOf(",") > 0) {	// where 后面有多个查询条件的
		var arr = query_parm.split(",");	// a@,b
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].indexOf("@") > 0) {
				val = document.getElementsByName(arr[i].split("@")[0])[0].value;
			} else {
				val = document.getElementsByName(arr[i])[0].value;
			}
			if (val != null && val != "" && typeof(val) != 'undefined') {
				val = val.replace(/\,/g, "");
				parms += arr[i] + "=" + val;
				parms += ",";
				isEmpty = false;
				if (isHadChineseChart(val)) {
					var len = getStrLength(val);
					if (len < 4) {
						sAlert("请输入最少两个汉字进行查询!");
						return false;
					}
				}
			}
		}
		if (isEmpty) {
			// sAlert("请在相应页面属性输入值后，再点击放大镜查询!");
			// return false;
		}
	} else {// 只有一个查询条件的
		if (query_parm != "") {
			if (query_parm.indexOf("@") > 0) {
				val = document.getElementsByName(query_parm.split("@")[0])[0].value;
			} else {
                var name = document.getElementById(query_parm);
                if(null!=name){
                    if(name.tagName=="INPUT" || name.tagName=="SELECT"){
                        val = name.value;
                    }else{
                        val = $(name).find("input").val();
                    }
					// val = val.replace(/\,/g, "");
				}else {
                	val = "";
				}
			}
			if (val == "") {
				// sAlert("请在相应页面属性输入值后，再点击放大镜查询!");
				// return false;
			} else {
                parms = query_parm + "=" + val;
			}
		}
	}
	return parms;
}

function isHadChineseChart(str){
	if(/.*[\u4e00-\u9fa5]+.*$/.test(str)){
		return true;
	}
	return false;
}




/**
 * 公用树弹出页（单选框） 参数1标示场景ID 参数2表示要从页面传的值即SQL语句where后面的条件
 */
function func_PopTree(scene_id, query_parm, call_func) {
	var parms = returnParms(query_parm);
	if (parms != "") {
		if (parms == false) {
			return false;
		}
	}
	url = "${ctx}a/sys/treeConf/getTreeConf?sceneId=" + scene_id + "&parms="
			+ encodeURI(parms) + "&call_func=" + call_func;
	showNewDailogWindow(url, true, 400, 400);
}

function getStrLength(str) {
	if (str == null)
		return 0;
	if (typeof str != "string") {
		str += "";
	}
	return str.replace(/[^\x00-\xff]/g, "01").length;
}
//弹出多选框回填值方法
//author:wangpeng;
function openPopCheckbox(scene_id, query_parm,boxLoaded,callback){
	var parms = returnParms(query_parm);
	if (parms != "") {
		if (parms == false) {
			return false;
		}
	}
	$.ajax({
		type : "POST",
		url : ctx + "/sys/popMultiple/findByPopMultiple",
		cache : false,
		data : {
			'scene_id' : scene_id,
			'parms' : encodeURI(parms)
		},
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : 'json',
		success : function(json) {
			var db_rel = json.rel;
			var sql = json.sql;
			var col_name = json.col_name;
			col_name = encodeURI(col_name);
			sql = sql.replace(/\%/g, "@");
			var url = ctxStatic + "/pop/jsp/Pop_MultipleCheckbox.jsp?rel="
					+ db_rel + "&sql=" + sql + "&col_name=" + col_name
					+ "&parms=" + parms;
			if(scene_id=='ZXC003'){
				url = ctxStatic + "/pop/jsp/Pop_MultipleRoleCheckbox.jsp?rel="
				+ db_rel + "&sql=" + sql + "&col_name=" + col_name
				+ "&parms=" + parms;
			}
			    top.$.jBox("iframe:"+url, {
					title: "",
					width: 1000,
					top:"10%",
			        showScrolling: false,
					height: 500,
					buttons: { '关闭': true },
					loaded: function (h) { 
						$(".jbox-content",top.document).css("overflow-y","hidden");
						
						var $iframeBody = top.$("#jbox-iframe").contents().find(".body_bg");
						var $submitBtn = $iframeBody.find("#submit");
						var $table = $iframeBody.find("#tablist");
						var $trArr = $table.find("tr");
						//确认按钮事件
						$submitBtn.click(function(){
							var checkedArr=[]
							$trArr.find("input:checkbox[name='pop_box']:checked").each(function(){
								checkedArr.push($(this).parent().parent().find("#role_name").text());
							})
							callback(checkedArr)
							top.$.jBox.close();
						})
					},
					submit: function (v,h,f) {  
			            $trArr.click(function(){
			            	var obj = {
			            			"userName":$(this).find("td:first-child").text(),
			            			"officeName":$(this).find("td:nth-child(2)").text(),
			            			"vaule":$(this).find("input").val()
			            	}
			       
			            	callback(obj);
			            	top.$.jBox.close();
			            })
					},
				});
		}
	})
}
/**
 * Created by 34502 on 2017/3/24.
 */
// author:wangpeng;
//弹出穿梭框部分
;(function (factory) {
    // 如果要兼容 CMD 等其他标准，可以在下面添加条件，比如：
    // CMD: typeof define === 'function' && define.cmd
    // UMD: typeof exports === 'object'
    if (typeof define === 'function' && define.amd) {
        // AMD
        define(['zepto'], factory);
    } else {
        factory(jQuery);
        // 如果要兼容 Zepto，可以改写，比如使用：factory(Zepto||jQuery)
    }
})(function($){
    $.fn.addMultiselect = function(options){
        return this.each(function(){
            new Multiselect($(this),options);
        })
    }
    var Multiselect = function(inputEle,options){
    	
        var self = this;
        self.$input = inputEle;
        var defaultOpt = {
        	scene:"",
        	queryparms:"",
            title1:"待选择列表",
            title2: "已选择列表",
            callback:function(data){
            }
        };
        //参数对比
        this.options = $.extend({},defaultOpt,options);
        var leftArr = [],rightArr = [];
        this.totalLen=0;this.choLen=0;
        this.options.JSONData={};
        self.init();
    };
//穿梭框返回JSon
	Multiselect.prototype.func_popMultipleRl = function(scene_id,queryparms) {
		var self = this;
		var parms = returnParms(queryparms);
		$.ajax({
			type : "POST", // 请求方式
			url : ctx + "/sys/popMultiple/findByPopMultipleRl", // 请求路径
			cache : false,
			async : false,
			data : {
				
				'scene_id' : scene_id,
				'parms' : encodeURI(parms)
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : 'json',
			success : function(json) {
				self.options.JSONData = json;
				
			}
		});
	
	}
    
    //初始化插件HTML
    Multiselect.prototype.renderHTML = function(){
        var html = '	<div class="overall-layout" id="popbox" style="display:none;">\
						<div class="shuttle-box">\
						<div class="shuttle-box-top">\
						<span class="shuttle-box-topTitle fl">\
						待选择列表(<span  id="total" name="total" style="width: 35px" readonly></span>)\
			</span>\
				<span class="shuttle-box-topTitle fr">\
						已选择列表(<span  id="cho" name="cho" style="width: 35px" readonly></span>)\
			</span>\
				</div>\
				<div class="shuttle-box-content">\
						<div class="shuttle-box-contentRight">\
						<div class="shuttle-box-contentRLtop" >\
						<div class="form-inline">\
						<div class="form-group form-inline-align">\
						<input type="search" class="form-control icon-sameAttr16 defined-search left_parm_search"  placeholder="搜索" />\
						</div>\
						</div>\
						</div>\
						<div class="shuttle-box-contentRLbottom " >\
						<!--<div style="height: 400px;width: 100%;">-->\
						<select name="left_parm" id="left_parm" size="23" multiple="multiple" class="shuttleBox-ele">\
						</select>\
						<!--</div>-->\
						</div>\
						</div>\
						<div class="shuttle-box-contentMiddle">\
						<div class="shuttle-box-btn  shuttle-boxBtn-active">&#62;</div>\
						<div class="shuttle-box-btn  shuttle-boxBtn-active">&#60;</div>\
				</div>\
				<div class="shuttle-box-contentLeft">\
						<div class="shuttle-box-contentRLtop" >\
						<div class="form-inline">\
						<div class="form-group form-inline-align">\
						<input type="search" class="form-control icon-sameAttr16 defined-search right_parm_search"  placeholder="搜索" />\
						</div>\
						</div>\
						</div>\
						<div class="shuttle-box-contentRLbottom" >\
						<select name="right_parm" id="right_parm" size="23" multiple="multiple" class="shuttleBox-ele"></select>\
						</div>\
						</div>\
						</div>\
						<div class="shuttle-box-bottom">\
						<div class="main-animateDiv">\
						<div class="btn-main-animateDiv">\
						<div class="btn-main-animate" ></div>\
						<button class="btn btn-main">确定</button>\
						</div>\
						</div>\
						<div class="main-animateDiv">\
						<div class="btn-main-animateDiv">\
						<div class="btn-main-animate" ></div>\
						<button class="btn btn-auxiliaty show_bnt">关闭</button>\
						</div>\
						</div>\
						</div>\
						</div>\
						</div>'
        $("body").append(html);
    };
    //dom渲染
    Multiselect.prototype.renderCheckboxHTML=function(arr,id){
    	
        var self = this;
        var html="";
//				arr.sort(function(a,b){return a.split("-")['+self.options.JSONData.mapData.site+']-b.split("-")['+self.options.JSONData.mapData.site+']});
        for(var i=0;i<arr.length;i++){
            html+='<option class="opt" value="'+arr[i].split("-")[self.options.JSONData.mapData.site]+'">'+arr[i]+'</option>'
        }
        $("#right_parm, #left_parm").empty();
        $(".left_parm_search, .right_parm_search").val("");
        self.choLen=0;
        $("#"+id).append(html);
        self.totalLen= arr.length;
        $("#total").html(self.totalLen);
        $("#cho").html(self.choLen);
    };
    //搜索函数
    Multiselect.prototype.func_match = function(id) {
        var obj = $("#"+id+" option");
        obj.attr("selected",false);
        var val = $("."+id+"_search").val();
        var len = 0;
        if (val != "") {
            var allOptions = $("#"+id).children();
            $(allOptions).each(function(i) {
                if ($(allOptions[i]).html().indexOf(val) <= -1) {
                    $("#"+id).append(allOptions[i]);
                    //$("#left_parm option").eq(0).attr('selected', 'true');
                }else{
                    len++;
                }
            });
        }
        for( var j=0;j<len;j++ ){
            $("#"+id+" option").eq(j).attr('selected', 'true');
        }
    }
    //左右option互填值函数
    Multiselect.prototype.addParm =function(id){
        var self = this;
        if(id=="left_parm"){
            $('#left_parm option:selected').appendTo('#right_parm');
            self.choLen = $("#right_parm option").length;
            self.totalLen = $("#left_parm option").length;
            $("#cho").html(self.choLen);
            $("#total").html(self.totalLen);
        }else{
            $('#right_parm option:selected').appendTo('#left_parm');
            self.choLen = $("#right_parm option").length;
            self.totalLen = $("#left_parm option").length;
            $("#cho").html(self.choLen);
            $("#total").html(self.totalLen);
        }
    }
    //保存回填值
    Multiselect.prototype.func_save = function (){
        var self = this;
        var right_val = "";
        var right_name = "";
        var right_text = "";
        var entity = self.options.JSONData.mapData.rel;
        var colName = entity.split(",");
        $("#right_parm option").each(function() {
            right_val += $(this).val() + "@";
            right_name+=$(this).text().split("-")[1]+ "@";;
        });
        right_val = right_val.substr(0,right_val.length-1);
        right_name = right_name.substr(0,right_name.length-1);
		/*document.getElementsByName(colName[1])[0].value = right_val;*/
        for(var i=0;i<colName.length;i++){
            $("[name='"+colName[i].split("-")[1]+"']").attr("value",right_val);
        }
        self.options.callback(right_val,right_name);
    }
    //事件绑定
    Multiselect.prototype.bindClick = function(){
        var self =this;
        //显示隐藏
        $(".show_bnt").on("click",function(){
            $("#popbox").hide("slow");
        });
        //option双击事件
        $(".shuttleBox-ele").dblclick(function() {
            var id = $(this).attr("id");
            self.addParm(id)
        });
        //选中添加事件
        $(".shuttle-box-btn ").on("click",function(){
            var id = $(this).index()==1 ? "right_parm":"left_parm";
            self.addParm(id);
        })
        //搜索列表事件
        $(".defined-search").on("keyup",function(){
            var id = $(this).hasClass("left_parm_search") ? "left_parm" : "right_parm";
            self.func_match(id);
        })
        //保存
        $(".btn-main").on("click",function(){
            $("#popbox").hide("slow");
            self.func_save();
        })

    };
   // //绑定当前点击按钮事件
    Multiselect.prototype.showBtn = function(){
        var self = this;
        self.$input.on("click",function(){
            //显示隐藏
        
        	self.func_popMultipleRl(self.options.scene,self.options.queryparms);
        	self.renderCheckboxHTML(self.options.JSONData.listData,"left_parm");
                $("#popbox").show("slow");
        });
    };
    
    //初始化页面
    Multiselect.prototype.init = function(){
        if($("#popbox").length==0){
            this.renderHTML();
            this.bindClick();
        }
        this.showBtn();
        // this.renderCheckboxHTML(self.options.JSONData.listData,"left_parm");
        // this.bindClick();
    }
 
});

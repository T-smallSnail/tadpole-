''/**
 *验证只能输入数字
 */
/*function valiteNum(){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	var keyCode = e.keyCode;
	if(keyCode >= 48 && keyCode <= 57 && keyCode >= 96 && keyCode <= 105){
	 alert('您输入的是数字!');
    }else{
	 alert('您输入的不是数字!');	
	}

}*/
//全局对象
var globalSettings={
		clickedFlag:""
};
$(document).ready(function() {
    $("#loading").ajaxStart(function () {
        parent.mask.showMask();
    }).ajaxStop(function () {//ajaxStop改为ajaxComplete也是一样的
        parent.mask.hideMask();
    });
});
/**
 * 表单保存操作
 */
function insert( ) {
	var form = document.getElementById("claimForm");
	var vendorName =document.getElementById("vendorName").value;
	form.submit();
	}



//是否事前申请
function  openClaim(){
	  var url = document.getElementById("hiddenValue").value;
	  window.open(url, 'newwindow', 'height=900%, width=1000%, top=130%, left=250%, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');   //该句写成一行代码

}
//金额转换成大写方法（万亿级）
//金额转换成大写
function lowToUp(currencyDigits,id) {
    if(currencyDigits==""){
        document.getElementById(id).value="";
    }
    var MAXIMUM_NUMBER = 9999999999999.99;
    var CN_ZERO = "零";
    var CN_ONE = "壹";
    var CN_TWO = "贰";
    var CN_THREE = "叁";
    var CN_FOUR = "肆";
    var CN_FIVE = "伍";
    var CN_SIX = "陆";
    var CN_SEVEN = "柒";
    var CN_EIGHT = "捌";
    var CN_NINE = "玖";
    var CN_TEN = "拾";
    var CN_HUNDRED = "佰";
    var CN_THOUSAND = "仟";
    var CN_TEN_THOUSAND = "万";
    var CN_HUNDRED_MILLION = "亿";
    var CN_DOLLAR = "元";
    var CN_TEN_CENT = "角";
    var CN_CENT = "分";
    var CN_SYMBOL = "人民币";
    var CN_INTEGER = "整";
    var integral; // Represent integral part of digit number.
    var decimal; // Represent decimal part of digit number.
    var outputCharacters; // The output result.
    var parts;
    var digits, radices, bigRadices, decimals;
    var zeroCount;
    var i, p, d;
    var quotient, modulus;
    currencyDigits = currencyDigits.toString();
    if (currencyDigits == "") {
        return "";
    }
    if (currencyDigits.match(/[^,.\d]/) != null) {
        return "";
    }
    if ((currencyDigits).match(/^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/) == null) {
        return "";
    }
    currencyDigits = currencyDigits.replace(/,/g, ""); // Remove comma delimiters.
    currencyDigits = currencyDigits.replace(/^0+/, ""); // Trim zeros at the beginning.
    if (Number(currencyDigits) > MAXIMUM_NUMBER) {
        return "";
    }
    parts = currencyDigits.split(".");
    if (parts.length > 1) {
        integral = parts[0];
        decimal = parts[1];
        decimal = decimal.substr(0, 2);
    }
    else {
        integral = parts[0];
        decimal = "";
    }
    digits = ["零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌","玖"];
    radices = ["", "拾", "佰", "仟"];
    bigRadices = ["", "万", "亿","兆"];
    decimals = ["角", "分"];
    // Start processing:
    outputCharacters = "";
    
    // Process integral part if it is larger than 0:
    if (Number(integral) > 0) {
        zeroCount = 0;
        for (i = 0; i < integral.length; i++) {
            p = integral.length - i - 1 ;
            d = integral.substr(i, 1);
            quotient = p / 4;
            modulus = p % 4;
            if (d == "0") {
                zeroCount++;
            }
            else {
                if (zeroCount > 0){
                    outputCharacters += digits[0];
                }
                zeroCount = 0;
                outputCharacters += digits[Number(d)] + radices[modulus];
               
            }
            if (modulus == 0 && zeroCount < 4) {
                outputCharacters += bigRadices[quotient];
            }
        }


        outputCharacters += CN_DOLLAR;
    }

    // Process decimal part if there is:

    if (decimal != "") {
        for (i = 0; i < decimal.length; i++) {
            d = decimal.substr(i, 1);
            if (d != "0") {
                outputCharacters += digits[Number(d)] + decimals[i];
            }

        }
    }

    // Confirm and return the final output string:
    if (outputCharacters == "") {
        outputCharacters = CN_ZERO + CN_DOLLAR;
    }
    if (decimal[0] == "0"&&decimal[1] == "0") {
        outputCharacters += CN_INTEGER;
    }
    outputCharacters = outputCharacters;

    document.getElementById(id).value=outputCharacters;
    return outputCharacters;
}

/** 将千分位格式的字符串转换为浮点数 */
function toFloat(num) {

    var fTmp = parseFloat(num.replace(/,/g, ''));
    return   (isNaN(fTmp) ? 0 : fTmp);
}

/**
 * 金额按千位逗号分割
 * @param num
 * @returns {string}
 */
function formatMoney(num){
	if(num!=null&&num!=undefined){
		num = num.toString().replace(/\$|\,/g,'');
	}
    if(isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num*100+0.50000000001);
    cents = num%100;
    num = Math.floor(num/100).toString();
    if(cents<10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
        num = num.substring(0,num.length-(4*i+3))+','+
            num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + num + '.' + cents);
}

//格式化数量保留6位小数
function formatQuanTity(obj,number){
	//检查是否是非数字值
    if (isNaN(obj.value)) {
        obj.value = "0";
        return;
    }
    if (obj != null) {
    	var quanTity  = obj.value.toString().replace(/(^\s*)|(\s*$)/g,'');
        //检查小数点
        if (quanTity.split(".").length > 1) {
        	if(quanTity.split(".")[1].length > number){
        		obj.value = parseFloat(quanTity.substring(0, quanTity.indexOf('.') + (number + 1)));
        	}
        }
    }
}
    //自定义一个验证方法
    $.validator.addMethod(
        "formatMoney", //验证方法名称
        function(value, element, param) {//验证规则
            // var returnVal =(value == toFloat(value));
            // if(returnVal&&param!="undefined"&&param!=''){
            //     lowToUp(value,param);
            // }else {
            //     document.getElementById(param).value='';
            // }
            // $("#"+element.id).val(formatMoney(value));
            var reg = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
            return reg.test(value);
        },
        '请输入正确的金额'//验证提示信息
    );

/**
 * 根据字典值生成下拉选择框
 */
function appendDictSelect(selectId,dictValue) {
    for(var i=0;i<dictValue.length;i++){
        if(i==0){
            $('#'+selectId).prev().children(":first").text(dictValue[i].label);//设置下拉的选中值
        }
        $("#"+selectId).append("<option value='"+dictValue[i].type+"'>"+dictValue[i].label+"</option>");  //为Select追加一个Option(下拉项)
    }

}

/**
 * 根据业务大小类查询所属行业
 * @param industryId
 * @param templateNo
 */
function ajaxChangeSelectDict(ctx,industryId,templateNo) {
    $.ajax({
        url: ctx+"/account/common/findIndustry",
        data: {"supCateId":$(".supCateId").val(),"templateNo":templateNo},
        dataType: "json",
        type: "post",
        success: function (data) {
            var industryList = data.industryList;
            $("#industryId").empty();
            appendDictSelect(industryId,industryList);
        }
    });
}
//iframe弹出框
function openPop(url,title){
	setPrevFrame();
	 top.$.jBox("iframe:"+url, {
		title: title,
		width: 1000,
		top:"10%",
        showScrolling: false,
        draggable: true,
		height: 580,
		buttons: { },
        loaded: function (h) {
            $(".jbox-content",top.document).css("overflow-y","hidden"); 
		},
	});
}
//iframe弹出框2,回传值回掉函数
//使用方法：
//var callback = function(data){得到值后要操作的内容}
//openPopCallback(url,title,callback);
function openPopAssignment(url,title,callback){
	setPrevFrame();
	 top.$.jBox("iframe:"+url, {
		title: title,
		width: 1000,
		top:"10%",
        showScrolling: false,
        draggable: true,
		height: 580,
		buttons: { },
        loaded: function (h) {
            $(".jbox-content",top.document).css("overflow-y","hidden");
		},
	});
}
//iframe弹出框2
//使用方法：
// var callback = function(data){得到值后要操作的内容}
//openPopCallback(url,title,callback);
function openPopCallback(url,title,callback){
	setPrevFrame();
	url=encodeURI(url);
    $.jBox("iframe:"+url, {
		title: title,
		width: 1000,
		top:"10%",
        showScrolling: false,
        draggable: true,
		height: 500,
		buttons: { 
},
loaded: function (h) {
    $(".jbox-content").css("overflow-y","hidden");
},   
closed:function(){
	
		}
	});
}
//iframe弹出框3
//使用方法：
//var callback = function(data){得到值后要操作的内容}
//openPopCallback(url,title,callback);

function openPopCall(url,title,callback){
	setPrevFrame();
	top.$.jBox("iframe:"+url, {
		title: title,
		width: 1000,
		top:"10%",
		showScrolling: false,
		draggable: true,
		height: 500,
		buttons: { 

},
loaded: function (h) {
  $(".jbox-content",top.document).css("overflow-y","hidden");
},   
closed:function(){
			callback();
		}
	});
}
//展示型弹框
function openPopDisplay(url,title){
	top.$.jBox("iframe:"+url, {
		title: title,
		width: 1000,
		top:"10%",
		showScrolling: false,
		draggable: true,
		height: 500,
		buttons: { 

},
loaded: function (h) {
  $(".jbox-content",top.document).css("overflow-y","hidden");
}
	});
}
//树结构弹出框公共方法公共回调函数--概算节点
function getTreeData(treeNode){	
		var parentTId = treeNode.parentTId;
		var typeValue = treeNode.name;
		var idValue = treeNode.id;
		var mark = globalSettings.clickedFlag.indexOf(',')>0?globalSettings.clickedFlag.indexOf(','):0;
		if(mark){
			var id = "#"+globalSettings.clickedFlag.substring(0, mark);
			$(id).val(idValue);
		}
		var type = "#"+globalSettings.clickedFlag.substr(mark+1);
		$(type).val(typeValue);
		$(type).attr("title",typeValue);
		//$.jBox.close();
		top.$.jBox.close(top.jBox.getBox(0).attr("id"));
	
	
}


// 特殊组织树  --编码为PIDS
function getBudgeTreeData(treeNode){
	var typeValue = treeNode.name;
	var idValue = treeNode.pIds;
	var mark = globalSettings.clickedFlag.indexOf(',')>0?globalSettings.clickedFlag.indexOf(','):0;
	if(mark){
		var id = "#"+globalSettings.clickedFlag.substring(0, mark);
		$(id).val(idValue);
	}
	var type = "#"+globalSettings.clickedFlag.substr(mark+1);
	$(type).val(typeValue);
	$(type).attr("title",typeValue);
	top.$.jBox.close(top.jBox.getBox(0).attr("id"));
}
function getTreeData2(treeNode,treeValue){	
	//var parentTId = treeNode.parentTId;
	//var typeValue = treeNode.name;
	var idValue = treeNode.id;
	var mark = globalSettings.clickedFlag.indexOf(',')>0?globalSettings.clickedFlag.indexOf(','):0;
	if(mark){
		var id = "#"+globalSettings.clickedFlag.substring(0, mark);
		$(id).val(idValue);
	}
	var type = "#"+globalSettings.clickedFlag.substr(mark+1);
	$(type).val(treeValue);
	$(type).attr("title",treeValue);
	top.$.jBox.close(top.jBox.getBox(0).attr("id"));


}
//树结构弹出框公共方法
function openTreeCallback(id ,url ,title ,callback){
	globalSettings.clickedFlag = id;
	setPrevFrame();
    top.$.jBox("iframe:"+url, {
		title: title,
		width: 310,
		top:"10%",
        showScrolling: false,
		height: 500,
		draggable: false,
		buttons: {
			/*'关闭': true*/
		},
        loaded: function (h) {
            $(".jbox-content",top.document).css("overflow-y","hidden");
            /*var $leftIframe = $("#jbox-iframe").contents().find("#officeContent");
            var $tableIframe = $leftIframe.contents().find("#contentTable")
            var $trArr = $tableIframe.find("tr");
            $trArr.on("click","tr",function(){
            	var obj = {
            			"userName":$(this).find("td:first-child").text(),
            			"officeName":$(this).find("td:nth-child(2)").text(),
            			"vaule":$(this).find("input").val()
            	}
            	callback(obj);
            	$.jBox.close();
            })*/
		},
		submit:function(){
			
		}
	});
}
function setSummary() {
 		var remarkCfg = $("#remarkCfg").val();
 	    var remarkParam = $("#remarkParam").val();
 	    var innerValue;
 	    if (typeof (remarkCfg) == "undefined")
 	        return;
 	    params = remarkParam.split("#cusfs#");
 	    for (var i = 0; i < params.length; i++) {
 	        var param = $("#" + params[i]);
 	        if (param != null && param.val() != null) {
 	            if (param.attr('id') == 'supCateName') {
 	                var supCateName = $("#s2id_supCateId span").text();
 	                innerValue = supCateName;
 	            }else{
 	                innerValue = param.val();
 	            }
 	        }
 	        var regStr = new RegExp("【"+ params[i] +"】", "g");
 	        remarkCfg = remarkCfg.replace(regStr,innerValue);
			if(remarkCfg.split("--").length>0){
 	        	remarkCfg = remarkCfg.replace("--","-");
 	        }
 	    }
 	    remarkCfg = remarkCfg.replace(/##/g, "\"");
 	    if ($("#summary")) {
 	        if (remarkCfg != "") {
 	            $("#summary").val(remarkCfg);
 	        }
 	    }
  
}
    /*
     * 日期格式
     */
    function formatDate (ss) {
	  date = new Date(ss);
	   var y = date.getFullYear();  
	   var m = date.getMonth() + 1;  
	   m = m < 10 ? '0' + m : m;  
	   var d = date.getDate();  
	    d = d < 10 ? ('0' + d) : d;  
	   return y + '-' + m + '-' + d;
    }
    //借贷科目改变
function setCrSeq() {
    var crSeqCode = $("#subCrSeqCode").val(); 
    var crSeqName = $("#subCrSeqName").val(); 
    var crAmount = $("#subCrAmount").val();
    $("#crSeq").val(crSeqName+"----"+crAmount+"元");
    
}

function setDrSeq() {
    var drSeqCode = $("#subDrSeqCode").val();
    var drSeqName = $("#subDrSeqName").val();
    var drAmount = $("#subDrAmount").val();
    $("#drSeq").val(drSeqName+"----"+drAmount+"元");
}
function setPayCrSeq() {
    var payCrSeqName = $("#payCrSeqName").val();
    var payCrAmount = $("#payCrAmount").val();
    $("#payCrSeq").val(payCrSeqName+"----"+payCrAmount+"元");
}
function setPayDrSeq() {
    var payDrSeqName = $("#payDrSeqName").val();
    var payDrAmount = $("#payDrAmount").val();
    $("#payDrSeq").val(payDrSeqName+"----"+payDrAmount+"元");
}
function setBillSummary(){
		var summary = $("#summary").val();
		if(summary==null||summary==""){
			var remarkCfg = $("#remarkCfg").val();
	 	    var remarkParam = $("#remarkParam").val();
	 	    var innerValue;
	 	    if (typeof (remarkCfg) == "undefined")
	 	        return;
	 	    params = remarkParam.split("#cusfs#");
	 	    for (var i = 0; i < params.length; i++) {
	 	        var param = $("#" + params[i]);
	 	        if (param != null && param.val() != null) {
	 	            if (param.attr('id') == 'supCateName') {
	 	                var supCateName = $("#s2id_supCateId span").text();
	 	                innerValue = supCateName;
	 	            }else{
	 	                innerValue = param.val();
	 	            }
	 	        }
	 	        var regStr = new RegExp("【"+ params[i] +"】", "g");
	 	        remarkCfg = remarkCfg.replace(regStr,innerValue);
	 	    }
	 	    remarkCfg = remarkCfg.replace(/##/g, "\"");
	 	    if ($("#summary")) {
	 	        if (remarkCfg != "") {
	 	            $("#summary").val(remarkCfg);
	 	        }
	 	    }
		}
}

function moneyToString(money){
	if (money == 0 || money == null) {
		return '0.00';
	} else if (money % 100 == 0) {
		var data = money / 100 + '.00'
		return formatMoney(data);
	} else if (money % 10 == 0) {
		var data = money / 100 + '0';
		return formatMoney(data);
	}else if(money % 10 != 0){
		var data = money / 100;
		return formatMoney(data);
	}
}
//检查输入的字符长度
function checkLength(obj,maxlength){
    if(obj.value.length > maxlength){
        obj.value = obj.value.substring(0,maxlength);
    }
}
/*
 * 往来单位的回调函数
 */
function getBankAccountDataPop(data,accountType){
	  data = $(data);
			if(data==undefined||data.length==0){
				return;
			}
			var obj = {
			    "accountType":accountType,//往来单位类别
    			"parentAccount":data.find("td:first-child").text(),     //名称
    			"supplierNo":data.find("td:nth-child(2)").text(),  //编号
              "accountName":data.find("td:nth-child(3)").text(),	//户名
    			"accountNo":data.find("td:nth-child(4)").text(), //银行账号
    			"bankName":data.find("td:nth-child(5)").text() //开户行
      	}
			//往来单位类别 accountType
		/*  1 员工
			2 客户
			3 外部供应商"
			4 内部供应商"*/
	    if($("#vendorType").length>0){
	    	if(obj.accountType==1){
	  		  $("#vendorType").val("Y");
	  		}else if(obj.accountType==2){
	  		  $("#vendorType").val("C");
	  		}else{
		  	  $("#vendorType").val("G");
		    }
	    	
	    }
      	if(typeof(getVendorCallBack2)=="function"){//函数功能 给自己页面回显相对应的值,增加“清除”字样 
      		getVendorCallBack2(obj);
      	}
	}

/**
 * @description 待办处理详情页面
 *    由于在待办处理页面，某些环节如退回到《起草》环节时，用户“保存”或“新增”等跳转页面的操作后会篡改原有待办 url
 *    所以增加该方法用于跳转到原有待办处理页面
 * @param params 用户操作后需要拼接到参数，格式支持 json或 string
 *     1、json: {
		            processInstId: "1111",
		            processDefId: "activity",
		            newCol: "222222"
		        };
 *     2、string: processInstId=1111&processDefId=activity&newCol=2222222
 */
function gotoTodoPage(params) {
	var url = $("li.tab_selected", window.parent.document).attr("datalink");
	
	if(params) {
		if(params.indexOf("?") == 0) {
			params = params.substr(1);
		}
		
		if(url.indexOf("?") == -1) {
			url += "?"; // 方便后面追加参数
		} else {
			url += "&"; // 为了正则表达式替换参数
		}
		// 将 string参数转换为 json统一处理
		if((typeof params) == "string") {
			var tempParams = params.split("&");
			params = {};
			for(var i = 0; i < tempParams.length; i++) {
				if(!tempParams[i]) {
					continue;
				}
				var temp = tempParams[i].split("=");
				params[temp[0]] = temp[1];
			}
		}
		for(var p in params) {
			if(params[p]) { // 有值才替换或追加到 url后面
				var param = (p + "=" + params[p]);
				var regex = eval("/(" + p + "=.*?)&/"); // 转换为正则表达式
				if(regex.test(url)) {
					url = url.replace(RegExp.$1, param); // 替换原有参数			
				} else {
					url += param + "&"; // 追加新的参数
				}
			}
		}
	}
	
	window.location.href = url;
}


//限制钱 参数: 固定this , 固定event, 最大金额
function limitMoney(datNode,e,moneyMax){
	var lKeyCode = (navigator.appname=="Netscape")?e.which:e.keyCode;
	var dataNode = $(datNode);
	var maxlength = dataNode.attr("maxlength");
	
	if(lKeyCode==8){
		dataNode.removeClass("verify-error");
		dataNode.removeClass("valid");
		dataNode.siblings("label.verify-error-line").remove();
		return;
	}
	//去掉标红的警示文字
	dataNode.removeClass("verify-error");
	dataNode.removeClass("valid");
	dataNode.siblings("label.verify-error-line").remove();
	var inputMoney = dataNode.val();
	if(dataNode.val().indexOf(",")!=-1){
		inputMoney = delcommafy(inputMoney);
	}
	if(moneyMax==undefined&&maxlength==undefined){
		moneyMax = 999999999999.99;
		maxlength = formatMoney(moneyMax).length;
		dataNode.attr("maxlength",maxlength);
	}
	if(moneyMax!=undefined){
		if(maxlength==undefined){
			maxlength = formatMoney(moneyMax).length;
			dataNode.attr("maxlength",maxlength);
		}
		if(parseFloat(inputMoney)>parseFloat(moneyMax)){
			dataNode.val(formatMoney(moneyMax));
			dataNode.after('<label for="'+dataNode.attr("id")+'" class="verify-error verify-error-line" style="bottom: -20px; right: 5px;">超出最大'+moneyMax+'的金额限制</label>');
			dataNode.next().show();
			dataNode.removeClass("valid");
		}
	}else{
		if(formatMoney(inputMoney).length>maxlength){
			moneyMax = 999999999999.99;
			dataNode.val(formatMoney(moneyMax));
			if(dataNode.siblings("label.verify-error-line").length==0){
				dataNode.addClass("verify-error");
				dataNode.after('<label for="'+dataNode.attr("id")+'" class="verify-error verify-error-line" style="bottom: -20px; right: 5px;">请输入一个长度最多是  '+maxlength+' 的字符</label>');
				dataNode.next().show();
			}
		}
	}
}
//校验负数
function validateNegative(datNode,e){
	var lKeyCode = (navigator.appname=="Netscape")?e.which:e.keyCode;
	var dataNode = $(datNode);
	var moneyMax = -999999999999.99;
	var moneyMin = 0 ;
	var maxlength = formatMoney(moneyMax).length;
	if(lKeyCode==8){
		dataNode.removeClass("verify-error");
		dataNode.removeClass("valid");
		dataNode.siblings("label.verify-error-line").remove();
		return;
	}
	//去掉标红的警示文字
	dataNode.removeClass("verify-error");
	dataNode.removeClass("valid");
	dataNode.siblings("label.verify-error-line").remove();
	var inputMoney = dataNode.val();
	if(dataNode.val().indexOf(",")!=-1){
		inputMoney = delcommafy(inputMoney);
	}
	if(isNaN(inputMoney)){
		dataNode.val("-1");
	}
	if((parseFloat(inputMoney)<parseFloat(moneyMax))){
		dataNode.val(formatMoney(moneyMax));
		dataNode.after('<label for="'+dataNode.attr("id")+'" class="verify-error verify-error-line" style="bottom: -20px; right: 5px;">请输入不能小于'+moneyMax+ '的负数金额！</label>');
		dataNode.next().show();
		dataNode.removeClass("valid");
	}
	if(parseFloat(inputMoney)>= parseFloat(moneyMin)){
		dataNode.val("-1");
		dataNode.after('<label for="'+dataNode.attr("id")+'" class="verify-error verify-error-line" style="bottom: -20px; right: 5px;">请输入小于'+moneyMin+ '的负数金额！</label>');
		dataNode.next().show();
		dataNode.removeClass("valid");
	}
}
//失去焦点，移除错误提示
function removeError(){
	$("label.verify-error-line").remove();
}
	
//反格式化带逗号的string格式的金额
//反格式化带逗号的string格式的金额
function delcommafy(num){
   if((num+"").trim()==""){
	   return"";
   }else{
	 num=  num+"";
   }
   dd=num.replace(/,/g,'');
   ee=Number(dd);
   return ee;
}
 
 
//监听加载状态改变
	document.onreadystatechange = completeLoading;
	//加载状态为complete时移除loading效果
	function completeLoading() {
	  if (document.readyState == "complete") {
		   closeGlobalLoading();
	  }
	}
	//处理外部页面跳转时，无top层页面top.prevIframeId_G不存在问题
	if(top.prevIframeId_G==undefined) {
        var prevIframeId_G = [];
    }
	//jquery中处理时间格式化
	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	
	
	
	
	//合并ajax.common.js
	/**
	 * ajax异常统一处理
	 */
	$(function() {
		$.ajaxSetup({
	        error: function(xhr, textStatus, errorThrown) {
	        	var sessionstatus = xhr.getResponseHeader("sessionstatus");
		       	if(sessionstatus=="timeout") {
		       		return false;
		       	}
	        	wfGlobalAlert(xhr, textStatus, errorThrown);
	        }
	    });
	});

	function wfGlobalAlert(xhr, textStatus, errorThrown) {
		if(window.wfClearRepeatFlag) {
			wfClearRepeatFlag();				
		}
		fsscCloseTip();
		var title = "异常提示";
		var errMsg = xhr.responseText;
		var errCode = "";
		
		try {
			if(errMsg && (errMsg.indexOf("{") != -1)) {
				errMsg = eval("(" + errMsg + ")");
				errCode = errMsg.errCode;
				errMsg = errMsg.errMsg;
			}
		} catch (e) {
			errMsg = xhr.responseText;
		}
	    switch (xhr.status) {  
	        case 500:  
	        	title = "服务器系统内部错误";  
	            break;
	        case 400:  
	        	title = "错误信息";  
	            break;
	        case 401:  
	        	title = "系统提示";  
	            break;  
	        case 403:  
	        	title = "无权限执行此操作";  
	            break;  
	        case 408:  
	        	title = "请求超时";  
	            break;
	        default:
	        	title = "其他异常";
	    }
	    
	    $("#wfBusiFlag").val("Y"); // 重置业务财务环节表单保存标识
	    fsscError(errMsg, title, {
	    	submit: function(v) {
	    		if("WF_PRTICIPANT_EMPTY" == errCode) { // 工作流，跳转到待办页面
	    			parent.setTabTitle('我的待办', ctx + '/account/claim/myTodo/mongoList');
	                location.href = ctx + '/account/claim/myTodo/mongoList';
	    		}
	    	}
	    }, xhr.status);
	}

	
	//合并fsscDialog.js
	/**
	 * 该 js文件主要是对 jBox插件进行封装，以便日后有变更时能够统一修改，也能统一设置默认配置
	 */

	function fsscDialog(content, opts) {
		opts = $.extend({
	        title: "jbox dialog",
	        opacity: 0.6,
	        width: 460,
	        height: 600,
	        buttons: {"关闭": true},
	        submit: function(v, o, f) {
	        	if(opts.submit) {
	        		opts.submit(v, o, f);
	        	}
	        }
	    }, opts);
		return $.jBox(content, opts);
	}

	// icon='info'、'success'、'warning'、'error'、'loading'，默认值为'info'
	// 当为'loading'时，timeout值会被设置为0，表示不会自动关闭
	function fsscTip(content, icon, opts) {
		opts = $.extend({
			opacity: 0.6
		}, opts);
		$.jBox.tip(content, icon, opts);
	}

	function fsscCloseTip() {
		$.jBox.closeTip();
	}

	function fsscAlert(content, title, opts) {
		opts = $.extend({
			opacity: 0.6
		}, opts);
		$.jBox.alert(content, title, opts);
	}
	function fsscComfirm(content, title, submit, opts) {
		opts = $.extend({
			opacity: 0.6
		}, opts);
		$.jBox.confirm(content, title, submit, opts);
	}

	function fsscPrompt(content, title, icon, opts) {
		opts = $.extend({
			opacity: 0.6
		}, opts);
		$.jBox.prompt(content, title, icon, opts);
	}

	function fsscError(content, title, opts, responseStatus) {
		if (responseStatus == 500) {
	        opts = $.extend({
	            opacity: 0.6,
	            width: 800,
	            height: 500
	        }, opts);
	        $.jBox.error('<pre>'+content+'</pre>', title, opts);
		} else {
	        opts = $.extend({
	            opacity: 0.6,
	            width: 660
	        }, opts);
	        $.jBox.error(content, title, opts);
		}
	}

	
	
	

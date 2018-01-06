/*
* format currency
*/
function format_currency(value) {
	if (value == null) {
		return null;
	}
	value += "";
	var index = value.lastIndexOf(".");
	if (index < 0) { //no decimal
		value = value + ".00";
	} else {
		var padding = index + 3 - value.length;
		if (padding == 2) {
			value = value + "00";
		} else if (padding == 1) {
			value = value + "0";
		}
	}

	return format_number(value);
}

/*
* add comma
*/
function format_number(value) {
	if (value == null) {
		return null;
	}
	
	var length = value.indexOf(".");
	if (length < 0) {
		length = value.length;
	}

	length -= 3;
	while (length > 0) {
		value = value.substring(0, length)+","+value.substring(length);
		length -= 3;
	}

	value = value.replace("-,","-");
	
	return value;
}

/*
* math fomular
*/
function fixMath(m, n, op) {
	var a = (m+"");
	var b = (n+"");
	var x = 1;
	var y = 1;
	var c = 1;
	var reslut=0;
	if(a.indexOf(".")>-1) {
		x = Math.pow(10, a.length - a.indexOf(".") - 1);
	}
	if(b.indexOf(".")>-1) {
		y = Math.pow(10, b.length - b.indexOf(".") - 1);
	}
	switch(op)
	{
		case '+':
			c = Math.max(x,y);
			m = Math.round(m*c);
			n = Math.round(n*c);
			reslut=(m+n)/c;
			break;
		case '-':
			c = Math.max(x,y);
			m = Math.round(m*c);
			n = Math.round(n*c);
			reslut=(m-n)/c;
			break;
		case '*':
			c = x*y;
			m = Math.round(m*x);
			n = Math.round(n*y);
			reslut=(m*n)/c;
			break;
		case '/':
			c = Math.max(x,y);
			m = Math.round(m*c);
			n = Math.round(n*c);
			c = 1;
			reslut=(m/n)/c;
			break;
		default: reslut=0;
	}
	//return eval("(("+m+")"+op+"("+n+"))/"+"("+c+")");
	return reslut;
}

function ForDight(Dight,How)  
{  
	Dight = Math.round(Dight*Math.pow(10,How))/Math.pow(10,How);  
	return Dight;  
}
function returnNumber(id, model){
	var value = document.getElementById(id).value;
 	while(value.indexOf(',') != -1) {
 		value=value.replace(',','')
 	}
	if((parseFloat(value) + 'aa').indexOf('NaN') != -1){
		document.getElementById(id).value = "";
	}else{
		if(model == 'short'){
			document.getElementById(id).value = parseFloat(value);
		} else {
			if(value.indexOf('.') != -1){
				document.getElementById(id).value = parseFloat(value);
				if(value.indexOf('.') + 2 < value.length - 1){
					//messageBox('金额的小数点后面只能有两位,系统已经自动帮您去掉末位!','warning');
					value = value.substring(0, value.indexOf('.') + 3);
					document.getElementById(id).value = parseFloat(value);
				}
				if(value.indexOf('.') > 14){
					//messageBox('金额的整数部分超出了14位,系统已经自动帮您减少了多余部分!','warning');
					value = value.substring(0, 14) + "." + 
								value.substring(16, value.length);
					document.getElementById(id).value = parseFloat(value);
				}
			} else {
				if(value.length > 14){
					//messageBox('金额的整数部分超出了14位,系统已经自动帮您减少了多余部分','warning');
					value = value.substring(0, 14);
					document.getElementById(id).value = parseFloat(value);
				} else {
					document.getElementById(id).value = parseFloat(value);
				}
			}
		}
		
	}
}

function regInput(obj, reg, inputStr)
{
	var docSel	= document.selection.createRange();
	if (docSel.parentElement().tagName != "INPUT")	return false;
	oSel = docSel.duplicate();
	oSel.text = "";
	var srcRange	= obj.createTextRange();
	oSel.setEndPoint("StartToStart", srcRange);
	var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length);	
	
	return reg.test(str);
}

function returnNegativeNumber(id){
	var value = document.getElementById(id).value;
	if(value == '' || value == '0' || value == '0.0'){
		return;
	}
	if(parseFloat(value) > 0){
		document.getElementById(id).value = "-" + value;
	}
	
}
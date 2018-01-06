var LODOP; //声明为全局变量 
function prn_preview(){
	LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
	LODOP.PRINT_INIT("打印预览");
	LODOP.ADD_PRINT_HTM(0,0,"100%","100%",document.getElementById('printid').innerHTML);
	LODOP.PREVIEW();
};	
function prn_print(){
	LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
	LODOP.PRINT_INIT("打印");
	LODOP.ADD_PRINT_HTM(0,0,"100%","100%",document.getElementById('printid').innerHTML);
	LODOP.PRINT();
};
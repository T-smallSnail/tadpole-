var LODOP; //声明为全局变量 
function prn_preview() {	
	CreateOneFormPage();	
	LODOP.PREVIEW();	
};
function prn_print() {		
	CreateOneFormPage();
	LODOP.PRINT();	
};
function CreateOneFormPage(){
	LODOP=getLodop();  
	LODOP.PRINT_INIT("打印控件");
	LODOP.ADD_PRINT_HTM(0,0,"100%","100%",document.getElementById('printid').innerHTML);
};


//C-Lodop
function printViews(){
	  LODOP=getLodop();
	  var strHTML=document.getElementById("printid").innerHTML;
	  var strHtmInstall="<br><font color='#FF00FF'>打印控件未安装!点击这里<a href='CLodop_Setup_for_Win32NT.exe' target='_self'>执行安装</a>,安装后请刷新页面或重新进入。</font>";
	  var strHtmUpdate="<br><font color='#FF00FF'>打印控件需要升级!点击这里<a href='CLodop_Setup_for_Win32NT.exe' target='_self'>执行升级</a>,升级后请重新进入。</font>";
		 if((LODOP==null)||(typeof(LODOP.VERSION)=="undefined")){
			 document.write(strHtmInstall);
		 }else if(LODOP.VERSION<"2.1.3.0"){
			 document.write(strHtmUpdate);
		 }else{
			 LODOP.PRINT_INITA(1,1,770,660,"测试预览功能");//打印初始化  初始化运行环境，清理异常打印遗留的系统资源，设定打印任务名
			 LODOP.ADD_PRINT_TEXT(10,60,300,200,"");//增加纯文本打印项
			 LODOP.ADD_PRINT_HTM(30,5,"100%","80%",strHTML);//增加超文本打印项  设定该打印项在纸张内的位置和区域大小，实现超文本控制打印
			 LODOP.PREVIEW();//打印预览
		 }
	 

	}
	
function print(){
	 LODOP=getLodop();
	 var strHTML=document.getElementById("printid").innerHTML;
	 var strHtmInstall="<br><font color='#FF00FF'>打印控件未安装!点击这里<a href='CLodop_Setup_for_Win32NT.exe' target='_self'>执行安装</a>,安装后请刷新页面或重新进入。</font>";
     var strHtmUpdate="<br><font color='#FF00FF'>打印控件需要升级!点击这里<a href='CLodop_Setup_for_Win32NT.exe' target='_self'>执行升级</a>,升级后请重新进入。</font>";
     if((LODOP==null)||(typeof(LODOP.VERSION)=="undefined")){
    	 document.write(strHtmInstall);
     }else if(LODOP.VERSION<"2.1.3.0"){
		 document.write(strHtmUpdate);
	 }else{
    	 LODOP.PRINT(); 
     }
	 
}

	
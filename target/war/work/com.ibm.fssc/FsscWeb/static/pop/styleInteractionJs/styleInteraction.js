//样式交互

//公用函数————样式切换
	function tba(obj, cla) {
		obj.on("click", function () {
			obj.removeClass(cla);
			$(this).addClass(cla);
		})
	};



$(function(){
	//<!--按钮动画效果-->
	$(".btn-main-animateDiv button" ).click(function(){
			var div=$(this).prev('.btn-main-animate');
			div.animate({width:'+=5px',height:'+=5px',left:'-=2.5px',top:'-=1.8px',opacity:'0.5'},5);
			div.animate({opacity:'0'},"slow");
			div.animate({width:'-=5px',height:'-=5px',left:'+=2.5px',top:'+=1.8px',opacity:'0'},5);
	});
		
	//<!--按钮动画效果-->
	
	
	

});



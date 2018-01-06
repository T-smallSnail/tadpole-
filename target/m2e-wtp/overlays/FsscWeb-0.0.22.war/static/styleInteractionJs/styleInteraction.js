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
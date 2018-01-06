package com.budget.modules.budget.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;

@Controller
@RequestMapping(value="${adminPath}/budget")
public class BudgetController extends BaseController {
	
		@RequestMapping(value={"index"})
		public String showIndex() {
			return "modules/sys/sysIndex-new";
		}
}
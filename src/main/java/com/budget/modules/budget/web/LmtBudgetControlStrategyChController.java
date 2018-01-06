/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.budget.modules.budget.entity.LmtBudgetControlStrategyCh;
import com.budget.modules.budget.service.LmtBudgetControlStrategyChService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 预算控制策略 ( 子）Controller
 * @author hfl
 * @version 2017-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}/budget/lmtBudgetControlStrategyCh")
public class LmtBudgetControlStrategyChController extends BaseController {

	@Autowired
	private LmtBudgetControlStrategyChService lmtBudgetControlStrategyChService;
	

	
	@RequestMapping(value = {"list", ""})
	public String list(LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LmtBudgetControlStrategyCh> page = lmtBudgetControlStrategyChService.findPage(new Page<LmtBudgetControlStrategyCh>(request, response), lmtBudgetControlStrategyCh); 
		model.addAttribute("page", page);
		return "modules/budget/lmtBudgetControlStrategyChList";
	}

	@RequestMapping(value = "form")
	public String form(LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh, Model model) {
		model.addAttribute("lmtBudgetControlStrategyCh", lmtBudgetControlStrategyCh);
		return "modules/budget/lmtBudgetControlStrategyChForm";
	}

	@RequestMapping(value = "save")
	public String save(LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, lmtBudgetControlStrategyCh)){
			return form(lmtBudgetControlStrategyCh, model);
		}
		lmtBudgetControlStrategyChService.save(lmtBudgetControlStrategyCh);
		addMessage(redirectAttributes, "保存预算控制策略 ( 子）成功");
		return "redirect:"+Global.getAdminPath()+"/budget/lmtBudgetControlStrategyCh/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh, RedirectAttributes redirectAttributes) {
		lmtBudgetControlStrategyChService.delete(lmtBudgetControlStrategyCh);
		addMessage(redirectAttributes, "删除预算控制策略 ( 子）成功");
		return "redirect:"+Global.getAdminPath()+"/budget/lmtBudgetControlStrategyCh/?repage";
	}

}
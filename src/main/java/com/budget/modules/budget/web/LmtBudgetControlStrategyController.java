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

import com.budget.modules.budget.entity.LmtBudgetControlStrategy;
import com.budget.modules.budget.service.LmtBudgetControlStrategyService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 预算控制策略 ( 主）Controller
 * @author hfl
 * @version 2017-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}/modules/budget/lmtBudgetControlStrategy")
public class LmtBudgetControlStrategyController extends BaseController {

	@Autowired
	private LmtBudgetControlStrategyService lmtBudgetControlStrategyService;
	
	/*@ModelAttribute
	public LmtBudgetControlStrategy get(@RequestParam(required=false) String id) {
		LmtBudgetControlStrategy entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = lmtBudgetControlStrategyService.get(id);
		}
		if (entity == null){
			entity = new LmtBudgetControlStrategy();
		}
		return entity;
	}*/
	
	@RequestMapping(value = {"list", ""})
	public String list(LmtBudgetControlStrategy lmtBudgetControlStrategy, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LmtBudgetControlStrategy> page = lmtBudgetControlStrategyService.findPage(new Page<LmtBudgetControlStrategy>(request, response), lmtBudgetControlStrategy); 
		model.addAttribute("page", page);
		return "budget/lmtBudgetControlStrategyList";
	}

	@RequestMapping(value = "form")
	public String form(LmtBudgetControlStrategy lmtBudgetControlStrategy, Model model) {
		model.addAttribute("lmtBudgetControlStrategy", lmtBudgetControlStrategy);
		return "budget/lmtBudgetControlStrategyForm";
	}

	@RequestMapping(value = "save")
	public String save(LmtBudgetControlStrategy lmtBudgetControlStrategy, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, lmtBudgetControlStrategy)){
			return form(lmtBudgetControlStrategy, model);
		}
		lmtBudgetControlStrategyService.save(lmtBudgetControlStrategy);
		addMessage(redirectAttributes, "保存预算控制策略 ( 主）成功");
		return "redirect:"+Global.getAdminPath()+"/modules/budget/lmtBudgetControlStrategy/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(LmtBudgetControlStrategy lmtBudgetControlStrategy, RedirectAttributes redirectAttributes) {
		lmtBudgetControlStrategyService.delete(lmtBudgetControlStrategy);
		addMessage(redirectAttributes, "删除预算控制策略 ( 主）成功");
		return "redirect:"+Global.getAdminPath()+"/modules/budget/lmtBudgetControlStrategy/?repage";
	}

}
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

import com.budget.modules.budget.entity.LmtBudgetStatistics;
import com.budget.modules.budget.service.LmtBudgetStatisticsService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 预算执行统计Controller
 * @author hfl
 * @version 2017-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}/budget/lmtBudgetStatistics")
public class LmtBudgetStatisticsController extends BaseController {

	@Autowired
	private LmtBudgetStatisticsService lmtBudgetStatisticsService;
	
	@ModelAttribute
	public LmtBudgetStatistics get(@RequestParam(required=false) String id) {
		LmtBudgetStatistics entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = lmtBudgetStatisticsService.get(id);
		}
		if (entity == null){
			entity = new LmtBudgetStatistics();
		}
		return entity;
	}
	
	@RequiresPermissions("budget:lmtBudgetStatistics:view")
	@RequestMapping(value = {"list", ""})
	public String list(LmtBudgetStatistics lmtBudgetStatistics, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LmtBudgetStatistics> page = lmtBudgetStatisticsService.findPage(new Page<LmtBudgetStatistics>(request, response), lmtBudgetStatistics); 
		model.addAttribute("page", page);
		return "modules/budget/lmtBudgetStatisticsList";
	}

	@RequiresPermissions("budget:lmtBudgetStatistics:view")
	@RequestMapping(value = "form")
	public String form(LmtBudgetStatistics lmtBudgetStatistics, Model model) {
		model.addAttribute("lmtBudgetStatistics", lmtBudgetStatistics);
		return "modules/budget/lmtBudgetStatisticsForm";
	}

	@RequiresPermissions("budget:lmtBudgetStatistics:edit")
	@RequestMapping(value = "save")
	public String save(LmtBudgetStatistics lmtBudgetStatistics, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, lmtBudgetStatistics)){
			return form(lmtBudgetStatistics, model);
		}
		lmtBudgetStatisticsService.save(lmtBudgetStatistics);
		addMessage(redirectAttributes, "保存预算执行统计成功");
		return "redirect:"+Global.getAdminPath()+"/budget/lmtBudgetStatistics/?repage";
	}
	
	@RequiresPermissions("budget:lmtBudgetStatistics:edit")
	@RequestMapping(value = "delete")
	public String delete(LmtBudgetStatistics lmtBudgetStatistics, RedirectAttributes redirectAttributes) {
		lmtBudgetStatisticsService.delete(lmtBudgetStatistics);
		addMessage(redirectAttributes, "删除预算执行统计成功");
		return "redirect:"+Global.getAdminPath()+"/budget/lmtBudgetStatistics/?repage";
	}

}
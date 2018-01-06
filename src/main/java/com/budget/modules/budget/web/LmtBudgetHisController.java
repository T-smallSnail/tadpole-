package com.budget.modules.budget.web;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.budget.common.util.TypeChange;
import com.budget.modules.budget.entity.LmtBudgetHis;
import com.budget.modules.budget.service.LmtBudgetHisService;
import com.budget.modules.util.BudgetOptStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.web.BaseController;

@Controller
@RequestMapping(value="${adminPath}/budgetHis")
public class LmtBudgetHisController extends BaseController {

		@Autowired
		LmtBudgetHisService lmtBudgetHisService;
	
		//显示预算变动明细页面
		@RequestMapping(value={"list"})
		public String showBaseBudget( Model model,LmtBudgetHis lmtBudgetHis, HttpServletRequest request, HttpServletResponse response){
			//获取当前时间的23:59:59
			if(lmtBudgetHis.getBudgetReallyDate()!=null){
				String strDa= DateUtils.formatDate(lmtBudgetHis.getBudgetReallyDate(), "yyyy-MM-dd");
				lmtBudgetHis.setBudgetReallyDates(DateUtils.parseDate(strDa+" 23:59:59"));
			}
			
			//将预算变动金额*100
			if(lmtBudgetHis.getChangeAmounts()!=null&&!"".equals(lmtBudgetHis.getChangeAmounts())){
				java.util.regex.Pattern pattern=java.util.regex.Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$"); // 判断小数点后一位的数字的正则表达式
		        java.util.regex.Matcher match=pattern.matcher(lmtBudgetHis.getChangeAmounts()); 
				if(match.matches()){
					int indexOf = lmtBudgetHis.getChangeAmounts().indexOf(".");
					if(indexOf==-1){
						lmtBudgetHis.setChangeAmounts(lmtBudgetHis.getChangeAmounts()+".00");
					}
					
					lmtBudgetHis.setChangeAmount(TypeChange.stringToLong(lmtBudgetHis.getChangeAmounts()));
				}
			}
			
			
			Page<LmtBudgetHis> page = lmtBudgetHisService.findPage(new Page<LmtBudgetHis>(request, response), lmtBudgetHis);
			List<BudgetOptStatus> list=Arrays.asList(BudgetOptStatus.class.getEnumConstants());
			model.addAttribute("page", page);
			model.addAttribute("searchForm",lmtBudgetHis);
			model.addAttribute("opTypelist",list);
			
			return "budget/lmtBudgetHisList";
		}
		
		/**
		 * 预算详情展示
		 * @param lmtBudget
		 * @param model
		 * @return
		 */
		@RequestMapping(value = "form")
		public String form(LmtBudgetHis lmtBudgetHis, Model model) {
			
			LmtBudgetHis lmtBudgetHis1 = lmtBudgetHisService.get(lmtBudgetHis);
			List<BudgetOptStatus> list=Arrays.asList(BudgetOptStatus.class.getEnumConstants());
			model.addAttribute("opTypelist",list);
			model.addAttribute("lmtBudgetHis", lmtBudgetHis1);
			
			return "budget/budgetHisDetails";
		}
		
		
		
		@RequestMapping(value={"showmm"})
		public String showBaseMM(LmtBudgetHis lmtBudgetHis, HttpServletRequest request, HttpServletResponse response, Model model) {
//			List<LmtBudgetHis> grouplist=lomtBudgetHisService.findList(lmtBudgetHis);
//			model.addAttribute("grouplist", grouplist);
//			model.addAttribute("searchForm",lmtBudgetHis);

			return "budget/lmtBudgetMap";
		}

}

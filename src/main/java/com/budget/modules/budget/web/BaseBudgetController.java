package com.budget.modules.budget.web;


import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.budget.common.util.TypeChange;
import com.budget.modules.budget.entity.LmtBudget;
import com.budget.modules.budget.service.BudgetSubAllervice;
import com.budget.modules.budget.service.LmtBudgetService;
import com.eos.system.utility.StringUtil;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.bas.entity.BudgetSub;

@Controller
@RequestMapping(value="${adminPath}/bas")
public class BaseBudgetController extends BaseController {

	
	@Autowired
	private LmtBudgetService lmtBudgetService;
	
	@Autowired
	private BudgetSubAllervice BudgetSubService;
	
	//显示预算基础信息同步页面
	@RequestMapping(value={"baseBudget"})
	public String showBaseBudget( Model model,LmtBudget lmtBudget, HttpServletRequest request, HttpServletResponse response){
		//allBudget.getDatas();
		//获取预算公司
		lmtBudget.setCompId(request.getParameter("company.orgNo"));
		lmtBudget.setCompName(request.getParameter("company.name"));
		
		//获取年份
		String year = request.getParameter("year");
		if(StringUtil.isNotEmpty(year)){
			lmtBudget.setBudgetYear(Long.parseLong(year));
		}
		Page<LmtBudget> page = lmtBudgetService.findPage(new Page<LmtBudget>(request, response), lmtBudget);
		//获取预算科目编码的选择框数据
		List<BudgetSub> allBudgetSub = BudgetSubService.getAllBudgetSub(new BudgetSub());
		
		model.addAttribute("lmtBudget", lmtBudget);
		model.addAttribute("allBudgetSub", allBudgetSub);
		model.addAttribute("page", page);
		
		
		return "budget/baseBudgetList2";
	}
	
	/**
	 * 预算详情展示
	 * @param lmtBudget
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "form")
	public String form(LmtBudget lmtBudget, Model model) {
		
		LmtBudget lmtBudget2 = lmtBudgetService.get(lmtBudget);
		model.addAttribute("budget", lmtBudget2);
		
		return "budget/budgetDetails";
	}
	
	/**
	 * 下载导入用户数据模板
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response,HttpServletRequest resquest, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "预算数据模板.xlsx";
    		List<LmtBudget> list = Lists.newArrayList(); 
    		
    		list.add(new LmtBudget());
    		new ExportExcel("预算数据", LmtBudget.class,2).setDataList(list).write(response,resquest,fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
			
		}
		return null;
    }
    /**
     * 导入预算基础数据
     * @param file
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "import")
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes){
    	try {
    		//设置计数字段
			int successNum = 0;
			int failureNum = 0;

			
			//Excel导入的数据
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<LmtBudget> list = ei.getDataList(LmtBudget.class);
			
			//获取要导入的数据
			List<LmtBudget> listb = new ArrayList<LmtBudget>();
			//记录要删除数据的compId
			Set<String> set=new HashSet<String>();
			
			for (LmtBudget lmtBudget : list){
				//排除空数据
				if(StringUtils.isBlank(lmtBudget.getCompId())){
					continue;
				}
				
				try{
					//允许金额为空的情况，并把空金额转为0
					if(lmtBudget.getBudgetAmountd()==null||lmtBudget.getBudgetAmountd().equals("")){
						lmtBudget.setBudgetAmountd("0");
					}
					if(lmtBudget.getOccupiedAmountd()==null||lmtBudget.getOccupiedAmountd().equals("")){
						lmtBudget.setOccupiedAmountd("0");
					}
					if(lmtBudget.getBudgetBalanced()==null||lmtBudget.getBudgetBalanced().equals("")){
						lmtBudget.setBudgetBalanced("0");
					}
					
						//判断金额是否为两位小数,并转换为Long. 进行科学计数法转换    （判断金额是否合法）
						String ba = new BigDecimal(lmtBudget.getBudgetAmountd()).toPlainString();
						String oa = new BigDecimal(lmtBudget.getOccupiedAmountd()).toPlainString();
						//String bla =new BigDecimal(lmtBudget.getBlockedAmountd()).toPlainString();
						String bb = new BigDecimal(lmtBudget.getBudgetBalanced()).toPlainString();
					
						//获取小数位数（判断是否为两位小数）
						String bad = ba.substring(ba.indexOf(".")+1);
						String oad = oa.substring(oa.indexOf(".")+1);
						//String blad = bla.substring(bla.indexOf(".")+1);
						String bbd = bb.substring(bb.indexOf(".")+1);
						
						//金额合法时才导入
						//if((bad.length()<3||ba.indexOf(".")==-1)&&(oad.length()<3||oa.indexOf(".")==-1)&&(blad.length()<3||bla.indexOf(".")==-1)&&(bbd.length()<3||bb.indexOf(".")==-1)){
						if((bad.length()<3||ba.indexOf(".")==-1)&&(oad.length()<3||oa.indexOf(".")==-1)&&(bbd.length()<3||bb.indexOf(".")==-1)){
							//判断预算信息是否重复
							/*boolean flag = false;
							boolean update = false;
							LmtBudget budgetUp=null;
							boolean parentBudget =!StringUtils.isBlank(lmtBudget.getParentBudgetId());
							boolean hasParent = false;*/
							
							//判断预算编号是否存在
							/*if(lmtBudget.getBudgetNo()==null){
								flag=true;
								failureNum++;
								if(!failureMsg.toString().contains("预算编号为空！")){
									failureMsg.append("预算编号为空！");
								}
								break;
							}*/
							
							//for (LmtBudget lmtBudget2 : findList) {
								//判断预算时间是否重复
								//boolean time = repeatedTime(lmtBudget,lmtBudget2);
								/*if(time){
									//表示时间段重复
									failureNum++;
									if(!failureMsg.toString().contains("时间段重复！")){
										failureMsg.append("时间段重复！");
									}
									flag=true;
									break;
									
								}*/
								//判断父预算ID是否存在
								/*if(parentBudget&&lmtBudget.getParentBudgetId().equals(lmtBudget2.getBudgetNo())){
										hasParent = true;
								}*/
								//预算编号是否重复
								/*if(lmtBudget2.getBudgetNo().equals(lmtBudget.getBudgetNo())){
									budgetUp=lmtBudget2;
									update = true;
									break;
								}*/
							//}
							
							/*if(flag){
								continue;
							}*/
							
							//预算是否为部门预算
							if(lmtBudget.getIsDeptbudget()!=null&&!lmtBudget.getIsDeptbudget().equals("")&&lmtBudget.getIsDeptbudget().equals("是")){
								lmtBudget.setIsDeptbudget("1");
							}else{
								lmtBudget.setIsDeptbudget("0");
							}
							//预算是否生效（N生效）
							if(lmtBudget.getStatus()!=null&&lmtBudget.getStatus().equals("1")){
								lmtBudget.setStatus("N");
							}else{
								lmtBudget.setStatus("Y");
							}
							
							
							
							//把金额转换为Long	
							Long  budgetAmount = TypeChange.stringToLongAll(ba);
							Long  occupiedAmount = TypeChange.stringToLongAll(oa);
							//Long blockedAmount = TypeChange.stringToLongAll(bla);
							Long budgetBalance = TypeChange.stringToLongAll(bb);
							//保存到实体中
							lmtBudget.setBudgetAmount(budgetAmount);
							lmtBudget.setOccupiedAmount(occupiedAmount);
							//lmtBudget.setBlockedAmount(blockedAmount);
							
							//Long budgetBalance = budgetAmount-occupiedAmount-blockedAmount;
							lmtBudget.setBudgetBalance(budgetBalance);
							
							//把code字段的科学计数法转化为普通字符串，并排除带字母的字符串
							try{
								if(null!=lmtBudget.getCompId()&&!"".equals(lmtBudget.getCompId())&&lmtBudget.getCompId().contains("E")){
									lmtBudget.setCompId(new BigDecimal(lmtBudget.getCompId()).toPlainString());
								}
							}catch(Exception ex){
								
							}
							
							try{
								if(null!=lmtBudget.getBudgetDeptId()&&!"".equals(lmtBudget.getBudgetDeptId())&&lmtBudget.getBudgetDeptId().contains("E")){
									lmtBudget.setBudgetDeptId(new BigDecimal(lmtBudget.getBudgetDeptId()).toPlainString());
								}
							}catch(Exception ex){
								
							}
							
							try{
								/*if(null!=lmtBudget.getBudgetNo()&&!"".equals(lmtBudget.getBudgetNo())){
									lmtBudget.setBudgetNo(new BigDecimal(lmtBudget.getBudgetNo()).toPlainString());
								}*/
							}catch(Exception ex){
								
							}
							try{
								/*if(null!=lmtBudget.getBudgetProjectCode()&&!"".equals(lmtBudget.getBudgetProjectCode())){
									lmtBudget.setBudgetProjectCode(new BigDecimal(lmtBudget.getBudgetProjectCode()).toPlainString());
								}*/
							}catch(Exception ex){
								
							}
							try{
								if(null!=lmtBudget.getBudgetSubjectCode()&&!"".equals(lmtBudget.getBudgetSubjectCode())&&lmtBudget.getBudgetSubjectCode().contains("E")){
									lmtBudget.setBudgetSubjectCode(new BigDecimal(lmtBudget.getBudgetSubjectCode()).toPlainString());
							}
							}catch(Exception ex){
								
							}
							
							
							
							//预算余额要大于0
							/*if(budgetBalance>=0){
								lmtBudget.setBudgetBalance(budgetBalance);
							}else{
								failureNum++;
								if(!failureMsg.toString().contains("预算余额应大于零！")){
									failureMsg.append("预算余额应大于零！");
								}
								continue;
							}*/
							
							//保存数据(父预算存在）
							/*if(parentBudget){
								if(hasParent){
									lmtBudgetService.save(lmtBudget);
								}else{
									failureNum++;
									if(!failureMsg.toString().contains("父预算不存在！")){
										failureMsg.append("父预算不存在！");
									}
									continue;
								}
							}else{
								lmtBudgetService.save(lmtBudget);
							}*/
							
							//添加时间
							Date date = new Date();
							lmtBudget.setCreationTime(date);
							lmtBudget.setModifyDate(date);
							listb.add(lmtBudget);
							//把需要删除的预算添加到set集合
							set.add(lmtBudget.getCompId());
							
							successNum++;
					}else{
						failureNum++;
						failureMsg.append(lmtBudget.getCompId()+"公司预算科目为"+lmtBudget.getBudgetSubjectCode()+":金额请保留两位小数;");
					
					}
				}catch(ConstraintViolationException ex){
					//failureMsg.append("<br/>登录名 "+user.getLoginName()+" 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch(NumberFormatException e)	{
					failureNum++;
					
						failureMsg.append(lmtBudget.getCompId()+"公司预算科目为"+lmtBudget.getBudgetSubjectCode()+"：输入金额不能为空;");
				
				}catch (Exception ex) {
					failureNum++;
					failureMsg.append(lmtBudget.getCompId()+"公司预算科目为"+lmtBudget.getBudgetSubjectCode()+"：请正确输入数据;");

				}
			}
			
			//删除set集合中的老数据
			StringBuilder ids = new StringBuilder();
			for( Iterator<String> it = set.iterator();  it.hasNext(); )  
			 {               
			     ids.append(",'"+it.next().toString()+"'");              
			 }
			String compids = ids.toString().substring(1);
			lmtBudgetService.saveListAndDeleteOld(listb,compids);
			
	
			
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条数据，失败信息为：");
			}

			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条数据"+failureMsg);
		} catch (Exception e) {
			e.printStackTrace();
			addMessage(redirectAttributes, "导入数据失败！失败信息："+e.getMessage());
			return "redirect:" + adminPath + "/bas/baseBudget";
		}
		return "redirect:" + adminPath + "/bas/baseBudget";
    }
    
    /**
     * 判断时间段是否重复,如果重复则不保存该条记录
     * @param lmtBudget
     * @param lmtBudget2
     * @return
     */
    private boolean repeatedTime(LmtBudget lmtBudget, LmtBudget lmtBudget2) {
		//如果存在年月，   且数值相等，则表示时间重复
    	if(lmtBudget.getBudgetYear()!=null&&lmtBudget.getBudgetMonth()!=null&&lmtBudget2.getBudgetYear()!=null&&lmtBudget2.getBudgetMonth()!=null
    			&&lmtBudget.getBudgetYear().equals(lmtBudget2.getBudgetYear())&&lmtBudget.getBudgetMonth().equals(lmtBudget2.getBudgetMonth())){
    		return true;
    	}
    	//如果存在时间段， 则比较时间段
    	if(lmtBudget.getBudgetValidPeriodStart()!=null&&lmtBudget.getBudgetValidPeriodEnd()!=null&&lmtBudget2.getBudgetValidPeriodStart()!=null&&lmtBudget2.getBudgetValidPeriodEnd()!=null){
    		//如果新记录时间段的在老记录的时间段内，则表示重复
    		if(lmtBudget.getBudgetValidPeriodStart().getTime()>=lmtBudget2.getBudgetValidPeriodStart().getTime()&&lmtBudget.getBudgetValidPeriodEnd().getTime()<=lmtBudget2.getBudgetValidPeriodEnd().getTime()){
    			return true;
    		}
    	}
		return false;
	}


  
    /**
     * 判断传入code是否为数字
     * @param str
     * @return
     */
    private boolean isNumeric(String str){
    	  for (int i = 0; i < str.length(); i++){
    	   System.out.println(str.charAt(i));
    	   if (!Character.isDigit(str.charAt(i))){
    	    return false;
    	   }
    	  }
    	  return true;
    	 }

	/**
     * double转bigdecimal
     */
    @Test
    private void aa(){
    	String a = "1.2E+9";
    	BigDecimal ba = new BigDecimal(a);
    	System.out.println(ba);
    }
    
}

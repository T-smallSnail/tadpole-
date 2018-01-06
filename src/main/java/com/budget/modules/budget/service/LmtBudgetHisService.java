/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.service;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.budget.modules.budget.dao.LmtBudgetDao;
import com.budget.modules.budget.dao.LmtBudgetHisDao;
import com.budget.modules.budget.entity.LmtBudget;
import com.budget.modules.budget.entity.LmtBudgetHis;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 预算变动明细Service
 * @author xiahui
 * @version 2017-03-18
 */
@Service
@Transactional(readOnly = true)
public class LmtBudgetHisService extends CrudService<LmtBudgetHisDao, LmtBudgetHis> {

	@Autowired
	LmtBudgetDao lmtBudgetDao;
	@Autowired
	LmtBudgetHisDao lmtBudgetHisDao;
	
	public LmtBudgetHis get(String id) {
		return super.get(id);
	}
	
	public List<LmtBudgetHis> findList(LmtBudgetHis lmtBudgetHis) {
		return super.findList(lmtBudgetHis);
	}
	
	public Page<LmtBudgetHis> findPage(Page<LmtBudgetHis> page, LmtBudgetHis lmtBudgetHis) {
		return super.findPage(page, lmtBudgetHis);
	}
	
	@Transactional(readOnly = false)
	public void save(LmtBudgetHis lmtBudgetHis) {
		lmtBudgetHis.setIsNewRecord(true);
		super.save(lmtBudgetHis);
	}
	
	@Transactional(readOnly = false)
	public void delete(LmtBudgetHis lmtBudgetHis) {
		super.delete(lmtBudgetHis);
	}
	
	@Transactional(readOnly = false)
	public void saveXX(String inputXML){
		JSONObject jsoninput=JSONObject.fromObject(inputXML);
		String budgetID=jsoninput.getString("BUDGET_ID");//预算基础表主键ID
		long amount=jsoninput.getLong("LIST_AMOUNT");//变动金额
		String budgetControllStatus=jsoninput.getString("BUDGET_CONTROLL_STATUS");
		User user=UserUtils.getUser();
		
		LmtBudget lmtBudget=lmtBudgetDao.get(budgetID);
		if("F".equals(budgetControllStatus)){
			//存入冻结金额
			lmtBudget.setBlockedAmount(amount+lmtBudget.getBlockedAmount());
			//计算预算余额
			lmtBudget.setBudgetBalance(lmtBudget.getBudgetAmount()-lmtBudget.getOccupiedAmount()-lmtBudget.getBlockedAmount());
			//修改金额时间
			lmtBudget.setModifyDate(new Date());
			//修改用户ID
			lmtBudget.setModifyUserId(user.getId());
			
			lmtBudgetDao.update(lmtBudget);
			
			//插入预算表冻结细表
			LmtBudgetHis lmtBudgetHis=new LmtBudgetHis();
			lmtBudgetHis.setClaimId(jsoninput.getString("ID"));
			lmtBudgetHis.setClaimNo(jsoninput.getString("CLAIM_NO"));
			lmtBudgetHis.setClaimLineId(jsoninput.getString("LINE_ID"));
			lmtBudgetHis.setBudgetId(lmtBudget.getId());
			lmtBudgetHis.setOpType(jsoninput.getString("BUDGET_CONTROLL_STATUS"));
			lmtBudgetHis.setBudgetNo("");
			lmtBudgetHis.setBudgetName(lmtBudget.getBudgetName());
			lmtBudgetHis.setBudgetSubjectCode("");
			lmtBudgetHis.setBudgetReallyDate(new Date());
			lmtBudgetHis.setSystemCode("");
			lmtBudgetHis.setSystemName("");
			lmtBudgetHis.setUserId("");
			lmtBudgetHis.setUserName("");
			lmtBudgetHis.setComId("");
			lmtBudgetHis.setComName("");
			lmtBudgetHis.setDeptId("");
			lmtBudgetHis.setDeptName("");
			lmtBudgetHis.setSubmitDate(new Date());		
			lmtBudgetHis.setChangeAmount(jsoninput.getLong("LIST_AMOUNT"));
			lmtBudgetHis.setBudgetAmount(lmtBudget.getBudgetAmount());
			lmtBudgetHis.setOccupiedAmount(lmtBudget.getOccupiedAmount());
			lmtBudgetHis.setBlockedAmount(lmtBudget.getBlockedAmount());
			lmtBudgetHis.setBudgetBalance(lmtBudget.getBudgetBalance());
			lmtBudgetHis.setFundsBudgetAmount(lmtBudget.getFundsBudgetAmount());
			lmtBudgetHis.setFundsOccupiedAmount(lmtBudget.getFundsOccupiedAmount());
			lmtBudgetHis.setFundsBlockedAmount(lmtBudget.getFundsBlockedAmount());
			lmtBudgetHis.setFundsBudgetBalance(lmtBudget.getFundsBudgetBalance());
			lmtBudgetHis.setFundsChangeAmount(0l);
			lmtBudgetHis.setDescribes("预算冻结");
			
			lmtBudgetHisDao.insert(lmtBudgetHis);
			
			
			
		}else if("R".equals(budgetControllStatus)){
			//释放冻结金额
			lmtBudget.setBlockedAmount(lmtBudget.getBlockedAmount()-amount);
			//计算预算余额
			lmtBudget.setBudgetBalance(lmtBudget.getBudgetAmount()-lmtBudget.getOccupiedAmount()-lmtBudget.getBlockedAmount());
			//修改金额时间
			lmtBudget.setModifyDate(new Date());
			//修改用户ID
			lmtBudget.setModifyUserId(user.getId());
			
			lmtBudgetDao.update(lmtBudget);
			
			//插入预算表冻结细表
			LmtBudgetHis lmtBudgetHis=new LmtBudgetHis();
			lmtBudgetHis.setClaimId(jsoninput.getString("ID"));
			lmtBudgetHis.setClaimNo(jsoninput.getString("CLAIM_NO"));
			lmtBudgetHis.setClaimLineId(jsoninput.getString("LINE_ID"));
			lmtBudgetHis.setBudgetId(lmtBudget.getId());
			lmtBudgetHis.setOpType(jsoninput.getString("BUDGET_CONTROLL_STATUS"));
			lmtBudgetHis.setBudgetNo("");
			lmtBudgetHis.setBudgetName(lmtBudget.getBudgetName());
			lmtBudgetHis.setBudgetSubjectCode("");
			lmtBudgetHis.setBudgetReallyDate(new Date());
			lmtBudgetHis.setSystemCode("");
			lmtBudgetHis.setSystemName("");
			lmtBudgetHis.setUserId("");
			lmtBudgetHis.setUserName("");
			lmtBudgetHis.setComId("");
			lmtBudgetHis.setComName("");
			lmtBudgetHis.setDeptId("");
			lmtBudgetHis.setDeptName("");
			lmtBudgetHis.setSubmitDate(new Date());		
			lmtBudgetHis.setChangeAmount(jsoninput.getLong("LIST_AMOUNT"));
			lmtBudgetHis.setBudgetAmount(lmtBudget.getBudgetAmount());
			lmtBudgetHis.setOccupiedAmount(lmtBudget.getOccupiedAmount());
			lmtBudgetHis.setBlockedAmount(lmtBudget.getBlockedAmount());
			lmtBudgetHis.setBudgetBalance(lmtBudget.getBudgetBalance());
			lmtBudgetHis.setFundsBudgetAmount(lmtBudget.getFundsBudgetAmount());
			lmtBudgetHis.setFundsOccupiedAmount(lmtBudget.getFundsOccupiedAmount());
			lmtBudgetHis.setFundsBlockedAmount(lmtBudget.getFundsBlockedAmount());
			lmtBudgetHis.setFundsBudgetBalance(lmtBudget.getFundsBudgetBalance());
			lmtBudgetHis.setFundsChangeAmount(0l);
			lmtBudgetHis.setDescribes("预算释放");
			
			lmtBudgetHisDao.insert(lmtBudgetHis);
			
			
			
		}else if("O".equals(budgetControllStatus)){
			//释放冻结金额
			lmtBudget.setBlockedAmount(lmtBudget.getBlockedAmount()-amount);
			//添加已完成的金额
			lmtBudget.setOccupiedAmount(lmtBudget.getOccupiedAmount()+amount);
			//计算预算余额
			lmtBudget.setBudgetBalance(lmtBudget.getBudgetAmount()-lmtBudget.getOccupiedAmount()-lmtBudget.getBlockedAmount());
			//修改金额时间
			lmtBudget.setModifyDate(new Date());
			//修改用户ID
			lmtBudget.setModifyUserId(user.getId());
			
			lmtBudgetDao.update(lmtBudget);
			
			//插入预算表冻结细表
			LmtBudgetHis lmtBudgetHis=new LmtBudgetHis();
			lmtBudgetHis.setClaimId(jsoninput.getString("ID"));
			lmtBudgetHis.setClaimNo(jsoninput.getString("CLAIM_NO"));
			lmtBudgetHis.setClaimLineId(jsoninput.getString("LINE_ID"));
			lmtBudgetHis.setBudgetId(lmtBudget.getId());
			lmtBudgetHis.setOpType(jsoninput.getString("BUDGET_CONTROLL_STATUS"));
			lmtBudgetHis.setBudgetNo("");
			lmtBudgetHis.setBudgetName(lmtBudget.getBudgetName());
			lmtBudgetHis.setBudgetSubjectCode("");
			lmtBudgetHis.setBudgetReallyDate(new Date());
			lmtBudgetHis.setSystemCode("");
			lmtBudgetHis.setSystemName("");
			lmtBudgetHis.setUserId("");
			lmtBudgetHis.setUserName("");
			lmtBudgetHis.setComId("");
			lmtBudgetHis.setComName("");
			lmtBudgetHis.setDeptId("");
			lmtBudgetHis.setDeptName("");
			lmtBudgetHis.setSubmitDate(new Date());		
			lmtBudgetHis.setChangeAmount(jsoninput.getLong("LIST_AMOUNT"));
			lmtBudgetHis.setBudgetAmount(lmtBudget.getBudgetAmount());
			lmtBudgetHis.setOccupiedAmount(lmtBudget.getOccupiedAmount());
			lmtBudgetHis.setBlockedAmount(lmtBudget.getBlockedAmount());
			lmtBudgetHis.setBudgetBalance(lmtBudget.getBudgetBalance());
			lmtBudgetHis.setFundsBudgetAmount(lmtBudget.getFundsBudgetAmount());
			lmtBudgetHis.setFundsOccupiedAmount(lmtBudget.getFundsOccupiedAmount());
			lmtBudgetHis.setFundsBlockedAmount(lmtBudget.getFundsBlockedAmount());
			lmtBudgetHis.setFundsBudgetBalance(lmtBudget.getFundsBudgetBalance());
			lmtBudgetHis.setFundsChangeAmount(0l);
			lmtBudgetHis.setDescribes("预算占用");
			
			lmtBudgetHisDao.insert(lmtBudgetHis);
			
			
		}
	}
	
}
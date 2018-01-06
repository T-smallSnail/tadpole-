/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.budget.modules.budget.dao.LmtBudgetDao;
import com.budget.modules.budget.entity.LmtBudget;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * lim_budgetService
 * @author pingtian
 * @version 2017-03-15
 */
@Service
@Transactional(readOnly = true)
public class LmtBudgetService extends CrudService<LmtBudgetDao, LmtBudget> {
	@Autowired
    private LmtBudgetDao lmtBudgetDao;

	public LmtBudget get(String id) {
		return super.get(id);
	}
	
	public List<LmtBudget> findList(LmtBudget lmtBudget) {
		return super.findList(lmtBudget);
	}
	public List<LmtBudget> findAllList(LmtBudget lmtBudget) {
		return lmtBudgetDao.findAllList(lmtBudget);
	}
	
	public Page<LmtBudget> findPage(Page<LmtBudget> page, LmtBudget lmtBudget) {
		return super.findPage(page, lmtBudget);
	}
	
	@Transactional(readOnly = false)
	public void save(LmtBudget lmtBudget) {
		lmtBudget.setIsNewRecord(true);
		super.save(lmtBudget);
	}
	
	@Transactional(readOnly = false)
	public void update(LmtBudget lmtBudget) {
		lmtBudget.setIsNewRecord(false);
		super.save(lmtBudget);
	}
	
	@Transactional(readOnly = false)
	public void delete(LmtBudget lmtBudget) {
		super.delete(lmtBudget);
	}
	
	@Transactional(readOnly = false)
	public void deleteAll(String id) {
		lmtBudgetDao.deleteAll(id);
	}
	
	/**
	 * 先根据compId删除老数据，再插入新的预算数据
	 * @param listb
	 * @param compIds
	 */
	@Transactional(readOnly = false)
	public void saveListAndDeleteOld(List<LmtBudget> listb,String compIds) {
		lmtBudgetDao.deletebudgetBycompIds(compIds);
		lmtBudgetDao.insertForeach(listb);
		
	}
	
	

	
	
}
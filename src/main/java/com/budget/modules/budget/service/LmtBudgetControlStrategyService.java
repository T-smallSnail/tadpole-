/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.budget.modules.budget.dao.LmtBudgetControlStrategyDao;
import com.budget.modules.budget.entity.LmtBudgetControlStrategy;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 预算控制策略 ( 主）Service
 * @author hfl
 * @version 2017-11-28
 */
@Service
@Transactional(readOnly = true)
public class LmtBudgetControlStrategyService extends CrudService<LmtBudgetControlStrategyDao, LmtBudgetControlStrategy> {

	public LmtBudgetControlStrategy get(String id) {
		return super.get(id);
	}
	
	public List<LmtBudgetControlStrategy> findList(LmtBudgetControlStrategy lmtBudgetControlStrategy) {
		return super.findList(lmtBudgetControlStrategy);
	}
	
	public Page<LmtBudgetControlStrategy> findPage(Page<LmtBudgetControlStrategy> page, LmtBudgetControlStrategy lmtBudgetControlStrategy) {
		return super.findPage(page, lmtBudgetControlStrategy);
	}
	
	@Transactional(readOnly = false)
	public void save(LmtBudgetControlStrategy lmtBudgetControlStrategy) {
		lmtBudgetControlStrategy.setIsNewRecord(true);
		super.save(lmtBudgetControlStrategy);
	}
	
	@Transactional(readOnly = false)
	public void delete(LmtBudgetControlStrategy lmtBudgetControlStrategy) {
		super.delete(lmtBudgetControlStrategy);
	}
	
}
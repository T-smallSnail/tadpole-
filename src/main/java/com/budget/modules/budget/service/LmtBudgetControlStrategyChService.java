/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.budget.modules.budget.dao.LmtBudgetControlStrategyChDao;
import com.budget.modules.budget.entity.LmtBudgetControlStrategyCh;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 预算控制策略 ( 子）Service
 * @author hfl
 * @version 2017-11-28
 */
@Service
@Transactional(readOnly = true)
public class LmtBudgetControlStrategyChService extends CrudService<LmtBudgetControlStrategyChDao, LmtBudgetControlStrategyCh> {

	public LmtBudgetControlStrategyCh get(String id) {
		return super.get(id);
	}
	
	public List<LmtBudgetControlStrategyCh> findList(LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh) {
		return super.findList(lmtBudgetControlStrategyCh);
	}
	
	public Page<LmtBudgetControlStrategyCh> findPage(Page<LmtBudgetControlStrategyCh> page, LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh) {
		return super.findPage(page, lmtBudgetControlStrategyCh);
	}
	
	@Transactional(readOnly = false)
	public void save(LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh) {
		lmtBudgetControlStrategyCh.setIsNewRecord(true);
		super.save(lmtBudgetControlStrategyCh);
	}
	
	@Transactional(readOnly = false)
	public void delete(LmtBudgetControlStrategyCh lmtBudgetControlStrategyCh) {
		super.delete(lmtBudgetControlStrategyCh);
	}
	
}
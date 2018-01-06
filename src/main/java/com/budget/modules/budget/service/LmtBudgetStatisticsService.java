/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.budget.modules.budget.dao.LmtBudgetStatisticsDao;
import com.budget.modules.budget.entity.LmtBudgetStatistics;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 预算执行统计Service
 * @author hfl
 * @version 2017-11-28
 */
@Service
@Transactional(readOnly = true)
public class LmtBudgetStatisticsService extends CrudService<LmtBudgetStatisticsDao, LmtBudgetStatistics> {

	public LmtBudgetStatistics get(String id) {
		return super.get(id);
	}
	
	public List<LmtBudgetStatistics> findList(LmtBudgetStatistics lmtBudgetStatistics) {
		return super.findList(lmtBudgetStatistics);
	}
	
	public Page<LmtBudgetStatistics> findPage(Page<LmtBudgetStatistics> page, LmtBudgetStatistics lmtBudgetStatistics) {
		return super.findPage(page, lmtBudgetStatistics);
	}
	
	@Transactional(readOnly = false)
	public void save(LmtBudgetStatistics lmtBudgetStatistics) {
		lmtBudgetStatistics.setIsNewRecord(true);
		super.save(lmtBudgetStatistics);
	}
	
	@Transactional(readOnly = false)
	public void delete(LmtBudgetStatistics lmtBudgetStatistics) {
		super.delete(lmtBudgetStatistics);
	}
	
}
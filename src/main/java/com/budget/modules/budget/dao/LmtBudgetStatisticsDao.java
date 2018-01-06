/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.dao;

import com.budget.modules.budget.entity.LmtBudgetStatistics;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 预算执行统计DAO接口
 * @author hfl
 * @version 2017-11-28
 */
@MyBatisDao
public interface LmtBudgetStatisticsDao extends CrudDao<LmtBudgetStatistics> {
	
}
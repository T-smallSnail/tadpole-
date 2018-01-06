/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.dao;

import com.budget.modules.budget.entity.LmtBudgetHis;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 预算变动明细DAO接口
 * @author xiahui
 * @version 2017-03-18
 */
@MyBatisDao
public interface LmtBudgetHisDao extends CrudDao<LmtBudgetHis> {
	public LmtBudgetHis getLmtBudget(LmtBudgetHis entity);
}
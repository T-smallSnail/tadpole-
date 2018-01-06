/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.budget.modules.budget.entity.LmtBudget;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 预算表DAO接口
 * @author ly
 * @version 2017-04-18
 */
@MyBatisDao
public interface LmtBudgetDao extends CrudDao<LmtBudget> {

	void deleteAll(String id);
	
	public void updateBudgetById(LmtBudget lmtBudget);

	
	//根据预算公司ids删除公司下的所有数据
	void deletebudgetBycompIds(@Param(value = "compIds") String compIds);

	void insertForeach(List<LmtBudget> list);
	

	
	
}
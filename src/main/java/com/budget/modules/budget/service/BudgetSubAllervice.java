package com.budget.modules.budget.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.bas.dao.BudgetSubDao;
import com.thinkgem.jeesite.modules.bas.entity.BudgetSub;

@Service
@Transactional(readOnly = true)
public class BudgetSubAllervice extends CrudService<BudgetSubDao, BudgetSub>  {

	@Autowired
	private BudgetSubDao budgetSubDao;
	
	public List<BudgetSub> getAllBudgetSub(BudgetSub budegtSub){
		List<BudgetSub> findAllList = budgetSubDao.findAllList(budegtSub);
		
		return findAllList;
	}
}

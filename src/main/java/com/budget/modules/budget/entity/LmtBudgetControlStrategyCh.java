/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 预算控制策略 ( 子）Entity
 * @author hfl
 * @version 2017-11-28
 */
public class LmtBudgetControlStrategyCh extends DataEntity<LmtBudgetControlStrategyCh> {
	
	private static final long serialVersionUID = 1L;
	private String strategyId;		// 控制策略主表ID
	private String budgetSubjectCode;		// 预算科目编码
	private String budgetSubjectName;		// 预算科目名称
	private String accountCode;		// 会计科目编码
	private String accountName;		// 会计科目名称
	private String compId;		// 所属公司编码
	private String compName;		// 所属公司名称
	private String controlStrategy;		// 控制策略（F柔性  R刚性 N不控制）
	private Date startTime;		// 控制生效开始时间
	private Date endTime;		// 控制生效结束时间
	private String remark;		// 摘要
	
	public LmtBudgetControlStrategyCh() {
		super();
	}

	public LmtBudgetControlStrategyCh(String id){
		super(id);
	}

	@Length(min=1, max=256, message="控制策略主表ID长度必须介于 1 和 256 之间")
	public String getStrategyId() {
		return strategyId;
	}

	public void setStrategyId(String strategyId) {
		this.strategyId = strategyId;
	}
	
	@Length(min=0, max=256, message="预算科目编码长度必须介于 0 和 256 之间")
	public String getBudgetSubjectCode() {
		return budgetSubjectCode;
	}

	public void setBudgetSubjectCode(String budgetSubjectCode) {
		this.budgetSubjectCode = budgetSubjectCode;
	}
	
	@Length(min=0, max=1200, message="预算科目名称长度必须介于 0 和 1200 之间")
	public String getBudgetSubjectName() {
		return budgetSubjectName;
	}

	public void setBudgetSubjectName(String budgetSubjectName) {
		this.budgetSubjectName = budgetSubjectName;
	}
	
	@Length(min=0, max=256, message="会计科目编码长度必须介于 0 和 256 之间")
	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}
	
	@Length(min=0, max=1200, message="会计科目名称长度必须介于 0 和 1200 之间")
	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	@Length(min=0, max=256, message="所属公司编码长度必须介于 0 和 256 之间")
	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}
	
	@Length(min=0, max=1200, message="所属公司名称长度必须介于 0 和 1200 之间")
	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}
	
	@Length(min=0, max=88, message="控制策略长度必须介于 0 和 88 之间")
	public String getControlStrategy() {
		return controlStrategy;
	}

	public void setControlStrategy(String controlStrategy) {
		this.controlStrategy = controlStrategy;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=4000, message="摘要长度必须介于 0 和 4000 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
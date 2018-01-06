/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.budget.modules.budget.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 预算执行统计Entity
 * @author hfl
 * @version 2017-11-28
 */
public class LmtBudgetStatistics extends DataEntity<LmtBudgetStatistics> {
	
	private static final long serialVersionUID = 1L;
	private String budgetId;		// 预算基础数据表ID
	private String claimId;		// 报账单主表ID
	private String claimNo;		// 报账单单号
	private String claimLineId;		// 报账单行表ID
	private String opType;		// 操作状态 F:冻结，R：释放，O：占用
	private String accountName;		// 会计科目名称
	private String accountCode;		// 会计科目编码
	private String compId;		// 所属公司编码
	private String compName;		// 所属公司名称
	private String controlStrategy;		// 控制策略
	private Date startTime;		// 控制生效开始时间
	private Date endTime;		// 控制生效结束时间
	private String templateNo;		// 报账单模板
	private String templateName;		// 报账单模版名称
	private String supCateId;		// 业务大类编码
	private String supCateName;		// 业务大类名称
	private Long applyAmount;		// 报账金额
	private Date applyDate;		// 报账日期
	private Long changeAmount;		// 变动金额
	private Long budgetAmount;		// 预算总金额
	private Long occupiedAmount;		// 预算已完成（占用）金额（按会计科目累加统计)
	private Long blockedAmount;		// 预算冻结金额（按会计科目累加统计)
	private String remark;		// 摘要
	
	public LmtBudgetStatistics() {
		super();
	}

	public LmtBudgetStatistics(String id){
		super(id);
	}

	@Length(min=1, max=256, message="预算基础数据表ID长度必须介于 1 和 256 之间")
	public String getBudgetId() {
		return budgetId;
	}

	public void setBudgetId(String budgetId) {
		this.budgetId = budgetId;
	}
	
	@Length(min=0, max=256, message="报账单主表ID长度必须介于 0 和 256 之间")
	public String getClaimId() {
		return claimId;
	}

	public void setClaimId(String claimId) {
		this.claimId = claimId;
	}
	
	@Length(min=0, max=400, message="报账单单号长度必须介于 0 和 400 之间")
	public String getClaimNo() {
		return claimNo;
	}

	public void setClaimNo(String claimNo) {
		this.claimNo = claimNo;
	}
	
	@Length(min=0, max=400, message="报账单行表ID长度必须介于 0 和 400 之间")
	public String getClaimLineId() {
		return claimLineId;
	}

	public void setClaimLineId(String claimLineId) {
		this.claimLineId = claimLineId;
	}
	
	@Length(min=0, max=40, message="操作状态 F:冻结，R：释放，O：占用长度必须介于 0 和 40 之间")
	public String getOpType() {
		return opType;
	}

	public void setOpType(String opType) {
		this.opType = opType;
	}
	
	@Length(min=0, max=1200, message="会计科目名称长度必须介于 0 和 1200 之间")
	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	@Length(min=0, max=256, message="会计科目编码长度必须介于 0 和 256 之间")
	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
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
	
	@Length(min=0, max=256, message="报账单模板长度必须介于 0 和 256 之间")
	public String getTemplateNo() {
		return templateNo;
	}

	public void setTemplateNo(String templateNo) {
		this.templateNo = templateNo;
	}
	
	@Length(min=0, max=400, message="报账单模版名称长度必须介于 0 和 400 之间")
	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	
	@Length(min=0, max=256, message="业务大类编码长度必须介于 0 和 256 之间")
	public String getSupCateId() {
		return supCateId;
	}

	public void setSupCateId(String supCateId) {
		this.supCateId = supCateId;
	}
	
	@Length(min=0, max=400, message="业务大类名称长度必须介于 0 和 400 之间")
	public String getSupCateName() {
		return supCateName;
	}

	public void setSupCateName(String supCateName) {
		this.supCateName = supCateName;
	}
	
	public Long getApplyAmount() {
		return applyAmount;
	}

	public void setApplyAmount(Long applyAmount) {
		this.applyAmount = applyAmount;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
	public Long getChangeAmount() {
		return changeAmount;
	}

	public void setChangeAmount(Long changeAmount) {
		this.changeAmount = changeAmount;
	}
	
	public Long getBudgetAmount() {
		return budgetAmount;
	}

	public void setBudgetAmount(Long budgetAmount) {
		this.budgetAmount = budgetAmount;
	}
	
	public Long getOccupiedAmount() {
		return occupiedAmount;
	}

	public void setOccupiedAmount(Long occupiedAmount) {
		this.occupiedAmount = occupiedAmount;
	}
	
	public Long getBlockedAmount() {
		return blockedAmount;
	}

	public void setBlockedAmount(Long blockedAmount) {
		this.blockedAmount = blockedAmount;
	}
	
	@Length(min=0, max=4000, message="摘要长度必须介于 0 和 4000 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
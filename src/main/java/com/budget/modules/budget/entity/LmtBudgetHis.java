package com.budget.modules.budget.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 预算变动明细Entity
 * @author xiahui
 * @version 2017-04-12
 */
public class LmtBudgetHis extends DataEntity<LmtBudgetHis> {
	
	private static final long serialVersionUID = 1L;
	private String claimId;		// 单据ID
	private String claimNo;		// 单据编号
	private String claimLineId;		// 单据行ID
	private String budgetId;		// 预算基础表主键ID
	private String opType;		// 操作类型        		预算操作状态F:冻结  R:释放   O:占用 
	private String budgetNo;		// 预算编码
	private String budgetName;		// 预算名称
	private String budgetSubjectCode;		// 预算科目编码
	private Date budgetReallyDate;		// 预算实际发生日期
	private Date budgetReallyDates;		//预算实际发生日期(当日的23:59:59)
	private String systemCode;		// 来源系统编码
	private String systemName;		// 来源系统名称
	private String userId;		// 预算操作人ID
	private String userName;		// 预算操作人名称
	private String comId;		// 预算操作人所在公司ID
	private String comName;		// 预算操作人所在公司名称
	private String deptId;		// 预算操作人所在部门ID
	private String deptName;		// 预算操作人所在部门名称
	private Date submitDate;		// 预算修改时间
	
	private String changeAmounts;//变动金额（String）
	private Long changeAmount;		// 变动金额
	private Long budgetAmount;		// 成本预算金额
	private Long occupiedAmount;		// 成本预算已完成金额
	private Long blockedAmount;		// 成本预算冻结金额
	private Long budgetBalance;		// 成本预算余额
	
	
	private Long fundsBudgetAmount;		// 资金预算金额
	private Long fundsOccupiedAmount;		// 资金预算已完成金额
	private Long fundsBlockedAmount;		// 资金预算冻结金额
	private Long fundsBudgetBalance;		// 资金预算余额
	private Long fundsChangeAmount;		// 资金变动金额
	private String describes;		// describes
	
	public LmtBudgetHis() {
		super();
	}

	public LmtBudgetHis(String id){
		super(id);
	}

	@Length(min=0, max=20, message="单据ID长度必须介于 0 和 20 之间")
	public String getClaimId() {
		return claimId;
	}

	public void setClaimId(String claimId) {
		this.claimId = claimId;
	}
	
	@Length(min=0, max=100, message="单据编号长度必须介于 0 和 100 之间")
	public String getClaimNo() {
		return claimNo;
	}

	public void setClaimNo(String claimNo) {
		this.claimNo = claimNo;
	}
	
	@Length(min=0, max=18, message="单据行ID长度必须介于 0 和 18 之间")
	public String getClaimLineId() {
		return claimLineId;
	}

	public void setClaimLineId(String claimLineId) {
		this.claimLineId = claimLineId;
	}
	
	@Length(min=0, max=100, message="预算基础表主键ID长度必须介于 0 和 100 之间")
	public String getBudgetId() {
		return budgetId;
	}

	public void setBudgetId(String budgetId) {
		this.budgetId = budgetId;
	}
	
	@Length(min=0, max=20, message="操作类型长度必须介于 0 和 20 之间")
	public String getOpType() {
		return opType;
	}

	public void setOpType(String opType) {
		this.opType = opType;
	}
	
	@Length(min=0, max=100, message="预算编码长度必须介于 0 和 100 之间")
	public String getBudgetNo() {
		return budgetNo;
	}

	public void setBudgetNo(String budgetNo) {
		this.budgetNo = budgetNo;
	}
	
	@Length(min=0, max=255, message="预算名称长度必须介于 0 和 255 之间")
	public String getBudgetName() {
		return budgetName;
	}

	public void setBudgetName(String budgetName) {
		this.budgetName = budgetName;
	}
	
	@Length(min=0, max=100, message="预算科目编码长度必须介于 0 和 100 之间")
	public String getBudgetSubjectCode() {
		return budgetSubjectCode;
	}

	public void setBudgetSubjectCode(String budgetSubjectCode) {
		this.budgetSubjectCode = budgetSubjectCode;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBudgetReallyDate() {
		return budgetReallyDate;
	}

	public void setBudgetReallyDate(Date budgetReallyDate) {
		this.budgetReallyDate = budgetReallyDate;
	}
	
	@Length(min=0, max=100, message="来源系统编码长度必须介于 0 和 100 之间")
	public String getSystemCode() {
		return systemCode;
	}

	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}
	
	@Length(min=0, max=100, message="来源系统名称长度必须介于 0 和 100 之间")
	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	
	@Length(min=0, max=100, message="预算操作人ID长度必须介于 0 和 100 之间")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Length(min=0, max=100, message="预算操作人名称长度必须介于 0 和 100 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=100, message="预算操作人所在公司ID长度必须介于 0 和 100 之间")
	public String getComId() {
		return comId;
	}

	public void setComId(String comId) {
		this.comId = comId;
	}
	
	@Length(min=0, max=100, message="预算操作人所在公司名称长度必须介于 0 和 100 之间")
	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}
	
	@Length(min=0, max=100, message="预算操作人所在部门ID长度必须介于 0 和 100 之间")
	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	
	@Length(min=0, max=100, message="预算操作人所在部门名称长度必须介于 0 和 100 之间")
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
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
	
	public Long getBudgetBalance() {
		return budgetBalance;
	}

	public void setBudgetBalance(Long budgetBalance) {
		this.budgetBalance = budgetBalance;
	}
	
	public Long getFundsBudgetAmount() {
		return fundsBudgetAmount;
	}

	public void setFundsBudgetAmount(Long fundsBudgetAmount) {
		this.fundsBudgetAmount = fundsBudgetAmount;
	}
	
	public Long getFundsOccupiedAmount() {
		return fundsOccupiedAmount;
	}

	public void setFundsOccupiedAmount(Long fundsOccupiedAmount) {
		this.fundsOccupiedAmount = fundsOccupiedAmount;
	}
	
	public Long getFundsBlockedAmount() {
		return fundsBlockedAmount;
	}

	public void setFundsBlockedAmount(Long fundsBlockedAmount) {
		this.fundsBlockedAmount = fundsBlockedAmount;
	}
	
	public Long getFundsBudgetBalance() {
		return fundsBudgetBalance;
	}

	public void setFundsBudgetBalance(Long fundsBudgetBalance) {
		this.fundsBudgetBalance = fundsBudgetBalance;
	}
	
	public Long getFundsChangeAmount() {
		return fundsChangeAmount;
	}

	public void setFundsChangeAmount(Long fundsChangeAmount) {
		this.fundsChangeAmount = fundsChangeAmount;
	}
	
	@Length(min=0, max=250, message="describes长度必须介于 0 和 250 之间")
	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public String getChangeAmounts() {
		return changeAmounts;
	}

	public void setChangeAmounts(String changeAmounts) {
		this.changeAmounts = changeAmounts;
	}

	public Date getBudgetReallyDates() {
		return budgetReallyDates;
	}

	public void setBudgetReallyDates(Date budgetReallyDates) {
		this.budgetReallyDates = budgetReallyDates;
	}
	
}
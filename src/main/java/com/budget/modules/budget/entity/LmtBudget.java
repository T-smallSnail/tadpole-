package com.budget.modules.budget.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 预算表Entity
 * @author ly
 * @version 2017-04-18
 */
public class LmtBudget extends DataEntity<LmtBudget> {
	
	private static final long serialVersionUID = 1L;
	private String compId;				// 预算责任公司ID
	private String compName;			// 预算责任公司名称
	private String budgetDeptId;		// 预算责任部门ID
	private String budgetDeptName;		// 预算责任部门名称
	
	private String budgetSysId;			// 预算使用系统ID  		YG   	   	BZ
	private String budgetSysName;		// 预算使用系统名字     		 远光财务核心            报账系统
	
	private String budgetDesc;			// 预算描述
	private String isDeptbudget;		// 是否部门预算(0非部门 1部门)
	private String budgetNo;			// 预算编号
	private String budgetName;			// 预算名称
	private String isPublic;			// 是否公开
	private String budgetTypeCode;		// 预算项目分类编码
	private String budgetTypeName;		// 预算项目分类名称
	private String budgetSubjectCode;		// 预算科目编码
	private String budgetSubjectName;		// 预算科目名称
	private String budgetProjectCode;		// 预算项目编码
	private String budgetProjectName;		// 预算项目名称
	private String displayOrder;		// 排序号
	private String isParent;			// 是否是父级预算
	private String parentBudgetId;		// 父级预算
	private String parentBudgetName;		// 父级预算名称
	private Long budgetAmount;			// 成本预算金额
	private Long occupiedAmount;		// 成本预算已完成金额
	private Long blockedAmount;			// 成本预算冻结金额
	private Long budgetBalance;			// 成本预算余额
	
	private String budgetAmountd;			// 成本预算金额D
	private String occupiedAmountd;		// 成本预算已完成金额D
	private String blockedAmountd;			// 成本预算冻结金额D
	private String budgetBalanced;			// 成本预算余额D
	
	
	
	private String status;				//预算 失效状态    Y、N分别代表失效、未失效
	private Long budgetYear;		// 预算年度
	private Long budgetMonth;		// 预算月份
	private Date budgetValidPeriodStart;		// 预算开始生效日期
	private Date budgetValidPeriodEnd;			// 预算结束生效日期
	
	private Long fundsBudgetAmount;			// 资金预算金额
	private Long fundsOccupiedAmount;		// 资金预算已完成金额
	private Long fundsBlockedAmount;		// 资金预算冻结金额
	private Long fundsBudgetBalance;		// 资金预算余额
	private Date creationTime;			// 预算创建时间
	private String creationUserId;		// 预算创建用户ID
	private Date modifyDate;			// 预算修改时间
	private String modifyUserId;		// 预算修改用户ID
	private String budgetPeriod;		// 预算期间 
	private String batchId;		// 导入批次
	private String budgetMark;		// 唯一预算标志
	private String recordId;		// 中间表UUID
	
	public LmtBudget() {
		super();
	}

	public LmtBudget(String id){
		super(id);
	}

	
	@ExcelField(title="预算责任公司ID", sort=5)
	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}
	
	/*@ExcelField(title="预算编号", sort=30)*/
	public String getBudgetNo() {
		return budgetNo;
	}

	public void setBudgetNo(String budgetNo) {
		this.budgetNo = budgetNo;
	}
	
	@Length(min=0, max=255, message="budget_name长度必须介于 0 和 255 之间")
	/*@ExcelField(title="预算名称", sort=40)*/
	public String getBudgetName() {
		return budgetName;
	}

	public void setBudgetName(String budgetName) {
		this.budgetName = budgetName;
	}
	
	@Length(min=0, max=20, message="is_public长度必须介于 0 和 20 之间")
	/*@ExcelField(title="是否公开(1：公开   0：不公开)", sort=130)*/
	public String getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}
	
	@Length(min=0, max=20, message="budget_type_code长度必须介于 0 和 20 之间")
	public String getBudgetTypeCode() {
		return budgetTypeCode;
	}

	public void setBudgetTypeCode(String budgetTypeCode) {
		this.budgetTypeCode = budgetTypeCode;
	}
	
	@Length(min=0, max=150, message="budget_type_name长度必须介于 0 和 150 之间")
	/*@ExcelField(title="预算项目分类", sort=112)*/
	public String getBudgetTypeName() {
		return budgetTypeName;
	}

	public void setBudgetTypeName(String budgetTypeName) {
		this.budgetTypeName = budgetTypeName;
	}
	
	@Length(min=0, max=10, message="budget_category_code长度必须介于 0 和 10 之间")
	@ExcelField(title="预算科目编码", sort=100)
	public String getBudgetSubjectCode() {
		return budgetSubjectCode;
	}

	public void setBudgetSubjectCode(String budgetSubjectCode) {
		this.budgetSubjectCode = budgetSubjectCode;
	}
	
	@Length(min=0, max=100, message="budget_category_name长度必须介于 0 和 100 之间")
	@ExcelField(title="预算科目名称", sort=110)
	public String getBudgetSubjectName() {
		return budgetSubjectName;
	}

	public void setBudgetSubjectName(String budgetSubjectName) {
		this.budgetSubjectName = budgetSubjectName;
	}
	
	@Length(min=0, max=20, message="display_order长度必须介于 0 和 20 之间")
	/*@ExcelField(title="排序号", sort=70)*/
	public String getDisplayOrder() {
		return displayOrder;
	}

	@ExcelField(title="预算责任公司名称", sort=6)
	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	@Length(min=0, max=100, message="business_action_code长度必须介于 0 和 100 之间")
	/*@ExcelField(title="预算项目编码", sort=80)*/
	public String getBudgetProjectCode() {
		return budgetProjectCode;
	}

	public void setBudgetProjectCode(String budgetProjectCode) {
		this.budgetProjectCode = budgetProjectCode;
	}
	/*@ExcelField(title="预算项目名称", sort=81)*/
	public String getBudgetProjectName() {
		return budgetProjectName;
	}

	public void setBudgetProjectName(String budgetProjectName) {
		this.budgetProjectName = budgetProjectName;
	}

	public void setDisplayOrder(String displayOrder) {
		this.displayOrder = displayOrder;
	}
	
	@Length(min=0, max=20, message="is_parent长度必须介于 0 和 20 之间")
	/*@ExcelField(title="是否是父级预算(1:是    0：否)", sort=140)*/
	public String getIsParent() {
		return isParent;
	}

	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}
	
	@Length(min=0, max=20, message="parent_budget_id长度必须介于 0 和 20 之间")
	/*@ExcelField(title="父预算ID", sort=160)*/
	public String getParentBudgetId() {
		return parentBudgetId;
	}

	public void setParentBudgetId(String parentBudgetId) {
		this.parentBudgetId = parentBudgetId;
	}
	
	@Length(min=0, max=255, message="parent_budget_name长度必须介于 0 和 255 之间")
	/*@ExcelField(title="父预算名称", sort=170)*/
	public String getParentBudgetName() {
		return parentBudgetName;
	}

	public void setParentBudgetName(String parentBudgetName) {
		this.parentBudgetName = parentBudgetName;
	}
	
	public Long getBudgetAmount() {
		return budgetAmount;
	}

	public void setBudgetAmount(Long budgetAmount) {
		this.budgetAmount = budgetAmount;
	}
	
	
	@ExcelField(title="预算金额", sort=180)
	public String getBudgetAmountd() {
		return budgetAmountd;
	}

	public void setBudgetAmountd(String budgetAmountd) {
		this.budgetAmountd = budgetAmountd;
	
		
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
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}
	
	@Length(min=0, max=20, message="creation_user_id长度必须介于 0 和 20 之间")
	public String getCreationUserId() {
		return creationUserId;
	}

	public void setCreationUserId(String creationUserId) {
		this.creationUserId = creationUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	@Length(min=0, max=20, message="modify_user_id长度必须介于 0 和 20 之间")
	public String getModifyUserId() {
		return modifyUserId;
	}

	public void setModifyUserId(String modifyUserId) {
		this.modifyUserId = modifyUserId;
	}
	
	@Length(min=0, max=20, message="status长度必须介于 0 和 20 之间")
	@ExcelField(title="状态(1:正常  0：失效)", sort=540)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@ExcelField(title="预算年度", sort=550)
	public Long getBudgetYear() {
		return budgetYear;
	}

	public void setBudgetYear(Long budgetYear) {
		this.budgetYear = budgetYear;
	}
	@ExcelField(title="预算月份", sort=600)
	public Long getBudgetMonth() {
		return budgetMonth;
	}

	public void setBudgetMonth(Long budgetMonth) {
		this.budgetMonth = budgetMonth;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@ExcelField(title="预算开始时间（yyyy-MM-dd）", sort=700)
	public Date getBudgetValidPeriodStart() {
		return budgetValidPeriodStart;
	}

	public void setBudgetValidPeriodStart(Date budgetValidPeriodStart) {
		this.budgetValidPeriodStart = budgetValidPeriodStart;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@ExcelField(title="预算结束时间（yyyy-MM-dd）", sort=800)
	public Date getBudgetValidPeriodEnd() {
		return budgetValidPeriodEnd;
	}

	public void setBudgetValidPeriodEnd(Date budgetValidPeriodEnd) {
		this.budgetValidPeriodEnd = budgetValidPeriodEnd;
	}

	@ExcelField(title="预算责任部门ID", sort=9)
	public String getBudgetDeptId() {
		return budgetDeptId;
	}

	public void setBudgetDeptId(String budgetDeptId) {
		this.budgetDeptId = budgetDeptId;
	}

	@ExcelField(title="预算责任部门名称", sort=10)
	public String getBudgetDeptName() {
		return budgetDeptName;
	}

	public void setBudgetDeptName(String budgetDeptName) {
		this.budgetDeptName = budgetDeptName;
	}

	public String getBudgetSysId() {
		return budgetSysId;
	}

	public void setBudgetSysId(String budgetSysId) {
		this.budgetSysId = budgetSysId;
	}

	/*@ExcelField(title="预算使用系统", sort=15)*/
	public String getBudgetSysName() {
		return budgetSysName;
	}

	public void setBudgetSysName(String budgetSysName) {
		this.budgetSysName = budgetSysName;
	}

	@ExcelField(title="预算描述", sort=50)
	public String getBudgetDesc() {
		return budgetDesc;
	}

	public void setBudgetDesc(String budgetDesc) {
		this.budgetDesc = budgetDesc;
	}

	@ExcelField(title="是否部门预算（是/否）", sort=8)
	public String getIsDeptbudget() {
		return isDeptbudget;
	}

	public void setIsDeptbudget(String isDeptbudget) {
		this.isDeptbudget = isDeptbudget;
	}
	
	@ExcelField(title="预算已完成金额", sort=200)
	public String getOccupiedAmountd() {
		return occupiedAmountd;
	}

	public void setOccupiedAmountd(String occupiedAmountd) {
		this.occupiedAmountd = occupiedAmountd;
	}
	
	/*@ExcelField(title="预算冻结金额", sort=250)*/
	public String getBlockedAmountd() {
		return blockedAmountd;
	}

	public void setBlockedAmountd(String blockedAmountd) {
		this.blockedAmountd = blockedAmountd;
	}
	
	@ExcelField(title="预算余额", sort=260)
	public String getBudgetBalanced() {
		return budgetBalanced;
	}

	public void setBudgetBalanced(String budgetBalanced) {
		this.budgetBalanced = budgetBalanced;
	}

	public String getBudgetPeriod() {
		return budgetPeriod;
	}

	public void setBudgetPeriod(String budgetPeriod) {
		this.budgetPeriod = budgetPeriod;
	}

	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}

	public String getBudgetMark() {
		return budgetMark;
	}

	public void setBudgetMark(String budgetMark) {
		this.budgetMark = budgetMark;
	}

	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}

	
}
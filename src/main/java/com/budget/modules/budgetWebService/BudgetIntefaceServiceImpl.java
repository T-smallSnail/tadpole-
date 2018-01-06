package com.budget.modules.budgetWebService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.budget.common.util.TypeChange;
import com.budget.modules.budget.dao.LmtBudgetDao;
import com.budget.modules.budget.dao.LmtBudgetHisDao;
import com.budget.modules.budget.entity.LmtBudget;
import com.budget.modules.budget.service.BudgetWSDLService;
import com.budget.modules.budget.service.LmtBudgetHisService;
import com.budget.modules.budget.service.LmtBudgetService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.Log;
import com.thinkgem.jeesite.modules.bas.dao.BudgetAccountMappingDao;
import com.thinkgem.jeesite.modules.bas.entity.BudgetAccountMapping;

@WebService
public class BudgetIntefaceServiceImpl implements BudgetIntefaceService {
	
	private Logger logger = LoggerFactory.getLogger(BudgetIntefaceServiceImpl.class);
//	private Logger errorLogger = Log.getErrLogger(BudgetIntefaceServiceImpl.class);

	@Autowired
	LmtBudgetDao lmtBudgetDao;
	@Autowired
	LmtBudgetHisDao lmtBudgetHisDao;
	@Autowired
	LmtBudgetService lmtBudgetService;
	@Autowired
	LmtBudgetHisService lmtBudgetHisService;
	@Autowired
	BudgetWSDLService budgetWSDLService;
	@Autowired
	private BudgetAccountMappingDao budgetAccountMappingDao;

	@Override
	public String SynSearchBudgetInfo(String inputXML) {


		
		
		
		//创建LmtBudget来封装查询参数
		LmtBudget budget = new LmtBudget();
		//创建一个list封装查询出来的数据
		List list = new ArrayList();
		//创建一个Map封装返回参数
		Map returnMap = new HashMap();
		//分页参数
		int pageSize = 50;
		int currentPage = 1;
		
		//会计科目
		String seqCode = null;
		//保存接口日志
		logger.debug("预算查询 接收的参数 (Budget serach Input Parameter:{})", inputXML);
		
		//接收请求参数
		JSONObject jsonObject =JSONObject.fromObject(inputXML);
		
		
		//预算年度
		if(!jsonObject.getString("YEAR").equals("")&&!jsonObject.getString("YEAR").equals("null")){
			budget.setBudgetYear(Long.valueOf(jsonObject.getString("YEAR")));
		}
		//预算月份
		if(!(jsonObject.get("MONTH")==null)){
			budget.setBudgetMonth(Long.valueOf(jsonObject.getString("MONTH")));
		}
		//预算部门ID
		if(!(jsonObject.get("DEPT_ID")==null)){
			budget.setBudgetDeptId((jsonObject.getString("DEPT_ID")));
		}
		//公司ID
		if(!jsonObject.getString("COM_ID").equals("")&&!jsonObject.getString("COM_ID").equals("null")){
			budget.setCompId((jsonObject.getString("COM_ID")));
		}
		//预算名称
		if(!(jsonObject.get("ACCOUNT_NAME")==null)){
			budget.setBudgetName((jsonObject.getString("ACCOUNT_NAME")));
		}
		/*//预算科目代码
		if(!(jsonObject.get("ACCOUNT_CODE")==null)){
			budget.setBudgetSubjectCode((jsonObject.getString("ACCOUNT_CODE")));
		}*/
		if(!(jsonObject.get("SEQ_CODE")==null)){
			seqCode = jsonObject.getString("SEQ_CODE");
		}
		//是否部门预算
		if(!(jsonObject.get("IS_DEPT_BUDGET")==null)){
			budget.setIsDeptbudget((jsonObject.getString("IS_DEPT_BUDGET")));
		}
		//预算开始时间
		if(!(jsonObject.get("START_DATE")==null)){
			String start = jsonObject.getString("START_DATE");
			budget.setBudgetValidPeriodStart(DateUtils.parseDate(start));
		}
		//预算结束时间
		if(!(jsonObject.get("END_DATE")==null)){
			String start = jsonObject.getString("END_DATE");
			budget.setBudgetValidPeriodStart(DateUtils.parseDate(start));
		}
		//分页大小pageSize
		if(!(jsonObject.get("PAGE_SIZE")==null)){
			Number size = (Number) jsonObject.get("PAGE_SIZE");
			pageSize = size.intValue();
		}
		//当前页CURRENT_PAGE
		if(!(jsonObject.get("CURRENT_PAGE")==null)){
			Number size = (Number) jsonObject.get("CURRENT_PAGE");
			currentPage = size.intValue();
		}
		//当前页TOTAL_RECORD
		if(!(jsonObject.get("TOTAL_RECORD")==null)){
			
		}
		
		
		//其他信息
		//来源系统ID
		if(!(jsonObject.get("SYSTEM_ID")==null)){	
		}
		//来源系统名称
		if(!(jsonObject.get("SYSTEM_NAME")==null)){
		}
		//用户ID
		if(!(jsonObject.get("USER_ID")==null)){
			
		}
		//用户名称
		if(!(jsonObject.get("USER_NAME")==null)){
			
		}
		//接口调用时间
		if(!(jsonObject.get("SUBMIT_DATE")==null)){
			
		}
		//第一步:查出该会计科目对应的预算科目
		BudgetAccountMapping budgetAccountMapping = new BudgetAccountMapping();
		budgetAccountMapping.setAccountCode(seqCode);
		List<BudgetAccountMapping> findList2 = budgetAccountMappingDao.findList(budgetAccountMapping);
		if(findList2.size()==0){
			
		}
		//获取预算科目
		String budgetCode = findList2.get(0).getBudgetCode();
		
		//第二步：查出预算数据
		
		//第一步：查出预算控制策略（参数 公司，会计科目，时间）
		
		
		
		
		
		//分页查询
		Page<LmtBudget> page = new Page<LmtBudget>(currentPage,pageSize);
		Page<LmtBudget> findPage = lmtBudgetService.findPage(page, budget);
		List<LmtBudget> findList = findPage.getList();
		
		//设置返回分页参数
		long count = findPage.getCount();
		Number TOTAL_RECORD = count;
		Number CURRENT_PAGE = currentPage;
		Number PAGE_SIZE = pageSize;
		
		//把查询结果封装到Map中
		for (LmtBudget lmtBudget : findList) {
			Map map = new HashMap();
				map.put("BUDGET_ID",lmtBudget.getId());
				map.put("BUDGET_NAME", lmtBudget.getBudgetName());
				map.put("DEPT_NAME", lmtBudget.getBudgetDeptName());
				map.put("BUDGET_TYPE_NAME", lmtBudget.getBudgetTypeName());
				map.put("BUDGET_DESCRIPTION", lmtBudget.getBudgetDesc());
				map.put("IS_DEPT_BUDGET", lmtBudget.getIsDeptbudget());
				map.put("BUDGET_SUBJECT_NAME", lmtBudget.getBudgetSubjectName());
				//保存金额
				if(lmtBudget.getBudgetAmount()!=null){
					BigDecimal budegtAmount = new BigDecimal(TypeChange.longToString(lmtBudget.getBudgetAmount()));
					map.put("BUDGET_AMOUNT", budegtAmount);
				}else{
					map.put("BUDGET_AMOUNT",null);
				}
				if(lmtBudget.getOccupiedAmount()!=null){
					BigDecimal budegtOccupiedAmount = new BigDecimal(TypeChange.longToString(lmtBudget.getOccupiedAmount()));
					map.put("BUDGET_OCCUPIED_AMOUNT", budegtOccupiedAmount);
				}else{
					map.put("BUDGET_OCCUPIED_AMOUNT", null);
				}
				if(lmtBudget.getBlockedAmount()!=null){
					BigDecimal budegtBlockedAmount = new BigDecimal(TypeChange.longToString(lmtBudget.getBlockedAmount()));
					map.put("BUDGET_BLOCKED_AMOUNT", budegtBlockedAmount);
				}else{
					map.put("BUDGET_BLOCKED_AMOUNT",null);
				}
				if(lmtBudget.getBudgetBalance()!=null){
					BigDecimal budegtBalanceAmount = new BigDecimal(TypeChange.longToString(lmtBudget.getBudgetBalance()));
					map.put("BUDGET_BALANCE_AMOUNT", budegtBalanceAmount);
				}else{
					map.put("BUDGET_BALANCE_AMOUNT",null);
				}
				map.put("BUDGET_YEAR", lmtBudget.getBudgetYear());
				map.put("BUDGET_MONTH", lmtBudget.getBudgetMonth());
				map.put("START_DATE", lmtBudget.getBudgetValidPeriodStart());
				map.put("END_DATE", lmtBudget.getBudgetValidPeriodEnd());	
				
				
				
				//保存list中
				list.add(map);
				
		}
		
		
		returnMap.put("TOTAL_RECORD",TOTAL_RECORD );
		returnMap.put("CURRENT_PAGE",CURRENT_PAGE );
		returnMap.put("PAGE_SIZE", PAGE_SIZE);
		returnMap.put("BUDGET_LIST", list);
		
		//returnMap转化为JSON
		JSONObject responseJson = JSONObject.fromObject(returnMap);
		
		return responseJson.toString();
		
		
	}

	@Override
	//校验
	public String SynCheckBudgetInfo(String inputXML) {
		return budgetWSDLService.SynCheckBudgetInfo(inputXML);
	}

	@Override
	//控制
	public String SynControllBudgetInfo(String inputXML) {
		
		logger.debug("预算控制接收的参数 (Budget Controll Input Parameter:{})", inputXML);
		
		JSONObject outJson=new JSONObject();
		try {
			outJson= budgetWSDLService.SynControllBudgetInfo(inputXML);
		} catch (Exception e) {
			outJson.put("RESULT_FLAG", "N");
			outJson.put("RESULT_MSG", "接口操作异常："+e.getMessage());
			outJson.put("ID", "");
			outJson.put("LINE_LIST", new ArrayList());	
			
			logger.error("预算控制操作异常 (Budget Controll Exception:)", e);
			e.printStackTrace();
		}
		
		logger.debug("预算控制回送参数 (Budget Controll Output Parameter:{})", outJson.toString());
		return outJson.toString();
	}
	
	/**
	 * 与合同比较金额
	 */
	@Override
	public String compareMoneyWithContract(String inputJson) {
		//封装返回参数
		HashMap<String, String> map = new HashMap<String, String>();
		
		JSONObject jsonObject =JSONObject.fromObject(inputJson);
		//合同编号
		String contractNum = jsonObject.getString("contractNum");
		map.put("contractNum", contractNum);
		//合同金额
		String originTotalsum = jsonObject.getString("originTotalsum");
		BigDecimal a = new BigDecimal(originTotalsum);
		//所属公司
		String compId = jsonObject.getString("maOrgCode");
		//所属部门
		String dept = jsonObject.getString("maDepCode");
		
		
		//查询该公司下的预算余额总和
		LmtBudget budget = new LmtBudget();
		budget.setCompId(compId);
		budget.setBudgetDeptId(dept);
		List<LmtBudget> list = lmtBudgetService.findList(budget);
		//查询不到预算时,去除部门重新查
		if(list.size()==0){
			budget.setBudgetDeptId("");
			list = lmtBudgetService.findList(budget);
		}
		
		//判断
		if(list.size()==0){
			map.put("budgetReturn", "2");
			//returnMap转化为JSON
			JSONObject responseJson = JSONObject.fromObject(map);
			return responseJson.toString();
		}
		
		//查询到预算时校验金额
		//获取该公司下的所用预算余额的和
		long sumTotal = 0;
		for(LmtBudget b :list){
			sumTotal = sumTotal + b.getBudgetBalance();
		}
		//比较金额
		long b = sumTotal-a.longValue()*100;
		if((sumTotal-a.longValue()*100)>=0){
			map.put("budgetReturn", "1");
		}else{
			map.put("budgetReturn", "0");
		}
		//returnMap转化为JSON
		JSONObject responseJson = JSONObject.fromObject(map);
		return responseJson.toString();
	}

}

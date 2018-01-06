package com.budget.modules.budget.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.budget.common.util.TypeChange;
import com.budget.modules.budget.dao.LmtBudgetDao;
import com.budget.modules.budget.dao.LmtBudgetHisDao;
import com.budget.modules.budget.entity.LmtBudget;
import com.budget.modules.budget.entity.LmtBudgetHis;
import com.budget.modules.util.BudgetOptStatus;
import com.thinkgem.jeesite.common.utils.StringUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional(readOnly=true)
public class BudgetWSDLService {

	@Autowired
	LmtBudgetDao lmtBudgetDao;
	@Autowired
	LmtBudgetHisDao lmtBudgetHisDao;
	
	
	/**预算校验
	 * @param inputXML
	 * @return
	 */
	public String SynCheckBudgetInfo(String inputXML) {
		JSONObject outJson=new JSONObject();
		List<Map<String,String>> linelist=new ArrayList<Map<String,String>>();
		Map<String,String> map = null;
		String resultFlag="Y";
		String resultMsg="";
		//单据ID
		String id="";
		
		try{
			if(StringUtils.isNotBlank(inputXML)){
				JSONArray jlist=JSONArray.fromObject(inputXML);
				for(int i=0;i<jlist.size();i++){
					resultFlag="Y";//标志重置
					map=new HashMap<String,String>();
					JSONObject json=JSONObject.fromObject(jlist.get(i));
					id=json.getString("ID");//单据ID
					String lineID=json.getString("LINE_ID");//单据行ID
					String budgetID=json.getString("BUDGET_ID");//预算基础表主键ID
					long amount=TypeChange.stringToLongAll((new BigDecimal(json.getString("LIST_AMOUNT")))+"");//变动金额
					String budgetControllStatus=json.getString("BUDGET_CONTROLL_STATUS");
					
					//若会计科目发生改变则会改变预算，则原预算ID会被新预算ID覆盖，无法对原预算进行释放，此时需要从预算变动明细表中查询原预算ID的记录
					if("R".equals(budgetControllStatus)){
						LmtBudgetHis entity=new LmtBudgetHis();
						entity.setClaimId(id);
						entity.setClaimLineId(lineID);
						LmtBudgetHis lhis = lmtBudgetHisDao.getLmtBudget(entity);
						if(null!=lhis){
							budgetID=lhis.getBudgetId();//预算基础表主键ID
						}
						
					}
					
					LmtBudget lmtBudget=lmtBudgetDao.get(budgetID);
					if(lmtBudget!=null){
						//预算余额
						long occupiedAmount = lmtBudget.getOccupiedAmount() == null ? 0L :lmtBudget.getOccupiedAmount();
						long blockedAmount = lmtBudget.getBlockedAmount() == null ? 0L : lmtBudget.getBlockedAmount();
						long budgetAmount = lmtBudget.getBudgetAmount() == null ? 0L : lmtBudget.getBudgetAmount();
						long budgetBalance=budgetAmount - occupiedAmount - blockedAmount;
						
						//获取预算变动明细表
						LmtBudgetHis entity=new LmtBudgetHis();
						entity.setClaimId(id);
						entity.setClaimLineId(lineID);
						entity.setBudgetId(budgetID);
//						List<LmtBudgetHis> lmtBudgetHisList=lmtBudgetHisDao.findList(entity);
						LmtBudgetHis lhis = lmtBudgetHisDao.getLmtBudget(entity);
						if(lhis!=null){							
													
							//如果此时要做冻结操作，变动明细中最新的数据为冻结或占用操作，则不允许操作
							if("F".equals(budgetControllStatus)){
								if("F".equals(lhis.getOpType())||"O".equals(lhis.getOpType())){
									resultFlag="N";
									resultMsg="该条预算已经被"+this.getStatusName(lhis.getOpType())+",不允许冻结";
								}else{
									//若要冻结的金额超过预算余额，不允许冻结
									if(amount>budgetBalance){
										resultFlag="N";
										resultMsg="需要冻结的金额："+TypeChange.longToString(amount)+" 超过预算的余额："+TypeChange.longToString(budgetBalance)+",不允许冻结";
									}
								}
							}else if("R".equals(budgetControllStatus)){//如果此时要做释放操作，变动明细中最新的数据为释放或占用操作，则不允许操作
//									if("R".equals(lhis.getOpType())||"O".equals(lhis.getOpType())){
									if("R".equals(lhis.getOpType())){//20171023逻辑变更，占用的预算也允许释放
										resultFlag="N";
										resultMsg="该条预算已经被"+this.getStatusName(lhis.getOpType())+",不允许释放";
									}else{
										//若要释放的金额超过预算冻结金额，不允许释放
										if(amount>lmtBudget.getBlockedAmount()){
											resultFlag="N";
											resultMsg="需要释放的金额："+TypeChange.longToString(amount)+" 超过预算冻结金额："+TypeChange.longToString(blockedAmount)+",不允许释放";
										}
									}
							}else if("O".equals(budgetControllStatus)){//如果此时要做占用操作，变动明细中最新的数据为释放或占用操作，则不允许操作
								if("R".equals(lhis.getOpType())||"O".equals(lhis.getOpType())){
									resultFlag="N";
									resultMsg="该条预算已经被"+this.getStatusName(lhis.getOpType())+",不允许占用";
								}else{
									//若要占用的金额超过冻结的金额，不允许占用
									if(amount>lmtBudget.getBlockedAmount()){
										resultFlag="N";
										resultMsg="需要占用的金额："+TypeChange.longToString(amount)+" 超过预算冻结金额："+TypeChange.longToString(blockedAmount)+",释放出现异常,不允许占用";
									}
									
								}
							}
						}else{
							//若变动明细表中没有相关的数据，则允许冻结，同时校验金额
							if("F".equals(budgetControllStatus)){
								//若要冻结的金额超过预算余额，不允许冻结
								if(amount>budgetBalance){
									resultFlag="N";
									resultMsg="需要冻结的金额："+TypeChange.longToString(amount)+" 超过预算的余额："+TypeChange.longToString(budgetBalance)+",不允许冻结";
								}
							
							}else if("R".equals(budgetControllStatus)){//如果此时要做释放操作，则不允许操作
								resultFlag="N";
								resultMsg="该条预算未被"+this.getStatusName("F")+",不需要释放";
								
							}else if("O".equals(budgetControllStatus)){//如果此时要做占用操作，则不允许操作
								resultFlag="N";
								resultMsg="该条预算未被"+this.getStatusName("F")+",不允许直接占用";					
							}
						}
					
						
					}else{
						resultFlag="N";
						resultMsg="没有对应的预算信息或预算信息不可用";
					}
					
					if("N".equals(resultFlag)){
						map.put("LINE_ID", lineID);
						map.put("LINE_FLAG", resultFlag);
						map.put("ERROR_MSG", resultMsg);
						linelist.add(map);
					}
				}
				
				
			}else{
				resultFlag="N";
				resultMsg="没有参数传入，请输入正确的参数";
			}
		}catch(Exception e){
			resultFlag="N";
			resultMsg="接口操作出现异常："+e.getMessage();
			e.printStackTrace();
		}finally{
			
			if(linelist!=null&&linelist.size()>0){
				resultFlag="N";
				resultMsg="";
			}
			outJson.put("ID", id);
			outJson.put("RESULT_FLAG", resultFlag);
			outJson.put("RESULT_MSG", resultMsg);
			outJson.put("LINE_LIST", linelist);
		}
		return outJson.toString();
	}

	
	
	
	/**预算控制，冻结、释放、占用，service层不捕获异常，异常在最外层抛，保证事务的完整
	 * @param inputXML
	 * @return
	 */
	@Transactional(readOnly = false)
	public JSONObject SynControllBudgetInfo(String inputXML){
		//预算校验
		String jsonStr=this.SynCheckBudgetInfo(inputXML);
		
		JSONObject json=JSONObject.fromObject(jsonStr);
		if("N".equals(json.getString("RESULT_FLAG"))){
			return json;
		}
		
		String resultFlag="";
		String resultMsg="";
		String id=json.getString("ID");//单据ID
		List linelist=json.getJSONArray("LINE_LIST");
		json=new JSONObject();
		
		JSONArray jlist=JSONArray.fromObject(inputXML);
		for(int i=0;i<jlist.size();i++){
			JSONObject jsoninput=JSONObject.fromObject(jlist.get(i));
			String lineID=jsoninput.getString("LINE_ID");//单据行ID
			String budgetID=jsoninput.getString("BUDGET_ID");//预算基础表主键ID
			long amount=TypeChange.stringToLongAll(jsoninput.getString("LIST_AMOUNT"));//变动金额
			String budgetControllStatus=jsoninput.getString("BUDGET_CONTROLL_STATUS");//预算操作状态F:冻结  R:释放   O:占用 
			String curStatus="";//预算当前所处的状态
			
			//若会计科目发生改变则会改变预算，则原预算ID会被新预算ID覆盖，无法对原预算进行释放，此时需要从预算变动明细表中查询原预算ID的记录
			if(budgetControllStatus.equals("R")){
				LmtBudgetHis entity=new LmtBudgetHis();
				entity.setClaimId(id);
				entity.setClaimLineId(lineID);
				LmtBudgetHis lhis = lmtBudgetHisDao.getLmtBudget(entity);
				if(null!=lhis){
					budgetID=lhis.getBudgetId();//预算基础表主键ID
					curStatus=lhis.getOpType();//获取预算明细中最近的状态
				}
				
			}
			
			LmtBudget lmtBudget=lmtBudgetDao.get(budgetID);
			
			long occupiedAmount = lmtBudget.getOccupiedAmount() == null ? 0L :lmtBudget.getOccupiedAmount();
			long blockedAmount = lmtBudget.getBlockedAmount() == null ? 0L : lmtBudget.getBlockedAmount();
			long budgetAmount = lmtBudget.getBudgetAmount() == null ? 0L : lmtBudget.getBudgetAmount();
			lmtBudget.setBlockedAmount(blockedAmount);
			lmtBudget.setOccupiedAmount(occupiedAmount);
			lmtBudget.setBudgetAmount(budgetAmount);
			
			
			if("F".equals(budgetControllStatus)){//冻结
				//存入冻结金额
				lmtBudget.setBlockedAmount(amount+lmtBudget.getBlockedAmount());
				//计算预算余额
				lmtBudget.setBudgetBalance(lmtBudget.getBudgetAmount()-lmtBudget.getOccupiedAmount()-lmtBudget.getBlockedAmount());
				//修改金额时间
				lmtBudget.setModifyDate(new Date());
				//修改用户ID
				lmtBudget.setModifyUserId(jsoninput.getString("USER_ID"));
				
				lmtBudgetDao.updateBudgetById(lmtBudget);
				
				//插入预算表冻结细表
				LmtBudgetHis lmtBudgetHis=this.setLmtBudgetHis(lmtBudget, jsoninput);
				lmtBudgetHis.setDescribes("预算冻结");
				
				lmtBudgetHisDao.insert(lmtBudgetHis);
				
				resultFlag="Y";
				resultMsg="预算金额冻结操作成功";
				
			}else if("R".equals(budgetControllStatus)){//释放
				if("O".equals(curStatus)){
					//释放已完成(占用)金额
					lmtBudget.setOccupiedAmount(lmtBudget.getOccupiedAmount()-amount);
				}else{
					//释放冻结金额
					lmtBudget.setBlockedAmount(lmtBudget.getBlockedAmount()-amount);
				}

				//计算预算余额
				lmtBudget.setBudgetBalance(lmtBudget.getBudgetAmount()-lmtBudget.getOccupiedAmount()-lmtBudget.getBlockedAmount());
				//修改金额时间
				lmtBudget.setModifyDate(new Date());
				//修改用户ID
				lmtBudget.setModifyUserId(jsoninput.getString("USER_ID"));
				
				lmtBudgetDao.updateBudgetById(lmtBudget);
				
				//插入预算表冻结细表
				LmtBudgetHis lmtBudgetHis=this.setLmtBudgetHis(lmtBudget, jsoninput);
				lmtBudgetHis.setDescribes("预算释放");
//				//抛异常，测回滚
//				if(i==1){
//					lmtBudgetHis.setUserGroupId(jsoninput.getString(""));
//				}
				
				lmtBudgetHisDao.insert(lmtBudgetHis);
				
				resultFlag="Y";
				resultMsg="预算金额释放操作成功";
				
			}else if("O".equals(budgetControllStatus)){//占用
				//释放冻结金额
				lmtBudget.setBlockedAmount(lmtBudget.getBlockedAmount()-amount);
				//添加已完成的金额
				lmtBudget.setOccupiedAmount(lmtBudget.getOccupiedAmount()+amount);
				//计算预算余额
				lmtBudget.setBudgetBalance(lmtBudget.getBudgetAmount()-lmtBudget.getOccupiedAmount()-lmtBudget.getBlockedAmount());
				//修改金额时间
				lmtBudget.setModifyDate(new Date());
				//修改用户ID
				lmtBudget.setModifyUserId(jsoninput.getString("USER_ID"));
				
				lmtBudgetDao.updateBudgetById(lmtBudget);
				
				//插入预算表冻结细表
				LmtBudgetHis lmtBudgetHis=this.setLmtBudgetHis(lmtBudget, jsoninput);
				lmtBudgetHis.setDescribes("预算占用");
				
				lmtBudgetHisDao.insert(lmtBudgetHis);
				
				resultFlag="Y";
				resultMsg="预算金额占用操作成功";
			}
			
			
		}
		
		json.put("ID", id);
		json.put("RESULT_FLAG", resultFlag);
		json.put("RESULT_MSG", resultMsg);
		json.put("LINE_LIST", linelist);
		
		return json;
	}
	
	
	
	private String getStatusName(String status){
		String result="";
		if("F".equals(status)){
			result=BudgetOptStatus.Frozen.getName();
		}else if("R".equals(status)){
			result=BudgetOptStatus.Release.getName();
		}else if("O".equals(status)){
			result=BudgetOptStatus.Occupy.getName();
		}
		return result;
	}
	
	private LmtBudgetHis setLmtBudgetHis(LmtBudget lmtBudget,JSONObject jsoninput){
		LmtBudgetHis lmtBudgetHis=new LmtBudgetHis();
		lmtBudgetHis.setClaimId(jsoninput.getString("ID"));
		lmtBudgetHis.setClaimNo(jsoninput.getString("NUM"));
		lmtBudgetHis.setClaimLineId(jsoninput.getString("LINE_ID"));
		lmtBudgetHis.setBudgetId(lmtBudget.getId());
		lmtBudgetHis.setOpType(jsoninput.getString("BUDGET_CONTROLL_STATUS"));
		lmtBudgetHis.setBudgetNo("");
		lmtBudgetHis.setBudgetName(lmtBudget.getBudgetSubjectName());
		lmtBudgetHis.setBudgetSubjectCode(lmtBudget.getBudgetSubjectCode());
		lmtBudgetHis.setBudgetReallyDate(new Date());
		lmtBudgetHis.setSystemCode(jsoninput.get("SYSTEM_CODE")+"");
		lmtBudgetHis.setSystemName(jsoninput.get("SYSTEM_NAME")+"");
		lmtBudgetHis.setUserId(jsoninput.get("USER_ID")+"");
		lmtBudgetHis.setUserName(jsoninput.get("USER_NAME")+"");
		lmtBudgetHis.setComId(jsoninput.get("COM_ID")+"");
		lmtBudgetHis.setComName(jsoninput.get("COM_NAME")+"");
		lmtBudgetHis.setDeptId("");
		lmtBudgetHis.setDeptName("");
		lmtBudgetHis.setSubmitDate(new Date());		
		lmtBudgetHis.setChangeAmount(TypeChange.stringToLongAll(jsoninput.getString("LIST_AMOUNT")));
		lmtBudgetHis.setBudgetAmount(lmtBudget.getBudgetAmount());
		lmtBudgetHis.setOccupiedAmount(lmtBudget.getOccupiedAmount() == null ? 0L : lmtBudget.getOccupiedAmount());
		lmtBudgetHis.setBlockedAmount(lmtBudget.getBlockedAmount() == null ? 0L : lmtBudget.getBlockedAmount());
		lmtBudgetHis.setBudgetBalance(lmtBudget.getBudgetBalance());
		lmtBudgetHis.setFundsBudgetAmount(lmtBudget.getFundsBudgetAmount());
		lmtBudgetHis.setFundsOccupiedAmount(lmtBudget.getFundsOccupiedAmount());
		lmtBudgetHis.setFundsBlockedAmount(lmtBudget.getFundsBlockedAmount());
		lmtBudgetHis.setFundsBudgetBalance(lmtBudget.getFundsBudgetBalance());
		lmtBudgetHis.setFundsChangeAmount(0l);
		
		return lmtBudgetHis;
	}
	
}

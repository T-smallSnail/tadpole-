package com.budget.modules.budgetWebService;

import javax.jws.WebService;

/**预算接口
 * @author shxiahui
 *
 */
@WebService
public interface BudgetIntefaceService {

	
	/**根据维度查询预算信息
	 * @param inputXML
	 * @return
	 */
	String SynSearchBudgetInfo(String inputXML);
	
	/**根据维度校验预算信息
	 * @param inputXML
	 * @return
	 */
	String SynCheckBudgetInfo(String inputXML);
	
	/**预算信息的冻结、释放、占用
	 * @param inputXML
	 * @return
	 */
	String SynControllBudgetInfo(String inputXML);
	
	/**
	 * 将预算余额同合同金额做比较
	 * @param inputJson
	 * @return
	 */
	String compareMoneyWithContract(String inputJson);
}

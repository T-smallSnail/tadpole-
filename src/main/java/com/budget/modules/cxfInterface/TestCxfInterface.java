package com.budget.modules.cxfInterface;

import org.springframework.beans.factory.annotation.Autowired;

import com.budget.modules.cxfInterface.wsdlclass.GetTestInfoRequest;
import com.budget.modules.cxfInterface.wsdlclass.GetTestInfoService;
import com.budget.modules.cxfInterface.wsdlclass.SetTestInfoResponse;
import com.budget.modules.cxfInterface.wsdlclass.TestInfoInputItem;
import com.budget.modules.cxfInterface.wsdlclass.TestInfoList;

@javax.jws.WebService(endpointInterface = "com.budget.modules.cxfInterface.wsdlclass.GetTestInfoService", targetNamespace = "http://test.cmcc.com/getTestInfoService", serviceName = "getTestInfoService", portName = "getTestInfoServicePort")
public class TestCxfInterface implements GetTestInfoService {

	@Override
	public SetTestInfoResponse getTestInfo(GetTestInfoRequest request) {
		// TODO Auto-generated method stub
		String claimId=request.getClaimId();
		
		
		
		SetTestInfoResponse response=new SetTestInfoResponse();
		TestInfoList list=new TestInfoList();
		if(claimId!="2013"){
			TestInfoInputItem item=new TestInfoInputItem();
			
			item.setCliamNo("419001010103201703222026550001");
			item.setApplyUserName("兰顺亮");
			item.setApplyDeptName("工程建设部");
			item.setApplyDate("2017-01-01");
			
			list.getTestInfoInputItem().add(item);
			
			
			response.setErrorFlag("0");
			response.setErrorMessage("success");
		}else{
			response.setErrorFlag("1");
			response.setErrorMessage("fail,not data can be found");
		}
		response.setTestInfoList(list);
		
		
		return response;
	}

}

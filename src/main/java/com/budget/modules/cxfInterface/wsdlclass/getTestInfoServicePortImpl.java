package com.budget.modules.cxfInterface.wsdlclass;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@javax.jws.WebService(endpointInterface = "test.GetTestInfoService", targetNamespace = "http://test.cmcc.com/getTestInfoService", serviceName = "getTestInfoService", portName = "getTestInfoServicePort")
public class getTestInfoServicePortImpl {

	public SetTestInfoResponse getTestInfo(GetTestInfoRequest parameters) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Not implemented yet.");
	}

}
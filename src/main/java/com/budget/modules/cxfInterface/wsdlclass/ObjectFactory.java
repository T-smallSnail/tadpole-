package com.budget.modules.cxfInterface.wsdlclass;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java
 * element interface generated in the test package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the
 * Java representation for XML content. The Java representation of XML content
 * can consist of schema derived interfaces and classes representing the binding
 * of schema type definitions, element declarations and model groups. Factory
 * methods for each of these are provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _SetTestInfoResponse_QNAME = new QName(
			"http://test.cmcc.com/getTestInfoService", "setTestInfoResponse");
	private final static QName _GetTestInfoRequest_QNAME = new QName(
			"http://test.cmcc.com/getTestInfoService", "getTestInfoRequest");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of
	 * schema derived classes for package: test
	 * 
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link TestInfoList }
	 * 
	 */
	public TestInfoList createTestInfoList() {
		return new TestInfoList();
	}

	/**
	 * Create an instance of {@link SetTestInfoResponse }
	 * 
	 */
	public SetTestInfoResponse createSetTestInfoResponse() {
		return new SetTestInfoResponse();
	}

	/**
	 * Create an instance of {@link GetTestInfoRequest }
	 * 
	 */
	public GetTestInfoRequest createGetTestInfoRequest() {
		return new GetTestInfoRequest();
	}

	/**
	 * Create an instance of {@link MsgHeader }
	 * 
	 */
	public MsgHeader createMsgHeader() {
		return new MsgHeader();
	}

	/**
	 * Create an instance of {@link TestInfoInputItem }
	 * 
	 */
	public TestInfoInputItem createTestInfoInputItem() {
		return new TestInfoInputItem();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link SetTestInfoResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://test.cmcc.com/getTestInfoService", name = "setTestInfoResponse")
	public JAXBElement<SetTestInfoResponse> createSetTestInfoResponse(
			SetTestInfoResponse value) {
		return new JAXBElement<SetTestInfoResponse>(_SetTestInfoResponse_QNAME,
				SetTestInfoResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link GetTestInfoRequest }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://test.cmcc.com/getTestInfoService", name = "getTestInfoRequest")
	public JAXBElement<GetTestInfoRequest> createGetTestInfoRequest(
			GetTestInfoRequest value) {
		return new JAXBElement<GetTestInfoRequest>(_GetTestInfoRequest_QNAME,
				GetTestInfoRequest.class, null, value);
	}

}

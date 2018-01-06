package com.budget.modules.cxfInterface.wsdlclass;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for setTestInfoResponse complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="setTestInfoResponse">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="errorFlag" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="errorMessage" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="testInfoList" type="{http://test.cmcc.com/getTestInfoService}testInfoList"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "setTestInfoResponse", propOrder = { "errorFlag",
		"errorMessage", "testInfoList" })
public class SetTestInfoResponse {

	@XmlElement(required = true, nillable = true)
	protected String errorFlag;
	@XmlElement(required = true, nillable = true)
	protected String errorMessage;
	@XmlElement(required = true)
	protected TestInfoList testInfoList;

	/**
	 * Gets the value of the errorFlag property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getErrorFlag() {
		return errorFlag;
	}

	/**
	 * Sets the value of the errorFlag property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setErrorFlag(String value) {
		this.errorFlag = value;
	}

	/**
	 * Gets the value of the errorMessage property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getErrorMessage() {
		return errorMessage;
	}

	/**
	 * Sets the value of the errorMessage property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setErrorMessage(String value) {
		this.errorMessage = value;
	}

	/**
	 * Gets the value of the testInfoList property.
	 * 
	 * @return possible object is {@link TestInfoList }
	 * 
	 */
	public TestInfoList getTestInfoList() {
		return testInfoList;
	}

	/**
	 * Sets the value of the testInfoList property.
	 * 
	 * @param value
	 *            allowed object is {@link TestInfoList }
	 * 
	 */
	public void setTestInfoList(TestInfoList value) {
		this.testInfoList = value;
	}

}

package com.budget.modules.cxfInterface.wsdlclass;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for TestInfoInputItem complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="TestInfoInputItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cliamNo" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="applyDeptName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="applyDate" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="applyUserName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TestInfoInputItem", propOrder = { "cliamNo", "applyDeptName",
		"applyDate", "applyUserName" })
public class TestInfoInputItem {

	@XmlElement(required = true, nillable = true)
	protected String cliamNo;
	@XmlElement(required = true, nillable = true)
	protected String applyDeptName;
	@XmlElement(required = true, nillable = true)
	protected String applyDate;
	@XmlElement(required = true, nillable = true)
	protected String applyUserName;

	/**
	 * Gets the value of the cliamNo property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCliamNo() {
		return cliamNo;
	}

	/**
	 * Sets the value of the cliamNo property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCliamNo(String value) {
		this.cliamNo = value;
	}

	/**
	 * Gets the value of the applyDeptName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getApplyDeptName() {
		return applyDeptName;
	}

	/**
	 * Sets the value of the applyDeptName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setApplyDeptName(String value) {
		this.applyDeptName = value;
	}

	/**
	 * Gets the value of the applyDate property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getApplyDate() {
		return applyDate;
	}

	/**
	 * Sets the value of the applyDate property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setApplyDate(String value) {
		this.applyDate = value;
	}

	/**
	 * Gets the value of the applyUserName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getApplyUserName() {
		return applyUserName;
	}

	/**
	 * Sets the value of the applyUserName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setApplyUserName(String value) {
		this.applyUserName = value;
	}

}

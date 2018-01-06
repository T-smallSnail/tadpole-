package com.budget.modules.cxfInterface.wsdlclass;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for getTestInfoRequest complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="getTestInfoRequest">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="MsgHeader" type="{http://test.cmcc.com/MsgHeader}MsgHeader"/>
 *         &lt;element name="claimId" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getTestInfoRequest", propOrder = { "msgHeader", "claimId" })
public class GetTestInfoRequest {

	@XmlElement(name = "MsgHeader", required = true)
	protected MsgHeader msgHeader;
	@XmlElement(required = true, nillable = true)
	protected String claimId;

	/**
	 * Gets the value of the msgHeader property.
	 * 
	 * @return possible object is {@link MsgHeader }
	 * 
	 */
	public MsgHeader getMsgHeader() {
		return msgHeader;
	}

	/**
	 * Sets the value of the msgHeader property.
	 * 
	 * @param value
	 *            allowed object is {@link MsgHeader }
	 * 
	 */
	public void setMsgHeader(MsgHeader value) {
		this.msgHeader = value;
	}

	/**
	 * Gets the value of the claimId property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getClaimId() {
		return claimId;
	}

	/**
	 * Sets the value of the claimId property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setClaimId(String value) {
		this.claimId = value;
	}

}

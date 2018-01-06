package com.budget.modules.cxfInterface.wsdlclass;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for MsgHeader complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="MsgHeader">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="SOURCE_SYSTEMID" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="SOURCE_SYSTEMNAME" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="USERID" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="USERNAME" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="SUBMITDATE" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="PAGE_SIZE" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="CURRENT_PAGE" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="TOTAL_RECORD" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="PROVINCE_CODE" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="ENVIRONMENT_NAME" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MsgHeader", namespace = "http://test.cmcc.com/MsgHeader", propOrder = {
		"sourcesystemid", "sourcesystemname", "userid", "username",
		"submitdate", "pagesize", "currentpage", "totalrecord", "provincecode",
		"environmentname" })
public class MsgHeader {

	@XmlElement(name = "SOURCE_SYSTEMID", required = true, nillable = true)
	protected String sourcesystemid;
	@XmlElement(name = "SOURCE_SYSTEMNAME", required = true, nillable = true)
	protected String sourcesystemname;
	@XmlElement(name = "USERID", required = true, nillable = true)
	protected String userid;
	@XmlElement(name = "USERNAME", required = true, nillable = true)
	protected String username;
	@XmlElement(name = "SUBMITDATE", required = true, nillable = true)
	protected String submitdate;
	@XmlElement(name = "PAGE_SIZE", required = true, type = Long.class, nillable = true)
	protected Long pagesize;
	@XmlElement(name = "CURRENT_PAGE", required = true, type = Long.class, nillable = true)
	protected Long currentpage;
	@XmlElement(name = "TOTAL_RECORD", required = true, type = Long.class, nillable = true)
	protected Long totalrecord;
	@XmlElement(name = "PROVINCE_CODE", required = true, nillable = true)
	protected String provincecode;
	@XmlElement(name = "ENVIRONMENT_NAME", required = true, nillable = true)
	protected String environmentname;

	/**
	 * Gets the value of the sourcesystemid property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSOURCESYSTEMID() {
		return sourcesystemid;
	}

	/**
	 * Sets the value of the sourcesystemid property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSOURCESYSTEMID(String value) {
		this.sourcesystemid = value;
	}

	/**
	 * Gets the value of the sourcesystemname property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSOURCESYSTEMNAME() {
		return sourcesystemname;
	}

	/**
	 * Sets the value of the sourcesystemname property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSOURCESYSTEMNAME(String value) {
		this.sourcesystemname = value;
	}

	/**
	 * Gets the value of the userid property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getUSERID() {
		return userid;
	}

	/**
	 * Sets the value of the userid property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setUSERID(String value) {
		this.userid = value;
	}

	/**
	 * Gets the value of the username property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getUSERNAME() {
		return username;
	}

	/**
	 * Sets the value of the username property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setUSERNAME(String value) {
		this.username = value;
	}

	/**
	 * Gets the value of the submitdate property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSUBMITDATE() {
		return submitdate;
	}

	/**
	 * Sets the value of the submitdate property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSUBMITDATE(String value) {
		this.submitdate = value;
	}

	/**
	 * Gets the value of the pagesize property.
	 * 
	 * @return possible object is {@link Long }
	 * 
	 */
	public Long getPAGESIZE() {
		return pagesize;
	}

	/**
	 * Sets the value of the pagesize property.
	 * 
	 * @param value
	 *            allowed object is {@link Long }
	 * 
	 */
	public void setPAGESIZE(Long value) {
		this.pagesize = value;
	}

	/**
	 * Gets the value of the currentpage property.
	 * 
	 * @return possible object is {@link Long }
	 * 
	 */
	public Long getCURRENTPAGE() {
		return currentpage;
	}

	/**
	 * Sets the value of the currentpage property.
	 * 
	 * @param value
	 *            allowed object is {@link Long }
	 * 
	 */
	public void setCURRENTPAGE(Long value) {
		this.currentpage = value;
	}

	/**
	 * Gets the value of the totalrecord property.
	 * 
	 * @return possible object is {@link Long }
	 * 
	 */
	public Long getTOTALRECORD() {
		return totalrecord;
	}

	/**
	 * Sets the value of the totalrecord property.
	 * 
	 * @param value
	 *            allowed object is {@link Long }
	 * 
	 */
	public void setTOTALRECORD(Long value) {
		this.totalrecord = value;
	}

	/**
	 * Gets the value of the provincecode property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getPROVINCECODE() {
		return provincecode;
	}

	/**
	 * Sets the value of the provincecode property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setPROVINCECODE(String value) {
		this.provincecode = value;
	}

	/**
	 * Gets the value of the environmentname property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getENVIRONMENTNAME() {
		return environmentname;
	}

	/**
	 * Sets the value of the environmentname property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setENVIRONMENTNAME(String value) {
		this.environmentname = value;
	}

}

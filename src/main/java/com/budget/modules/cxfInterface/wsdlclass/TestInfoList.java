package com.budget.modules.cxfInterface.wsdlclass;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for testInfoList complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="testInfoList">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="TestInfoInputItem" type="{http://test.cmcc.com/getTestInfoService}TestInfoInputItem" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "testInfoList", propOrder = { "testInfoInputItem" })
public class TestInfoList {

	@XmlElement(name = "TestInfoInputItem")
	protected List<TestInfoInputItem> testInfoInputItem;

	/**
	 * Gets the value of the testInfoInputItem property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live list, not a
	 * snapshot. Therefore any modification you make to the returned list will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the testInfoInputItem property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getTestInfoInputItem().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the list
	 * {@link TestInfoInputItem }
	 * 
	 * 
	 */
	public List<TestInfoInputItem> getTestInfoInputItem() {
		if (testInfoInputItem == null) {
			testInfoInputItem = new ArrayList<TestInfoInputItem>();
		}
		return this.testInfoInputItem;
	}

}

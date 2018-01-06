package com.budget.common.util;

import org.apache.commons.lang3.StringUtils;

public class TypeChange {

	public static String longToString(Long value){
		return longToString( value,2);
	}
	public static Long stringToLong(String value){
		return stringToLong( value,2);
	}
	public static Long stringToLong(String value,int i){

		if(StringUtils.isBlank(value)){
			return 0L;
		}
		value = value.replace(",","");
		value = value.replace("，","");
		String[] strings = value.split("\\.");
		int num = 1;
		for (int s = 0; s < i ; s++) {
			num = num*10;
		}
		return Long.parseLong(strings[0])*num + Long.parseLong(strings[1]);
	}
	public static Long stringToLongAll(String value){
		String[] strings =null;
		try{
			if(StringUtils.isBlank(value)){
				return 0L;
			}
			value = value.replace(",","");
			value = value.replace("，","");
			strings = value.split("\\.");
			if(strings[1].length()==1){
				return Long.parseLong(strings[0])*100 + Long.parseLong(strings[1])*10;
			}else{
				return Long.parseLong(strings[0])*100 + Long.parseLong(strings[1]);
			}
		}catch(Exception e){
			return Long.parseLong(strings[0])*100;
		}
	
	}
	
	
	public static String longToString(Long value,int i){
		
		if(value==null||value==0L){
			return "0.00";
		}

		String str = String.format("%0"+(i+1)+"d", value);
		StringBuilder string = new StringBuilder(str);
		return string.insert(string.length()-i, ".").toString();
	}
	
	
	  


}

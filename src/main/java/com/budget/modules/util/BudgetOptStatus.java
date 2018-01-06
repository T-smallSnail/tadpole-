package com.budget.modules.util;

public enum BudgetOptStatus {

	Frozen  ("F","冻结"),
	Release ("R","释放"),
	Occupy  ("O","占用");
	
    public final String code;
    public final String name;
    
    
    BudgetOptStatus(String code, String name) {
        this.code = code;
        this.name = name;
    }


	public String getCode() {
		return code;
	}


	public String getName() {
		return name;
	}
    
    
}

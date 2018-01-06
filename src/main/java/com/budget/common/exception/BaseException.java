package com.budget.common.exception;


/**
 * <!-- START SNIPPET: javadoc -->
 * <p>
 * 系统异常基类：
 * </p>
 * <!-- END SNIPPET: javadoc --> <!-- START SNIPPET: params -->
 * <ul>
 * <li>异常编码规则.
 * <li>00000000：未编码异常</li>
 * <li> -1：未知异常</li>
 * <li>XXYY0DDD：系统代码(2)+模块(2)+顺序号码(4)</li>
 * <li>错误信息有统一配置文件组成</li>
 * </ul>
 * <!-- END SNIPPET: params --> BaseException.java
 * 
 * @author admin 2009-12-31
 * 
 */
@SuppressWarnings("serial")
public class BaseException extends Exception {

	
}
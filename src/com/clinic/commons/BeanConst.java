package com.clinic.commons;

/**
 * @description json格式规范 eg：{"flag":"info","msg":"用户名或密码错误！"} {"flag":"ok","msg":"操作成功！","items":[{"name":"123"}]}
 * 
 * @author Jxl
 * @date 2014年1月15日
 * @time 下午12:38:40
 * 
 */
public class BeanConst {

	/**
	 * 状态码：成功
	 */
	public static final String OK = "ok";

	/**
	 * 状态码：系统错误
	 */
	public static final String ERROR = "error";

	/**
	 * 状态码：信息提示，如用户名和密码错误
	 */
	public static final String INFO = "info";

	/**
	 * 返回标志 flag 保存状态码
	 */
	public static final String FLAG = "flag";

	/**
	 * 返回标志 MSG 保存操作信息
	 */
	public static final String MSG = "msg";

	/**
	 * 返回标志 ITEMS 保存业务数据，json数组格式保存
	 */
	public static final String ITEMS = "items";

	/**
	 * 返回标志 CODE
	 */
	public static final String CODE = "code";

	/**
	 * 默认 CODE值
	 */
	public static final int DEFAULT_CODE = 0;

	/**
	 * 默认基本错误信息提示
	 */
	public static final String DEFAULT_ERROR_MSG = "网络异常,请稍后重试！";
	
	/**
	 * 默认基本错误信息提示JSON
	 */
	public static final String DEFAULT_ERROR_MSG_JSON = "{\"flag\":\"error\",\"msg\":\"网络异常，请稍后再试！\"}";
	
	/**
	 * 超时
	 */
	public static final String TIME_OVER = "{\"flag\":\"error\",\"msg\":\"timeover\"}";
	
	/**
	 * 分页第页默认显示记录数
	 */
	public static final Integer PAGE_SIZE = 10;
	
	/**
	 * 存session user
	 */
	public static final String USER_INFO = "userInfo";

}

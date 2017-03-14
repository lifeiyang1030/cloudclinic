package com.clinic.commons;


/**
 * @description 注意下面的方法中如果有自定义的其他方法则 不能出现getXXX()或者isXX(),否则在json解析这个对象的时候会把这个方法解析出来。
 * 
 * @author Jxl
 * @date 2014年8月29日
 * @time 下午12:20:44
 * 
 */
public class BeanResult {

	private String flag = "";
	private String msg = "";
	private Object items = null;
	private int code = BeanConst.DEFAULT_CODE;

	public BeanResult() {
	}

	public void setResultError(String msg) {
		flag = BeanConst.ERROR;
		this.msg = msg;
		this.code = -100;
		items = null;
	}

	public void setResultError(String msg, int code) {
		flag = BeanConst.ERROR;
		this.msg = msg;
		this.code = code;
		items = null;
	}

	public void setResultBaseError() {
		flag = BeanConst.ERROR;
		this.msg = BeanConst.DEFAULT_ERROR_MSG;
		this.code = -100;
		items = null;
	}

	public void setResultInfo(String msg) {
		flag = BeanConst.INFO;
		this.msg = msg;
		this.code = 1;
		items = null;
	}

	public void setResultInfo(String msg, int code) {
		flag = BeanConst.INFO;
		this.msg = msg;
		this.code = code;
		items = null;
	}

	public void setResultOK(String msg) {
		flag = BeanConst.OK;
		this.msg = msg;
		this.code = 0;
		this.items = null;
	}

	public void setResultOK(Object items) {
		flag = BeanConst.OK;
		this.msg = "";
		this.code = 0;
		this.items = items;
	}

	public void setResultOK( Object items, String msg) {
		flag = BeanConst.OK;
		this.msg = msg;
		this.code = 0;
		this.items = items;
	}

	public boolean ckIsOk() {
		if (flag.equals(BeanConst.OK)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean ckIsInfo() {
		if (flag.equals(BeanConst.INFO)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean ckIsError() {
		if (flag.equals(BeanConst.ERROR)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	public String ckFlagMsg(Map<String, T> dbResult, Logger logger, String showMsg) {
		T flag = dbResult.get("flag");
		if (showMsg == null || showMsg.equals("")) {
			showMsg = "操作";
		}
		if (flag != null) {
			if (flag.toString().equals("1")) {
				this.setResultOK(showMsg + "成功");
			} else {
				logger.error(showMsg + "失败,存储过程返回错误Code:" + flag.toString());
				this.setResultError(showMsg + "失败");
			}
			return flag.toString();
		} else {
			logger.error(showMsg + "失败,获取存储过程返回的flag失败");
			this.setResultError(showMsg + "失败");
			return "";
		}

	}
	**/

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getItems() {
		return items;
	}

	public void setItems(Object items) {
		this.items = items;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "BeanResult [flag=" + flag + ", msg=" + msg + ", items=" + items + ", code=" + code + "]";
	}

}

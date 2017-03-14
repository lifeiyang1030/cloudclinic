package com.clinic.commons;

public class EasyUIPageRequest {

	/**
	 * 当前页
	 */
	private Integer page;
	/**
	 * 每页显示多少条数据
	 */
	private Integer rows;
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
}

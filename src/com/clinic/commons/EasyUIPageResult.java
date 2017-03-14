package com.clinic.commons;

import java.util.List;


public class EasyUIPageResult {

	/**
	 * 数据总数
	 */
	private String total;
	/**
	 * 当前页要呈现的数据
	 */
	private List<?> rows;
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> listGuahao) {
		this.rows = listGuahao;
	}
	
}

package com.clinic.user.entity;

public class UserInfo {
	private Integer userID;
	private String name;
	private String pwd;

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "UserInfo [userID=" + userID + ", name=" + name + ", pwd=" + pwd + "]";
	}
}

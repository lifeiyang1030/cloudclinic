package com.clinic.user.service;

import java.util.List;

import com.clinic.user.entity.UserInfo;

public interface UserInfoService {
	
	public void save(UserInfo userInfo);

	public void update(UserInfo userInfo);

	public void delete(Integer userID);

	public UserInfo getUserInfo(Integer userID);

	public List<UserInfo> getUserInfos();
}

package com.clinic.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.clinic.user.entity.UserInfo;
import com.clinic.user.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public void save(UserInfo userInfo) {
		jdbcTemplate.update("insert into user_info(name, pwd) values(?, ?)", userInfo.getName(), userInfo.getPwd());
	}

	@Override
	public void update(UserInfo userInfo) {
		jdbcTemplate.update("update user_info set name = ?, pwd = ? where userID = ?", userInfo.getName(), userInfo.getPwd(), userInfo.getUserID());
	}

	@Override
	public void delete(Integer userID) {
		jdbcTemplate.update("delete from user_info where userID = ?", userID);
	}

	@Override
	public UserInfo getUserInfo(Integer userID) {
		return jdbcTemplate.queryForObject("select * from user_info where userID = ?", new Object[] { userID }, new BeanPropertyRowMapper<UserInfo>(UserInfo.class));
	}

	@Override
	public List<UserInfo> getUserInfos() {
		return jdbcTemplate.query("select * from user_info", new BeanPropertyRowMapper<UserInfo>(UserInfo.class));
	}

}

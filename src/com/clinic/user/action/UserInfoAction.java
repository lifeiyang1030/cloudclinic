package com.clinic.user.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clinic.commons.BeanResult;
import com.clinic.user.entity.UserInfo;
import com.clinic.user.service.UserInfoService;

@Controller
@RequestMapping("/user")
public class UserInfoAction {

	@Resource(name = "userInfoServiceImpl")
	private UserInfoService userInfoService;

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public BeanResult saveData(Model model, UserInfo userInfo) {
		BeanResult beanResult = new BeanResult();
		userInfoService.save(userInfo);
		return beanResult;
	}

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public BeanResult updateData(Model model, UserInfo userInfo) {
		BeanResult beanResult = new BeanResult();
		userInfoService.update(userInfo);
		return beanResult;
	}

	@ResponseBody
	@RequestMapping(value = "/delete/{userID}", method = RequestMethod.GET)
	public BeanResult deleteData(@PathVariable Integer userID) {
		BeanResult beanResult = new BeanResult();
		userInfoService.delete(userID);
		return beanResult;
	}

	@ResponseBody
	@RequestMapping(value = "/query/{userID}", method = RequestMethod.GET)
	public BeanResult queryData(@PathVariable Integer userID) {
		BeanResult beanResult = new BeanResult();
		UserInfo userInfo = userInfoService.getUserInfo(userID);
		beanResult.setResultOK(userInfo);
		return beanResult;
	}

	@ResponseBody
	@RequestMapping(value = "/query/list", method = RequestMethod.GET)
	public BeanResult listData(Model model) {
		BeanResult beanResult = new BeanResult();
		List<UserInfo> listUserInfo = userInfoService.getUserInfos();
		model.addAttribute("listUser", listUserInfo);
		beanResult.setResultOK(listUserInfo);
		//return "user/user_list";
		return beanResult;
	}

}

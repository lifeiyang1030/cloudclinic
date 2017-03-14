package com.clinic.user.action;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clinic.commons.BeanResult;
import com.clinic.user.entity.UserInfo;

@Controller
@RequestMapping("/test")
public class TestAction {
	
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String Guahao(Model model) {
		return "test/test1";
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public BeanResult saveData(Model model, UserInfo userInfo) {
		BeanResult beanResult = new BeanResult();
		beanResult.setResultOK(userInfo, "成功");
		return beanResult;
	}
}

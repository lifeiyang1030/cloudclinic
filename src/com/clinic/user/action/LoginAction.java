package com.clinic.user.action;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginAction {

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String Login(Model model) {
		return "login/login";
	}
}

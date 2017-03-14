package com.clinic.user.action;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main")
public class MainAction {
	
	@RequestMapping(value = "/guahao", method = RequestMethod.GET)
	public String Guahao(Model model) {
		return "guahao/guahao";
	}
	
	@RequestMapping(value = "/feiyong", method = RequestMethod.GET)
	public String Feiyong(Model model) {
		return "feiyong/feiyong";
	}
	
	@RequestMapping(value = "/fayao", method = RequestMethod.GET)
	public String Fayao(Model model) {
		return "fayao/fayao";
	}
	
	@RequestMapping(value = "/menzhen", method = RequestMethod.GET)
	public String Menzhen(Model model) {
		return "menzhen/menzhen";
	}
	
	@RequestMapping(value = "/yaopin", method = RequestMethod.GET)
	public String Yaoping(Model model) {
		return "yaopin/yaopin";
	}
	
	@RequestMapping(value = "/xitongguanli", method = RequestMethod.GET)
	public String Xitongguanli(Model model) {
		return "xitongguanli/xitongguanli";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String User(Model model) {
		return "user/user";
	}
	
}

package com.clinic.menzhen.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clinic.commons.EasyUIPageResult;
import com.clinic.guahao.entity.Guahao;

@Controller
@RequestMapping("/menzhen")
public class MenzhenAction {

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public EasyUIPageResult listUsers(Model model) {
		EasyUIPageResult easyUIPageResult = new EasyUIPageResult();
		easyUIPageResult.setTotal("10");
		
		List<Guahao> listGuahao = new ArrayList<Guahao>();
		for (int i = 0; i < 20; i++) {
			Guahao guahao = new Guahao();
			guahao.setUserId(i);
			guahao.setAge("1");
			guahao.setCreateName("test");
			guahao.setCreateTime("2017-01-01 12:23:59");
			guahao.setDept("test");
			guahao.setDoctors("test");
			guahao.setName("test(" + i + ")");
			guahao.setSex("1");
			guahao.setStatus("11");
			guahao.setUserId(1);
			listGuahao.add(guahao);
		}
		easyUIPageResult.setRows(listGuahao);
		
		return easyUIPageResult;
	}
	
}

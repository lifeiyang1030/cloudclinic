package com.clinic.guahao.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clinic.commons.EasyUIPageRequest;
import com.clinic.commons.EasyUIPageResult;
import com.clinic.guahao.entity.Guahao;

@Controller
@RequestMapping("/guahao")
public class GuahaoAction {

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public EasyUIPageResult listUsers(Model model, EasyUIPageRequest easyUIPageRequest) {
		EasyUIPageResult easyUIPageResult = new EasyUIPageResult();
		easyUIPageResult.setTotal("63");
		
		List<Guahao> listGuahao = new ArrayList<Guahao>();
		for (int i = 0; i < easyUIPageRequest.getRows(); i++) {
			Guahao guahao = new Guahao();
			guahao.setAge("11");
			guahao.setCreateName("test");
			guahao.setCreateTime("2017-01-01 12:23:59");
			guahao.setDept("test");
			guahao.setDoctors("test");
			guahao.setName("test(" + easyUIPageRequest.getPage() + ")");
			guahao.setSex("3");
			guahao.setStatus("4");
			guahao.setUserId(1);
			listGuahao.add(guahao);
		}
		easyUIPageResult.setRows(listGuahao);
		
		return easyUIPageResult;
	}
}

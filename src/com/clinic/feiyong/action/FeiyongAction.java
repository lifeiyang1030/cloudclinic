package com.clinic.feiyong.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clinic.commons.EasyUIPageRequest;
import com.clinic.commons.EasyUIPageResult;
import com.clinic.feiyong.entity.Daishoufei;

@Controller
@RequestMapping("/feiyong")
public class FeiyongAction {

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public EasyUIPageResult listUsers(Model model,EasyUIPageRequest easyUIPageRequest) {
		EasyUIPageResult easyUIPageResult = new EasyUIPageResult();
		easyUIPageResult.setTotal("40");
		
		List<Daishoufei> listDaishoufei = new ArrayList<Daishoufei>();
		for (int i = 0; i < easyUIPageRequest.getRows(); i++) {
			Daishoufei daishoufei = new Daishoufei();
			daishoufei.setName("张三");
			daishoufei.setAge("21");
			daishoufei.setSex("男");
			daishoufei.setOrderdoctor("王医生");
			daishoufei.setJiuzhentime("2016-06-06");
			daishoufei.setTotal("1000");
			daishoufei.setYsmoney("279");
			listDaishoufei.add(daishoufei);
		}
		easyUIPageResult.setRows(listDaishoufei);
		
		return easyUIPageResult;
	}
}

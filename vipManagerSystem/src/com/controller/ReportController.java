package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.core.model.Grid;
import com.mapping.OrderMapper;

@Controller
@RequestMapping("/report")
public class ReportController {
	   
	
	@Resource
	private OrderMapper orderDao;
	
	@ResponseBody
	@RequestMapping("/vip")
	public Grid  getVipDataReport(){
		 ///ModelAndView mv = new ModelAndView("vip_report");
		 JSONObject json = new JSONObject();
		 List<Map<String,Object>> list =  orderDao.queryVipDataReport();
		 List<Map<String,String>> testlist =  new ArrayList<Map<String,String>>();
		 for(Map<String,Object> mapTemp : list){
			  Map<String, String> map = new HashMap<>();
			 for (String key : mapTemp.keySet()) {
				 map.put("value",mapTemp.get("pill").toString() ) ;
				 map.put("name", mapTemp.get("username").toString() );
			  }
			 testlist.add(map);
		 }
		 json.put("data" , list);
		 json.put("mapdata", testlist);
		 Grid grid = new Grid();
		 grid.setRows(list);
		 grid.setTotal(Long.valueOf(list.size()));
		// mv.addObject("", attributeValue)
		 return grid ;
	}
}

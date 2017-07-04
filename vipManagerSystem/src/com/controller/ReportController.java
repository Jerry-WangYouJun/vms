package com.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
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
	public Grid  getVipDataReport(ModelMap modelmap){
		 List<Map<String,Object>> list =  orderDao.queryVipDataReport();
		 Grid grid = new Grid();
		 grid.setRows(list);
		 grid.setTotal(Long.valueOf(list.size()));
		 return grid ;
	}
	
	@ResponseBody
	@RequestMapping("/vipinit")
	public ModelAndView vipReportInit(){
		ModelAndView  mv = new ModelAndView("vip_report");
		JSONArray jsonarr = new JSONArray();
		 List<Map<String,Object>> list =  orderDao.queryVipDataReport();
		 for(Map<String,Object> mapTemp : list){
			 JSONObject map = new JSONObject();
			 map.put("value",mapTemp.get("pill").toString() ) ;
			 map.put("name", mapTemp.get("username").toString() );
			 jsonarr.add(map);
		 }
		 mv.addObject("mapdata", jsonarr);
		 return mv ;
	}
}

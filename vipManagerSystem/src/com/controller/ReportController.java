package com.controller;

import java.util.ArrayList;
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
	
	@ResponseBody
	@RequestMapping("/productinit")
	public ModelAndView productReportInit(){
		ModelAndView  mv = new ModelAndView("vip_report");
		JSONArray jsonarr = new JSONArray();
		// List<Map<String,Object>> list =  orderDao.queryVipDataReport();
		 List<Map<String,Object>> list =  orderDao.queryPorductDataReport();
		 for(Map<String,Object> mapTemp : list){
			 JSONObject map = new JSONObject();
			 map.put("value",mapTemp.get("counts").toString() ) ;
			 map.put("name", mapTemp.get("proname").toString() );
			 jsonarr.add(map);
		 }
		 mv.addObject("mapdata", jsonarr);
		 return mv ;
	}
	
	@ResponseBody
	@RequestMapping("/gainsinit")
	public ModelAndView gainsReportInit(){
		ModelAndView  mv = new ModelAndView("gains_report");
		List<String> nameList = new ArrayList<>();
		//["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
		nameList.add("布丁");
		nameList.add("卡布奇诺");
		nameList.add("红茶");
		nameList.add("绿茶");
		nameList.add("龟苓膏");
		nameList.add("拿铁");
		List<Integer> valueList = new ArrayList<>();
		valueList.add(20);
		valueList.add(30);
		valueList.add(40);
		valueList.add(50);
		valueList.add(10);
		valueList.add(90);
		JSONArray json = new JSONArray();
		json.addAll(nameList);
		JSONArray valuejson = new JSONArray();
		valuejson.addAll(valueList);
		mv.addObject("data", json);
		mv.addObject("valueData", valuejson);
		return mv ;
	}
}

package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.core.model.Grid;
import com.github.pagehelper.StringUtil;
import com.mapping.OrderMapper;

@Controller
@RequestMapping("/report")
public class ReportController {
	   
	
	@Resource
	private OrderMapper orderDao;
	
	@ResponseBody
	@RequestMapping("/vip")
	public Grid  getVipDataReport(String reportType , String reportDate , String userName){
		Map params = new HashMap();
		params.put("reportType", reportType);
		params.put("reportDate", reportDate);
		params.put("userName", userName);
		 List<Map<String,Object>> list =  orderDao.queryVipDataReport(params);
		 Grid grid = new Grid();
		 grid.setRows(list);
		 grid.setTotal(Long.valueOf(list.size()));
		 return grid ;
	}
	
	@ResponseBody
	@RequestMapping("/vipinit")
	public ModelAndView vipReportInit(String reportType, String reportDate , String userName) {
		ModelAndView mv = new ModelAndView("vip_report");
		JSONArray jsonarr = new JSONArray();
		Map params = new HashMap();
		params.put("reportType", reportType);
		params.put("reportDate", reportDate);
		params.put("userName", userName);
		List<Map<String, Object>> list = orderDao.queryVipDataReport(params);
		List<String> nameList = new ArrayList<>();
		List<String> valueList = new ArrayList<>();
		for (Map<String, Object> mapTemp : list) {
			JSONObject map = new JSONObject();
			map.put("value", mapTemp.get("pill").toString());
			map.put("name", mapTemp.get("username").toString());
			nameList.add(mapTemp.get("username").toString());
			valueList.add(mapTemp.get("pill").toString());
		}
		JSONArray json = new JSONArray();
		json.addAll(nameList);
		JSONArray valuejson = new JSONArray();
		valuejson.addAll(valueList);
		if(StringUtil.isNotEmpty(reportType)){
			mv.addObject("reportType", reportType);
		}
		if(StringUtil.isNotEmpty(reportDate)){
			mv.addObject("reportDate", reportDate);		
		}
		if(StringUtil.isNotEmpty(userName)){
			mv.addObject("userName", userName);
		}
		mv.addObject("data", json);
		mv.addObject("valueData", valuejson);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/product")
	public Grid  getProductDataReport(String reportType , String reportDate , String producttypecode){
		Map params = new HashMap();
		params.put("reportType", reportType);
		params.put("reportDate", reportDate);
		params.put("producttypecode", producttypecode);
		 List<Map<String,Object>> list =  orderDao.queryPorductDataReport(params);
		 Grid grid = new Grid();
		 grid.setRows(list);
		 grid.setTotal(Long.valueOf(list.size()));
		 return grid ;
	}
	
	@ResponseBody
	@RequestMapping("/productinit")
	public ModelAndView productReportInit(String reportType , String reportDate , String producttypecode){
		ModelAndView  mv = new ModelAndView("product_report");
		JSONArray jsonarr = new JSONArray();
		Map params = new HashMap();
		params.put("reportType", reportType);
		params.put("reportDate", reportDate);
		params.put("producttypecode", producttypecode);
		List<Map<String,Object>> list =  orderDao.queryPorductDataReport(params);
		 for(Map<String,Object> mapTemp : list){
			 JSONObject map = new JSONObject();
			 map.put("value",mapTemp.get("counts").toString() ) ;
			 map.put("name", mapTemp.get("proname").toString() );
			 jsonarr.add(map);
		 }
		 mv.addObject("mapdata", jsonarr);
		 mv.addObject("reportType", reportType);
		 mv.addObject("reportDate", reportDate);
		 mv.addObject("producttypecode", producttypecode);
		 return mv ;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxProduct")
	public String ajaxProduct( String userName , HttpServletResponse response) throws Exception {
		JSONArray jsonarr = new JSONArray();
		Map params = new HashMap();
		// List<Map<String,Object>> list =  orderDao.queryVipDataReport();
		 List<Map<String,Object>> list =  orderDao.queryPorductDataReport(params);
		 for(Map<String,Object> mapTemp : list){
			 JSONObject map = new JSONObject();
			 map.put("value",mapTemp.get("counts").toString() ) ;
			 map.put("name", mapTemp.get("proname").toString() );
			 jsonarr.add(map);
		 }
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(jsonarr.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
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

package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.common.Constant;
import com.core.model.Grid;
import com.mapping.OrderMapper;
import com.pojo.Goods;
import com.pojo.Order;
import com.service.GoodsServiceI;
import com.service.OrderServiceI;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource(name="orderServiceImpl")
	private OrderServiceI orderService;
	
	@Resource(name="goodsServiceImpl")
	private GoodsServiceI goodsService;
	
	@Resource
	private OrderMapper orderDao;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid getSelectOrder(Order order ){
		return this.orderService.findOrderList(order);
	}
	
	@ResponseBody
	@RequestMapping("/insertInit")
	public ModelAndView addInitOrder(){
		List<Goods> goodList =this.goodsService.findByAjax("");
		List<Goods> drinkList  =  new ArrayList<>();
		List<Goods> foodList  =  new ArrayList<>();
		List<Goods> specialList  =  new ArrayList<>();
		for (Goods good : goodList) {
			 if(Constant.DRINK.equals(good.getProducttype())){
				 drinkList.add(good);
			 }else if(Constant.FOOD.equals(good.getProducttype())){
				 foodList.add(good);
			 }else if(Constant.SPECIAL.equals(good.getProducttype())){
				 specialList.add(good);
			 }
		}
		
		ModelAndView mv = new ModelAndView("order_add");
		JSONObject json = new JSONObject();
		json.put("food" , foodList);
		json.put("drink", drinkList);
		json.put("special",specialList);
		mv.addObject("model", json);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public Integer addOrder(Order order ){
		 return this.orderService.addOrder(order);
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Integer deleteOrder(@RequestParam Integer id ){
		return this.orderDao.deleteByPrimaryKey(id);
		 
	}
	
	@RequestMapping("/updateinit")
	public ModelAndView updateOrderInit(@RequestParam int id ){
		Order order= this.orderDao.selectByPrimaryKey(id);
		Map<String,Object> model =new HashMap<String,Object>();
		model.put("order",order);//userlist是个Arraylist之类的  
		return new ModelAndView("order_update", model); 
	}
	
	@ResponseBody    
	@RequestMapping("/update")
	public int findOrderDetail(@ModelAttribute("orderForm") Order order ){
		return this.orderDao.updateByPrimaryKeySelective(order);
	}
	
	/**
	 * 查询产品
	 * @param request
	 * @return
	 */
	@RequestMapping("/search")
	@ResponseBody
	public Grid  searchOrder(HttpServletRequest request){
		
		String q = request.getParameter("q");
		List<Order> results = this.orderService.findByAjax(q);
		Grid grid = new Grid();
		grid.setRows(results);
		return grid;
	}
	
}

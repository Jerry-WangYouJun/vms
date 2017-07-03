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
import com.core.StringUtils;
import com.core.model.Grid;
import com.mapping.OrderDetailMapper;
import com.mapping.OrderMapper;
import com.mapping.UserMapper;
import com.pojo.Goods;
import com.pojo.Order;
import com.pojo.OrderDetail;
import com.pojo.User;
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
	
	@Resource
	private OrderDetailMapper orderDetail;
	
	@Resource
	private UserMapper userDao;
	
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
		orderDetail.deleteByPrimaryKey(id);
		return this.orderDao.deleteByPrimaryKey(id);
		 
	}
	
	@RequestMapping("/updateinit")
	public ModelAndView updateOrderInit(@RequestParam int id ){
		Order order= this.orderDao.selectByPrimaryKey(id);
		 User user = userDao.selectByPrimaryKey(order.getUserId());
		 order.setUserName(user.getUsername());
		  Map param = new HashMap();
			if (StringUtils.isNotEmpty(order.getId()+"")) {
				param.put("orderId",  order.getId());
			}
		  List<OrderDetail>  listDetail = orderDetail.selectByWhere(param);
		  order.setOrderDetailList(listDetail);
		Map<String,Object> model =new HashMap<String,Object>();
		
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
		JSONObject json = new JSONObject();
		json.put("food" , foodList);
		json.put("drink", drinkList);
		json.put("special",specialList);
		json.put("detail", listDetail);
		model.put("order",order);//userlist是个Arraylist之类的  
		model.put("model", json);
		return new ModelAndView("order_update", model); 
	}
	
	@ResponseBody    
	@RequestMapping("/update")
	public int findOrderDetail(@ModelAttribute("orderForm") Order order ){
		orderDetail.deleteByPrimaryKey(order.getId());
		for (OrderDetail detail : order.getOrderDetailList()) {
			if(detail.getGoodId() != null && detail.getGoodId() > 0){
				detail.setOrderId(order.getId());
				orderDetail.insert(detail);
			}
		}
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

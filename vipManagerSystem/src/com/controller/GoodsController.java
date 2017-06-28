package com.controller;

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

import com.core.model.Grid;
import com.mapping.GoodsMapper;
import com.pojo.Goods;
import com.service.GoodsServiceI;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Resource(name="goodsServiceImpl")
	private GoodsServiceI goodsService;
	
	@Resource
	private GoodsMapper goodsDao;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid getSelectGoods(Goods goods ){
		return this.goodsService.findGoodsList(goods);
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public Integer addGoods(Goods goods ){
		 return this.goodsService.addGoods(goods);
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Integer deleteGoods(@RequestParam Integer id ){
		return this.goodsDao.deleteByPrimaryKey(id);
		 
	}
	
	@RequestMapping("/updateinit")
	public ModelAndView updateGoodsInit(@RequestParam int id ){
		Goods goods= this.goodsDao.selectByPrimaryKey(id);
		Map<String,Object> model =new HashMap<String,Object>();
		model.put("goods",goods);//userlist是个Arraylist之类的  
		return new ModelAndView("goods_update", model); 
	}
	
	@ResponseBody    
	@RequestMapping("/update")
	public int findGoodsDetail(@ModelAttribute("goodsForm") Goods goods ){
		return this.goodsDao.updateByPrimaryKeySelective(goods);
	}
	
	/**
	 * 查询产品
	 * @param request
	 * @return
	 */
	@RequestMapping("/search")
	@ResponseBody
	public Grid  searchGoods(HttpServletRequest request){
		
		String q = request.getParameter("q");
		List<Goods> results = this.goodsService.findByAjax(q);
		Grid grid = new Grid();
		grid.setRows(results);
		return grid;
	}
	
	
}

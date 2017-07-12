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
import com.mapping.RechargeMapper;
import com.mapping.UserMapper;
import com.pojo.Recharge;
import com.pojo.User;
import com.service.GoodsServiceI;
import com.service.RechargeServiceI;

@Controller
@RequestMapping("/recharge")
public class RechargeController {
	@Resource(name="rechargeServiceImpl")
	private RechargeServiceI rechargeService;
	
	@Resource(name="goodsServiceImpl")
	private GoodsServiceI goodsService;
	
	@Resource
	private RechargeMapper rechargeDao;
	
	
	@Resource
	private UserMapper userDao;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid getSelectRecharge(Recharge recharge ){
		return this.rechargeService.findRechargeList(recharge);
	}
	
	@ResponseBody
	@RequestMapping("/recharge_add")
	public ModelAndView addInitRecharge(){
		ModelAndView mv = new ModelAndView("recharge_add");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public Integer addRecharge(Recharge recharge ){
		int count  = this.rechargeService.addRecharge(recharge) ;
		if(count > 0 ){
			User user = userDao.selectByPrimaryKey(recharge.getUserId());
			if(user!= null){
				user.setBalance(recharge.getTotalMoney() + "");
				user.setScore(recharge.getTotalPoints()+ "");
			}
			userDao.updateByPrimaryKey(user);
		}
		 return count;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Integer deleteRecharge(@RequestParam Integer id ){
		return this.rechargeDao.deleteByPrimaryKey(id);
		 
	}
	
	@RequestMapping("/updateinit")
	public ModelAndView updateRechargeInit(@RequestParam int id ){
		Recharge recharge= this.rechargeDao.selectByPrimaryKey(id);
		 User user = userDao.selectByPrimaryKey(recharge.getUserId());
		Map<String,Object> model =new HashMap<String,Object>();
		model.put("recharge",recharge);//userlist是个Arraylist之类的  
		return new ModelAndView("recharge_update", model); 
	}
	
	@ResponseBody    
	@RequestMapping("/update")
	public int findRechargeDetail(@ModelAttribute("rechargeForm") Recharge recharge ){
		return this.rechargeDao.updateByPrimaryKeySelective(recharge);
	}
	
	/**
	 * 查询产品
	 * @param request
	 * @return
	 */
	@RequestMapping("/search")
	@ResponseBody
	public Grid  searchRecharge(HttpServletRequest request){
		
		String q = request.getParameter("q");
		List<Recharge> results = this.rechargeService.findByAjax(q);
		Grid grid = new Grid();
		grid.setRows(results);
		return grid;
	}
	
}

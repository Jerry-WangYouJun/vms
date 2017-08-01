package com.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.StringUtils;
import com.core.model.Grid;
import com.github.pagehelper.PageHelper;
import com.mapping.OrderDetailMapper;
import com.mapping.OrderMapper;
import com.mapping.UserMapper;
import com.pojo.Order;
import com.pojo.OrderDetail;
import com.pojo.User;
import com.service.OrderServiceI;

@Service
public class OrderServiceImpl implements OrderServiceI {
	@Resource
	private OrderMapper orderDao;
	@Resource
	private OrderDetailMapper orderDetail;
	
	@Resource
	private UserMapper userDao;
	@Autowired
	private HttpServletRequest request;

	@Override
	public List<Order> findByAjax(String q) {
		// TODO Auto-generated method stub
		Map param = new HashMap();
		if (StringUtils.isNotEmpty(q)) {
			param.put("q", "%" + q + "%");
		}
		List<Order> results = this.orderDao.selectByWhere(param);
		return results;
	}

	@Override
	public Grid findOrderList(Order order) {
		String pageIndex = request.getParameter("page");
		String rowsIndex = request.getParameter("rows");
		PageHelper.startPage(Integer.parseInt(pageIndex),
				Integer.parseInt(rowsIndex));
		Grid grid = new Grid();
		List<Order> results = this.orderDao.selectOrderByWhere(order);
		for (Order orderTemp : results ) {
//			  User user = userDao.selectByPrimaryKey(orderTemp.getUserId());
//			  orderTemp.setUserName(user.getUsername());
			  Map param = new HashMap();
				if (StringUtils.isNotEmpty(orderTemp.getId()+"")) {
					param.put("orderId",  orderTemp.getId());
				}
			  List<OrderDetail>  listDetail = orderDetail.selectByWhere(param);
			  orderTemp.setOrderDetailList(listDetail);
		}
		Long total = this.orderDao.findOrderCountByWhere(order);
		grid.setRows(results);
		grid.setTotal(total);
		return grid;
	}

	@Override
	public Integer addOrder(Order order) {
		Date date = new Date();
		String  orderDate = (new SimpleDateFormat("yyyy-MM-dd")).format(date);  
		order.setOrderDate(orderDate);
		int count = orderDao.insert(order);
		if("01".equals(order.getPillType())){
			User user = userDao.selectByPrimaryKey(order.getUserId());
			if(user != null){
				user.setBalance((new Double(user.getBalance()) - order.getPill())+"");
				userDao.updateByPrimaryKey(user);
			}
		}
		for (OrderDetail detail : order.getOrderDetailList()) {
				if(detail.getGoodId() != null && detail.getGoodId() > 0){
					detail.setOrderId(order.getId());
					orderDetail.insert(detail);
				}
		}
		return count;
	}

}

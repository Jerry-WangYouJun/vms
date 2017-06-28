package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.core.StringUtils;
import com.core.model.Grid;
import com.mapping.OrderMapper;
import com.pojo.Order;
import com.service.OrderServiceI;

@Service
public class OrderServiceImpl implements OrderServiceI {
	@Resource
	private OrderMapper orderDao;
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
		Long total = this.orderDao.findOrderCountByWhere(order);
		grid.setRows(results);
		grid.setTotal(total);
		return grid;
	}

	@Override
	public Integer addOrder(Order order) {
		return orderDao.insert(order);
	}

}

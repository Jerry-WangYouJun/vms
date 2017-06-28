package com.service;

import java.util.List;

import com.core.model.Grid;
import com.pojo.Order;

public interface OrderServiceI {

	public List<Order> findByAjax(String q);

	public Grid findOrderList(Order order);

	public Integer addOrder(Order order);

}

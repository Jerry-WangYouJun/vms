package com.mapping;

import java.util.List;
import java.util.Map;

import com.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order order);

    int insertSelective(Order order);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order order);

    int updateByPrimaryKey(Order order);

	List<Order> selectByWhere(Map param);
	
	List<Order> selectOrderByWhere(Order order);

	Long findOrderCountByWhere(Order order); 
	
	List<Map<String,Object>> queryVipDataReport();
	
	List<Map<String,Object>> queryPorductDataReport();
}
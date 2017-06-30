package com.mapping;

import java.util.List;
import java.util.Map;

import com.pojo.OrderDetail;

public interface OrderDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderDetail orderDetail);

    int insertSelective(OrderDetail orderDetail);

	List<OrderDetail> selectByWhere(Map param);
	
	List<OrderDetail> selectOrderDetailByWhere(OrderDetail orderDetail);

	Long findOrderDetailCountByWhere(OrderDetail orderDetail);

	int insertCodeBatch(List<OrderDetail> orderDetailList); 
}
package com.pojo;

public class OrderDetail {
	   private  Integer id ; 
	   private  Integer orderId ;
	   private Integer goodId;
	   private  Integer count  ;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	  
}

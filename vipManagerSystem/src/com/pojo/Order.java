package com.pojo;

import java.util.Map;

public class Order {
		 private  Integer id ; 
		 private String  orderNo;
		 private Integer  userId ;
		 private double  pill ;
		 private  Integer count ;
		 private  Map<Integer,Integer> goodMap ;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getOrderNo() {
			return orderNo;
		}
		public void setOrderNo(String orderNo) {
			this.orderNo = orderNo;
		}
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		public double getPill() {
			return pill;
		}
		public void setPill(double pill) {
			this.pill = pill;
		}
		public Integer getCount() {
			return count;
		}
		public void setCount(Integer count) {
			this.count = count;
		}
		public Map<Integer, Integer> getGoodMap() {
			return goodMap;
		}
		public void setGoodMap(Map<Integer, Integer> goodMap) {
			this.goodMap = goodMap;
		}
		 

}

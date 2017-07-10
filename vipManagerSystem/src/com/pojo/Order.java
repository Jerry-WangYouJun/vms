package com.pojo;

import java.util.List;
import java.util.Map;

public class Order {
		 private  Integer id ; 
		 private String  orderNo;
		 private Integer  userId ;
		 private Double  pill ;
		 private  Integer count ;
		 private Double discount;
		 private  Map<Integer,Integer> goodMap ;
		 private  String remark ;
		 private String userName;
		 private List<OrderDetail>  orderDetailList;
		 
		 
		 
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
		}
		public List<OrderDetail> getOrderDetailList() {
			return orderDetailList;
		}
		public void setOrderDetailList(List<OrderDetail> orderDetailList) {
			this.orderDetailList = orderDetailList;
		}
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
		public Double getPill() {
			return pill;
		}
		public void setPill(Double pill) {
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
		public Double getDiscount() {
			return discount;
		}
		public void setDiscount(Double discount) {
			this.discount = discount;
		}
		 

}

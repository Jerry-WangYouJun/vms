package com.pojo;

public class Recharge {
	 private Integer  id ; 
	 private  Integer userId ;
	 private Double   finalMoney ;  //最终充值金额
	 private Double   actualMoney ; //实际充值金额
	 private Double   giftMoney ;    //赠送充值金额
	 private Integer  creditPoints ; //充值积分
	 private Integer  totalPoints ;  //总积分
	 private  Double  totalMoney  ;
	 private String userName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Double getFinalMoney() {
		return finalMoney;
	}
	public void setFinalMoney(Double finalMoney) {
		this.finalMoney = finalMoney;
	}
	public Double getActualMoney() {
		return actualMoney;
	}
	public void setActualMoney(Double actualMoney) {
		this.actualMoney = actualMoney;
	}
	public Double getGiftMoney() {
		return giftMoney;
	}
	public void setGiftMoney(Double giftMoney) {
		this.giftMoney = giftMoney;
	}
	public Integer getCreditPoints() {
		return creditPoints;
	}
	public void setCreditPoints(Integer creditPoints) {
		this.creditPoints = creditPoints;
	}
	public Integer getTotalPoints() {
		return totalPoints;
	}
	public void setTotalPoints(Integer totalPoints) {
		this.totalPoints = totalPoints;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	 
}

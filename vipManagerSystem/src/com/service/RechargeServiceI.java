package com.service;

import java.util.List;

import com.core.model.Grid;
import com.pojo.Recharge;

public interface RechargeServiceI {

	public List<Recharge> findByAjax(String q);

	public Grid findRechargeList(Recharge recharge);

	public Integer addRecharge(Recharge recharge);

}

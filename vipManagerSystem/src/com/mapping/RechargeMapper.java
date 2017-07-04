package com.mapping;

import java.util.List;
import java.util.Map;

import com.pojo.Recharge;

public interface RechargeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Recharge recharge);

    int insertSelective(Recharge recharge);

    Recharge selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Recharge recharge);

    int updateByPrimaryKey(Recharge recharge);

	List<Recharge> selectByWhere(Map param);
	
	List<Recharge> selectRechargeByWhere(Recharge recharge);

	Long findRechargeCountByWhere(Recharge recharge); 
	
}
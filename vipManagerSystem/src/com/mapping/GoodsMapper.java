package com.mapping;

import java.util.List;
import java.util.Map;

import com.pojo.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

	List<Goods> selectByWhere(Map param);
	
	List<Goods> selectGoodsByWhere(Goods goods);

	Long findGoodsCountByWhere(Goods goods); 
}
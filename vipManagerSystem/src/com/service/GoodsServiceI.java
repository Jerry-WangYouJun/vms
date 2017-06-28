package com.service;

import java.util.List;

import com.core.model.Grid;
import com.pojo.Goods;

public interface GoodsServiceI {

	public List<Goods> findByAjax(String q);

	public Grid findGoodsList(Goods goods);

	public Integer addGoods(Goods goods);

}

package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.core.StringUtils;
import com.core.model.Grid;
import com.mapping.GoodsMapper;
import com.pojo.Goods;
import com.service.GoodsServiceI;

@Service
public class GoodsServiceImpl implements GoodsServiceI {
	@Resource
	private GoodsMapper goodsDao;
	@Autowired
	private HttpServletRequest request;

	@Override
	public List<Goods> findByAjax(String q) {
		// TODO Auto-generated method stub
		Map param = new HashMap();
		if (StringUtils.isNotEmpty(q)) {
			param.put("q", "%" + q + "%");
		}
		List<Goods> results = this.goodsDao.selectByWhere(param);
		return results;
	}

	@Override
	public Grid findGoodsList(Goods goods) {
		String pageIndex = request.getParameter("page");
		String rowsIndex = request.getParameter("rows");
		PageHelper.startPage(Integer.parseInt(pageIndex),
				Integer.parseInt(rowsIndex));
		Grid grid = new Grid();
		List<Goods> results = this.goodsDao.selectGoodsByWhere(goods);
		Long total = this.goodsDao.findGoodsCountByWhere(goods);
		grid.setRows(results);
		grid.setTotal(total);
		return grid;
	}

	@Override
	public Integer addGoods(Goods goods) {
		return goodsDao.insert(goods);
	}

}

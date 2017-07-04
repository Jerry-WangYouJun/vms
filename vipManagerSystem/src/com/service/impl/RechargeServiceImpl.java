package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.StringUtils;
import com.core.model.Grid;
import com.github.pagehelper.PageHelper;
import com.mapping.RechargeMapper;
import com.mapping.UserMapper;
import com.pojo.Recharge;
import com.pojo.User;
import com.service.RechargeServiceI;

@Service
public class RechargeServiceImpl implements RechargeServiceI {
	@Resource
	private RechargeMapper rechargeDao;
	
	@Resource
	private UserMapper userDao;
	@Autowired
	private HttpServletRequest request;

	@Override
	public List<Recharge> findByAjax(String q) {
		// TODO Auto-generated method stub
		Map param = new HashMap();
		if (StringUtils.isNotEmpty(q)) {
			param.put("q", "%" + q + "%");
		}
		List<Recharge> results = this.rechargeDao.selectByWhere(param);
		return results;
	}

	@Override
	public Grid findRechargeList(Recharge recharge) {
		String pageIndex = request.getParameter("page");
		String rowsIndex = request.getParameter("rows");
		PageHelper.startPage(Integer.parseInt(pageIndex),
				Integer.parseInt(rowsIndex));
		Grid grid = new Grid();
		List<Recharge> results = this.rechargeDao.selectRechargeByWhere(recharge);
		for(Recharge rec : results){
			 User user = userDao.selectByPrimaryKey(rec.getUserId());
			 if(user != null){
				  rec.setUserName(user.getUsername());
			 }
		}
		Long total = this.rechargeDao.findRechargeCountByWhere(recharge);
		grid.setRows(results);
		grid.setTotal(total);
		return grid;
	}

	@Override
	public Integer addRecharge(Recharge recharge) {
		int count = rechargeDao.insert(recharge);
		return count;
	}

}

package com.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapping.UserMapper;
import com.pojo.User;
import com.service.UserServiceI;
@Service
public class UserServiceImpl implements UserServiceI {
	@Resource
	private UserMapper userDao;
	
	public User getUserById(int id){
		return this.userDao.selectByPrimaryKey(id);
	}

	
	@Override
	public User findUserForLogin(String userNo, String pwd) {
		// TODO Auto-generated method stub
		User user = new User();
		
		return this.userDao.selectByUserNoAndPwd(user);
	}


	@Override
	public List<User> findUserWhereSql(Map params) {
		// TODO Auto-generated method stub
		return this.userDao.selectUserByWhere(params);
	}


	@Override
	public Long findUserCountByWhere(Map params) {
		// TODO Auto-generated method stub
		return this.userDao.selectUserCountByWhere(params);
	}
	@Override
	public List<User> selectByUserName(Map params) {
		// TODO Auto-generated method stub
		return this.userDao.selectByUserName(params);
	}

	@Override
	public int inserUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.insert(user);
	}


	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.updateByPrimaryKey(user);
	}

	@Override
	public int deleteUser(String id) {
		// TODO Auto-generated method stub
		return this.userDao.deleteByPrimaryKey(Integer.parseInt(id));
	}
}

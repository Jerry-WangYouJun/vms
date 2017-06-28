package com.service;

import java.util.List;
import java.util.Map;

import com.pojo.User;

public interface UserServiceI {

	public User getUserById(int id);

	public User findUserForLogin(String userNo, String pwd);

	public List<User> findUserWhereSql(Map params);

	public Long findUserCountByWhere(Map params);

	public int inserUser(User user);

	public int updateUser(User user);

	public int deleteUser(String id);

}

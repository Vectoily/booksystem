package com.hu.book.mapper;

import java.util.List;

import com.hu.book.model.User;
import com.hu.book.model.UserCustom;

public interface UserMapperCustom {
	
	public List<User> LoginUser(UserCustom userCustom);
	
	//查询所有用户
	public List<User> findAllUser();
	//分页查询
	public List<User> userByFen(int index);
	
	public List<User> multicheckUser(User user);
	
	public User userBynumber(String number);
}

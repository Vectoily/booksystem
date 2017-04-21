package com.hu.book.service;

import java.util.List;

import com.hu.book.model.User;
import com.hu.book.model.UserCustom;
public interface UserService {
	//用户注册
	public void registUser(UserCustom userCustom);
	//根据激活码查找用户
	public User findUserByCode(String code);
	//点击链接后，更改用户激活状态
	public void updateState(UserCustom userCustom,String id);
	//用户登陆
	public List<User> loginUser(UserCustom userCustom);
	//信息更改
	public void messageChange(UserCustom userCustom);
	//查询所有用户
	public List<User> allUserList();
	//分页查询
	public List<User> userByfen(int index);
	
	public void deleteUser(String code);
	//模糊查询
	public List<User> multicheckUser(User user);
	
	public void changeUserPass(User user);
	
	public User userBynumber(String number);
}

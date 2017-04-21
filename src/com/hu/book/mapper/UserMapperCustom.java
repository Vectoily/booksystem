package com.hu.book.mapper;

import java.util.List;

import com.hu.book.model.User;
import com.hu.book.model.UserCustom;

public interface UserMapperCustom {
	
	public List<User> LoginUser(UserCustom userCustom);
	
	//��ѯ�����û�
	public List<User> findAllUser();
	//��ҳ��ѯ
	public List<User> userByFen(int index);
	
	public List<User> multicheckUser(User user);
	
	public User userBynumber(String number);
}

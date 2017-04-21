package com.hu.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hu.book.mapper.UserMapper;
import com.hu.book.mapper.UserMapperCustom;
import com.hu.book.model.User;
import com.hu.book.model.UserCustom;
import com.hu.book.service.UserService;
import com.hu.book.utils.MailUtils;
import com.hu.book.utils.UUIDUtils;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserMapperCustom userMapperCustom;
	
	@Override
	/*注册时给用户注册的邮箱发送一条激活信息，在未点击此链接之前，设置用户状态为未激活
	 * (non-Javadoc)
	 * @see com.hu.book.service.UserService#registUser(com.hu.book.model.UserCustom)
	 */
	public void registUser(UserCustom userCustom) {
		// TODO Auto-generated method stub
		userCustom.setState("未激活");
		String code=UUIDUtils.getUUID()+UUIDUtils.getUUID();
		userCustom.setCode(code);
		try {
			MailUtils.sendMail(userCustom.getEmail(), code);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userMapper.insertSelective(userCustom);
	}
	
	@Override
	//点击链接后查找表中用户，若不存在，给出错信息
	public User findUserByCode(String code) {
		return userMapper.selectByPrimaryKey(code);
	}
	@Override
	//点击激活链接后将用户的状态更改为已激活
	public void updateState(UserCustom userCustom, String id) {
		userCustom.setCode(id);
		userCustom.setState("已激活");
		userMapper.updateByPrimaryKeySelective(userCustom);
	}
	
	@Override
	public List<User> loginUser(UserCustom userCustom) {
		return userMapperCustom.LoginUser(userCustom);
	}

	@Override
	public void messageChange(UserCustom userCustom) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(userCustom);
	}

	@Override
	public List<User> allUserList() {
		// TODO Auto-generated method stub
		return userMapperCustom.findAllUser();
	}

	@Override
	public List<User> userByfen(int index) {
		// TODO Auto-generated method stub
		return userMapperCustom.userByFen(index);
	}

	@Override
	public void deleteUser(String code) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(code);
	}

	@Override
	public List<User> multicheckUser(User user) {
		// TODO Auto-generated method stub
		return userMapperCustom.multicheckUser(user);
	}

	@Override
	public void changeUserPass(User user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User userBynumber(String number) {
		// TODO Auto-generated method stub
		return userMapperCustom.userBynumber(number);
	}
	
	
}

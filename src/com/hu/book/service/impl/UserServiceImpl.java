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
	/*ע��ʱ���û�ע������䷢��һ��������Ϣ����δ���������֮ǰ�������û�״̬Ϊδ����
	 * (non-Javadoc)
	 * @see com.hu.book.service.UserService#registUser(com.hu.book.model.UserCustom)
	 */
	public void registUser(UserCustom userCustom) {
		// TODO Auto-generated method stub
		userCustom.setState("δ����");
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
	//������Ӻ���ұ����û����������ڣ���������Ϣ
	public User findUserByCode(String code) {
		return userMapper.selectByPrimaryKey(code);
	}
	@Override
	//����������Ӻ��û���״̬����Ϊ�Ѽ���
	public void updateState(UserCustom userCustom, String id) {
		userCustom.setCode(id);
		userCustom.setState("�Ѽ���");
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

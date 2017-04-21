package com.hu.book.service;

import java.util.List;

import com.hu.book.model.User;
import com.hu.book.model.UserCustom;
public interface UserService {
	//�û�ע��
	public void registUser(UserCustom userCustom);
	//���ݼ���������û�
	public User findUserByCode(String code);
	//������Ӻ󣬸����û�����״̬
	public void updateState(UserCustom userCustom,String id);
	//�û���½
	public List<User> loginUser(UserCustom userCustom);
	//��Ϣ����
	public void messageChange(UserCustom userCustom);
	//��ѯ�����û�
	public List<User> allUserList();
	//��ҳ��ѯ
	public List<User> userByfen(int index);
	
	public void deleteUser(String code);
	//ģ����ѯ
	public List<User> multicheckUser(User user);
	
	public void changeUserPass(User user);
	
	public User userBynumber(String number);
}

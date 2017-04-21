package com.hu.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hu.book.mapper.AdminMapper;
import com.hu.book.mapper.AdminMapperCustom;
import com.hu.book.model.Admin;
import com.hu.book.model.AdminCustom;
import com.hu.book.service.AdminService;
import com.hu.book.utils.UUIDUtils;

public class AminserviceImpl implements AdminService {
	@Autowired
	private AdminMapperCustom adminMapperCustom;
	
	@Autowired
	private AdminMapper adminMapper;
	@Override
	public List<Admin> loginAdmin(AdminCustom adminCustom) {
		// TODO Auto-generated method stub
		return adminMapperCustom.loginAdmin(adminCustom);
	}

	@Override
	public List<Admin> allAdmin() {
		// TODO Auto-generated method stub
		return adminMapperCustom.allAdmin();
	}

	@Override
	public List<Admin> adminByFen(int index) {
		// TODO Auto-generated method stub
		return adminMapperCustom.adminByFen(index);
	}

	@Override
	public Admin adminByNum(String adminnumber) {
		// TODO Auto-generated method stub
		return adminMapperCustom.adminBynumber(adminnumber);
	}
	@Override
	public void addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		String id=UUIDUtils.getUUID();
		admin.setAdminid(id);
		adminMapper.insertSelective(admin);
	}

	@Override
	public Admin adminById(String id) {
		// TODO Auto-generated method stub
		return adminMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.updateByPrimaryKeySelective(admin);
	}

	@Override
	public void deleteAdmin(String id) {
		// TODO Auto-generated method stub
		adminMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Admin> adminByMo(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapperCustom.adminByMo(admin);
	}
	
	
}

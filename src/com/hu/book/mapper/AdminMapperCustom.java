package com.hu.book.mapper;

import java.util.List;

import com.hu.book.model.Admin;
import com.hu.book.model.AdminCustom;

public interface AdminMapperCustom {
	
	public List<Admin> loginAdmin(AdminCustom adminCustom);
	
	public List<Admin> allAdmin();
	
	public List<Admin> adminByFen(int index);
	
	public Admin adminBynumber(String adminnumber);
	
	public List<Admin> adminByMo(Admin admin);
}

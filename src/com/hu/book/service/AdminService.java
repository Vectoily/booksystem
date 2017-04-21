package com.hu.book.service;

import java.util.List;

import com.hu.book.model.Admin;
import com.hu.book.model.AdminCustom;


public interface AdminService {
	
	public List<Admin>loginAdmin(AdminCustom adminCustom);
	
	public List<Admin> allAdmin();
	
	public List<Admin> adminByFen(int index);
	
	public Admin adminByNum(String adminnumber);
	
	public Admin adminById(String id);
	
	public void addAdmin(Admin admin);
	
	public void updateAdmin(Admin admin);
	
	public void deleteAdmin(String id);
	
	public List<Admin> adminByMo(Admin admin);
	
	
	
}

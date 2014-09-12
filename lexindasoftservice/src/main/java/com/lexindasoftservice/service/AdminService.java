package com.lexindasoftservice.service;

import java.util.List;

import com.lexindasoftservice.model.Admin;



public interface AdminService {
	
	public Admin getAdminById(int id);
	
	public Admin getAdminByUserName(String name);
	
	public int updateAdminInfo(Admin admin);
	
	public int insertAdminInfo(Admin admin);
	
	public int deleteAdminInfo(String id);
	
	public Admin login(Admin admin);
	
	public List<Admin> getAllAdminList(Admin admin);
	
}

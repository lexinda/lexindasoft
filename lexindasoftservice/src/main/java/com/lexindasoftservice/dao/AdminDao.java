package com.lexindasoftservice.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Admin;

@Component
public interface AdminDao {

	public Admin getAdminById(int id);
	
	public Admin getAdminByUserName(String account);
	
	public int updateAdminInfo(Admin admin);
	
	public int insertAdminInfo(Admin admin);
	
	public int deleteAdminInfo(String id);
	
	public Admin login(Admin admin);
	
	public List<Admin> getAllAdminList(Admin admin);
	
	public int adminNewpassword(Admin admin);
		
}

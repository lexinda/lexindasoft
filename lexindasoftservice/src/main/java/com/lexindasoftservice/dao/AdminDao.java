package com.lexindasoftservice.dao;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Admin;

@Component
public interface AdminDao {

	public Admin getAdminById(int id);
	
	public int updateAdminIndo(Admin admin);
	
	public int insertAdminInfo(Admin admin);
	
	public int deleteAdminInfo(int id);
	
	public Admin login(Admin admin);
		
}

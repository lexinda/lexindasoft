package com.lexindasoftservice.service;

import com.lexindasoftservice.model.Admin;



public interface AdminService {
	
public Admin getAdminById(int id);
	
	public int updateAdminIndo(Admin admin);
	
	public int insertAdminInfo(Admin admin);
	
	public int deleteAdminInfo(int id);
	
	public Admin login(Admin admin);
	
}

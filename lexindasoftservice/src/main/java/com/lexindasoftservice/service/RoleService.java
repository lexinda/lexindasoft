package com.lexindasoftservice.service;

import java.util.List;

import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Role;

public interface RoleService {
	
	public List<Role> getRoleInfo(Role role);
	
	public int insertRoleInfo(Role role);
	
}

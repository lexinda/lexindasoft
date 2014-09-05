package com.lexindasoftservice.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Role;

@Component
public interface RoleDao {

	public List<Role> getRoleInfo(Role role);
	
	public int insertRoleInfo(Role role);
	
}

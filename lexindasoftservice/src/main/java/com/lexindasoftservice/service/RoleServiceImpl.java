package com.lexindasoftservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexindasoftservice.dao.RoleDao;
import com.lexindasoftservice.model.Role;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleDao roleDao;

	public List<Role> getRoleInfo(Role role) {
		// TODO Auto-generated method stub
		return roleDao.getRoleInfo(role);
	}

	public int insertRoleInfo(Role role) {
		// TODO Auto-generated method stub
		return roleDao.insertRoleInfo(role);
	}

}

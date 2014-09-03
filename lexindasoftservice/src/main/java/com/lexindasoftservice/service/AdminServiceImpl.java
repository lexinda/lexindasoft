package com.lexindasoftservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexindasoftservice.dao.AdminDao;
import com.lexindasoftservice.model.Admin;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;

	public Admin getAdminById(int id) {
		// TODO Auto-generated method stub
		return adminDao.getAdminById(id);
	}

	public int updateAdminIndo(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.updateAdminIndo(admin);
	}

	public int insertAdminInfo(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.insertAdminInfo(admin);
	}

	public int deleteAdminInfo(String id) {
		// TODO Auto-generated method stub
		return adminDao.deleteAdminInfo(id);
	}

	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.login(admin);
	}

	public List<Admin> getAllAdminList(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.getAllAdminList(admin);
	}

	
	
}

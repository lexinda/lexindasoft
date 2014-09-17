package com.lexindasoftservice.service;

import java.util.List;

import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.model.Role;

public interface DepartmentService {
	
	public List<Department> getDepartmentInfo(Department department);
	
	public List<Department> hasChildDepartmentInfo(Department department);
	
	public int insertDepartmentInfo(Department department);
	
	public List<Department> getDepartmentByName(Department department);
	
	public int getDepartmentIdByName(Department department);
	
	public Department getDepartmentInfoById(Department department);
	
	public int deleteDepartmentInfo(int id);
	
	public int updateDepartmentInfo(Department department);
	
}

package com.lexindasoftservice.service;

import java.util.List;

import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.model.Role;

public interface DepartmentService {
	
	public List<Department> getDepartmentInfo(Department department);
	
	public List<Department> hasChildDepartmentInfo(Department department);
	
	public List<Integer> getDepartmentLevel();
	
	public int insertDepartmentInfo(Department department);
	
	public int getDepartmentIdByName(Department department);
	
	public List<Department> getDepartmentInfoById(Department department);
	
}

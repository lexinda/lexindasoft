package com.lexindasoftservice.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Department;

@Component
public interface DepartmentDao {

	public List<Department> getDepartmentInfo(Department department);
	
	public List<Department> hasChildDepartmentInfo(Department department);
	
	public int insertDepartmentInfo(Department department);
	
	public List<Department> getDepartmentByName(Department department);
	
	public int getDepartmentIdByName(Department department);
	
	public Department getDepartmentInfoById(Department department);
	
	public int deleteDepartmentInfo(int id);
}

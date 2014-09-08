package com.lexindasoftservice.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Department;

@Component
public interface DepartmentDao {

	public List<Department> getDepartmentInfo(Department department);

	public int insertDepartmentInfo(Department department);
		
}

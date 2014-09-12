package com.lexindasoftservice.dao;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Log;

@Component
public interface LogMapperDao {

	public void insertLog(Log log);
	
}

package com.lexindasoftservice.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Log;

@Component
public interface LogMapperDao {

	public void insertLog(Log log);
	
	public List<Log> getLogList(Log log);
}

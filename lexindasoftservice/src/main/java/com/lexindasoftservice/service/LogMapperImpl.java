package com.lexindasoftservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexindasoftservice.dao.LogMapperDao;
import com.lexindasoftservice.model.Log;
@Service
public class LogMapperImpl implements LogMapper {
	
	@Autowired
	LogMapperDao logMapperDao;
	 public void insertLog(Log log){
		 logMapperDao.insertLog(log);
	 }
}

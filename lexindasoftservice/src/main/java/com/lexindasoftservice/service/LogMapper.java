package com.lexindasoftservice.service;

import java.util.List;

import com.lexindasoftservice.model.Log;

public interface LogMapper {
	 public void insertLog(Log log);//添加日志记录
	 
	 public List<Log> getLogList(Log log);
}

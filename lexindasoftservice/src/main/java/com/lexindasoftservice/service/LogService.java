package com.lexindasoftservice.service;
import org.springframework.transaction.annotation.Transactional;

import com.lexindasoftservice.model.Log;
public interface LogService {
	/** 
     * 日志记录 
     * @param log 
     */  
    @Transactional  
    public void log(Log log);  
      
    /** 
     * 获取登录管理员ID 
     */  
    public int loginUserId();
}

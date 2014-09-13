package com.lexindasoftservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Log;
@Service
public class LogServiceImpl implements LogService {

	@Autowired
	AdminService adminService;
	@Autowired
	LogMapper logMapper;
	@Transactional
	public void log(Log log) {
		// TODO Auto-generated method stub
		
		logMapper.insertLog(log);
		
	}

	public int loginUserId() {
		// TODO Auto-generated method stub
		if(SecurityContextHolder.getContext() == null){  
            return 0;  
        }  
          
        if(SecurityContextHolder.getContext().getAuthentication() == null){  
            return 0;  
        }  
          
        UserDetails userDetails = (UserDetails) SecurityContextHolder  
                .getContext().getAuthentication().getPrincipal();  
          
        if(userDetails == null){  
            return 0;  
        }  
          
        //获取登录管理员帐号名  
        String userName = userDetails.getUsername();  
          
        if(userName == null || userName.equals("")){  
            return 0;  
        }  
        
     // 根据管理员帐号名获取帐号ID  
        Admin admin = adminService.getAdminByUserName(userName);  
          
        if(admin == null){  
            return 0;  
        }  
          
        return admin.getId();
	}

}

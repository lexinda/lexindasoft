package com.lexindasoft.utils;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lexindasoftservice.model.Admin;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.ui.Model;



public class UserUtils {

	public static int getId(HttpServletRequest req){
		HttpSession userSession = req.getSession();
		if(userSession.getAttribute("id") == null){
			return 0;
		}
		else{
			return NumberUtils.toInt(userSession.getAttribute("id").toString());
		}		
	}
	
	public static int getAccount(HttpServletRequest req){
		HttpSession userSession = req.getSession();
		if(userSession.getAttribute("account") == null){
			return 0;
		}
		else{
			return NumberUtils.toInt(userSession.getAttribute("account").toString());
		}		
	}
	
	public static String getUserLastLoginIP(HttpServletRequest req){
		HttpSession userSession = req.getSession();
		if(userSession.getAttribute("lastloginip") == null){
			return null;
		}
		else{
			return userSession.getAttribute("lastloginip").toString();
		}		
	}
	
	public static Date getUserLastLoginTime(HttpServletRequest req){
		HttpSession userSession =req.getSession();
		if(userSession.getAttribute("lastlogintime") == null){
			return null;
		}
		else{
			return (Date)userSession.getAttribute("lastlogintime");
		}		
	}
	
	public static Admin getUser(Model model){
		return (Admin)model.addAttribute("user");		
	}
	
}

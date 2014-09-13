package com.lexindasoft.utils;

import javax.servlet.http.HttpServletRequest;

import com.google.common.base.Strings;

public class ServletUtil {

	public static String getClientRealIp(HttpServletRequest req){
		String ret = req.getHeader("X-Real-IP");
		if(Strings.isNullOrEmpty(ret)){
			ret = req.getRemoteAddr();
		}
		return ret;
	}
	
}

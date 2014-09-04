package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

@Controller
public class ErrorController {
	
	@RequestMapping(value="/timeout",method = RequestMethod.GET)
	public void timeOut(HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statusCode", 301);
		jsonMap.put("message", "回话超时请重新登录!");
		jsonMap.put("navTabId","");
		jsonMap.put("callbackType","forward");
		jsonMap.put("forwardUrl","、login");
		Gson gson = new Gson();
        
        String list1 = gson.toJson(jsonMap);
        resp.setContentType("application/Json");
        resp.setCharacterEncoding("UTF-8");  
        resp.setHeader("Cache-Control", "no-cache"); 
        PrintWriter out;
        try { 
            out = resp.getWriter();  
            out.print(list1);
            // 用于返回对象参数 
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
}

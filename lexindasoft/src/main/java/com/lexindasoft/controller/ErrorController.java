package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
	
	@RequestMapping(value="/timeout",method = RequestMethod.GET)
	public void timeOut(HttpServletResponse resp,HttpServletRequest req){
		HttpSession session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("account");
		session.removeAttribute("certCode");
		session.invalidate();
		// 判断是否为ajax请求
        if (req.getHeader("x-requested-with") != null
                && req.getHeader("x-requested-with")
                        .equalsIgnoreCase("XMLHttpRequest")) {
        	resp.addHeader("sessionstatus", "timeOut");
        	resp.addHeader("loginPath", "/login");
        	resp.setContentType("application/Json");
            resp.setCharacterEncoding("UTF-8");  
            resp.setHeader("Cache-Control", "no-cache"); 
            PrintWriter out;
            try { 
                out = resp.getWriter();  
                out.print("timeOut");
                // 用于返回对象参数 
           } catch (IOException e) {  
                e.printStackTrace();  
           }
        } else {
            String str ="<script src='../ui/jquery.min.js' type='text/javascript'></script> "+
            		 "<script src='../ui/jquery.easyui.min.js' type='text/javascript'></script> "+
            		 "<link href='../ui/themes/default/easyui.css' rel='stylesheet' type='text/css' /> "+
            		 "<link href='../ui/themes/icon.css' rel='stylesheet' type='text/css' />" +
            		 "<script language='javascript'>" +
            		 "$(function(){" +
					 "   	$.messager.alert('操作提示', '会话超时，请重新登录！', 'info', function () { "+
					 "		window.top.location.href='/login';" +
        			 "	});" +
					 "});" + 
                     "</script>";
            resp.setContentType("text/html;charset=UTF-8");// 解决中文乱码
            try {
                PrintWriter writer = resp.getWriter();
                writer.write(str);
                writer.flush();
                writer.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
	}
}

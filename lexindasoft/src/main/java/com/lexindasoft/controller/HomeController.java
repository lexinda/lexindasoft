package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lexindasoft.utils.UserUtils;
import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.service.AdminService;
import com.lexindasoftservice.service.DepartmentService;
import com.lexindasoftservice.utils.Md5Util;


@Controller
public class HomeController {
	private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getUserInfo(HttpServletRequest req,HttpServletResponse resp,Model model){
		logger.debug("home");
		
		ModelAndView mav = new ModelAndView();  
		int id = UserUtils.getId(req);
		if(id>0){
			 mav.setViewName("redirect:/validate/index");
		}else{
			 mav.setViewName("redirect:/login");
		}
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView goLogin(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("index");
		mav.setViewName("login");
        return mav;	
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView goIndex(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
        return mav;	
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView goTest(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
		//mav.setViewName("login");
        return mav;	
	}
	
	@RequestMapping(value = "/validate/index", method = RequestMethod.GET)
	public ModelAndView goIndex(){
		ModelAndView mav = new ModelAndView();  
		mav.setViewName("index");
        return mav;	
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("username")String username,@RequestParam("password")String password,
			@RequestParam("code")String code,HttpServletRequest req,HttpServletResponse resp,Model model){
		ModelAndView mav = new ModelAndView();  
		HttpSession session = req.getSession();
		System.out.println(session.getAttribute("certCode"));
		if(session.getAttribute("certCode")!=null){
			if(!code.equals(session.getAttribute("certCode"))){
				 mav.setViewName("login");
				 mav.addObject("error", 1);
			}else{
				Admin admin = new Admin();
				admin.setAccount(username);
				admin.setPassword(Md5Util.digestMD5(password));
				Admin adminInfo = adminService.login(admin);
				if(adminInfo!=null){
					session.setAttribute("id", adminInfo.getId());
					session.setAttribute("account", adminInfo.getAccount());
					mav.setViewName("index");
				}else{
					mav.setViewName("login");
					 mav.addObject("error", 2);
				}
			}
		}else{
			mav.setViewName("login");
		}
		
        return mav;	
	}
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public ModelAndView loginOut(HttpServletRequest req,HttpServletResponse resp,Model model){
		ModelAndView mav = new ModelAndView();  
		HttpSession session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("account");
		session.removeAttribute("certCode");
		session.invalidate();
		mav.setViewName("login");
        return mav;	
	}
	
}

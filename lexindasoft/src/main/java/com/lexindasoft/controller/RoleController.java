package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.Role;
import com.lexindasoftservice.service.RoleService;

@Controller
@RequestMapping(value="/validate/role")
public class RoleController {

	final static int PAGE_NUM=20;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView roleManage(){
		ModelAndView mav = new ModelAndView();
		Role role = new Role();
		List<Role> roleList = roleService.getRoleInfo(role);
		mav.addObject("roleList", roleList);
		mav.setViewName("role/role-manage");
		return mav;
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public ModelAndView adminAdd(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("role/role-add");
		return mav;
	}
	
	@RequestMapping(value="/doadd",method = RequestMethod.POST)
	public void roleDoAdd(HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statusCode", 200);
		jsonMap.put("message", "新增成功!");
		jsonMap.put("navTabId","user");
		jsonMap.put("rel","");
		jsonMap.put("callbackType","closeCurrent");
		jsonMap.put("forwardUrl","");
		jsonMap.put("confirmMsg","");
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

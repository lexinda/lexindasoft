package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.model.Role;
import com.lexindasoftservice.service.DepartmentService;
import com.lexindasoftservice.service.RoleService;

@Controller
@RequestMapping(value="/validate/department")
public class DepartmentController {

	final static int PAGE_NUM=20;
	
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView departmentManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-manage");
		return mav;
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public ModelAndView departmentAdd(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-add");
		return mav;
	}
	
	@RequestMapping()
	public ModelAndView departmentAdmin(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-admin");
		return mav;
	}
	
	@RequestMapping(value="/doadd",method = RequestMethod.POST)
	public void departmentDoAdd(HttpServletResponse resp){
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
	
	@RequestMapping(value="/find",method = RequestMethod.GET)
	public ModelAndView departmentFind(){
		ModelAndView mav = new ModelAndView();
		Department department = new Department();
		List<Department> departmentList = departmentService.getDepartmentInfo(department);
		List<Integer> groupList = new ArrayList<Integer>();
		for(Department departments : departmentList){
			
		}
		mav.setViewName("department/department-find");
		return mav;
	}
	
}

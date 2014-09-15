package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.service.DepartmentService;
import com.lexindasoftservice.utils.Inputs;

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
	
	@RequestMapping(value="/data",method = RequestMethod.POST)
	public void departmentData(HttpServletResponse resp,@RequestParam("departmentName") String departmentName){
		Department department = new Department();
		int id = 1;
		departmentName = Inputs.trimToNull(departmentName);
		if(departmentName!=null){
			department.setDepartmentName(departmentName);
			id=departmentService.getDepartmentIdByName(department);
		}
		department.setId(id);
		List<Department> departmentList = departmentService.getDepartmentInfo(department);
		for(Department departments:departmentList){
			department.setId(departments.getId());
			List<Department> childDepartment = departmentService.hasChildDepartmentInfo(departments);
			if(childDepartment.size()>0){
				departments.setState("closed");
			}else{
				departments.setState("open");
			}
			
		}
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new Gson();
		String data=null;
		if(id==1){
			resultMap.put("total", departmentList.size());
			resultMap.put("rows", departmentList);
			data = gson.toJson(resultMap);
		}else{
			data = gson.toJson(departmentList);
		}
        resp.setContentType("application/Json");
        resp.setCharacterEncoding("UTF-8");  
        resp.setHeader("Cache-Control", "no-cache"); 
        PrintWriter out;
        try { 
            out = resp.getWriter();  
            out.print(data);
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
	@RequestMapping(value="/searchdata",method = RequestMethod.POST)
	public void departmentSearchData(HttpServletResponse resp,@RequestParam("departmentName") String departmentName){
		Department department = new Department();
		int id = 1;
		departmentName = Inputs.trimToNull(departmentName);
		if(departmentName!=null){
			department.setDepartmentName(departmentName);
			id=departmentService.getDepartmentIdByName(department);
		}
		department.setId(id);
		List<Department> departmentList = new ArrayList<Department>();
		if(id==1){
			departmentList = departmentService.getDepartmentInfo(department);
		}else{
			departmentList = departmentService.getDepartmentInfoById(department);
		}
		
		for(Department departments:departmentList){
			department.setId(departments.getId());
			List<Department> childDepartment = departmentService.hasChildDepartmentInfo(departments);
			if(childDepartment.size()>0){
				departments.setState("closed");
			}else{
				departments.setState("open");
			}
			
		}
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new Gson();
		String data=null;
		if(id==1){
			resultMap.put("total", departmentList.size());
			resultMap.put("rows", departmentList);
			data = gson.toJson(resultMap);
		}else{
			data = gson.toJson(departmentList);
		}
        resp.setContentType("application/Json");
        resp.setCharacterEncoding("UTF-8");  
        resp.setHeader("Cache-Control", "no-cache"); 
        PrintWriter out;
        try { 
            out = resp.getWriter();  
            out.print(data);
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public ModelAndView departmentAdd(@RequestParam("id")int id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-add");
		return mav;
	}
	
	@RequestMapping(value="/doadd",method = RequestMethod.POST)
	public void departmentDoAdd(HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statusCode", 200);
		jsonMap.put("message", "��板��������!");
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
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
	
	
	public List<Department> getList(int id,int levelId){
		Department department = new Department();
		department.setId(id);
		department.setLevelId(levelId);
		List<Department> departmentLists = departmentService.getDepartmentInfo(department);
		return departmentLists;
		
	}
	
}

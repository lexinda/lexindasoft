package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
	private final Log logger = LogFactory.getLog(getClass()); 
	final static int PAGE_NUM=20;
	
	@Autowired
	DepartmentService departmentService;
	//页面跳转
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView departmentManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-manage");
		return mav;
	}
	//加载数据
	@RequestMapping(value="/data",method = RequestMethod.POST)
	public void departmentData(HttpServletResponse resp,@RequestParam("departmentName") String departmentName){
		Department department = new Department();
		int id=1;
		departmentName = Inputs.trimToNull(departmentName);
		if(departmentName!=null){
			department.setDepartmentName(departmentName);
			id = departmentService.getDepartmentIdByName(department);
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
	//查询按钮
	@RequestMapping(value="/searchdata",method = RequestMethod.POST)
	public void departmentSearchData(HttpServletResponse resp,@RequestParam("departmentName") String departmentName){
		Department department = new Department();
		int id=1;
		departmentName = Inputs.trimToNull(departmentName);
		if(departmentName!=null){
			department.setDepartmentName(departmentName);
			id = departmentService.getDepartmentIdByName(department);
		}
		department.setId(id);
		List<Department> departmentList = new ArrayList<Department>();
		if(id==1){
			departmentList = departmentService.getDepartmentInfo(department);
		}else{
			Department departmentInfo = departmentService.getDepartmentInfoById(department);
			departmentList.add(departmentInfo);
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
	
	@RequestMapping(value="/getComboxdata",method = RequestMethod.POST)
	public void departmentComboxdata(HttpServletResponse resp,@RequestParam("departmentName") String departmentName){
		departmentName = Inputs.trimToNull(departmentName);
		List<Department> departmentList = new ArrayList<Department>();
		if(departmentName!=null){
			Department department = new Department();
			department.setDepartmentName(departmentName);
			departmentList = departmentService.getDepartmentByName(department);
		}
		Gson gson = new Gson();
		String data=null;
		data = gson.toJson(departmentList);	
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
	//跳转页面
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public ModelAndView departmentAdd(@RequestParam("id")int id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-add");
		return mav;
	}
	//保存数据
	@RequestMapping(value="/doadd",method = RequestMethod.POST)
	public void departmentDoAdd(HttpServletResponse resp,@RequestParam("parentId")int parentId
			,@RequestParam("departmentName")String departmentName,@RequestParam("departmentDesc")String departmentDesc){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		logger.debug("----"+parentId+"----------"+departmentName+"-----------"+departmentDesc);
		Department departmentInfo = new Department();
		departmentInfo.setId(parentId);
		Department department = departmentService.getDepartmentInfoById(departmentInfo);
		departmentInfo.setParentId(department.getId());
		departmentInfo.setLevelId(department.getLevelId()+1);
		departmentInfo.setDepartmentName(departmentName);
		departmentInfo.setDepartmentDesc(departmentDesc);
		int i = departmentService.insertDepartmentInfo(departmentInfo);
		jsonMap.put("result",1);
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
	
	//删除数据
		@RequestMapping(value="/deleteDepartment",method = RequestMethod.POST)
		public void deleteDepartment(HttpServletResponse resp,@RequestParam("id")int id){
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			int i = departmentService.deleteDepartmentInfo(id);
			if(i>0){
				jsonMap.put("success",true);
			}else{
				jsonMap.put("success",false);
			}
			
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
}

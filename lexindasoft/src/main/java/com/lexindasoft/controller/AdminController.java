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
import com.lexindasoftservice.service.AdminService;

@Controller
@RequestMapping(value="/validate/admin")
public class AdminController {

	final static int PAGE_NUM=20;
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView adminManage(){
		ModelAndView mav = new ModelAndView();
		Admin admin = new Admin();
		admin.setPage(-1);
		List<Admin> adminAllList = adminService.getAllAdminList(admin);
		admin.setPage(0);
		admin.setPageNum(PAGE_NUM);
		List<Admin> adminList = adminService.getAllAdminList(admin);
		mav.addObject("adminList", adminList);
		mav.setViewName("admin/admin-manage");
		return mav;
	}
	
	@RequestMapping(value="/active",method = RequestMethod.POST)
	public void adminActive(@RequestParam("id")int id,HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		Admin admin=adminService.getAdminById(id);
		if(admin.getStatus()==0){
			admin.setStatus(1);
		}else if(admin.getStatus()==1){
			admin.setStatus(0);
		}
		int i = adminService.updateAdminIndo(admin);
		if(i>0){
			jsonMap.put("statusCode", 200);
			if(admin.getStatus()==1){
				jsonMap.put("message", "成功启用!");
			}else if(admin.getStatus()==0){
				jsonMap.put("message", "成功禁用!");
			}
			
		}else{
			jsonMap.put("statusCode", 300);
			jsonMap.put("message", "操作失败!");
		}
		jsonMap.put("navTabId","user");
		jsonMap.put("rel","");
		jsonMap.put("callbackType","");
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
	
	@RequestMapping(value="/delete",method = RequestMethod.POST)
	public void adminDelete(@RequestParam("ids")String ids,HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int i=adminService.deleteAdminInfo(ids);
		if(i>0){
			jsonMap.put("statusCode", 200);
			jsonMap.put("message", "删除成功!");
		}else{
			jsonMap.put("statusCode", 300);
			jsonMap.put("message", "删除失败!");
		}
		jsonMap.put("navTabId","user");
		jsonMap.put("rel","");
		jsonMap.put("callbackType","");
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

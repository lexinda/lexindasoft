package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.lexindasoftservice.utils.Md5Util;
import com.lexindasoftservice.utils.RandomPwdUtil;

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
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public ModelAndView adminAdd(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin-add");
		return mav;
	}
	
	@RequestMapping(value="/doadd",method = RequestMethod.POST)
	public void adminDoAdd(HttpServletResponse resp,@RequestParam("name")String name,@RequestParam("phone")String phone,
			@RequestParam("birthday")String birthday,@RequestParam("email")String email) throws ParseException{
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthDay = sdf.parse(birthday);
		String initPassword = RandomPwdUtil.getRandomPassword(8);
		String password = Md5Util.digestMD5(initPassword);
		Admin admin = getAdmin(name, email, password, email,phone, 0, initPassword, 0, birthDay,0, PAGE_NUM);
		int result = adminService.insertAdminInfo(admin);
		if(result>0){
			jsonMap.put("statusCode", 200);
			jsonMap.put("message", "新增成功!");
			jsonMap.put("navTabId","user");
			jsonMap.put("callbackType","closeCurrent");
		}else{
			jsonMap.put("statusCode", 300);
			jsonMap.put("message", "新增失败!");
			jsonMap.put("navTabId","");
			jsonMap.put("callbackType","");
		}
		jsonMap.put("rel","");
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
	
	@RequestMapping(value="/active",method = RequestMethod.POST)
	public void adminActive(@RequestParam("id")int id,HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		Admin admin=adminService.getAdminById(id);
		if(admin.getStatus()==0){
			admin.setStatus(1);
		}else if(admin.getStatus()==1){
			admin.setStatus(0);
		}
		int i = adminService.updateAdminInfo(admin);
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
	
	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public ModelAndView adminEdit(@RequestParam("id") int id){
		ModelAndView mav = new ModelAndView();
		Admin admin = adminService.getAdminById(id);
		mav.addObject("admin", admin);
		mav.setViewName("admin/admin-edit");
		return mav;
	}
	
	@RequestMapping(value="/doedit",method = RequestMethod.POST)
	public void adminDoEdit(HttpServletResponse resp,@RequestParam("name")String name,@RequestParam("id")int id,@RequestParam("phone")String phone,
			@RequestParam("birthday")String birthday,@RequestParam("email")String email) throws ParseException{
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthDay = sdf.parse(birthday);
		Admin admin = adminService.getAdminById(id);
		admin.setName(name);
		admin.setBirthDay(birthDay);
		admin.setAccount(email);
		admin.setEmail(email);;
		admin.setPhone(phone);
		int result = adminService.updateAdminInfo(admin);
		if(result>0){
			jsonMap.put("statusCode", 200);
			jsonMap.put("message", "新增成功!");
			jsonMap.put("navTabId","user");
			jsonMap.put("callbackType","closeCurrent");
		}else{
			jsonMap.put("statusCode", 300);
			jsonMap.put("message", "新增失败!");
			jsonMap.put("navTabId","");
			jsonMap.put("callbackType","");
		}
		jsonMap.put("rel","");
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
	
	Admin getAdmin(String name,String account,String password,String email,String phone,int status,String initPassword,
			int is_initpwd,Date birthDay,int page,int pageNum){
		Admin admin = new Admin();
		admin.setName(name);
		admin.setAccount(account);
		admin.setPassword(password);
		admin.setEmail(email);
		admin.setPhone(phone);
		admin.setStatus(status);
		admin.setInitPassword(initPassword);
		admin.setIs_initpwd(is_initpwd);
		admin.setBirthDay(birthDay);
		admin.setPage(page);
		admin.setPageNum(pageNum);
		return admin;
	}
	
}

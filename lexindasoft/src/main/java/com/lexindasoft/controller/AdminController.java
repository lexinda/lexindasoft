package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.service.AdminService;
import com.lexindasoftservice.service.DepartmentService;
import com.lexindasoftservice.utils.Inputs;
import com.lexindasoftservice.utils.Md5Util;
import com.lexindasoftservice.utils.RandomPwdUtil;

@Controller
@RequestMapping(value="/validate/admin")
public class AdminController {

	final static int PAGE_NUM=20;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView adminManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin-manage");
		return mav;
	}
	
	@RequestMapping(value="/data",method = RequestMethod.POST)
	public void adminData(HttpServletResponse resp){
		ModelAndView mav = new ModelAndView();
		Admin admin = new Admin();
		admin.setPage(-1);
		List<Admin> adminAllList = adminService.getAllAdminList(admin);
		admin.setPage(0);
		admin.setPageNum(PAGE_NUM);
		List<Admin> adminList = adminService.getAllAdminList(admin);
		for(Admin admins : adminList){
			Department department = new Department();
			department.setId(admins.getDepartmentId());
			Department departmentInfo = departmentService.getDepartmentInfoById(department);
			if(departmentInfo!=null){
				admins.setDepartmentName(departmentInfo.getDepartmentName());
			}
		}
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new Gson();
		String data=null;
		resultMap.put("total", adminList.size());
		resultMap.put("rows", adminList);
		data = gson.toJson(resultMap);
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
	
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public void addAdmin(HttpServletResponse resp,@RequestParam("username")String username,@RequestParam(value="name",required=false)String name,@RequestParam(value="phone",required=false)String phone,
			@RequestParam(value="birthDay",required=false)String birthDay,@RequestParam(value="email",required=false)String email,@RequestParam(value="departmentName",required=false)int departmentName) throws ParseException{
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		username = Inputs.trimToNull(username);
		name = Inputs.trimToNull(name);
		phone = Inputs.trimToNull(phone);
		email = Inputs.trimToNull(email);
		birthDay = Inputs.trimToNull(birthDay);
		Date birthday = null;
		if(birthDay!=null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			birthday = sdf.parse(birthDay);
		}
		String initPassword = RandomPwdUtil.getRandomPassword(8);
		String password = Md5Util.digestMD5(initPassword);
		
		Admin admin = getAdmin(name, username, password, email,phone, 0, initPassword, 0, birthday,departmentName,null,0, PAGE_NUM);
		int result = adminService.insertAdminInfo(admin);
		jsonMap.put("result", result);
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
	public void activeAdmin(@RequestParam("id")int id,HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		Admin admin=adminService.getAdminById(id);
		if(admin.getStatus()==0){
			admin.setStatus(1);
		}else if(admin.getStatus()==1){
			admin.setStatus(0);
		}
		int i = adminService.updateAdminInfo(admin);
		if(i>0){
			jsonMap.put("success", true);
		}else{
			jsonMap.put("success", false);
			jsonMap.put("errorMsg", "修改失败!");
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
            // 用于返回对象参数 
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
	@RequestMapping(value="/info",method = RequestMethod.POST)
	public void getAdminInfo(HttpServletResponse resp,@RequestParam("id") int id){
		Admin admin=adminService.getAdminById(id);
		Department department = new Department();
		department.setId(id);
		Department departmentInfo = departmentService.getDepartmentInfoById(department);
		admin.setDepartmentName(departmentInfo.getDepartmentName());
		Gson gson = new Gson();
        String list1 = gson.toJson(admin);
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
	
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public void updateAdmin(HttpServletResponse resp,@RequestParam("username")String username,@RequestParam("name")String name,@RequestParam("id")int id,@RequestParam("phone")String phone,
			@RequestParam("birthDay")String birthDay,@RequestParam("email")String email,@RequestParam(value="departmentName",required=false)int departmentName) throws ParseException{
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		username = Inputs.trimToNull(username);
		name = Inputs.trimToNull(name);
		phone = Inputs.trimToNull(phone);
		email = Inputs.trimToNull(email);
		birthDay = Inputs.trimToNull(birthDay);
		Date birthday = null;
		if(birthDay!=null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			birthday = sdf.parse(birthDay);
		}
		Admin admin = adminService.getAdminById(id);
		Admin adminInfo = getAdmin(name, username, admin.getPassword(), email,phone, 0, admin.getInitPassword(), 0, birthday,departmentName,null,0, PAGE_NUM);
		int result = adminService.updateAdminInfo(adminInfo);
		jsonMap.put("result", result);
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
		String[] id = ids.split(",");
		int i=0;
		if(id.length>0){
			for(String value :id){
				i=adminService.deleteAdminInfo(value);
			}
		}
		if(i>0){
			jsonMap.put("success", true);
		}else{
			jsonMap.put("success", false);
			jsonMap.put("errorMsg", "删除失败!");
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
            // 用于返回对象参数 
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
	Admin getAdmin(String name,String account,String password,String email,String phone,int status,String initPassword,
			int is_initpwd,Date birthDay,int departmentId,String departmentName,int page,int pageNum){
		Admin admin = new Admin();
		admin.setName(name);
		admin.setUsername(account);
		admin.setPassword(password);
		admin.setEmail(email);
		admin.setPhone(phone);
		admin.setStatus(status);
		admin.setInitPassword(initPassword);
		admin.setIsInitpwd(is_initpwd);
		admin.setBirthDay(birthDay);
		admin.setDepartmentId(departmentId);
		admin.setDepartmentName(departmentName);
		admin.setPage(page);
		admin.setPageNum(pageNum);
		return admin;
	}
	
}

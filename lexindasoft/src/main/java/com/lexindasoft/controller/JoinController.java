package com.lexindasoft.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lexindasoft.utils.ImageUploadUtils;
import com.lexindasoftservice.service.AdminService;
import com.lexindasoftservice.service.DepartmentService;

@Controller
@RequestMapping(value="/validate/join")
public class JoinController {

	final static int PAGE_NUM=10;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView adminManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join/join-manage");
		return mav;
	}
	
	@RequestMapping(value="/imglogoupload",method = RequestMethod.POST)
	public void adminData(HttpServletResponse resp,HttpServletRequest req,@RequestParam(value="uploadLogo") MultipartFile uploadLogo){
		 Map<String, Object> jsonMap = new HashMap<String, Object>();
		String path = req.getSession().getServletContext().getRealPath("/")+File.separator+"ui"+File.separator+"setup";
		int status=1;
		if(ImageUploadUtils.isValidFormats(uploadLogo)){
			  status=0;
		  }
		if(status != 0){
			String picturePath = ImageUploadUtils.uploadImg(uploadLogo, path, "logo", 0);
			String filePath = StringUtils.substringAfter(picturePath, req.getSession().getServletContext().getRealPath("/"));
			jsonMap.put("imagePath", filePath);
		}
		jsonMap.put("status", status);
		Gson gson = new Gson();
		String data=null;
		data = gson.toJson(jsonMap);
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
	
	@RequestMapping(value="/img1load",method = RequestMethod.POST)
	public void setupImage1Data(HttpServletResponse resp,HttpServletRequest req,@RequestParam(value="uploadImage1Info") MultipartFile uploadImage1Info){
		 Map<String, Object> jsonMap = new HashMap<String, Object>();
		String path = req.getSession().getServletContext().getRealPath("/")+File.separator+"ui"+File.separator+"setup";
		int status=1;
		if(ImageUploadUtils.isValidFormats(uploadImage1Info)){
			  status=0;
		  }
		if(status != 0){
			String picturePath = ImageUploadUtils.uploadImg(uploadImage1Info, path, "img1", 0);
			String filePath = StringUtils.substringAfter(picturePath, req.getSession().getServletContext().getRealPath("/"));
			jsonMap.put("imagePath", filePath);
		}
		jsonMap.put("status", status);
		Gson gson = new Gson();
		String data=null;
		data = gson.toJson(jsonMap);
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
	
	@RequestMapping(value="/img2load",method = RequestMethod.POST)
	public void setupImage2Data(HttpServletResponse resp,HttpServletRequest req,@RequestParam(value="uploadImage2Info") MultipartFile uploadImage2Info){
		 Map<String, Object> jsonMap = new HashMap<String, Object>();
		String path = req.getSession().getServletContext().getRealPath("/")+File.separator+"ui"+File.separator+"setup";
		int status=1;
		if(ImageUploadUtils.isValidFormats(uploadImage2Info)){
			  status=0;
		  }
		if(status != 0){
			String picturePath = ImageUploadUtils.uploadImg(uploadImage2Info, path, "img2", 0);
			String filePath = StringUtils.substringAfter(picturePath, req.getSession().getServletContext().getRealPath("/"));
			jsonMap.put("imagePath", filePath);
		}
		jsonMap.put("status", status);
		Gson gson = new Gson();
		String data=null;
		data = gson.toJson(jsonMap);
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
	
	@RequestMapping(value="/img3load",method = RequestMethod.POST)
	public void setupImage3Data(HttpServletResponse resp,HttpServletRequest req,@RequestParam(value="uploadImage3Info") MultipartFile uploadImage3Info){
		 Map<String, Object> jsonMap = new HashMap<String, Object>();
		String path = req.getSession().getServletContext().getRealPath("/")+File.separator+"ui"+File.separator+"setup";
		int status=1;
		if(ImageUploadUtils.isValidFormats(uploadImage3Info)){
			  status=0;
		  }
		if(status != 0){
			String picturePath = ImageUploadUtils.uploadImg(uploadImage3Info, path, "img3", 0);
			String filePath = StringUtils.substringAfter(picturePath, req.getSession().getServletContext().getRealPath("/"));
			jsonMap.put("imagePath", filePath);
		}
		jsonMap.put("status", status);
		Gson gson = new Gson();
		String data=null;
		data = gson.toJson(jsonMap);
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
}

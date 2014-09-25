package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
import com.lexindasoftservice.model.Content;
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.model.Menu;
import com.lexindasoftservice.service.ContentService;
import com.lexindasoftservice.service.MenuService;
import com.lexindasoftservice.utils.Inputs;

@Controller
@RequestMapping(value="/validate/content")
public class ContentController {
	private final Log logger = LogFactory.getLog(getClass()); 
	final static int PAGE_NUM=20;
	
	@Autowired
	ContentService contentService;
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView contentManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("content/content-manage");
		return mav;
	}
	
	@RequestMapping(value="/data",method = RequestMethod.POST)
	public void contentData(HttpServletResponse resp,@RequestParam(value="title",required=false)String title,@RequestParam("status")int status
			,@RequestParam(value="titleKey",required=false)String titleKey,@RequestParam("contentType")int contentType,@RequestParam("page")int page){
		Content content = new Content();
		title = Inputs.trimToNull(title);
		titleKey = Inputs.trimToNull(titleKey);
		content.setTitle(title);
		content.setTitleKey(titleKey);
		content.setStatus(status);
		content.setContentType(contentType);
		content.setPage(-1);
		List<Content> contentAllList = contentService.getContentInfo(content);
		int index =0;
		if(page!=-1){
			index = (page-1)*PAGE_NUM;
		}
		content.setPage(index);
		content.setPageNum(PAGE_NUM);
		List<Content> contentList = contentService.getContentInfo(content);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new Gson();
		String data=null;
		resultMap.put("total", contentAllList.size());
		resultMap.put("rows", contentList);
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
	public void addContent(HttpServletResponse resp,@RequestParam("title")String title,@RequestParam("simpleTitle")String simpleTitle
			,@RequestParam("titleKey")String titleKey,@RequestParam("contentType")String contentType,@RequestParam("content")String content){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		title = Inputs.trimToNull(title);
		titleKey = Inputs.trimToNull(titleKey);
		simpleTitle = Inputs.trimToNull(simpleTitle);
		content = Inputs.trimToNull(content);
		int contentTypes=0;
		if(contentType!=null){
			contentTypes = Integer.parseInt(contentType);
		}
		if(content!=null){
			simpleTitle.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;");
		}
		Content contentInfo =getContentInfo(title,simpleTitle,titleKey,contentTypes,0,content);
		int i = contentService.insertContentInfo(contentInfo);
		jsonMap.put("result",i);
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
	
	/*@RequestMapping(value="/active",method = RequestMethod.POST)
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
	}*/
	
	@RequestMapping(value="/info",method = RequestMethod.POST)
	public void getAdminInfo(HttpServletResponse resp,@RequestParam("id") int id){
		Content content=contentService.getContentInfoById(id);
		Menu menu = new Menu();
		menu.setId(id);
		Menu menuInfo = menuService.getMenuInfoById(menu);
		if(content!=null){
			content.setContentTypeDesc(menuInfo.getMenuName());
		}
		Gson gson = new Gson();
        String list1 = gson.toJson(content);
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
	
	private Content getContentInfo(String title,String simple_title,String title_key,int contentType,int status,String content){
		Content contentInfo = new Content();
		contentInfo.setTitle(title);
		contentInfo.setSimpleTitle(simple_title);
		contentInfo.setTitleKey(title_key);
		contentInfo.setContentType(contentType);
		contentInfo.setStatus(status);
		contentInfo.setContent(content);
		return contentInfo;
	}
}

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
import com.lexindasoftservice.model.Log;
import com.lexindasoftservice.service.LogMapper;

@Controller
@RequestMapping(value="/validate/log")
public class LogController {

	final static int PAGE_NUM=20;
	
	@Autowired
	LogMapper logMapper;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView logManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("log/log-manage");
		return mav;
	}
	
	@RequestMapping(value="/searchlist",method = RequestMethod.POST)
	public void logSearchList(@RequestParam("page")Integer page,HttpServletResponse resp){
		int pageIndex = page==null?0:page.intValue();
		ModelAndView mav = new ModelAndView();
		Log log = new Log();
		log.setPage(-1);
		List<Log> logAllList = logMapper.getLogList(log);
		log.setPage(pageIndex);
		log.setPageNum(PAGE_NUM);
		List<Log> logList = logMapper.getLogList(log);
		int totalPage = (int)Math.ceil(logAllList.size() *1.0 / PAGE_NUM);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new Gson();
		String data=null;
		resultMap.put("total", logList.size());
		resultMap.put("rows", logList);
		data = gson.toJson(resultMap);
        resp.setContentType("application/Json");
        resp.setCharacterEncoding("UTF-8");  
        resp.setHeader("Cache-Control", "no-cache"); 
        PrintWriter out;
        try { 
            out = resp.getWriter();  
            out.print(data);
            // 用于返回对象参数 
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
}

package com.lexindasoft.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		Log log = new Log();
		log.setPage(-1);
		List<Log> logAllList = logMapper.getLogList(log);
		log.setPage(0);
		log.setPageNum(PAGE_NUM);
		List<Log> logList = logMapper.getLogList(log);
		int totalPage = (int)Math.ceil(logAllList.size() *1.0 / PAGE_NUM);
		mav.addObject("logList", logList);
		mav.addObject("page", 0);
		mav.addObject("totalPage", totalPage);
		mav.setViewName("log/log-manage");
		return mav;
	}
	
}

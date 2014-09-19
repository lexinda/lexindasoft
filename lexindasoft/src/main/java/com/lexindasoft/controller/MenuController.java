package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.model.Menu;
import com.lexindasoftservice.service.DepartmentService;
import com.lexindasoftservice.service.MenuService;
import com.lexindasoftservice.utils.Inputs;

@Controller
@RequestMapping(value="/validate/menu")
public class MenuController {

	private final Log logger = LogFactory.getLog(getClass()); 
	final static int PAGE_NUM=20;
	
	@Autowired
	MenuService menuService;
	
	//页面跳转
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView departmentManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menu/menu-manage");
		return mav;
	}
	//加载数据
	@RequestMapping(value="/data",method = RequestMethod.POST)
	public void departmentData(HttpServletResponse resp,@RequestParam("menuName") String menuName){
		Menu menu = new Menu();
		Menu rootMenu = new Menu();
		rootMenu.setId(-1);
		rootMenu.setMenuName("全部");
		rootMenu.setMenuUrl("全部");
		rootMenu.setParentId(0);
		rootMenu.setLevelId(0);
		rootMenu.setState("open");
		int id=-1;
		menuName = Inputs.trimToNull(menuName);
		if(menuName!=null){
			menu.setMenuName(menuName);
			id = menuService.getMenuIdByName(menu);
		}
		menu.setId(id);
		List<Menu> menuList = menuService.getMenuInfo(menu);
		for(Menu menus:menuList){
			menu.setId(menus.getId());
			List<Menu> childMenu = menuService.hasChildMenuInfo(menus);
			if(childMenu.size()>0){
				menus.setState("closed");
			}else{
				menus.setState("open");
			}
			
		}
		rootMenu.setChildren(menuList);
		/*Map<String,Object> resultMap = new HashMap<String,Object>();*/
		Gson gson = new Gson();
		String data=null;
		if(id==-1){
			//无根节点
			/*resultMap.put("total", departmentList.size());
			resultMap.put("rows", departmentList);*/
			data = "["+gson.toJson(rootMenu)+"]";
		}else{
			data = gson.toJson(menuList);
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
	//combotree查询数据
		@RequestMapping(value="/querycombotreedata",method = RequestMethod.POST)
		public void departmentQueryCombotreeData(HttpServletResponse resp,@RequestParam("menuName") String menuName){
			Menu menu = new Menu();
			Menu rootMenu = new Menu();
			rootMenu.setId(-1);
			rootMenu.setMenuName("全部");
			rootMenu.setText("全部");
			rootMenu.setMenuUrl("全部");
			rootMenu.setLevelId(0);
			rootMenu.setState("open");
			int id=-1;
			menuName = Inputs.trimToNull(menuName);
			if(menuName!=null){
				menu.setMenuName(menuName);
				id = menuService.getMenuIdByName(menu);
			}
			menu.setId(id);
			List<Menu> menuList = menuService.getMenuInfo(menu);
			for(Menu menus:menuList){
				List<Menu> childMenu = menuService.hasChildMenuInfo(menus);
				if(childMenu.size()>0){
					menus.setState("closed");
				}else{
					menus.setState("open");
				}
				menus.setText(menus.getMenuName());
			}
			Gson gson = new Gson();
			String data=null;
			if(id==-1){
				rootMenu.setChildren(menuList);
				data = "["+gson.toJson(rootMenu)+"]";
			}else{
				data = gson.toJson(menuList);
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
		//combotree加载数据
				@RequestMapping(value="/combotreedata",method = RequestMethod.POST)
				public void departmentCombotreeData(HttpServletResponse resp,@RequestParam("menuName") String menuName){
					Menu menu = new Menu();
					int id=-1;
					menuName = Inputs.trimToNull(menuName);
					if(menuName!=null){
						menu.setMenuName(menuName);
						id = menuService.getMenuIdByName(menu);
					}
					menu.setId(id);
					List<Menu> menuList = menuService.getMenuInfo(menu);
					for(Menu menus:menuList){
						List<Menu> childMenu = menuService.hasChildMenuInfo(menus);
						if(childMenu.size()>0){
							menus.setState("closed");
						}else{
							menus.setState("open");
						}
						menus.setText(menus.getMenuName());
					}
					Gson gson = new Gson();
					String data=null;
					data = gson.toJson(menuList);
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
	public void departmentSearchData(HttpServletResponse resp,@RequestParam("menuName") String menuName){
		Menu menu = new Menu();
		Menu rootMenu = new Menu();
		rootMenu.setId(-1);
		rootMenu.setMenuName("全部");
		rootMenu.setMenuUrl("全部");
		rootMenu.setParentId(0);
		rootMenu.setLevelId(0);
		rootMenu.setState("open");
		int id=-1;
		menuName = Inputs.trimToNull(menuName);
		if(menuName!=null){
			menu.setMenuName(menuName);
			id = menuService.getMenuIdByName(menu);
		}
		menu.setId(id);
		List<Menu> menuList = new ArrayList<Menu>();
		if(id==-1){
			menuList = menuService.getMenuInfo(menu);
		}else{
			Menu menuInfo = menuService.getMenuInfoById(menu);
			menuList.add(menuInfo);
		}
		
		for(Menu menus:menuList){
			menu.setId(menus.getId());
			List<Menu> childMenu = menuService.hasChildMenuInfo(menus);
			if(childMenu.size()>0){
				menus.setState("closed");
			}else{
				menus.setState("open");
			}
			
		}
/*		Map<String,Object> resultMap = new HashMap<String,Object>();
*/		Gson gson = new Gson();
		String data=null;
		if(id==-1){
			/*resultMap.put("total", departmentList.size());
			resultMap.put("rows", departmentList);
			data = gson.toJson(resultMap);*/
			rootMenu.setChildren(menuList);
			data = "["+gson.toJson(rootMenu)+"]";
		}else{
			data = gson.toJson(menuList);
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
	public void departmentComboxdata(HttpServletResponse resp,@RequestParam("menuName") String menuName){
		menuName = Inputs.trimToNull(menuName);
		List<Menu> menuList = new ArrayList<Menu>();
		if(menuName!=null){
			Menu menu = new Menu();
			menu.setMenuName(menuName);
			menuList = menuService.getMenuByName(menu);
		}
		Gson gson = new Gson();
		String data=null;
		data = gson.toJson(menuList);	
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
	//保存数据
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public void addDepartment(HttpServletResponse resp,@RequestParam("parentId")int parentId
			,@RequestParam("menuName")String menuName,@RequestParam("menuUrl")String menuUrl,@RequestParam("menuMethod")String menuMethod){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		logger.debug("----"+parentId+"----------"+menuName+"-----------"+menuUrl);
		Menu menuInfo = new Menu();
		if(parentId == -1){
			menuInfo.setParentId(-1);
			menuInfo.setLevelId(1);
		}else{
			menuInfo.setId(parentId);
			Menu menu = menuService.getMenuInfoById(menuInfo);
			menuInfo.setParentId(menu.getId());
			menuInfo.setLevelId(menu.getLevelId()+1);
		}
		menuInfo.setMenuName(menuName);
		menuInfo.setMenuUrl(menuUrl);
		menuInfo.setMenuMethod(menuMethod);
		menuInfo.setMenuState(0);
		int i = menuService.insertMenuInfo(menuInfo);
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
	//保存数据
		@RequestMapping(value="/update",method = RequestMethod.POST)
		public void updateDepartment(HttpServletResponse resp,@RequestParam("parentId")int parentId
				,@RequestParam("menuName")String menuName,@RequestParam("menuUrl")String menuUrl,@RequestParam("menuMethod")String menuMethod){
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			logger.debug("----"+parentId+"----------"+menuName+"-----------"+menuUrl);
			Menu menuInfo = new Menu();
			menuInfo.setId(parentId);
			menuInfo.setMenuName(menuName);
			menuInfo.setMenuUrl(menuUrl);
			menuInfo.setMenuMethod(menuMethod);
			int i = menuService.updateMenuInfo(menuInfo);
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
	
	//删除数据
		@RequestMapping(value="/delete",method = RequestMethod.POST)
		public void deleteDepartment(HttpServletResponse resp,@RequestParam("id")int id){
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			int i = menuService.deleteMenuInfo(id);
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

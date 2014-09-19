package com.lexindasoftservice.service;

import java.util.List;

import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.model.Menu;

public interface MenuService {
	
	public List<Menu> getMenuInfo(Menu menu);
	
	public List<Menu> hasChildMenuInfo(Menu menu);
	
	public int insertMenuInfo(Menu menu);
	
	public List<Menu> getMenuByName(Menu menu);
	
	public int getMenuIdByName(Menu menu);
	
	public Menu getMenuInfoById(Menu menu);
	
	public int deleteMenuInfo(int id);
	
	public int updateMenuInfo(Menu menu);
	
}

package com.lexindasoftservice.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Menu;

@Component
public interface MenuDao {

	public List<Menu> getMenuInfo(Menu menu);
	
	public List<Menu> hasChildMenuInfo(Menu menu);
	
	public int insertMenuInfo(Menu menu);
	
	public List<Menu> getMenuByName(Menu menu);
	
	public int getMenuIdByName(Menu menu);
	
	public Menu getMenuInfoById(Menu menu);
	
	public int deleteMenuInfo(int id);
	
	public int updateMenuInfo(Menu menu);
}

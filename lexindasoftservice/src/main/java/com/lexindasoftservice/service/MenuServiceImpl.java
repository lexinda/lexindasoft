package com.lexindasoftservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexindasoftservice.dao.MenuDao;
import com.lexindasoftservice.model.Menu;
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuDao menuDao;
	public List<Menu> getMenuInfo(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.getMenuInfo(menu);
	}

	public int insertMenuInfo(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.insertMenuInfo(menu);
	}

	public List<Menu> hasChildMenuInfo(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.hasChildMenuInfo(menu);
	}

	public List<Menu> getMenuByName(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.getMenuByName(menu);
	}
	
	public int getMenuIdByName(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.getMenuIdByName(menu);
	}

	public Menu getMenuInfoById(Menu menu){
		return menuDao.getMenuInfoById(menu);
	}
	
	public int deleteMenuInfo(int id){
		return menuDao.deleteMenuInfo(id);
	}

	public int updateMenuInfo(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.updateMenuInfo(menu);
	}

}

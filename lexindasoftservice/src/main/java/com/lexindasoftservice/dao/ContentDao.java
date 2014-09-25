package com.lexindasoftservice.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.lexindasoftservice.model.Content;

@Component
public interface ContentDao {

	public List<Content> getContentInfo(Content content);
	
	public int insertContentInfo(Content content);
	
	public Content getContentInfoById(int id);
	
	public int deleteDepartmentInfo(int id);
	
	public int updateDepartmentInfo(Content content);
}

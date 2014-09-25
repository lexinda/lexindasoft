package com.lexindasoftservice.service;

import java.util.List;

import com.lexindasoftservice.model.Content;

public interface ContentService {
	
	public List<Content> getContentInfo(Content content);
	
	public int insertContentInfo(Content content);
	
	public Content getContentInfoById(int id);
	
	public int deleteDepartmentInfo(int id);
	
	public int updateDepartmentInfo(Content content);
	
}

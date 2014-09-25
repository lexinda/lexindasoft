package com.lexindasoftservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lexindasoftservice.dao.ContentDao;
import com.lexindasoftservice.model.Content;
@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	ContentDao contentDao;
	public List<Content> getContentInfo(Content content) {
		// TODO Auto-generated method stub
		return contentDao.getContentInfo(content);
	}

	public int insertContentInfo(Content content) {
		// TODO Auto-generated method stub
		return contentDao.insertContentInfo(content);
	}

	public Content getContentInfoById(int id) {
		// TODO Auto-generated method stub
		return contentDao.getContentInfoById(id);
	}

	public int deleteDepartmentInfo(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateDepartmentInfo(Content content) {
		// TODO Auto-generated method stub
		return 0;
	}


}

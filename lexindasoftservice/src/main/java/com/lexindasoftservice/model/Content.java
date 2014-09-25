package com.lexindasoftservice.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class Content {
	private int id;
	private String title;
	private String simpleTitle;
	private String titleKey;
	private int contentType;
	private String contentTypeDesc;
	private int status;
	private String content;
	private Date crateTime;
	private Date updateTime;
	private int page;
	private int pageNum;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getContentType() {
		return contentType;
	}
	public void setContentType(int contentType) {
		this.contentType = contentType;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCrateTime() {
		return crateTime;
	}
	public void setCrateTime(Date crateTime) {
		this.crateTime = crateTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getSimpleTitle() {
		return simpleTitle;
	}
	public void setSimpleTitle(String simpleTitle) {
		this.simpleTitle = simpleTitle;
	}
	public String getTitleKey() {
		return titleKey;
	}
	public void setTitleKey(String titleKey) {
		this.titleKey = titleKey;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getContentTypeDesc() {
		return contentTypeDesc;
	}
	public void setContentTypeDesc(String contentTypeDesc) {
		this.contentTypeDesc = contentTypeDesc;
	}
	
}

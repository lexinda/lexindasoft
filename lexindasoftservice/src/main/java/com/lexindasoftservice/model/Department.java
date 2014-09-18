package com.lexindasoftservice.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class Department {
	private int id;
	private String departmentName;
	private int parentId;
	private int levelId;
	private String departmentDesc;
	private Date Create_time;
	private String state;
	private String text;
	private List<Department> children;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getLevelId() {
		return levelId;
	}
	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}
	public String getDepartmentDesc() {
		return departmentDesc;
	}
	public void setDepartmentDesc(String departmentDesc) {
		this.departmentDesc = departmentDesc;
	}
	public Date getCreate_time() {
		return Create_time;
	}
	public void setCreate_time(Date create_time) {
		Create_time = create_time;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public List<Department> getChildren() {
		return children;
	}
	public void setChildren(List<Department> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "Department [id=" + id + ", departmentName=" + departmentName
				+ ", parentId=" + parentId + ", levelId=" + levelId
				+ ", departmentDesc=" + departmentDesc + ", Create_time="
				+ Create_time + ", state=" + state + ", text=" + text
				+ ", children=" + children + "]";
	}
}

package com.lexindasoftservice.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class Menu {
	private int id;
	private String menuName;
	private String menuUrl;
	private String menuMethod;
	private int parentId;
	private int levelId;
	private int menuState;
	private Date createTime;
	private Date updateTime;
	private String state;
	private String text;
	private List<Menu> children;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenuMethod() {
		return menuMethod;
	}
	public void setMenuMethod(String menuMethod) {
		this.menuMethod = menuMethod;
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<Menu> getChildren() {
		return children;
	}
	public void setChildren(List<Menu> children) {
		this.children = children;
	}
	public int getMenuState() {
		return menuState;
	}
	public void setMenuState(int menuState) {
		this.menuState = menuState;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Menu [id=" + id + ", menuName=" + menuName + ", menuUrl="
				+ menuUrl + ", menuMethod=" + menuMethod + ", parentId="
				+ parentId + ", levelId=" + levelId + ", menuState="
				+ menuState + ", createTime=" + createTime + ", updateTime="
				+ updateTime + ", state=" + state + ", text=" + text
				+ ", children=" + children + "]";
	}
}

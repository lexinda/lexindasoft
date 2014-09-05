package com.lexindasoftservice.model;

import java.util.Date;

public class Role {

	private int id;

	private int adminId;
	
	private String roleName;

	private int levelId;
	
	private int parentId;

	private Date createTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", adminId=" + adminId + ", roleName="
				+ roleName + ", levelId=" + levelId + ", parentId=" + parentId
				+ ", createTime=" + createTime + "]";
	}
	
}

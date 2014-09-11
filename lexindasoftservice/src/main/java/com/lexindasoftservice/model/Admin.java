package com.lexindasoftservice.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;

public class Admin implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int id;

	private String name;

	private String username;
	
	private String password;
	
	private String phone;

	private String email;

	private int status;
	
	private String initPassword;
	
	private Date updatePwdtime;
	
	private int is_initpwd;
	
	private Date birthDay;

	private Date createTime;
	
	private Date updateTime;
	
	private int page;
	
	private int pageNum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getInitPassword() {
		return initPassword;
	}

	public void setInitPassword(String initPassword) {
		this.initPassword = initPassword;
	}

	public Date getUpdatePwdtime() {
		return updatePwdtime;
	}

	public void setUpdatePwdtime(Date updatePwdtime) {
		this.updatePwdtime = updatePwdtime;
	}

	public int getIs_initpwd() {
		return is_initpwd;
	}

	public void setIs_initpwd(int is_initpwd) {
		this.is_initpwd = is_initpwd;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
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

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", username=" + username
				+ ", password=" + password + ", phone=" + phone + ", email="
				+ email + ", status=" + status + ", initPassword="
				+ initPassword + ", updatePwdtime=" + updatePwdtime
				+ ", is_initpwd=" + is_initpwd + ", birthDay=" + birthDay
				+ ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", page=" + page + ", pageNum=" + pageNum + "]";
	}
	
}

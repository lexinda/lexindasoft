package com.lexindasoftservice.model;

import java.io.Serializable;
import java.util.Date;

public class Log implements Serializable {
	 private static final long serialVersionUID = 1024792477652984770L;  
	  	private int id;
	    private int userid;//管理员id  
	    private Date createdate;//日期  
	    private String content;//日志内容  
	    private int operation;//操作(主要是"添加"、"修改"、"删除")
	    private String logip;
	    private int page;
	    private int pageNum;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		public Date getCreatedate() {
			return createdate;
		}
		public void setCreatedate(Date createdate) {
			this.createdate = createdate;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getOperation() {
			return operation;
		}
		public void setOperation(int operation) {
			this.operation = operation;
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
		public String getLogip() {
			return logip;
		}
		public void setLogip(String logip) {
			this.logip = logip;
		}
	    
}

<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
</head>
<body>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<ul class="tree expand">
			<li><a href="javascript:">总经理办公室</a>
				<ul>
					<li><a href="javascript:" onclick="$.bringBack({id:'1', districtName:'总经理', cityName:'总经理'})">总经理</a></li>
					<li><a href="javascript:" onclick="$.bringBack({id:'2', districtName:'经理助理', cityName:'经理助理'})">经理助理</a></li>
				</ul>
			</li>
			<li><a href="javascript:">财务部</a>
				<ul>
					<li><a href="javascript:" onclick="$.bringBack({id:'1', districtName:'会计', cityName:'会计'})">会计</a></li>
					<li><a href="javascript:" onclick="$.bringBack({id:'2', districtName:'出纳', cityName:'出纳'})">出纳</a></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
		</ul>
	</div>
</div>
</body>
</html>
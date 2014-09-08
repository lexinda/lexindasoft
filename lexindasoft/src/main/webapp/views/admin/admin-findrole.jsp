<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户与角色</title>
</head>
<body>
<div class="pageHeader">
	<form action="/validate/role/search" method="post" onsubmit="return dwzSearch(this, 'dialog');">
	<div class="searchBar">
		<table class="searchContent">
			<tr><td>角色名：<input type="text" name="roleName"/><button type="submit">查询</button><button type="button" multLookup="orgId" warn="选择">选择</button></td></tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="30"><input type="checkbox" class="checkboxCtrl" group="orgId" />
				<th>角色名</th>
				<th>角色描述</th>
				<th>创建时间</th>
			</tr>
		</thead>
		<thbody>
			<c:forEach items="${adminList}" var="admin">
				<tr target="user" rel="${admin.id}">
					<td><input name="ids" value="${admin.id}" type="checkbox"></td>
					<td>${admin.account}</td>
					<td>${admin.email}</td>
					<td>${admin.createTime}</td>
				</tr>
			</c:forEach>
		</thbody>
	</table>
</div>
</body>
</html>
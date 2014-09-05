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
<div class="pageHeader">
	<form action="/validate/role/search" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr><td>角色名：<input type="text" name="account"/><button type="submit">查询</button></td></tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/validate/role/add" target="navTab"><span>新增角色</span></a></li>
			<li><a title="是否批量删除?" target="selectedTodo" rel="ids" postType="string" href="/validate/role/delete" class="delete"><span>批量删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="/validate/role/excel" target="dwzExport" targetType="navTab" title="是否确定导出！"><span>导出Excel数据</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>角色名</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<thbody>
			<c:forEach items="${roleList}" var="role">
				<tr target="user" rel="${role.id}">
					<td>${role.roleName}</td>
					<td>${role.createTime}</td>
					<td>
						<a title="编辑" target="navTab" href="/validate/role/edit?id=${role.id}" class="btnEdit">编辑</a>
						<a title="查看用户" target="navTab" href="/validate/role/edit?id=${role.id}" class="btnAssign">编辑</a>
						<a title="查看菜单" target="navTab" href="/validate/role/edit?id=${role.id}" class="btnInfo">编辑</a>
					</td>
				</tr>
			</c:forEach>
		</thbody>
	</table>
</div>
</body>
</html>
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
	<form action="/admin/search" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr><td>用户名：<input type="text" name="account"/><button type="submit">查询</button></td></tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/validate/admin/add" target="navTab"><span>新增用户</span></a></li>
			<li><a title="是否批量删除?" target="selectedTodo" rel="ids" postType="string" href="/admin/delete" class="delete"><span>批量删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="/admin/excel" target="dwzExport" targetType="navTab" title="是否确定导出！"><span>导出Excel数据</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>用户名</th>
				<th>email</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<thbody>
			<c:forEach items="${adminList}" var="admin">
				<tr target="user" rel="${admin.id}">
					<td><input name="ids" value="${admin.id}" type="checkbox"></td>
					<td>${admin.account}</td>
					<td>${admin.email}</td>
					<td>${admin.createTime}</td>
					<td>
						<c:if test="${admin.status == 0 }">
							<a title="禁用状态，点击启用！" target="ajaxTodo" href="/validate/admin/active?id=${admin.id}" class="btnDel">禁用状态，点击启用！</a>
						</c:if>
						<c:if test="${admin.status == 1 }">
							<a title="启用状态，点击禁用！" target="ajaxTodo" href="/validate/admin/active?id=${admin.id}" class="btnSelect">启用状态，点击禁用！</a>
						</c:if>
						<a title="编辑" target="navTab" href="/validate/admin/edit?id=${admin.id}" class="btnEdit">编辑</a>
					</td>
				</tr>
			</c:forEach>
		</thbody>
	</table>
</div>
</body>
</html>
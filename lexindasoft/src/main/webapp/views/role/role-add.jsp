<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户添加</title>
</head>
<body>
	<div  class="pageContent">
		<form action="/validate/admin/doadd" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>姓名：</label>
					<input name="account" type="text" size="30" value="" class="required"/>
				</p>
				<p>
					<label>邮箱：</label>
					<input name="account" type="text" size="30" value="" class="required"/>
				</p>
				<p>
					<label>日期：</label>
					<input type="text" name="startDate" class="date" size="30"/><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>角色：</label>
					<input name="roleType" type=text class="required" size="30" value="" suggestFields="orgNum,orgName" suggestUrl="/validate/role/search"/>
					<a class="btnLook" href="/validate/role/search" lookupGroup="orgLookup">查找</a>
				</p>
			</div>
			<div class="formBar">
				<ul>
					<li>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div>
					</li>
					<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>
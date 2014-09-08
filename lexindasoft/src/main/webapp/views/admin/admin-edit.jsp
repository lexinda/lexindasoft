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
		<form action="/validate/admin/doedit" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
			<input type="hidden" name="id" value="${admin.id}"/>
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>账号：</label>
					<input name="account" readonly="true" type="text" size="30" value="${admin.account}" class="required" />
				</p>
				<p>
					<label>姓名：</label>
					<input name="name" type="text" size="30" value="${admin.name}" class="required"/>
				</p>
				<c:if test="${admin.is_initpwd == 0 }">
					<p>
						<label>初始密码：</label>
						<input name="initPassword" readonly="true" type="text" size="30" value="${admin.initPassword}" class="required"/>
					</p>
				</c:if>
				<%-- <fmt:formatDate value="${admin.birthDay}" pattern="yyyy-MM-dd HH:mm"/> --%>
				<p>
					<label>出生日期：</label>
					<input type="text" name="birthday" class="date" value="<fmt:formatDate value="${admin.birthDay}" pattern="yyyy-MM-dd"/>" size="30"/><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>电话：</label>
					<input name="phone" type="text" size="30" value="${admin.phone}" class="required"/>
				</p>
				<p>
					<label>邮箱：</label>
					<input name="email" type="text" size="30" value="${admin.email}" class="required email"/>
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
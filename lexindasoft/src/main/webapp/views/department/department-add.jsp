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
		<form action="/validate/department/doadd" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone);">
			<div class="pageFormContent" layoutH="56">
				<p>
					<label>部门名称：</label>
					<input name="departmentName" type="text" size="30" value="" class="required"/>
				</p>
				<p>
					<label>所属机构：</label>
					<input class="required" name="district.id" type="hidden" readonly/>
					<input class="required" name="district.districtName" type="text" readonly/>
					<a class="btnLook" href="/validate/department/find" lookupGroup="district">请选择</a>	
				</p>
				<p>
					<label>部门描述：</label>
					<textarea name="departmentDesc" cols="40" rows="5"></textarea>
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
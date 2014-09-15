<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户添加</title>
	<script src="../ui/jquery.min.js" type="text/javascript"></script>
    <script src="../ui/jquery.easyui.min.js" type="text/javascript"></script>
    <link href="../ui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    function editInfo(){ 
    	var row = $('#test').datagrid('getSelected'); 
    	if(row){ 
    		win.window('open'); 
    		var code = row.code; 
    		$('#form1').form('load', 'get.action?code='+code); 
    	}else{ 
    		$.messager.alert('提示信息','请先选择要更新的记录。','info'); 
    	}	          
    } 
    </script>
</head>
<body>
	<div>
		<form method="post" id="form1">	
			<table> 
				<tr> 
					<td>部门名称：</td> 
					<td><input name="qybh" style="width:200px;"  id="qybh"></input></td> 
				</tr> 
				<tr> 
					<td>部门描述：</td> 
					<td><input name="qymc" style="width:200px;"></input></td> 
				</tr> 
			</table> 
		</form> 
	</div> 
	<div style="text-align:center;padding:5px;"> 
	<a href="javascript:void(0)" onclick="saveUser()" id="btn-save" icon="icon-save">保存</a> 
	<a href="javascript:void(0)" onclick="closeWindow()" id="btn-cancel" icon="icon-cancel">取消</a> 
	</div> 
</body>
</html>
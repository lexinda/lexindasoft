<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="../dwz/themes/css/vsStyle/jquery.treeTable.css" rel="stylesheet" type="text/css" media="screen"/>
<script src="../dwz/js/jquery.treeTable.js" type="text/javascript"></script>
<style type="text/css">
	.treetable { border:1px solid #ededed;
				width: 100%;
				}
	.treetable th{
				background:url(../dwz/themes/default/images/grid/tableth.png) repeat-x;
				border-left-color:#EEE; border-right-color:#d0d0d0;
				}
	.treetable td,.treetable th{ 
				border:1px solid #ededed; 
				padding:0 1em 0; 
				height: 20px;
				}
	.treetable tr.alter{ 
				background-color:#f5fafe; 
				}
</style>
<script type="text/javascript">
	$(function(){
	    var option = {
	        theme:'vsStyle',
	        expandLevel : 2,
	        beforeExpand : function($treeTable, id) {
	            //判断id是否已经有了孩子节点，如果有了就不再加载，这样就可以起到缓存的作用
	            if ($('.' + id, $treeTable).length) { return; }
	            //这里的html可以是ajax请求
	            var html = '<tr id="8" pId="6"><td>5.1</td><td>可以是ajax请求来的内容</td></tr>'
	                     + '<tr id="9" pId="6"><td>5.2</td><td>动态的内容</td></tr>';
	
	            $treeTable.addChilds(html);
	        },
	        onSelect : function($treeTable, id) {
	            window.console && console.log('onSelect:' + id);
	            
	        }
	
	    };
	    $('#treeTable1').treeTable(option);
	});
</script>
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
			<li><a class="add" href="/validate/department/add" target="navTab"><span>新增用户</span></a></li>
			<li><a title="是否批量删除?" target="selectedTodo" rel="ids" postType="string" href="/validate/admin/delete" class="delete"><span>批量删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="/admin/excel" target="dwzExport" targetType="navTab" title="是否确定导出！"><span>导出Excel数据</span></a></li>
		</ul>
	</div>
	<table id="treeTable1" class="treetable">
		<thead>
			<tr onmouseover="style.backgroundColor='#ededed'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <th style="width: 200px;">
                        部门</th>
                    <th>
                        描述</th>
                    <th>
                        操作</th>
                </tr>
		</thead>
		<tbody>
			<tr id="1" onmouseover="style.backgroundColor='#e9f0f2'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <td>
                        <span controller="true">1</span></td>
                    <td>
                        内容</td>
                </tr>
                <tr id="2" pid="1" onmouseover="style.backgroundColor='#e9f0f2'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <td>
                        <span controller="true">2</span></td>
                    <td>
                        内容</td>
                </tr>
                <tr id="3" pid="2" onmouseover="style.backgroundColor='#e9f0f2'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <td>
                        3</td>
                    <td>
                        内容</td>
                </tr>
                <tr id="4" pid="2" onmouseover="style.backgroundColor='#e9f0f2'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <td>
                        4</td>
                    <td>
                        内容</td>
                </tr>
                <tr id="5" pid="4" onmouseover="style.backgroundColor='#e9f0f2'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <td>
                        4.1</td>
                    <td>
                        内容</td>
                </tr>
                <tr id="6" pid="1" haschild="true" onmouseover="style.backgroundColor='#e9f0f2'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <td>
                        5</td>
                    <td>
                        注意这个节点是动态加载的</td>
                </tr>
                <tr id="7" onmouseover="style.backgroundColor='#e9f0f2'" onmouseout="style.backgroundColor='#FFFFFF'">
                    <td>
                        8</td>
                    <td>
                        内容</td>
                </tr>
		</tbody>
     </table>
</div>
</body>
</html>
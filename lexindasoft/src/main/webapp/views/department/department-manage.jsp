<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>组织结构管理</title>
	<script src="../ui/jquery.min.js" type="text/javascript"></script>
    <script src="../ui/jquery.easyui.min.js" type="text/javascript"></script>
    <link href="../ui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    	$(function(){
    		 $('#tt').treegrid({  
 			    url:'/department/data?id=1',  
 			 	idField:'id',
 			 	title:'组织机构',
 			 	iconCls:'icon-save',
 			 	toolbar:'#tb',
 			 	fit:'true',
 			    treeField:'departmentName',  
 			    columns:[[  
 			        {title:'机构名称',field:'departmentName',width:'30%'},  
 			        {field:'departmentDesc',title:'机构描述',width:'30%'},  
 			       	{field:'action',title:'操作',width:'30%',align:'center',
 						formatter:function(value,row,index){
 								var a = '<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="editrow(this)">新增</a> ';
 								var e = '<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editrow(this)">编辑</a> ';
 								var d = '<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="deleterow(this)">删除</a>';
 								return a+e+d;
 						}
 					}
 			    ]],
 			   onBeforeExpand:function(row){
 		    		var url = '/department/data?id='+row.id; 
 		    		$('#tt').treegrid('options').url = url; 
 		    		return true; 
 		    	}
 			});  
    	});
    	function getRowIndex(target){
    		var tr = $(target).closest('tr.datagrid-row');
    		return parseInt(tr.attr('datagrid-row-index'));
    	}
    	function editrow(target){
    		$('#tt').treegrid('beginEdit', getRowIndex(target));
    	}
    </script>
</head>
<body>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			Date From: <input class="easyui-datebox" style="width:80px">
			To: <input class="easyui-datebox" style="width:80px">
			Language: 
			<input class="easyui-combobox" style="width:100px"
					url="data/combobox_data.json"
					valueField="id" textField="text">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
		</div>
		<!-- <div>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增机构</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
		</div> -->
	</div>
	<table id="tt"></table>
</body>
</html>
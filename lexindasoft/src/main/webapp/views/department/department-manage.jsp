<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>组织结构管理</title>
	<script src="../../ui/jquery.min.js" type="text/javascript"></script>
    <script src="../../ui/jquery.easyui.min.js" type="text/javascript"></script>
    <link href="../../ui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/icon.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    	$(function(){
    		 $('#tt').treegrid({
    			 /*{ 
    			 text: '请选择<select size="1" id="select" name="select"><option>广州</option><option>深圳</option></select>' 
    			 }, 
    			 */ 
 			    url:'/validate/department/data?departmentName=',  
 			 	idField:'id',
 			 	title:'组织机构',
 			 	iconCls:'icon-save',
 			 	toolbar:[{ 
 			 		text: '机构名称：<input type="text" id="departmentName"/>' 
 			 	}, { 
 			 	id: 'searchBtn', 
 			 	text: '查询', 
 			 	iconCls:'icon-search', 
 			 	handler: function(){ 
 			 	query(); 
 			 	} 
 			 	}],
 			 	fit:'true',
 			    treeField:'departmentName',  
 			    columns:[[  
 			        {title:'机构名称',field:'departmentName',width:'30%'},  
 			        {field:'departmentDesc',title:'机构描述',width:'30%'},  
 			       	{field:'action',title:'操作',width:'30%',align:'center',
 						formatter:function(value,row,index){
 								var a = '<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newuser()">新增</a> ';
 								var e = '<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editrow(this)">编辑</a> ';
 								var d = '<a href="#" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="deleterow(this)">删除</a>';
 								return a+e+d;
 						}
 					}
 			    ]],
 			   onBeforeExpand:function(row){
 		    		var url = '/validate/department/data?departmentName='+row.departmentName; 
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
    	function query(){ 
    		$.post('/validate/department/searchdata',{departmentName:$("#departmentName").val()},function(data){ 
    			$('#tt').treegrid('loadData',data); 
    		},'json'); 
    	} 
    	
    	 var url;
         var type;
         function newuser() {
             $("#dlg").dialog("open").dialog('setTitle', '新增部门'); ;
             $("#fm").form("clear");
             url = "UserManage.aspx";
             document.getElementById("hidtype").value="submit";
         }
         function edituser() {
             var row = $("#dg").datagrid("getSelected");
             if (row) {
                 $("#dlg").dialog("open").dialog('setTitle', 'Edit User');
                 $("#fm").form("load", row);
                 url = "UserManage.aspx?id=" + row.ID;
             }
         }
         function saveuser() {
             $("#fm").form("submit", {
                 url: url,
                 onsubmit: function () {
                     return $(this).form("validate");
                 },
                 success: function (result) {
                     if (result == "1") {
                         $.messager.alert("提示信息", "操作成功");
                         $("#dlg").dialog("close");
                         $("#dg").datagrid("load");
                     }
                     else {
                         $.messager.alert("提示信息", "操作失败");
                     }
                 }
             });
         }
         function destroyUser() {
             var row = $('#dg').datagrid('getSelected');
             if (row) {
                 $.messager.confirm('Confirm', 'Are you sure you want to destroy this user?', function (r) {
                     if (r) {
                         $.post('destroy_user.php', { id: row.id }, function (result) {
                             if (result.success) {
                                 $('#dg').datagrid('reload');    // reload the user data  
                             } else {
                                 $.messager.show({   // show error message  
                                     title: 'Error',
                                     msg: result.errorMsg
                                 });
                             }
                         }, 'json');
                     }
                 });
             }
         }  
    </script>
</head>
<body>
	<table id="tt"></table>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
       closed="true" buttons="#dlg-buttons"> 
       <div class="ftitle"> 
           信息编辑 
       </div> 
       <form id="fm" method="post"> 
       <div class="fitem"> 
           <label> 
               编号 
           </label> 
           <input name="AccountCode" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               卡号</label> 
           <input name="AccountName" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               密码</label> 
           <input name="AccountPwd" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               创建时间</label> 
           <input name="CreateTime" class="easyui-datebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               创建人</label> 
           <input name="CreateName" class="easyui-vlidatebox" /> 
       </div> 
       <input type="hidden" name="action" id="hidtype" /> 
       <input type="hidden" name="ID" id="Nameid" /> 
       </form> 
   </div>
	<div id="dlg-buttons"> 
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a> 
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')"
            iconcls="icon-cancel">取消</a> 
    </div> 
</body>
</html>
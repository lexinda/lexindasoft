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
    <style type="text/css"> 
        #fm 
        { 
            margin: 0; 
            padding: 10px 30px; 
        } 
        .ftitle 
        { 
            font-size: 14px; 
            font-weight: bold; 
            padding: 5px 0; 
            margin-bottom: 10px; 
            border-bottom: 1px solid #ccc; 
        } 
        .fitem 
        { 
            margin-bottom: 5px; 
        } 
        .fitem label 
        { 
            display: inline-block; 
            width: 80px; 
        } 
    </style>
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
 			 		text: '机构名称： <select id="departmentName" name="departmentName" style="width:200px;"></select>' 
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
 								var a = '<a href="#" id="'+row.id+'" class="'+row.departmentName+'" onclick="newrow(this)">新增</a> ';
 								var e = '<a href="#" id="'+row.id+'" onclick="editrow(this)">编辑</a> ';
 								if(row.state=='open'){
 									var d = '<a href="#" id="'+row.id+'" onclick="deleterow(this)">删除</a>';
 									return a+e+d;
 								}else{
 									return a+e;
 								}
 						}
 					}
 			    ]],
 			   onBeforeExpand:function(row){
 		    		var url = '/validate/department/data?departmentName='+row.departmentName; 
 		    		$('#tt').treegrid('options').url = url; 
 		    		return true; 
 		    	}
 			});  
    		 $('#departmentName').combobox({  
 		        //url:urlStr,  
 		        valueField:'departmentName',  
 		        textField:'departmentName',  
 		        onChange:function (newValue, oldValue){  
 		            if(newValue !=null){  
 		                //alert(newValue+oldValue);  
 		                $("#departmentName").combobox("reload","/validate/department/getComboxdata?departmentName="+newValue); //encodeURIComponent(newValue));  
 		            }  
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
    		var departmentName=$('#departmentName').combobox('getValue');
    		if(departmentName==undefined){
    			departmentName="";
    		}
    		$.post('/validate/department/searchdata',{departmentName:departmentName},function(data){ 
    			$('#tt').treegrid('loadData',data); 
    		},'json'); 
    	} 
    	
    	 var url;
         var type;
         function newrow(data) {
             $("#dlg").dialog({
            	open:true,
            	width:400,
            	height:300,
            	closed: false,  
            	cache: false,  
            	modal: true,
             	title:data.className,
             	buttons:'#dlg-buttons'
             });
             $("#fm").form("clear");
             $("#parentId").val(data.id);
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
                 url: "/validate/department/doadd",
                 onsubmit: function () {
                     return $(this).form("validate");
                 },
                 success: function (data) {
                	 var obj = jQuery.parseJSON(data);
                     if (obj.result == "1") {
                         $.messager.alert("提示信息", "操作成功");
                         $("#dlg").dialog("close");
                         $("#tt").treegrid("load");
                     }
                     else {
                         $.messager.alert("提示信息", "操作失败");
                     }
                 }
             });
         }
         function deleterow(data) {
             if (data) {
                 $.messager.confirm('警告', '你确定删除此组织机构吗?', function (r) {
                     if (r) {
                         $.post('/validate/department/deleteDepartment', { id: data.id }, function (result) {
                             if (result.success) {
                                 $('#tt').treegrid('reload');// reload the user data  
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
	
	<div id="dlg"> 
       <form id="fm" method="post"> 
       <div class="ftitle"> 
           	信息编辑 
       </div> 
       <div class="fitem"> 
           <label>部门名称：</label> 
           <input name="departmentName" id="departmentName" class="easyui-validatebox" required="true" /> 
       </div> 
       <div class="fitem"> 
           <!-- <input name="departmentDesc" class="easyui-datebox" required="true" />  -->
			<label>部门描述:</label>
			<textarea name="departmentDesc" style="height:60px;"></textarea>
       </div> 
       <!-- <div class="fitem"> 
           <label> 
           		创建人
           </label> 
           <input name="CreateName" class="easyui-vlidatebox" /> 
       </div> --> 
       <input type="hidden" name="parentId" id="parentId" value="" /> 
       </form> 
   </div>
	<div id="dlg-buttons"> 
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveuser()" iconcls="icon-save">保存</a> 
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')" iconcls="icon-cancel">取消</a> 
    </div> 
</body>
</html>
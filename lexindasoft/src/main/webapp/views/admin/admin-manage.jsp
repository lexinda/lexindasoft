<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理</title>
	<script src="../../ui/jquery.min.js" type="text/javascript"></script>
    <script src="../../ui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../ui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
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
	    $('#tt').datagrid({
	    	idField:'id',
			iconCls:'icon-save',
	    	title:'用户管理',
	    	url:'/validate/admin/data',
	    	toolbar:[{ 
			 		text: '用户名： <input type="text" id="usernameq" name="usernameq" style="width:100px;"></input>' 
			 	},{ 
			 		text: '是否启用： <select id="statusq" name="status" style="width:100px;"><option value="-1">全部</option><option value="0">禁用</option><option value="1">启用</option></select>' 
			 	},{ 
			 		text: '是否为初始密码： <select id="isInitpwdq" name="isInitpwd" style="width:100px;"><option value="-1">全部</option><option value="0">是</option><option value="1">否</option></select>' 
			 	},{ 
			 		text: '组织机构： <input type="text" id="departmentIdq" name="departmentId" style="width:100px;"></input>' 
			 	}, { 
			 	id: 'searchBtn', 
			 	text: '查询', 
			 	iconCls:'icon-search', 
			 	handler: function(){ 
			 	query(); 
			 	} 
			 	},{  
                    text:'新增',iconCls:'icon-add',handler:function(){  
                        addrow(this);  
                    }  
                },  
                {text:'批量删除',iconCls:'icon-cut',handler:function(){  
                    mostDelete(this);  
                    }  
                }
                ],  
			fit:'true',
	    	columns:[[ 
	    	    {field:'ck',checkbox:true},
	    		{field:'username',title:'用户名',width:'12%'}, 
	    		{field:'name',title:'姓名',width:'12%'}, 
	    		{field:'phone',title:'电话号码',width:'12%'},
	    		{field:'email',title:'邮箱',width:'12%'},
	    		{field:'status',title:'状态',align:'center',width:'12%',formatter:function(value,row,index){
							if(row.status=='0'){
								var a = '<a href="#" id="'+row.id+'" onclick="unusefulrow(this)">禁用</a>';
								return a;
							}else{
								var a = '<a href="#" id="'+row.id+'" onclick="usefulrow(this)">启用</a>';
								return a;
							}
					}},
	    		{field:'isInitpwd',title:'是否为初始密码',align:'center',width:'12%',formatter:function(value,row,index){
					if(row.is_initpwd=='1'){
						var a = '<span>否</span>';
						return a;
					}else{
						var a = '<span>是</span>';
						return a;
					}
				}},
				{field:'departmentName',title:'所属机构',width:'12%'},
				{field:'action',title:'操作',width:'12%',align:'center',formatter:function(value,row,index){
					var a = '<a href="#" id="'+row.id+'" onclick="editrow(this)">编辑</a>  ';
					var b = '<a href="#" id="'+row.id+'" onclick="deleterow(this)">删除</a>';
					return a+b;
				}}
	    	]] 
	    });
	    $('#departmentName').combotree({
	    	url: '/validate/department/combotreedata?departmentName=',
	    	valueField: 'id',
            textField: 'text',
	    	required: true,
	    	onBeforeExpand:function(row){
		    		var url = '/validate/department/combotreedata?departmentName='+row.departmentName; 
		    		$('#departmentName').combotree('tree').tree('options').url = url; 
		    		return true; 
		    }
	    }); 
	    $('#departmentIdq').combotree({
	    	url: '/validate/department/querycombotreedata?departmentName=',
	    	valueField: 'id',
            textField: 'text',
	    	required: false,
	    	prerendered:true,
	    	onBeforeExpand:function(row){
		    		var url = '/validate/department/querycombotreedata?departmentName='+row.departmentName; 
		    		$('#departmentIdq').combotree('tree').tree('options').url = url; 
		    		return true; 
		    }
	    }); 
    });
    function query(){ 
		var departmentId=$('#departmentIdq').combobox('getValue');
		if(departmentId==undefined){
			departmentId=-1;
		}else if(departmentId==""){
			departmentId=-1;
		}
		var userName=$('#usernameq').val();
		var status=$('#statusq').val();
		var isInitpwd=$('#isInitpwdq').val();
		$.post('/validate/admin/searchdata',{departmentId:departmentId,username:userName,status:status,isInitpwd:isInitpwd},function(data){ 
			$('#tt').datagrid('loadData',data); 
		},'json'); 
	} 
    
    function addrow(data){
    	$("#username").removeAttr('readonly');
    	$("#password").attr('style','display:none');
    	$("#dlg").dialog({
        	open:true,
        	width:400,
        	height:330,
        	closed: false,  
        	cache: false,  
        	modal: true,
         	title:"新增用户",
         	buttons:[{ 
         		text: '提交', 
         		iconCls: 'icon-ok', 
         		handler: function() { 
         			savedata();
         		} 
         		}, { 
         		text: '取消', 
         		handler: function() { 
         			$('#dlg').dialog('close');
         		} 
         	}]
         });
         $("#fm").form("clear");
    }
    function savedata() {
        $("#fm").form("submit", {
            url: "/validate/admin/add",
            onsubmit: function () {
                return $(this).form("validate");
            },
            success: function (data) {
           	 var obj = jQuery.parseJSON(data);
                if (obj.result == "1") {
                    $.messager.alert("提示信息", "操作成功");
                    $("#dlg").dialog("close");
                    $("#tt").datagrid("load");
                }
                else {
                    $.messager.alert("提示信息", "操作失败");
                }
            }
        });
    }
    function editrow(data){
    	$("#username").attr('readonly','readonly');
    	$("#password").attr('style','display:block');
    	$("#dlg").dialog({
        	open:true,
        	width:400,
        	height:330,
        	closed: false,  
        	cache: false,  
        	modal: true,
         	title:"查看用户",
         	buttons:[{ 
         		text: '提交', 
         		iconCls: 'icon-ok', 
         		handler: function() { 
         			editdata();
         		} 
         		}, { 
         		text: '取消', 
         		handler: function() { 
         			$('#dlg').dialog('close');
         		} 
         	}]
         });
    	$.post('/validate/admin/info', { id: data.id }, function (result) {
                $('#fm').form('load',result);// reload the user data  
        }, 'json');
    }
    function editdata() {
        $("#fm").form("submit", {
            url: "/validate/admin/update",
            onsubmit: function () {
                return $(this).form("validate");
            },
            success: function (data) {
           	 var obj = jQuery.parseJSON(data);
                if (obj.result == "1") {
                    $.messager.alert("提示信息", "操作成功");
                    $("#dlg").dialog("close");
                    $("#tt").datagrid("load");
                }
                else {
                    $.messager.alert("提示信息", "操作失败");
                }
            }
        });
    }
    function usefulrow(data){
    	$.post('/validate/admin/active', { id: data.id }, function (result) {
            if (result.success) {
                $('#tt').datagrid('reload');// reload the user data  
            } else {
                $.messager.show({   // show error message  
                    title: 'Error',
                    msg: result.errorMsg
                });
            }
        }, 'json');
    }
    function unusefulrow(data){
    	$.post('/validate/admin/active', { id: data.id }, function (result) {
            if (result.success) {
                $('#tt').datagrid('reload');// reload the user data  
            } else {
                $.messager.show({   // show error message  
                    title: 'Error',
                    msg: result.errorMsg
                });
            }
        }, 'json');
    }
    function mostDelete(data){
    	var checkedItems = $('#tt').datagrid('getChecked');
    	var names='';
    	$.each(checkedItems, function(index, item){
    		names+=item.id+',';
    	});
    	$.messager.confirm('警告', '你确定删除这些用户吗?', function (r) {
            if (r) {
                $.post('/validate/admin/delete', { ids: names }, function (result) {
                    if (result.success) {
                        $('#tt').datagrid('reload');// reload the user data  
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
    
    function deleterow(data){
    	$.messager.confirm('警告', '你确定删除该用户吗?', function (r) {
            if (r) {
                $.post('/validate/admin/delete', { ids: data.id }, function (result) {
                    if (result.success) {
                        $('#tt').datagrid('reload');// reload the user data  
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
    function newpassword(){
    	$.messager.confirm('警告', '你确定重置该用户密码吗?', function (r) {
            if (r) {
                $.post('/validate/admin/newpassword', { id: $("#id").val() }, function (result) {
                    if (result.success) {
                    	$("#dlg").dialog("close");
                        $('#tt').datagrid('reload');// reload the user data  
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
           <label>用户名：</label> 
           <input name="username" id="username" class="easyui-validatebox" required="true"/> 
       </div>
       <div class="fitem" id="password" style="display: none;"> 
           <label>初始密码：</label> 
           <input name="initPassword" class="easyui-validatebox" value="" readonly="readonly"/><a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit" onclick="newpassword()" plain="true">重置</a> 
       </div> 
       <div class="fitem"> 
			<label>姓名:</label>
			<input name="name" class="easyui-validatebox" value=""></input>
       </div> 
       <div class="fitem"> 
			<label>出生日期：</label>
			<input name="birthDay" class="easyui-datebox" value=""></input>
       </div> 
       <div class="fitem"> 
			<label>电话:</label>
			<input name="phone" class="easyui-validatebox" value=""></input>
       </div>
       <div class="fitem"> 
			<label>邮箱:</label>
			<input name="email" class="easyui-validatebox" value=""></input>
       </div>
       <div class="fitem"> 
			<label>所属机构:</label>
			<input name="departmentName" id="departmentName" value=""></input>
       </div> 
       <input type="hidden" class="easyui-validatebox" name="id" id="id" value="" /> 
       </form> 
   </div>
</body>
</html>
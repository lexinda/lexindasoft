<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
    <link href="../../ui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/demo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../../ui/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../../ui/kindeditor/plugins/code/prettify.css" />
	<script src="../../ui/jquery.min.js" type="text/javascript"></script>
    <script src="../../ui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../ui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script charset="utf-8" src="../../ui/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="../../ui/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="../../ui/kindeditor/plugins/code/prettify.js"></script>
	<script>
		$(function(){
			$('#contenttable').datagrid({
		    	idField:'id',//不可修改
				iconCls:'icon-save',
		    	title:'新闻管理',
		    	url:'/validate/content/data?title=&status=-1&titleKey=&contentType=-1&page=-1',
		    	pagination:true,//分页控件  
		        rownumbers:true,//行号  
		    	toolbar:[{ 
				 		text: '标题关键字： <input type="text" id="titleq" name="titleq" style="width:100px;"></input>' 
				 	},{ 
				 		text: '关键字： <input type="text" id="titleKeyq" name="titleKeyq" style="width:100px;"></input>' 
				 	},{ 
				 		text: '是否发布： <select id="statusq" name="statusq" style="width:100px;"><option value="-1">全部</option><option value="0">否</option><option value="1">是</option></select>' 
				 	},{ 
				 		text: '所属菜单： <input type="text" id="contentTypeq" name="contentTypeq" style="width:150px;">' 
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
		    		{field:'title',title:'标题',width:'12%'}, 
		    		{field:'simpleTitle',title:'简约标题',width:'12%'}, 
		    		{field:'titleKey',title:'关键字',width:'12%'},
		    		{field:'contentType',title:'所属类型',width:'12%'},
		    		{field:'status',title:'状态',align:'center',width:'12%',formatter:function(value,row,index){
								if(row.status=='0'){
									var a = '<a href="#" id="'+row.id+'" onclick="unusefulrow(this)">下线</a>';
									return a;
								}else{
									var a = '<a href="#" id="'+row.id+'" onclick="usefulrow(this)">上线</a>';
									return a;
								}
						}},
					{field:'action',title:'操作',width:'12%',align:'center',formatter:function(value,row,index){
						var a = '<a href="#" id="'+row.id+'" onclick="editrow(this)">编辑</a>  ';
						var b = '<a href="#" id="'+row.id+'" onclick="deleterow(this)">删除</a>';
						return a+b;
					}}
		    	]] 
		    });
			$('#contentType').combotree({  
				url: '/validate/menu/querycombotreedata?menuName=',
		    	valueField: 'id',
	            textField: 'text',
		    	required: false,
		    	prerendered:true,
		    	onBeforeExpand:function(row){
			    		var url = '/validate/menu/querycombotreedata?menuName='+row.menuName; 
			    		$('#contentType').combotree('tree').tree('options').url = url; 
			    		return true; 
			    }
 		    });
			$('#contentTypeq').combotree({  
				url: '/validate/menu/querycombotreedata?menuName=',
		    	valueField: 'id',
	            textField: 'text',
		    	required: false,
		    	prerendered:true,
		    	onBeforeExpand:function(row){
			    		var url = '/validate/menu/querycombotreedata?menuName='+row.menuName; 
			    		$('#contentType').combotree('tree').tree('options').url = url; 
			    		return true; 
			    }
 		    });
			 //设置分页控件  
		    var p = $('#contenttable').datagrid('getPager');  
		    $(p).pagination({  
		        pageSize: 20,//每页显示的记录条数，默认为10 
		        showPageList:false,
		        //pageList: [5,10,15],//可以设置每页记录条数的列表  
		        beforePageText: '第',//页数文本框前显示的汉字  
		        afterPageText: '页    共 {pages} 页',  
		        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',  
		        onBeforeRefresh:function(){ 
		            $(this).pagination('loading'); 
		            //alert('before refresh'); 
		            $(this).pagination('loaded'); 
		        },
		       onRefresh:function(pageNumber,pageSize){
		           //alert(pageNumber);
		           //alert(pageSize);
		        },
		       onChangePageSize:function(){
		           //alert('pagesize changed');
		        },
		       onSelectPage:function(pageNumber,pageSize){
		           //alert(pageNumber+'------------');
		           //alert(pageSize);
		           var departmentId=$('#departmentIdq').combobox('getValue');
			   		if(departmentId==undefined){
			   			departmentId=-1;
			   		}else if(departmentId==""){
			   			departmentId=-1;
			   		}
			   		var title=$('#titleq').val();
			   		var titleKey=$('#titleKeyq').val();
			   		var status=$('#statusq').val();
			   		var contentType=$('#contentTypeq').val();
			   		$.post('/validate/content/data',{title:title,titleKey:titleKey,status:status,contentType:contentType,page:pageNumber},function(data){ 
			   			$('#admintable').datagrid('loadData',data); 
			   		},'json');
		        }
		    });  
		});
		/* KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : '../../ui/kindeditor/plugins/code/prettify.css',
				uploadJson : '',
				fileManagerJson : '',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		}); */
        function addrow(data){
        	$("#contentdlg").dialog({
            	open:true,
            	width:800,
            	height:430,
            	closed: false,  
            	cache: false,  
            	modal: true,
             	title:"新增内容",
             	draggable:false,
             	resizable:false,
             	onOpen:function(){
             	  KindEditor.create('textarea[name="content"]', {
             	  resizeType : 1
             	 });
             	},
             	onBeforeClose:function(){
             	  KindEditor.remove('textarea[name="content"]');
             	},
             	buttons:[{ 
             		text: '提交', 
             		iconCls: 'icon-ok', 
             		handler: function() { 
             			savedata();
             		} 
             		}, { 
             		text: '取消', 
             		handler: function() { 
             			$('#contentdlg').dialog('close');
             		} 
             	}]
             });
             $("#contentForm").form("clear");
        }
        function savedata() {
            $("#contentForm").form("submit", {
                url: "/validate/content/add",
                onsubmit: function () {
                    return $(this).form("validate");
                },
                success: function (data) {
               	 var obj = jQuery.parseJSON(data);
                    if (obj.result == "1") {
                        $.messager.alert("提示信息", "操作成功");
                        $("#contentdlg").dialog("close");
                        $("#contenttable").datagrid("load");
                    }
                    else {
                        $.messager.alert("提示信息", "操作失败");
                    }
                }
            });
        }
        function editrow(data){
        	$("#contentdlg").dialog({
            	open:true,
            	width:800,
            	height:430,
            	closed: false,  
            	cache: false,  
            	modal: true,
             	title:"查看用户",
             	onOpen:function(){
               	  KindEditor.create('textarea[name="content"]', {
               	  resizeType : 1
               	 });
               	},
               	onBeforeClose:function(){
               	  KindEditor.remove('textarea[name="content"]');
               	},
             	buttons:[{ 
             		text: '提交', 
             		iconCls: 'icon-ok', 
             		handler: function() { 
             			editdata();
             		} 
             		}, { 
             		text: '取消', 
             		handler: function() { 
             			$('#contentdlg').dialog('close');
             		} 
             	}]
             });
        	$.post('/validate/content/info', { id: data.id }, function (result) {
                    $('#contentForm').form('load',result);// reload the user data  
            }, 'json');
        }
        function editdata() {
            $("#contentForm").form("submit", {
                url: "/validate/content/update",
                onsubmit: function () {
                    return $(this).form("validate");
                },
                success: function (data) {
               	 var obj = jQuery.parseJSON(data);
                    if (obj.result == "1") {
                        $.messager.alert("提示信息", "操作成功");
                        $("#contentdlg").dialog("close");
                        $("#contenttable").datagrid("load");
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
                    $('#admintable').datagrid('reload');// reload the user data  
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
                    $('#admintable').datagrid('reload');// reload the user data  
                } else {
                    $.messager.show({   // show error message  
                        title: 'Error',
                        msg: result.errorMsg
                    });
                }
            }, 'json');
        }
        function mostDelete(data){
        	var checkedItems = $('#admintable').datagrid('getChecked');
        	var names='';
        	$.each(checkedItems, function(index, item){
        		names+=item.id+',';
        	});
        	$.messager.confirm('警告', '你确定删除这些用户吗?', function (r) {
                if (r) {
                    $.post('/validate/admin/delete', { ids: names }, function (result) {
                        if (result.success) {
                            $('#admintable').datagrid('reload');// reload the user data  
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
                            $('#admintable').datagrid('reload');// reload the user data  
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
	<table id="contenttable"></table> 
	<div id="contentdlg"> 
	<form id="contentForm" method="post">
		<table cellpadding="5">
        	<tr>
            	<td>文章标题：</td>
                <td><input class="easyui-textbox" type="text" name="title" data-options="required:true" style="width: 300px;" value=""></input></td>
            </tr>
            <tr>
            	<td>简略标题：</td>
                <td><input class="easyui-textbox" type="text" name="simpleTitle" data-options="required:true" value=""></input></td>
            </tr>
            <tr>
            	<td>关键字：</td>
                <td><input class="easyui-textbox" type="text" name="titleKey" data-options="required:true" value=""></input></td>
            </tr>
            <tr>
            	<td>文章分类：</td>
                <td>
                	 <input name="contentType" id="contentType" class="easyui-textbox" data-options="required:true" value=""/> 
                </td>
           </tr>
			<tr>
            	<td>文章内容：</td>
                <td><textarea name="content" cols="100" rows="8" style="width:400px;height:300px;visibility:hidden;"></textarea></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
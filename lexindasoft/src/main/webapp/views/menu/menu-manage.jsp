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
    <script src="../../ui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <link href="../../ui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/icon.css" rel="stylesheet" type="text/css" />
    <style type="text/css"> 
        #menufm 
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
    		 $('#menutable').treegrid({
    			 /*{ 
    			 text: '请选择<select size="1" id="select" name="select"><option>广州</option><option>深圳</option></select>' 
    			 }, 
    			 */ 
 			    url:'/validate/menu/data?menuName=',  
 			 	idField:'id',//修改会出错
 			 	title:'菜单',
 			 	iconCls:'icon-save',
 			 	toolbar:[{ 
 			 		text: '机构名称： <select id="menuNameq" name="menuNameq" style="width:200px;"></select>' 
 			 	}, { 
 			 		id: 'searchBtn', 
 			 		text: '查询', 
 			 		iconCls:'icon-search', 
 			 		handler: function(){ 
 			 		query(); 
 			 	} 
 			 	}],
 			 	fit:'true',
 			    treeField:'menuName', 
 			    columns:[[  
 			        {title:'菜单名称',field:'menuName',width:'30%'},  
 			        {field:'menuUrl',title:'访问链接',width:'30%'},  
 			       	{field:'action',title:'操作',width:'30%',align:'center',
 						formatter:function(value,row,index){
 								var a = '<a href="#" menuId="'+row.id+'" menuName="'+row.menuName+'"  onclick="newrow(this)">新增</a> ';
 								var e = '<a href="#" menuId="'+row.id+'" onclick="editrow(this)">编辑</a> ';
 								if(row.state=='open'){
 									if(row.id==-1){
 										return a;
 									}else{
 										var d = '<a href="#" menuId="'+row.id+'" onclick="deleterow(this)">删除</a>';
 										return a+e+d;
 									}
 								}else{
 									return a+e;
 								}
 						}
 					}
 			    ]],
 			   onBeforeExpand:function(row){
 		    		var url = '/validate/menu/data?menuName='+row.menuName; 
 		    		$('#menutable').treegrid('options').url = url; 
 		    		return true; 
 		    	}
 			});  
    		 $('#menuNameq').combobox({  
 		        //url:urlStr,  
 		        valueField:'menuName',  
 		        textField:'menuName',  
 		        onChange:function (newValue, oldValue){  
 		            if(newValue !=null){  
 		                //alert(newValue+oldValue);  
 		                $("#menuNameq").combobox("reload","/validate/menu/getComboxdata?menuName="+newValue); //encodeURIComponent(newValue));  
 		            }  
 		        }  
 		    });  
    	});
    	function query(){ 
    		var menuName=$('#menuNameq').combobox('getValue');
    		if(menuName==undefined){
    			menuName="";
    		}
    		$.post('/validate/menu/searchdata',{menuName:menuName},function(data){ 
    			$('#menutable').treegrid('loadData',data); 
    		},'json'); 
    	} 
    	
    	 var url;
         var type;
         function newrow(target) {
        	var data = target.attributes;
        	var menuId=data.getNamedItem("menuId").value;
        	var	menuName=data.getNamedItem("menuName").value;
             $("#menudlg").dialog({
            	open:true,
            	width:400,
            	height:300,
            	closed: false,  
            	cache: false,  
            	modal: true,
             	title:menuName,
             	buttons:[{ 
             		text: '提交', 
             		iconCls: 'icon-ok', 
             		handler: function() { 
             			savedata();
             		} 
             		}, { 
             		text: '取消', 
             		handler: function() { 
             			$('#menudlg').dialog('close');
             		} 
             	}]
             });
             $("#menufm").form("clear");
             $("#parentId").val(menuId);
         }
         function editrow(target) {
        	 var data = target.attributes;
        	 var menuId=data.getNamedItem("menuId").value;
        	 var menuName=data.getNamedItem("menuName").value;
        	 var menuDesc=data.getNamedItem("menuDesc").value;
        	 $("#menudlg").dialog({
              	open:true,
              	width:400,
              	height:300,
              	closed: false,  
              	cache: false,  
              	modal: true,
               	title:menuName,
               	buttons:[{ 
             		text: '提交', 
             		iconCls: 'icon-ok', 
             		handler: function() { 
             			editdata();
             		} 
             		}, { 
             		text: '取消', 
             		handler: function() { 
             			$('#menudlg').dialog('close');
             		} 
             	}]
               });
        	 $("#menufm").form('load',{parentId:menuId,menuName:menuName,menuDesc:menuDesc});
         }
         function savedata() {
             $("#menufm").form("submit", {
                 url: "/validate/menu/add",
                 onsubmit: function () {
                     return $(this).form("validate");
                 },
                 success: function (data) {
                	 var obj = jQuery.parseJSON(data);
                     if (obj.result == "1") {
                         $.messager.alert("提示信息", "操作成功");
                         $("#menudlg").dialog("close");
                         $.post('/validate/menu/searchdata',{menuName:null},function(data){ 
                  			$('#menutable').treegrid('loadData',data); 
                  		},'json');
                     }
                     else {
                         $.messager.alert("提示信息", "操作失败");
                     }
                 }
             });
         }
         function editdata() {
             $("#menufm").form("submit", {
                 url: "/validate/menu/update",
                 onsubmit: function () {
                     return $(this).form("validate");
                 },
                 success: function (data) {
                	 var obj = jQuery.parseJSON(data);
                     if (obj.result == "1") {
                         $.messager.alert("提示信息", "操作成功");
                         $("#menudlg").dialog("close");
                         $.post('/validate/menu/searchdata',{menuName:null},function(data){ 
                  			$('#menutable').treegrid('loadData',data); 
                  		},'json');
                     }
                     else {
                         $.messager.alert("提示信息", "操作失败");
                     }
                 }
             });
         }
         function deleterow(target) {
        	 var data = target.attributes;
        	 var menuId=data.getNamedItem("menuId").value;
        	 $.messager.confirm('警告', '你确定删除此组织机构吗?', function (r) {
                 if (r) {
                     $.post('/validate/menu/delete', { id: menuId }, function (result) {
                         if (result.success) {
                        	 $.post('/validate/menu/searchdata',{menuName:null},function(data){ 
                     			$('#menutable').treegrid('loadData',data); 
                     		},'json');// reload the user data  
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
	<table id="menutable"></table>
	
	<div id="menudlg"> 
       <form id="menufm" method="post"> 
       <div class="ftitle"> 
           	信息编辑 
       </div> 
       <div class="fitem"> 
           <label>菜单名称：</label> 
           <input name="menuName" id="departmentName" class="easyui-validatebox" required="true" value=""/> 
       </div> 
       <div class="fitem"> 
			<label>菜单链接:</label>
			<input name="menuUrl" class="easyui-validatebox" required="true" value=""></input>
       </div>
       <div class="fitem"> 
			<label>菜单方法名:</label>
			<input name="menuMethod" class="easyui-validatebox" required="true" value=""></input>
       </div> 
       <input type="hidden" name="parentId" id="parentId" value="" /> 
       </form> 
   </div>
</body>
</html>
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
    		$('#dg').datagrid({
    		    url:'/validate/log/searchlist?page=0',
    		    toolbar: '#tb',
    		    columns:[[
    		        {field:'userid',title:'用户id',width:'20%'},
    		        {field:'content',title:'描述',width:'20%'},
    		        {field:'operation',title:'操作类型',width:'20%',align:'right',formatter:function(value){
                        if(value=='1'){
                            return '<font color=red>新增数据</font>';
                        }else if(value=='2'){
                            return '<font color=red>修改数据</font>';
                        }else if(value=='3'){
                            return '<font color=red>删除数据</font>';
                        }else if(value=='4'){
                            return '<font color=green>访问菜单</font>';
                        }
                    }},
    		        {field:'logip',title:'访问的ip',width:'20%',align:'right'},
    		        {field:'createdate',title:'访问时间',width:'20%',align:'right',
    		        	formatter:function(value){
    		        		return fomatDate(value);
    		        	}
    		        }
    		    ]]
    		});
    	});
    	//时间格式化
    	Date.prototype.format = function (format) {
	    	if (!format) {
	    		format = "yyyy-MM-dd hh:mm:ss";
	    	}
	    	var o = {
		    	"M+": this.getMonth() + 1, // month
		    	"d+": this.getDate(), // day
		    	"h+": this.getHours(), // hour
		    	"m+": this.getMinutes(), // minute
		    	"s+": this.getSeconds(), // second
		    	"q+": Math.floor((this.getMonth() + 3) / 3), // quarter
		    	"S": this.getMilliseconds()
		    	// millisecond
	    	};
	    	if (/(y+)/.test(format)) {
	    		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    	}
	    	for (var k in o) {
		    	if (new RegExp("(" + k + ")").test(format)) {
		    		format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
		    	}
	    	}
	    	return format;
    	};
    	function fomatDateTime(str) {
    		return (new Date(str)).format("yyyy-MM-dd hh:mm:ss");
    	}

    	function fomatDate(str) {
    		return (new Date(str)).format("yyyy-MM-dd");
    	}
    </script>
</head>
<body>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			日志开始时间: <input class="easyui-datebox" style="width:80px"/>
			日志结束时间: <input class="easyui-datebox" style="width:80px"/>
			操作类型: 
			<input class="easyui-combobox" style="width:100px"
					url="data/combobox_data.json"
					valueField="id" textField="text"/>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
		</div>
	</div>
	<table id="dg"></table>
</body>
</html>
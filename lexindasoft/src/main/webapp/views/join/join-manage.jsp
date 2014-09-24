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
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="workDuty"]', {
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
			var editor2 = K.create('textarea[name="workRequire"]', {
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
		});
        function submitForm(){
            $('#ff').form('submit');
        }
        function clearForm(){
            $('#ff').form('clear');
        }
    </script>
</head>
<body>
	<%=htmlData%>
	<form id="ff" name="ff" method="post" action="demo.jsp">
		<table cellpadding="5">
        	<tr>
            	<td>工作地点：</td>
                <td>
                	<select class="easyui-combobox" name="workArea" data-options="required:true">
                		<option value="-1" selected="selected">请选择</option>
                		<option value="1">武汉</option>
                		<option value="2">洛阳</option>
                	</select>
                </td>
            </tr>
            <tr>
            	<td>职位分类：</td>
                <td>
                	<select class="easyui-combobox" name="workType" data-options="required:true">
                		<option value="-1" selected="selected">请选择</option>
                		<option value="1">技术类</option>
                		<option value="2">产品/项目类</option>
                		<option value="3">设计类</option>
                		<option value="4">市场类</option>
                		<option value="5">职能类</option>
                		<option value="6">内容编辑类</option>
                		<option value="7">客户服务类</option>
                	</select>
                </td>
            </tr>
            <tr>
            	<td>职位名称：</td>
                <td><input class="easyui-textbox" type="text" name="workName" data-options="required:true"></input></td>
            </tr>
            <tr>
            	<td>招聘人数：</td>
                <td><input class="easyui-textbox" type="text" name="workPeopleNum" data-options="required:true"></input></td>
            </tr>
            <tr>
            	<td>工作职责：</td>
                <td><textarea name="workDuty" cols="100" rows="8" style="width:400px;height:300px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
			</tr>
           	<tr>
            	<td>工作要求：</td>
                <td><textarea name="workRequire" cols="100" rows="8" style="width:400px;height:300px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
			</tr>
		</table>
	</form>
	<div style="text-align:center;padding:5px;margin-left: 10px;">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" iconCls="icon-save" >提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" iconCls="icon-reload">重置</a>
    </div>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
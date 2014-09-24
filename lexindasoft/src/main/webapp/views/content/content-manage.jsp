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
			var editor1 = K.create('textarea[name="content1"]', {
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
            	<td>文章标题：</td>
                <td><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width: 400px;"></input></td>
            </tr>
            <tr>
            	<td>简略标题：</td>
                <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
            </tr>
            <tr>
            	<td>关键字：</td>
                <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
            </tr>
            <tr>
            	<td>文章分类：</td>
                <td>
                	<select class="easyui-combobox" name="newsType" >
                		<option value="-1" selected="selected">请选择</option>
                		<option value="1">公司新闻</option>
                		<option value="2">业内动态</option>
                	</select>
                </td>
           </tr>
			<tr>
            	<td>文章内容：</td>
                <td><textarea name="content1" cols="100" rows="8" style="width:700px;height:400px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
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
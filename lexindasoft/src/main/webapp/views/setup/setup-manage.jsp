<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<% String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理</title>
	<script src="../../ui/jquery.min.js" type="text/javascript"></script>
    <script src="../../ui/jquery.easyui.min.js" type="text/javascript"></script>
     <script src="../../ui/jquery.form.min.js" type="text/javascript"></script>
    <script src="../../ui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <link href="../../ui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="../../ui/themes/demo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    $(function(){
    	$('#ImgLogoForm').ajaxForm({ 
		    dataType:  'json', 
		    success:   function(rsp){
		    	var imagePath = rsp.imagePath;
	    		var status = rsp.status;
	    		if(status==1){
	    			$("#logoDiv").html('<img class="item-img" src="<%=basePath%>'+imagePath+'" />'+
	    					'<input type="hidden" id="uploadLogoImg" name="uploadLogoImg" value="<%=basePath%>'+imagePath+'"/>'+
							'<a href="#" id="uploadLogo" name="uploadLogo" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImgLogo()">上传图片</a>');
	    		}else{
	    			$("#imgLogoText").text("上传失败！");
	    		}	
	    		$("#uploadLogoInfo").val("");
		    } 
		});
    }).on("change", "#uploadLogoInfo", function(){
		$('#ImgLogoForm').submit();
	});
    function selectImgLogo(){
		$("#uploadLogoInfo").click();
	}
    </script>
</head>
<body>
			
       		<table cellpadding="5">
                <tr>
                    <td>公司logo：</td>
                    <td>
                    	<div id="logoDiv">
                    		<img src="<%=basePath%>/ui/setup/logo.png" />
							<a href="#" id="uploadLogo" name="uploadLogo" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImgLogo()">上传图片</a>
							<span id="imgLogoText" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
                <tr>
                    <td>首页滚动图片1：</td>
                    <td><div id="logoDiv">
			   				<input class="span2" type="button" id="uploadLogo" name="uploadLogo" value="选择图片" onclick="selectImgLogo()"/>
							<span id="imgLogoText" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
                <tr>
                    <td>首页滚动图片2：</td>
                    <td><div id="logoDiv">
			   				<input class="span2" type="button" id="uploadLogo" name="uploadLogo" value="选择图片" onclick="selectImgLogo()"/>
							<span id="imgLogoText" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
                <tr>
                    <td>首页滚动图片3：</td>
                    <td><div id="logoDiv">
			   				<input class="span2" type="button" id="uploadLogo" name="uploadLogo" value="选择图片" onclick="selectImgLogo()"/>
							<span id="imgLogoText" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
            </table>
       <div style="display:none">
			<form id="ImgLogoForm" action="/validate/setup/imglogoupload" method="post" enctype="multipart/form-data">
				<input id="uploadLogoInfo" type="file" name="uploadLogo" />
			</form>
		</div>
</body>
</html>
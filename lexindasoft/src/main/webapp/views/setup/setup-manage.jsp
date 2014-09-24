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
    
    $(function(){
    	$('#Img1Form').ajaxForm({ 
		    dataType:  'json', 
		    success:   function(rsp){
		    	var imagePath = rsp.imagePath;
	    		var status = rsp.status;
	    		if(status==1){
	    			$("#img1Div").html('<img class="item-img" src="<%=basePath%>'+imagePath+'" />'+
	    					'<input type="hidden" id="uploadImg1" name="uploadImg1" value="<%=basePath%>'+imagePath+'"/>'+
							'<a href="#" id="uploadImage1" name="uploadImage1" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImg1()">上传图片</a>');
	    		}else{
	    			$("#img1Text").text("上传失败！");
	    		}	
	    		$("#uploadImage1Info").val("");
		    } 
		});
    }).on("change", "#uploadImage1Info", function(){
		$('#Img1Form').submit();
	});
    function selectImg1(){
		$("#uploadImage1Info").click();
	}
    
    $(function(){
    	$('#Img2Form').ajaxForm({ 
		    dataType:  'json', 
		    success:   function(rsp){
		    	var imagePath = rsp.imagePath;
	    		var status = rsp.status;
	    		if(status==1){
	    			$("#img2Div").html('<img class="item-img" src="<%=basePath%>'+imagePath+'" />'+
	    					'<input type="hidden" id="uploadImg2" name="uploadImg2" value="<%=basePath%>'+imagePath+'"/>'+
							'<a href="#" id="uploadImage2" name="uploadImage2" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImg2()">上传图片</a>');
	    		}else{
	    			$("#img2Text").text("上传失败！");
	    		}	
	    		$("#uploadImage2Info").val("");
		    } 
		});
    }).on("change", "#uploadImage2Info", function(){
		$('#Img2Form').submit();
	});
    function selectImg2(){
		$("#uploadImage2Info").click();
	}
    
    $(function(){
    	$('#Img3Form').ajaxForm({ 
		    dataType:  'json', 
		    success:   function(rsp){
		    	var imagePath = rsp.imagePath;
	    		var status = rsp.status;
	    		if(status==1){
	    			$("#img3Div").html('<img class="item-img" src="<%=basePath%>'+imagePath+'" />'+
	    					'<input type="hidden" id="uploadImg3" name="uploadImg3" value="<%=basePath%>'+imagePath+'"/>'+
							'<a href="#" id="uploadImage3" name="uploadImage3" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImg3()">上传图片</a>');
	    		}else{
	    			$("#img2Text").text("上传失败！");
	    		}	
	    		$("#uploadImage3Info").val("");
		    } 
		});
    }).on("change", "#uploadImage3Info", function(){
		$('#Img3Form').submit();
	});
    function selectImg3(){
		$("#uploadImage3Info").click();
	}
    </script>
</head>
<body>
			
       		<table cellpadding="5">
                <tr>
                    <td>公司logo：</td>
                    <td>
                    	<div id="logoDiv">
                    		<img src="<%=basePath%>/ui/setup/logo.jpg" />
							<a href="#" id="uploadLogo" name="uploadLogo" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImgLogo()">上传图片</a>
							<span id="imgLogoText" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
                <tr>
                    <td>首页滚动图片1：</td>
                    <td><div id="img1Div">
                    		<img src="<%=basePath%>/ui/setup/img1.jpg" />
			   				<a href="#" id="uploadImage1" name="uploadImage1" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImg1()">上传图片</a>
							<span id="uploadImage1Text" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
                <tr>
                    <td>首页滚动图片2：</td>
                    <td><div id="img2Div">
                    		<img src="<%=basePath%>/ui/setup/img2.jpg" />
			   				<a href="#" id="uploadImage2" name="uploadImage2" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImg2()">上传图片</a>
							<span id="uploadImage2Text" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
                <tr>
                    <td>首页滚动图片3：</td>
                    <td><div id="img3Div">
                    		<img src="<%=basePath%>/ui/setup/img3.jpg" />
			   				<a href="#" id="uploadImage3" name="uploadImage3" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectImg3()">上传图片</a>
							<span id="uploadImage3Text" style="color: red;"></span>
			   			</div>
			   		</td>
                </tr>
            </table>
       <div style="display:none">
			<form id="ImgLogoForm" action="/validate/setup/imglogoupload" method="post" enctype="multipart/form-data">
				<input id="uploadLogoInfo" type="file" name="uploadLogo" />
			</form>
			<form id="Img1Form" action="/validate/setup/img1load" method="post" enctype="multipart/form-data">
				<input id="uploadImage1Info" type="file" name="uploadImage1Info" />
			</form>
			<form id="Img2Form" action="/validate/setup/img2load" method="post" enctype="multipart/form-data">
				<input id="uploadImage2Info" type="file" name="uploadImage2Info" />
			</form>
			<form id="Img3Form" action="/validate/setup/img3load" method="post" enctype="multipart/form-data">
				<input id="uploadImage3Info" type="file" name="uploadImage3Info" />
			</form>
		</div>
</body>
</html>
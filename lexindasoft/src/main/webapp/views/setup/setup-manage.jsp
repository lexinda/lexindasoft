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
    	$('#ImgLogoForm').ajaxForm({ 
		    dataType:  'json', 
		    success:   function(rsp){
		    	var imagePath = rsp.imagePath;
	    		var status = rsp.status;
	    		if(status==1){
	    			$("#logoDiv").html('<img class="item-img" src="<%=basePath%>'+imagePath+'" />'+
	    					'<input type="hidden" id="uploadLogoImg" name="uploadLogoImg" value="<%=basePath%>'+imagePath+'"/>'+
							'<input class="span2" type="button" id="uploadLogo" name="uploadLogo" value="选择图片" onclick="selectImgLogo()"/>');
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
       <div id="setupfm"> 
	       <div class="ftitle"> 
	           	信息编辑 
	       </div> 
	       <div class="fitem"> 
	           <label>公司logo：</label> 
	           <div id="logoDiv">
			   	<input class="span2" type="button" id="uploadLogo" name="uploadLogo" value="选择图片" onclick="selectImgLogo()"/>
				<span id="imgLogoText" style="color: red;"></span>
			   </div>
	       </div>
	       <div class="fitem"> 
	           <label>首页滚动图片1：</label> 
	           <input type="file" name="uploadImg1" id="uploadImg1"  class="easyui-validatebox" validType="fileType['BMP|GIF|JPG|JPEG|ICO|PNG|TIF']" required="true" invalidMessage="请选择(BMP|GIF|JPG|JPEG|ICO|PNG|TIF)等格式的图片"/>
	       </div> 
	       <div class="fitem"> 
				<label>首页滚动图片2:</label>
				<input type="file" name="uploadImg2" id="uploadImg2"  class="easyui-validatebox" validType="fileType['BMP|GIF|JPG|JPEG|ICO|PNG|TIF']" required="true" invalidMessage="请选择(BMP|GIF|JPG|JPEG|ICO|PNG|TIF)等格式的图片"/>
	       </div> 
	       <div class="fitem"> 
				<label>首页滚动图片3：</label>
				<input type="file" name="uploadImg3" id="uploadImg3"  class="easyui-validatebox" validType="fileType['BMP|GIF|JPG|JPEG|ICO|PNG|TIF']" required="true" invalidMessage="请选择(BMP|GIF|JPG|JPEG|ICO|PNG|TIF)等格式的图片"/>
	       </div> 
       </div> 
       <div style="display:none">
			<form id="ImgLogoForm" action="/validate/setup/imglogoupload" method="post" enctype="multipart/form-data">
				<input id="uploadLogoInfo" type="file" name="uploadLogo" />
			</form>
		</div>
</body>
</html>
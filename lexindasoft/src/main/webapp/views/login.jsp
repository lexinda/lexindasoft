<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>风险管理平台</title>
<link href="../dwz/themes/css/login.css" rel="stylesheet" type="text/css" />
<script src="../dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="../dwz/js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
  function reloadcode(){
  	var verify=document.getElementById('code');
  	verify.setAttribute('src','/views/makeCertPic.jsp?it='+Math.random());
  }
  $(function(){
	  $("#error").text("");
	  if("${error}" == 1){
		  $("#error").text("验证码错误！");
	  }
	  if("${error}" == 2){
		  $("#error").text("用户名或密码错误！");
	  }
  });
  
  $("#submitBtn").live("click", function(){
	  if(checkSubmit()){
		  $("#loginForm").submit();
	  }
	});
  
  function checkSubmit(){
	  $("#error").text("");
	  if($("#username").val()==''){
		  $("#error").text("用户名不能为空！");
		  return false;
	  }else if($("#password").val()==''){
		  $("#error").text("密码不能为空！");
		  return false;
	  }else if($("#code").val()==''){
		  $("#error").text("验证码不能为空！");
		  return false;
	  }else{
		  return true;
	  }
  }
</script>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<a href="http://demo.dwzjs.com"><img src="../dwz/themes/default/images/login_logo.gif" /></a>
			</h1>
			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li><a href="#">设为首页</a></li>
						<li><a href="http://bbs.dwzjs.com">反馈</a></li>
						<li><a href="doc/dwz-user-guide.pdf" target="_blank">帮助</a></li>
					</ul>
				</div>
				<h2 class="login_title"><img src="../dwz/themes/default/images/login_title.png" /></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
				<form action="/login" id="loginForm" method="post">
					<span id="error" style="color:red;margin-left: 80px;"></span>
					<p>
						<label>用户名：</label>
						<input type="text" id="username" name="username" size="20" class="login_input" />
					</p>
					<p>
						<label>密码：</label>
						<input type="password" id="password" name="password" size="20" class="login_input" />
					</p>
					<p>
						<label>验证码：</label>
						<input class="code" id="code" name="code" type="text" size="5" />
						<span><img src="/views/makeCertPic.jsp" onclick="reloadcode()" style="cursor: pointer;" alt="看不清楚,换一张"/></span>
					</p>
					<div class="login_bar">
						<button class="sub" type="button" id="submitBtn" />
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="../dwz/themes/default/images/login_banner.jpg" /></div>
			<div class="login_main">
				<ul class="helpList">
					<li><a href="#">下载驱动程序</a></li>
					<li><a href="#">如何安装密钥驱动程序？</a></li>
					<li><a href="#">忘记密码怎么办？</a></li>
					<li><a href="#">为什么登录失败？</a></li>
				</ul>
				<div class="login_inner">
					<p>您可以使用 网易网盘 ，随时存，随地取</p>
					<p>您还可以使用 闪电邮 在桌面随时提醒邮件到达，快速收发邮件。</p>
					<p>在 百宝箱 里您可以查星座，订机票，看小说，学做菜…</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2014 www.lexindasoft.com Inc. All Rights Reserved.
		</div>
	</div>
</body>
</html>
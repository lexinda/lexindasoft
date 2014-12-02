<%@ page pageEncoding= "UTF-8" %>
<%@ page contentType= "text/html; charset=UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
  	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<%=basePath%>ui/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>ui/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="<%=basePath%>ui/bootstrap/css/accordion.css">
	<link rel="stylesheet" href="<%=basePath%>ui/bootstrap/css/primary-blue.css">
	<style type="text/css">
		body{
			background: #f5f5f5;color:#000; font-size:12px;
		}
		#myCarousel .carousel-inner{
			max-height:400px;
		}
		nav{
			padding-top:15px;
			/* padding-left: 20%; */
		}
		nav ul li{
			min-width: 150px;
		}
		.topDiv{
			height: 30px;
			background-color: black;
		}
		.bs-docs-sidenav.affix {
			top: 40px;
		}
	
		/*  >表示第一个子元素  */
		.bs-docs-sidenav > li:first-child > a {
			-webkit-border-radius: 6px 6px 0 0;
			-moz-border-radius: 6px 6px 0 0;
			border-radius: 6px 6px 0 0;
		}
		.bs-docs-sidenav > li > a {
			display: block;
			width: 190px \9;
			margin: 0 0 -1px;
			padding: 8px 14px;
			border: 1px solid #e5e5e5;
		}
	
		.bs-docs-sidenav {
			width: 228px;
			margin: 30px 0 0;
			padding: 0;
			background-color: #fff;
			-webkit-border-radius: 6px;
			-moz-border-radius: 6px;
			border-radius: 6px;
			-webkit-box-shadow: 0 1px 4px rgba(0,0,0,.065);
			-moz-box-shadow: 0 1px 4px rgba(0,0,0,.065);
			box-shadow: 0 1px 4px rgba(0,0,0,.065);
		}
	
		.bs-docs-sidenav .icon-chevron-right {
			float: right;
			margin-top: 2px;
			margin-right: -6px;
			opacity: .25;
		}
		.bs-arrows:after {
			position:absolute;
			top:12px;
			right:15px;
			width:12px;
			height:12px;
			background:url(<%=basePath%>ui/bootstrap/images/arrows.png) -12px 0;
			content:"";
		}
		#leftNav .active {
			color: black;
			background-color: #FF6B45;
			-webkit-border-radius: 6px;
			-moz-border-radius: 6px;
			border-radius: 6px;
			-webkit-box-shadow: 0 1px 4px rgba(0,0,0,.065);
			-moz-box-shadow: 0 1px 4px rgba(0,0,0,.065);
			box-shadow: 0 1px 4px rgba(0,0,0,.065);	
		}
		.footer{
			color:#777;
			padding:30px 0;
			border-top:1px solid #e5e5e5;
			margin-top:10px
		}
		.footer a{
			color:#777
		}
		.footer-top .about>div{
			height:110px;margin-bottom:10px
		}
		.footer-top .about>div h4{
			color:#563d7c;font-size:16px
		}
		.footer-bottom{
			font-size:13px
		}
		.footer-bottom ul>li{
			padding:0
		}
		.footer-bottom ul>li+li:before{
			padding:0 10px;color:#ccc;content:"|"
		}
	</style>
	<script src="<%=basePath%>ui/jquery.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>ui/bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('#leftNav li').click(function(e) {
				$('#leftNav li').removeClass('active');
				//$(e.target).addClass('active');
				$(this).addClass('active');
			});
		});
	</script>
  </head>
  <body>
	<aside class="top-aside clearfix">
         <div class="center-wrap">
            <div class="one_half">
               <div class="sidebar-widget">
                  <ul class="custom-menu">
                     <li class="current-menu-item"><a href="index.html">Home</a></li>
                     <li><a href="page-template-team-members.html">Team</a></li>
                     <li><a href="page-template-sitemap.html">Sitemap</a></li>
                     <li><a href="content-color-autumn.html">Colors</a></li>
                     <li><a href="page-template-shortcodelist.html">Shortcodes</a></li>
                     <li><a href="page-template-homepage-lightbox-hero.html">Pages</a></li>
                  </ul>
               </div>
            </div>
            <!-- END top-toolbar-left -->
            <div class="one_half">
               <div class="sidebar-widget">
                  <ul class="social_icons">
                     <li><a href="http://themes.truethemes.net/Sterling/feed" class="rss">RSS</a></li>
                     <li><a href="http://www.twitter.com/truethemes" class="twitter">Twitter</a></li>
                     <li><a href="http://www.facebook.com/truethemes" class="facebook">Facebook</a></li>
                     <li><a href="mailto:themes@truethemes.net" class="email">Email</a></li>
                  </ul>
               </div>
            </div>
            <!-- END top-toolbar-right -->
         </div>
         <!-- END center-wrap -->
         <div class="top-aside-shadow"></div>
      </aside>
  	<nav class="navbar navbar-default" role="navigation">
  		<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" 
				         data-target="#example-navbar-collapse">
				         <span class="sr-only">切换导航</span>
				         <span class="icon-bar"></span>
				         <span class="icon-bar"></span>
				         <span class="icon-bar"></span>
				      </button>
					<a class="navbar-brand" href="#">W3Cschool</a>
				</div>
				<div class="center">
					<div class="collapse navbar-collapse" id="example-navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">one</a></li>
							<li><a href="#">two</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">three <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">four</a></li>
									<li><a href="#">five</a></li>
									<li><a href="#">Jasper Report</a></li>
									<li class="divider"></li>
									<li><a href="#">分离的链接</a></li>
									<li class="divider"></li>
									<li><a href="#">另一个分离的链接</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
		</div>
	</nav>
	<div class="container" style="margin-top: 10px;">
		<ul class="nav nav-list bs-docs-sidenav affix-top" id="leftNav">
			<li class="active">
				<a href="#overview" class="bs-arrows"><i class="icon-chevron-right"></i> 概览</a>
			</li>
			<li class="">
				<a href="#transitions" class="bs-arrows"><i class="icon-chevron-right"></i> 过渡效果</a>
			</li>
			<li class="">
				<a href="#modals" class="bs-arrows"><i class="icon-chevron-right"></i> 模态对话框</a>
			</li>
			<li class="">
				<a href="#dropdowns" class="bs-arrows"><i class="icon-chevron-right"></i> 下拉菜单</a>
			</li>
			<li>
				<a href="#scrollspy" class="bs-arrows"><i class="icon-chevron-right"></i> 滚动监听</a>
			</li>
			<li class="">
				<a href="#tabs" class="bs-arrows"><i class="icon-chevron-right"></i> 标签页</a>
			</li>
		</ul>
    </div>
	<footer class="footer ">
  <div class="container">
    <div class="row footer-top">
      <div class="col-sm-6 col-lg-6">
        <h4>
          <img src="http://static.bootcss.com/www/assets/img/logo.png">
        </h4>
        <p>本网站所列开源项目的中文版文档全部由<a href="http://www.bootcss.com/">Bootstrap中文网</a>成员翻译整理，并全部遵循 <a href="http://creativecommons.org/licenses/by/3.0/" target="_blank">CC BY 3.0</a>协议发布。</p>
      </div>
      <div class="col-sm-6  col-lg-5 col-lg-offset-1">
        <div class="row about">
          <div class="col-xs-3">
            <h4>关于</h4>
            <ul class="list-unstyled">
              <li><a href="/about/">关于我们</a></li>
              <li><a href="/ad/">广告合作</a></li>
              <li><a href="/links/">友情链接</a></li>
            </ul>
          </div>
          <div class="col-xs-3">
            <h4>联系方式</h4>
            <ul class="list-unstyled">
              <li><a href="http://weibo.com/bootcss" title="Bootstrap中文网官方微博" target="_blank">新浪微博</a></li>
              <li><a href="mailto:admin@bootcss.com">电子邮件</a></li>
            </ul>
          </div>
          <div class="col-xs-3">
            <h4>旗下网站</h4>
            <ul class="list-unstyled">
              <li><a href="http://www.golaravel.com/" target="_blank">Laravel中文网</a></li>
              <li><a href="http://www.ghostchina.com/" target="_blank">Ghost中国</a></li>
            </ul>
          </div>
          <div class="col-xs-3">
            <h4>赞助商</h4>
            <ul class="list-unstyled">
              <li><a href="https://www.upyun.com" target="_blank">又拍云</a></li>
            </ul>
          </div>
        </div>

      </div>
    </div>
    <hr/>
    <div class="row footer-bottom">
      <ul class="list-inline text-center">
        <li><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备11008151号</a></li><li>京公网安备11010802014853</li>
      </ul>
    </div>
  </div>
</footer>
	
  </body>
</html>
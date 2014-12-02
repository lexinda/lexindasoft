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
			$("#myCarousel").carousel('cycle');
		});
	</script>
  </head>
  <body>
	  <div class="topDiv">
	  </div>
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
	<div class="container-fluid" style="margin-top: -10px;">
		<div id="myCarousel" class="carousel slide">
		   <!-- 轮播（Carousel）指标 -->
		   <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		   </ol>   
		   <!-- 轮播（Carousel）项目 -->
		   <div class="carousel-inner">
		      <div class="item active">
		         <img src="http://www.w3cschool.cc/wp-content/uploads/2014/07/slide1.png" width="100%" alt="First slide">
		         <div class="carousel-caption">标题 1</div>
		      </div>
		      <div class="item">
		         <img src="http://www.w3cschool.cc/wp-content/uploads/2014/07/slide2.png" width="100%" alt="Second slide">
		      </div>
		      <div class="item">
		         <img src="http://www.w3cschool.cc/wp-content/uploads/2014/07/slide3.png" width="100%" alt="Third slide">
		      </div>
		   </div>
		   <!-- 轮播（Carousel）导航 -->
		   <!-- <a class="carousel-control left" href="#myCarousel" 
		      data-slide="prev">&lsaquo;</a>
		   <a class="carousel-control right" href="#myCarousel" 
		      data-slide="next">&rsaquo;</a> -->
		</div> 
	</div>
	<div class="container" style="margin-top: 10px;">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-lg-3">
	          <div class="thumbnail">
	          <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])"><img class="lazy" src="http://static.bootcss.com/www/assets/img/null.png?v2" width="300" height="150" data-src="http://static.bootcss.com/www/assets/img/layoutit.png" alt="Layoutit"></a>
	            <div class="caption">
	              <h3> 
	                <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])">LayoutIt!<br><small>Bootstrap可视化布局</small></a>
	              </h3>
	              <p>
	              LayoutIt! 可拖放排序在线编辑的Bootstrap可视化布局系统。由<a href="https://github.com/dodgepudding" target="_blank">4wer</a>同学汉化整理。
	              </p>
	            </div>
	          </div>
        	</div>
			<div class="col-sm-6 col-md-4 col-lg-3">
	          <div class="thumbnail">
	          <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])"><img class="lazy" src="http://static.bootcss.com/www/assets/img/null.png?v2" width="300" height="150" data-src="http://static.bootcss.com/www/assets/img/layoutit.png" alt="Layoutit"></a>
	            <div class="caption">
	              <h3> 
	                <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])">LayoutIt!<br><small>Bootstrap可视化布局</small></a>
	              </h3>
	              <p>
	              LayoutIt! 可拖放排序在线编辑的Bootstrap可视化布局系统。由<a href="https://github.com/dodgepudding" target="_blank">4wer</a>同学汉化整理。
	              </p>
	            </div>
	          </div>
        	</div>
        	<div class="col-sm-6 col-md-4 col-lg-3">
	          <div class="thumbnail">
	          <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])"><img class="lazy" src="http://static.bootcss.com/www/assets/img/null.png?v2" width="300" height="150" data-src="http://static.bootcss.com/www/assets/img/layoutit.png" alt="Layoutit"></a>
	            <div class="caption">
	              <h3> 
	                <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])">LayoutIt!<br><small>Bootstrap可视化布局</small></a>
	              </h3>
	              <p>
	              LayoutIt! 可拖放排序在线编辑的Bootstrap可视化布局系统。由<a href="https://github.com/dodgepudding" target="_blank">4wer</a>同学汉化整理。
	              </p>
	            </div>
	          </div>
        	</div>
        	<div class="col-sm-6 col-md-4 col-lg-3 ">
	          <div class="thumbnail">
	          <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])"><img class="lazy" src="http://static.bootcss.com/www/assets/img/null.png?v2" width="300" height="150" data-src="http://static.bootcss.com/www/assets/img/layoutit.png" alt="Layoutit"></a>
	            <div class="caption">
	              <h3> 
	                <a href="/p/layoutit/" title="Bootstrap可视化布局系统" target="_blank" onclick="_hmt.push(['_trackEvent', 'tile', 'click', 'layoutit'])">LayoutIt!<br><small>Bootstrap可视化布局</small></a>
	              </h3>
	              <p>
	              LayoutIt! 可拖放排序在线编辑的Bootstrap可视化布局系统。由<a href="https://github.com/dodgepudding" target="_blank">4wer</a>同学汉化整理。
	              </p>
	            </div>
	          </div>
        	</div>
        </div>
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
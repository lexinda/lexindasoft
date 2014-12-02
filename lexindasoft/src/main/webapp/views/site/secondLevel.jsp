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
		.avatar .img-circle{background:#fff;padding:3px;border:1px solid #c5c5c5}.avatar .img-circle:hover{background:#c0865e}
		#accordion2{
			width: 200px;
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
			$('#accordion2 a').click(function(e) {
				$('#accordion2 a').removeClass('expanded');
				//$(e.target).addClass('active');
				$(this).addClass('expanded');
			});
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
	<div class="container" style="margin-top: 10px;">
		<div class="accordion" id="accordion2">
              <div class="accordion-group boxshadow">
                <div class="accordion-heading">
                  <a class="accordion-toggle expanded" data-toggle="collapse" data-target="#collapseTwo" href="#">
                    KIND
                  </a>
                </div><!-- accordion-heading -->
                <div id="collapseTwo" class="accordion-body collapse in">
                      <div class="accordion-inner clearfix">
                        <input type="checkbox" id="cb8" name="blog" value="1" >
                        <label for="cb8" class="checkbox field">                      
                            <strong>BLOG</strong> <span id="objN8"></span><span class="chbx"></span>                      
                        </label>
                      </div><!-- accordion-inner -->
                      <div class="accordion-inner clearfix">                      
                        <input type="checkbox" id="cb14" name="forum" value="1" >
                        <label for="cb14" class="checkbox field">                      
                            <strong>FORUM</strong> <span id="objN14"></span><span class="chbx"></span>                      
                        </label>
                      </div><!-- accordion-inner --> 
                    </div><!-- accordion-heading-sub -->
                  </div><!-- accordion-group -->
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse" data-target="#collapseOne" href="#">
					CMS
				</a>
			</div><!-- accordion-heading -->
				<div id="collapseOne" class="accordion-body collapse">
                      <div class="accordion-inner clearfix">
                        <input type="checkbox" id="cb5" name="tumblr" value="1" >
                        <label for="cb5" class="checkbox field">                      
                            <strong>TUMBLR</strong> <span id="objN5"></span><span class="chbx"></span>                      
                        </label>
                      </div><!-- accordion-inner -->   
                </div><!-- accordion-heading-sub -->
            </div><!-- accordion-group -->	
            	
            <div class="accordion-group">
            	<div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-target="#collapseThree" href="#">
                      PRICE
                     </a>
				</div><!-- accordion-heading -->
                    <div id="collapseThree" class="accordion-body collapse">
                      <div class="accordion-inner clearfix">
                         <div id="slider-wrap">
							<div id="slider" class="noUiSlider horizontal"></div><!-- slider -->
                         </div><!-- slider-wrap --> 
							<div class="slider-label">FROM <strong>$ <span class="from-value"></span></strong> TO <strong>$ <span class="to-value"></span></strong>
						</div><!-- slider-label -->                          
                      </div><!-- accordion-inner -->                                                                       
                </div><!-- accordion-heading-sub -->                
              </div><!-- accordion-group -->
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-target="#collapseFour" href="#">
                    LAYOUT
                  </a>
                </div><!-- accordion-heading -->
                    <div id="collapseFour" class="accordion-body collapse">
                      <div class="accordion-inner clearfix">
                        <input type="checkbox" id="cb17" name="scrolling" value="1" >
                        <label for="cb17" class="checkbox field">                      
                            <strong>ONE-PAGE<span class="hidden-tablet"> SCROLLING</span></strong> <span id="objN17"></span><span class="chbx"></span>                      
                        </label>
                      </div><!-- accordion-inner -->                      
                </div><!-- accordion-heading-sub -->
              </div><!-- accordion-group -->
            </div><!-- accordion -->
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
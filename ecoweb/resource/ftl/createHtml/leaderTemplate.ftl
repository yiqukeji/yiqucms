<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		 <link href="fh_static_1/img/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
		<script type="text/javascript" src="fh_static_1/js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript" src="fh_static_1/js/boot.jquery.js" ></script>
		<script type="text/javascript" src="fh_static_1/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="fh_static_1/js/paging.js"></script>
		<link rel="stylesheet" href="fh_static_1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="fh_static_1/css/public.css" />
		
		<link rel="stylesheet" href="fh_static_1/css/xygk_css.css" />
		
		<title>${TITLE}</title>
	</head>
	<body>
		
		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：引入公共头部
        -->
		<div id="swiper_header"><#include "headerTemplate.ftl"></div>
		
		<div class="container child">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<div class="title_box">
					<p>学院概况</p>
					<a class="col-xs-12 col-sm-12 col-md-12 col-lg-12 " href="webnews1.html">学院简介</a>
					<a class="col-xs-12 col-sm-12 col-md-12 col-lg-12 active" href="webindex.html">现任领导</a>
					<a class="col-xs-12 col-sm-12 col-md-12 col-lg-12" href="webnews2.html">机构设置</a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
				<div class="address">
					<p>你的位置：
						<a href="javaScript:;">首页</a>>
						<a href="javaScript:;">学院概况</a>>
						<a href="webindex.html" class="name">现任领导</a>
					</p>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 list_box">
				</div>
				<div id="page" class="page_div"></div>
			</div>
		</div>
		
		
		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：引入公共头部
        -->
		<div id="swiper_footer"><#include "footerTemplate.ftl"></div>
		
		<script type="text/javascript" src="fh_static_1/js/public.js" ></script>
		<script src="fh_static_1/js/leader.js"></script>
	</body>
</html>

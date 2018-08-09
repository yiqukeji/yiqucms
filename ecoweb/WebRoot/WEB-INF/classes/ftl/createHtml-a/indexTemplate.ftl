<!DOCTYPE HTML>
<html>
<head>
	<title>${TITLE}</title>
	<meta charset="utf-8">
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link href="fh_static_1/images/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/main.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/public.css" />
	<link rel="stylesheet" href="fh_static_1/css/lrtk.css" />
	<script type="text/javascript" src="fh_static_1/js/myfocus-2.0.1.min.js"></script>
	<script type="text/javascript" src="fh_static_1/js/jquery.js"></script>
	
	<script type="text/javascript" src="fh_static_1/js/public.js"></script>
	<script type="text/javascript">
		//设置
		myFocus.set({
			id:'myFocus',//ID
			pattern:'mF_kiki'//风格
		});
	</script>
</head>
<body>
    <#include "sjTemplate.ftl"> 
	<!--top结束-->
    <#include "headerTemplate.ftl"> 
    <#include "xinxiangTemplate.ftl"> 
	<!--header结束-->
	<!--head_warp结束-->
	<!--轮播开始-->
		<div id="bannerSlide">
			<div id="index_b_hero">
				<div class="hero-wrap">
					<ul class="heros clearfix">
					   <#list fieldList1 as var>
						<!--<li class="hero">
							<a href="" target="_blank"><img src="${var[1]}"></a>
						</li>-->
						<li class="hero">
							<a href="${var[2]}" target="_blank"><img src="${var[1]}" /></a>
							<div class="text">${var[0]}</div>
						</li>
						</#list>
					</ul>
				</div>
				<div class="helper">
					<div class="mask-left">
					</div>
					<div class="mask-right">
					</div>
					<a class="prev icon-arrow-a-left"></a>
					<a class="next icon-arrow-a-right"></a>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="fh_static_1/js/mf-pattern/jquery.foucs.js" ></script>
		<script type="text/javascript">
			$.foucs({
				direction: 'left'
			});
		</script>
		<!--结束-->
		<div style="clear: both;"></div>
	
	<!--move_warp结束-->

	<div class="warp1"><!-- 关注青团、新闻动态 -->
			<div class="content_box">
				<div class="content content1 content1-1">
					 
				</div>
				<div class="content content2 content2-2">
				</div>
				
			</div>
	</div>
	<div id="tabBoxWarp"><!-- 两个选项卡外框 -->
		<div id="tabBox0">
			<div class="tabBox tabBox1"><!-- 左边第一个选项卡 -->
				<ul class="tabs" id="tabs">
				</ul>
				<ul class="conbox">
					<li class="tab1 tab_con tzgg" >
						<ul>
						</ul>
					</li>
					<li class="tab2 tab_con wjxz" >
						<ul>
						</ul>
					</li>
				</ul>
			</div>
			<div class="tabBox tabBox2"><!-- 右边第二个人选项卡 -->
				<ul class="tabs t" id="tabs">
				</ul>
				<ul class="conbox">
					<li class="tab1 tab_con ddjt" >
						<ul>
							
						</ul>
					</li>
					<li class="tab2 tab_con xywh" >
						<ul>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--结束-->
	<div id="jiangtang_warp">
	</div>
	<!--讲堂结束-->
	<div id="other_info">
		<div class="awarp lk">
		</div>
	</div>
	<#include "footerTemplate.ftl"> 
	<script type="text/javascript" src="fh_static_1/js/main.js"></script>
	<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
</body>
</html>
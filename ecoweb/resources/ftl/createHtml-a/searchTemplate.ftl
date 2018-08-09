<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${TITLE} </title>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="Author" content="" /> 
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link href="fh_static_1/images/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/subcommon.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/public.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/llzl.css" />
	<script type="text/javascript" src="fh_static_1/js/jquery.js"></script>
	<script type="text/javascript" src="fh_static_1/js/subweb.js"></script>
	<script type="text/javascript" src="fh_static_1/js/public.js"></script>
</head>
<body>
	 <#include "sjTemplate.ftl">
	 <#include "headerTemplate.ftl"> 
	 <#include "xinxiangTemplate.ftl"> 
	<!--top结束-->
	<!--head_warp结束-->
	<div class="warp">
	</div>
	<div class="content_warp">
		<div class="sidebar-title">
			<p>搜索内容</p>
		</div>
		<div class="current_pos"><!-- 当前位置 -->
			<p>当前位置：<a href="./index.html">首页</a>&nbsp;>&nbsp;<a href="#">搜索内容</a></p>
		</div>
		<form action="./list.do" method="post" name="Form" id="Form">
		<div class="tabBox"><!-- 选项卡 -->
			<ul class="conBox">	
				<li class="content content1">
					<ul class="box commC">
					</ul>
					<div class="newpage">
					<a href="javascript:;"  class="page_home">首页</a>
					<a href="javascript:;" class="page_up">上一页</a>
					<a href="javascript:;" class="page_down">下一页</a>
					<a href="javascript:;" class="page_af">尾页</a>
					
	                </div>
				</li>
			</ul>
		</div>
		</form>
	</div>
    <#include "footerTemplate.ftl"> 
	<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
	<script type="text/javascript" src="fh_static_1/js/page.js"></script>
</body>
</html>
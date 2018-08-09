<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${TITLE} </title>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="Author" content="" /> 
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
	<link href="fh_static_1/images/favicon.ico" sizes="16*16" type="image/x-icon" rel="Shortcut Icon"/>
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/subcommon.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/public.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/article02.css" />
	<script type="text/javascript" src="fh_static_1/js/jquery.js"></script>
	<script type="text/javascript" src="fh_static_1/js/public.js"></script>

</head>
<body>
  <#include "sjTemplate.ftl">
	 <#include "headerTemplate.ftl"> 
	 <#include "xinxiangTemplate.ftl"> 
	<!--head_warp结束-->
	<div class="content_warp">
		<div class="sidebar-title">
			<p>文章详情</p>
		</div>
		<div class="current_pos"><p>当前位置：<a href="./index.html">首页</a>&nbsp;>&nbsp;<a href="#">文章详情</a></p></div>
		<div class="content">
			<p class="tit"></p>
			<span class="date">发布时间：<span class="pub_time"></span>&nbsp;&nbsp;&nbsp;&nbsp;发布部门：<span class="pub_address"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;浏览统计：<span class="count"></span></span>
			<div class="CT"></div>
			
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			getById();
		});
		function getById(){
			var CONTENTS_ID = ((window.location+"").split('CONTENTS_ID='))[1];
			$.ajax({
				type: "POST",
				url: 'web/getNewDetail.do',
		    	data: {CONTENTS_ID:CONTENTS_ID},
				dataType:'json',
				cache: false,
				success: function(data){
				$(".tit").html(data.data.TITLE)
				$(".pub_time").html(data.data.PUB_TIME)
				$(".pub_address").html(data.data.PUB_SOURCE)
				$(".count").html(data.data.NUMBER)
				$(".CT").html(data.data.CONTENT)
				}
			});
		}
		
	</script>
	<#include "footerTemplate.ftl"> 
	<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
</body>
</html>
<!DOCTYPE HTML>
<html>
<head>
    <title>${TITLE}</title>
	<meta charset="utf-8">
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link href="fh_static_1/images/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/subcommon.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/public.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/zzjg.css" />
	<script type="text/javascript" src="fh_static_1/js/jquery.js"></script>
	<script type="text/javascript" src="fh_static_1/js/subweb.js"></script>
	<script type="text/javascript" src="fh_static_1/js/public.js"></script>
</head>
<body>
	 <#include "sjTemplate.ftl">
	 <#include "headerTemplate.ftl"> 
	 <#include "xinxiangTemplate.ftl"> 
	<!--head_warp结束-->
	<div class="content_warp">
		<div class="sidebar-title sidebar">
			<p>学生组织</p>
			<a href="javascript:;"  class="sidebar-list" index="1" style="background-color:#c62f2f;color:#fff;" id="xszz1">校学生会</a>
			<a href="javascript:;"  class="sidebar-list" index="2" id="xszz2">校社团联合会</a>
			<a href="javascript:;"  class="sidebar-list" index="3" id="xszz3">校青年志愿者联合会</a>
			<a href="javascript:;"  class="sidebar-list" index="4" id="xszz4">共青团新媒体中心</a>
		</div>
		<div class="current_pos"><p>当前位置：<a href="./index.html">首页</a>&nbsp;\&nbsp;<a href="./qnzyz.html">学生组织</a></p></div>
			<div class="list_box">
				<div class="box box1">
					<#list fieldListxxsh as var>
					${var[2]}
					</#list>
				</div>
				<div class="box box2" style="display:none">
					<#list fieldListxstlhh as var>
					${var[2]}
				    </#list>
				</div>
				<div class="box box3" style="display:none">
					<#list fieldListzyzxh as var>
					${var[2]}
				  </#list>	
				</div>
				<div class="box box4" style="display:none">
					<#list fieldListxmtzx as var>
				${var[2]}
			</#list>
				</div>
		</div>
	</div>
	<#include "footerTemplate.ftl"> 
	<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
</body>
</html>
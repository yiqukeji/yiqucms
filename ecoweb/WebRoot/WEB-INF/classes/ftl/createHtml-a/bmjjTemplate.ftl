<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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
			<p>组织机构</p>
			<a href="javascript:;"  class="sidebar-list" id="bumen">部门简介</a>
			<a href="javascript:;"  class="sidebar-list" id="renyuan">工作人员</a>
			<a href="javascript:;"  class="sidebar-list" id="fengong">科室分工</a>
		</div>
	<div class="current_pos"><p>当前位置：<a href="./index.html">首页</a>&nbsp;>&nbsp;<a href="">组织机构</a></p></div>
		<form action="web/pageHtml.do?PUB_TYPE=gzry" method="post" name="Form" id="Form">
		<div class="list_box">
			<div class="bumen box">
				<#list fieldListbbjj as var>
				${var[2]}
				</#list>
			</div>
			<div class="box renyuan renyuan-img" style="display:none">
				<!--<a href="#" class="tit" name="renyuan">工作人员</a>-->
				<#list fieldListgzry as var>
				<div class="commC "><a href="web-d.html?CONTENTS_ID=${var[0]}" class="img_box" ><img src="${var[3]}" alt=""></a><a href="web-d.html?CONTENTS_ID=${var[0]}">${var[1]}</a></div>
				</#list>
				<!---->
				<p style="clear: both;"></p>
				<p class="newpage">
				<a href="javascript:;" onclick='nextPage(0)' class="page_home">首页</a>
				<#if (totalPagegzry>1)>
				<a href="javascript:;" class="" onclick='nextPage(${page.currentPage-1})'>上一页</a>
				<a href="javascript:;" class="" onclick='nextPage(${page.currentPage+1})'>下一页</a>
				<a href="javascript:;"  onclick='nextPage(${totalPagegzry})'>尾页</a>
				<#elseif (totalPagegzry=1)> 
				<a href="javascript:;" class="page_pre" onclick='nextPage(1)' >上一页</a>
				<a href="javascript:;" class="page_next" onclick='nextPage(1)'>下一页</a>
				<a href="javascript:;" class="page_tail" onclick='nextPage(1)'>尾页</a>
				</#if>
				</p>
			</div>
			<div class="box fengong commC" style="display:none">
				<!--<a href="javascript:;" class="tit" name="fengong">科室分工</a>-->
				<#list fieldListksfg as var>
				${var[2]}
				</#list>
			</div>
		</div>
	</div>
	</form>
	<#include "footerTemplate.ftl"> 
	<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
	<script type="text/javascript" src="fh_static_1/js/page.js"></script>
</body>
</html>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${TITLE} </title>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="Author" content="" /> 
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link href="../images/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/subcommon.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/public.css" />
	<script type="text/javascript" src="fh_static_1/js/jquery.js"></script>
	<script type="text/javascript" src="fh_static_1/js/public.js"></script>

</head>
<body>
     <#include "sjTemplate.ftl"> 
	 <#include "headerTemplate.ftl"> 
	 <#include "xinxiangTemplate.ftl"> 
	<!--head_warp结束-->
	<div class="warp">
	</div>
	<div class="content_warp">
		<div class="sidebar-title">
			<p>创新创业</p>
		</div>
		<div class="current_pos"><p>当前位置：<a href="./index.html">首页</a>&nbsp;>&nbsp;<a href="">创新创业</a></p></div>
		<form action="web/pageHtml.do?PUB_TYPE=cxcy" method="post" name="Form" id="Form">
		<div class="list_box ">	
				<ul class="commC">
				   <#list fieldListcxcy as var>
					<li><a href="web-d.html?CONTENTS_ID=${var[0]}">	${var[1]}</a><span class="date">${var[4]}</span></li>
					</#list>
				</ul>
				<div class="newpage">
				<a href="javascript:;" onclick='nextPage(0)' class="page_home">首页</a>
				<#if (totalPagecxcy>1)>
				<a href="javascript:;" class="" onclick='nextPage(${page.currentPage-1})'>上一页</a>
				<a href="javascript:;" class="" onclick='nextPage(${page.currentPage+1})'>下一页</a>
				<a href="javascript:;"  onclick='nextPage(${totalPagecxcy})'>尾页</a>
				<#elseif (totalPagecxcy=1)> 
				<a href="javascript:;" class="page_pre" onclick='nextPage(1)' >上一页</a>
				<a href="javascript:;" class="page_next" onclick='nextPage(1)'>下一页</a>
				<a href="javascript:;" class="page_tail" onclick='nextPage(1)'>尾页</a>
				</#if>
                 </div> 
		</div>
		</form>
	</div>
	<#include "footerTemplate.ftl"> 
	<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
	<script type="text/javascript" src="fh_static_1/js/page.js"></script>
</body>
</html>
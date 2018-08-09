<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>共青团贵州财经大学委员会 </title>
	<title>${TITLE} </title>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="Author" content="" /> 
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link href="fh_static_1/images/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/reset.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/subcommon.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/public.css" />
	<link type="text/css" rel="stylesheet" href="fh_static_1/css/jctw.css" />
	<script type="text/javascript" src="fh_static_1/js/jquery.js"></script>
	<script type="text/javascript" src="fh_static_1/js/subweb.js"></script>
	<script type="text/javascript" src="fh_static_1/js/public.js"></script>

</head>
<body>
	<#include "sjTemplate.ftl"> 
	<!--top结束-->
    <#include "headerTemplate.ftl"> 
	<!--top结束-->
	<!--head_warp结束-->
	<div class="suggestion"><!-- 意见反馈 -->
			<p>意见反馈<span class="close">关闭</span></p>
			<ul>
				<li><span>主题：</span><input name="txtTitle" type="text" maxlength="20" /></li>
				<li><span>姓名：</span><input name="txtRealname" type="text" maxlength="20" /></li>
				<li><span>手机：</span><input name="txtPhone" type="text" maxlength="11" /></li>
				<li><span>邮箱：</span><input name="txtEmail" type="text" maxlength="20" /></li>
				<li><span>内容：</span><textarea name="txtContent" id="" cols="35" rows="5" maxlength="150"></textarea></li>
			</ul>
			<button>提交</button>
		</div>
		<!--另加-->
		<div class="content_warp">
		<div class="sidebar-title">
			<p>基层团委</p>
		</div>
	<div class="current_pos_box">
	<div class="current_pos"><p>当前位置：<a href="./index.html">首页</a>&nbsp;&gt;&nbsp;<a href="">基层团委</a></p></div>
	<form action="web/pageHtml.do?PUB_TYPE=jctw" method="post" name="Form" id="Form">
	<div class="center" >
	    <span class="commC">
	    <#list fieldListjctw as var>
		<div class="box guide"><a href="web-d.html?CONTENTS_ID=${var[0]}" class="icobox"><img src="${var[3]}" alt=""></a><a href="web-d.html?CONTENTS_ID=${var[0]}" class="name">${var[1]}</a></div>
		</#list>
		</span>
		<div class="newpage">
				<a href="javascript:;" onclick='nextPage(0)' class="page_home">首页</a>
				<#if (totalPagejctw>1)>
				<a href="javascript:;" class="" onclick='nextPage(${page.currentPage-1})'>上一页</a>
				<a href="javascript:;" class="" onclick='nextPage(${page.currentPage+1})'>下一页</a>
				<a href="javascript:;"  onclick='nextPage(${totalPagejctw})'>尾页</a>
				<#elseif (totalPagejctw=1)> 
				<a href="javascript:;" class="page_pre" onclick='nextPage(1)' >上一页</a>
				<a href="javascript:;" class="page_next" onclick='nextPage(1)'>下一页</a>
				<a href="javascript:;" class="page_tail" onclick='nextPage(1)'>尾页</a>
				</#if>
                 </div>
	</div>
	</form>
	</div>
	</div>
	<#include "footerTemplate.ftl"> 
	<script type="text/javascript" src="fh_static_1/js/nav.js"></script>
	<script type="text/javascript" src="fh_static_1/js/page.js"></script>
</body>
</html>
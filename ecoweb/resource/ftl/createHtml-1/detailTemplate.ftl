<!DOCTYPE html>
<html lang="en">
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=9*">
	<title>${TITLE}</title>
	<meta charset="utf-8">
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link href="fh_static_1/imgs/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
    <link rel="stylesheet" href="fh_static_1/css/public.css">
    <link rel="stylesheet" href="fh_static_1/css/listPage.css">
    <script src="fh_static_1/js/jquery-2.1.0.js"></script>
    <script src="fh_static_1/js/paging.js"></script>
</head>
<body>
<!--公共头部-->
<#include "headerTemplate.ftl"> 
<!--公共头部-->
<!--body部分-->
<div class="content">
    <div class="center-1200">
        <div class="cont-menu">
        <input name="type" class="type" type="hidden" value=""/>
         <input name="type" class="htmlStr" type="hidden" value="webdetail.html"/>
         <input name="keywords" class="keywords" type="hidden" value=""/>
            <div class="cont-menu-title">
            </div>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="./index.html">首页</a>>&nbsp<a href="JavaScript:;" class="name" onclick="toSubHtml()"></a>&nbsp><a class="name0"></a> 文章详情</p>
            </div>
            <div class="article-details">
                <div class="details-title"></div>
                <p class="wenzhang_time">发布时间:<span class="time"></span><b></b>浏览次数:<span class="number"></span><b></b>文章来源:<span class="source"></span></p>
                <div class="contents">
                </div>
                <div class="bj" style="float:right;margin-bottom:20px;"></div>
            </div>
        </div>
    </div>
</div>
<!--body部分-->
<!--footer-->
<#include "footerTemplate.ftl"> 
<!--footer-->
<script src="fh_static_1/js/public.js"></script>
<script src="fh_static_1/js/detail.js"></script>
<script src="fh_static_1/js/toList.js"></script>
<script>
</script>
</body>
</html>
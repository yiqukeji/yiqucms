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
</head>
<body>
<!--公共头部-->
<#include "headerTemplate.ftl"> 
<!--公共头部-->
<!--body部分-->
<div class="content">
    <div class="center-1200">
        <div class="cont-menu">
            <div class="cont-menu-title">
                学院概况
            </div>
            <ul>
                 <li ><a href="webnews1.html">学院简介</a></li>
                <li><a href="webindex.html">现任领导</a></li>
                <li class="ons"><a href="webnews2.html">组织机构</a></li>
            </ul>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="./index.html">首页</a>>学院概况>组织机构</p>
            </div>
            <div>
            <#list fieldListeo03 as var>
             ${var[2]}
            </#list>
            </div>
        </div>
    </div>
</div>
<!--body部分-->
<#include "footerTemplate.ftl"> 
<!--footer-->
<script src="fh_static_1/js/public.js"></script>
<script src="fh_static_1/js/toList.js"></script>
</body>
</html>
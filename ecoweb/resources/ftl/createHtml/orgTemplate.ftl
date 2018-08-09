<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${KEYWORDS}" />
     <title>${TITLE}</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
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
                <li><a href="webIntro.html">学院简介</a></li>
                <li><a href="webLeader.html">现任领导</a></li>
                <li class="ons"><a href="webOrg.html">组织机构</a></li>
            </ul>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="index.html">首页</a>>学院概况>组织机构</p>
            </div>
            <div class="neirong">
                <#list fieldListzzjg as var>
                ${var[2]}
               </#list>
            </div>
        </div>
    </div>
</div>
<!--body部分-->
<!--footer-->
<#include "footerTemplate.ftl"> 
<!--footer-->

<script src="fh_static_1/js/public.js"></script>
</body>
</html>
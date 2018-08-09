<!DOCTYPE html>
<html lang="en">
<head>
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
<!--body部分-->
<div class="content">
    <div class="center-1200">
        <div class="cont-menu">
            <div class="cont-menu-title">
                师资队伍
            </div>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="./index.html">首页</a>&nbsp;>&nbsp;<span class="eo10">师资队伍</span></p>
            </div>
            <div class="teach-div">
                <div class="teach-title">
                              教 授 
                </div>
                <div class="teach-content">
                    <ul>
                       <#list fieldListeo10 as var>
                        <#if var[8]=="教授">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo10','eo10','${var[0]}')">${var[1]}</a></li>
                        </#if>
                        </#list>
                    </ul>
                </div>
                <div class="teach-title">
                   副 教 授
                </div>
                <div class="teach-content">
                    <ul>
                        <#list fieldListeo10 as var>
                        <#if var[8]=="副教授">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo10','eo10','${var[0]}')">${var[1]}</a></li>
                        </#if>
                        </#list>
                    </ul>
                </div>
                <div class="teach-title">
                    讲 师
                </div>
                <div class="teach-content">
                    <ul>
                        <#list fieldListeo10 as var>
                        <#if var[8]=="讲师">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo10','eo10','${var[0]}')">${var[1]}</a></li>
                        </#if>
                        </#list>
                    </ul>
                </div>
                <div class="teach-title">
                    行 政 管 理 人 员
                </div>
                <div class="teach-content">
                    <ul>
                        <#list fieldListeo10 as var>
                        <#if var[8]=="行政管理人员">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo10','eo10','${var[0]}')">${var[1]}</a></li>
                        </#if>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--body部分-->
<!--footer-->
<#include "footerTemplate.ftl">
<!--footer-->
<script src="fh_static_1/js/public.js"></script>
<script src="fh_static_1/js/toList.js"></script>
</body>
</html>
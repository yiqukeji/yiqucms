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
            <div class="cont-menu-title">
                师资队伍
            </div>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="index.html">首页</a>&nbsp;>&nbsp;师资队伍</p>
            </div>
            <div class="teach-div">
                <div class="teach-title">
                    教 授
                </div>
                <div class="teach-content">
                    <ul>
                    <#list fieldListjsdw as var>
                        <#if var[6]=="教授">
                        <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a></li>
                        </#if>
                     </#list>
                    </ul>
                </div>
                <div class="teach-title">
                   副 教 授
                </div>
                <div class="teach-content">
                    <ul>
                        <#list fieldListjsdw as var>
                        <#if var[6]=="副教授">
                        <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a></li>
                        </#if>
                     </#list>
                    </ul>
                </div>
                <div class="teach-title">
                    讲 师
                </div>
                <div class="teach-content">
                    <ul>
                       <#list fieldListjsdw as var>
                        <#if var[6]=="讲师">
                        <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a></li>
                        </#if>
                     </#list>
                    </ul>
                </div>
                <div class="teach-title">
                    行 政 管 理 人 员
                </div>
                <div class="teach-content">
                    <ul>
                        <#list fieldListjsdw as var>
                        <#if var[6]=="行政管理人员">
                        <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a></li>
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
</body>
</html>
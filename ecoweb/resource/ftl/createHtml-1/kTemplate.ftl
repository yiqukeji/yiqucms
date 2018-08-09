<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${TITLE}</title>
    <meta name="viewport"
    content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
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
            <div class="cont-menu-title">师资队伍</div>
            <div class="cont-menu-title1"><a href="webj.html" >经济系</a></div>
            <div class="cont-menu-title1"><a href="webc.html" >财税系</a></div>
            <div class="cont-menu-title1"><a href="webg.html" >国经系</a></div>
            <div class="cont-menu-title1"><a href="webk.html" class="active">科研机构</a></div>
            <div class="cont-menu-title1"><a href="webx.html">行政机构</a></div>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="./index.html">首页</a>&nbsp;>&nbsp;<span class="eo10">师资队伍</span>  > 经济系</p>
            </div>
            <div class="teach-div">
                <div class="teach-title">
                   经 济 史 研 究 所
                </div>
                <div class="teach-content">
                    <ul>
                        <#list fieldListeo35 as var>
                        <#if var[8]?trim=="经济史研究所">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo35','eo35','${var[0]}')">${var[1]}</a></li>
                        </#if>
                        </#list>
                    </ul>
                </div>
                <div class="teach-title">
                  经 济 研 究 所
                </div>
                <div class="teach-content">
                    <ul>
                          <#list fieldListeo35 as var>
                        <#if var[8]?trim=="经济研究所">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo35','eo35','${var[0]}')">${var[1]}</a></li>
                        </#if>
                        </#list>
                    </ul>
                </div>
                <div class="teach-title">
                    西 南 地 区 经 济 发 展 研 究 院
                </div>
                <div class="teach-content">
                    <ul>
                         <#list fieldListeo35 as var>
                        <#if var[8]?trim=="西南地区经济发展研究院">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo35','eo35','${var[0]}')">${var[1]}</a></li>
                        </#if>
                        </#list>
                    </ul>
                </div>
                <div class="teach-title">
                    	贵 州 经 济 发 展 中 心
                </div>
                <div class="teach-content">
                    <ul>
                        <#list fieldListeo35 as var>
                        <#if var[8]?trim=="贵州经济发展中心">
                        <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','eo35','eo35','${var[0]}')">${var[1]}</a></li>
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
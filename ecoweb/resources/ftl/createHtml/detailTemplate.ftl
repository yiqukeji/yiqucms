<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
                文章详情
            </div>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="index.html">首页</a>> 文章详情</p>
            </div>
            <div class="article-details">
                <div class="details-title"></div>
                <p class="wenzhang_time">发布时间:<span class="time"></span><b></b>浏览次数:<span class="number"></span><b></b>文章来源:<span class="source"></span></p>
                <div class="content0 neirong">
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
<script type="text/javascript">
		$(document).ready(function(){
			getById();
		});
		function getById(){
		var CONTENTS_ID = ((window.location+"").split('CONTENTS_ID='))[1];
			$.ajax({
				type: "POST",
				url: 'web/getNewDetail.do',
		    	data: {CONTENTS_ID:CONTENTS_ID},
				dataType:'json',
				cache: false,
				success: function(data){
				$(".details-title").html(data.data.TITLE);
				$(".time").html(data.data.PUB_TIME);
				$(".number").html(data.data.NUMBER+"次");
				$(".source").html(data.data.PUB_SOURCE);
				$(".content0").html(data.data.CONTENT);
				}
			});
		}
	</script>
</body>
</html>
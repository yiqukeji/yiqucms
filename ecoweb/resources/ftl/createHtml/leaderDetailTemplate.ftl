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
                <li class="ons"><a href="webLeader.html">现任领导</a></li>
                <li><a href="webOrg.html">机构设置</a></li>
            </ul>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="index.html">首页</a>>学院概况>学院简介</p>
            </div>
            <div class="list-gaikuang">
                <div class="jigou-title"></div>
                <div class="wenzhang-info">
                    <p >文章来源&nbsp;:&nbsp;<span class="source"></span><span
                            class="juli"></span>发布时间&nbsp;:&nbsp;<span class="time"></span><span class="juli"></span>浏览次数&nbsp;:&nbsp;<span class="number"></span>次
                    </p>
                </div>
                <div class="jigou-neiron">
                    <div class="boxs">
                        <div class="zhiwei"></div>
                        <div class="pic1">
                            <img src="" alt="">
                        </div>
                        <div class="text1">
                          
                            <p class="text-quanli1"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--body部分-->
<!--footer-->
<#include "footerTemplate.ftl"> 
<!--footer-->
<script>
    function hidestring() {
        var maxwidth = 45;
        $(".text-quanli").each(function () {
            if ($(this).text().length > maxwidth) {
                $(this).text($(this).text().substring(0, maxwidth) + "...");
            }
        })
    }

    hidestring();
    
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
				$(".jigou-title").html(data.data.TITLE);
				$(".source").html(data.data.PUB_SOURCE);
				$(".time").html(data.data.PUB_TIME);
				$(".number").html(data.data.NUMBER);
				$(".zhiwei").html(data.data.DESCRIPTION);
				$(".zhiwei").append("<span></span>");
				
				$(".text-quanli1").html(data.data.CONTENT);
				$(".pic1 img").attr("src",data.data.THUMNAIL);
				}
			});
		}
</script>
<script src="fh_static_1/js/public.js"></script>
</body>
</html>
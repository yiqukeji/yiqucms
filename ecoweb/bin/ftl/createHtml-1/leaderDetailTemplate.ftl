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
               <li><a href="webnews1.html">学院简介</a></li>
                <li class="ons"><a href="webindex.html">现任领导</a></li>
                <li><a href="webnews2.html">机构设置</a></li>
            </ul>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="./index.html">首页</a>><a href="webnews1.html">学院概况</a>><a href="webindex.html">现任领导</a></p>
            </div>
            <div class="list-gaikuang">
                <div class="jigou-title">部门领导</div>
                <div class="wenzhang-info">
                    <p>文章来源&nbsp;:&nbsp;<span class="source"></span><span
                            class="juli"></span>发布时间&nbsp;:&nbsp;<span class="time"></span><span class="juli"></span>浏览次数&nbsp;:&nbsp;<span class="number"></span>次
                    </p>
                </div>
                <div class="jigou-neiron">
                    <div class="boxs">
                        <div class="zhiwei"><span></span></div>
                        <div class="pic1">
                            <img src="" >
                        </div>
                        <div class="text1">
                            <p class="text-name1"></p>
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
 hidestring();
    function hidestring() {
        var maxwidth = 45;
        $(".text-quanli").each(function () {
            if ($(this).text().length > maxwidth) {
                $(this).text($(this).text().substring(0, maxwidth) + "...");
            }
        })
    }

   
    
  $(function(){
     getDetail();
  })  
  //
  function getDetail(CONTENTS_ID,type){
  var mark = ((window.location+"").split('mark='))[1];
	var arr = mark.split("&");
	var id = arr[2].split("=")[1];
	$.ajax({
		type: "POST",
		url: 'web/getNewDetail.do',
    	data: {CONTENTS_ID:id},
		dataType:'json',
		cache: false,
		success: function(data){
		$(".zhiwei").html(data.data.DESCRIPTION);
		$(".text-name1").html(data.data.TITLE);
		$(".number").html(data.data.NUMBER);
		$(".source").html(data.data.PUB_SOURCE);
		$(".text-quanli1").html(data.data.CONTENT);
		$(".time").html(data.data.PUB_TIME);
		$(".pic1 img").attr("src",data.data.THUMNAIL);
		}
	});
}  
    
</script>
<script src="fh_static_1/js/public.js"></script>
</body>
</html>
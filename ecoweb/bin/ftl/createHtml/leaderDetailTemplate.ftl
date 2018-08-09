<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="fh_static_1/css/bootstrap.min.css" />
		<script type="text/javascript" src="fh_static_1/js/boot.jquery.js" ></script>
		<script type="text/javascript" src="fh_static_1/js/bootstrap.min.js" ></script>
		<link href="fh_static_1/imgs/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
		<link rel="stylesheet" href="fh_static_1/css/public.css" />
		<script type="text/javascript" src="fh_static_1/js/jquery-3.3.1.min.js" ></script>
		
		<link rel="stylesheet" href="fh_static_1/css/xygk_css.css" />
		
		<title>${TITLE}</title>
	</head>
	<body>
		
		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：引入公共头部
        -->
		<div id="swiper_header"><#include "headerTemplate.ftl"> </div>
		
		<div class="container child">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<div class="title_box">
					<p>现任领导</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
				<div class="address">
					<p>你的位置：
						<a href="javaScript:;">首页</a> >
						<a href="webnews1.html">学院概况</a>
						<a href="webindex.html">现任领导</a>
					</p>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 content_datails">
					<h2>新闻标题</h2>
					<p>发布时间：<span>2018-08-06</span> 浏览次数：<span>28次</span> 文章来源：<span>思政网</span></p>
					<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 content_datails">
						<div class="ld_img">
							<img src="../img/weiyong.jpg" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 font_datails">
						<!--<img src="../images/pic3.png" />-->
						<p>
							此处插入内容 此处插入内容 此处插入内容 此处插入内容 此处插入内容
							此处插入内容 此处插入内容 此处插入内容 此处插入内容 此处插入内容
							此处插入内容 此处插入内容 此处插入内容 此处插入内容 此处插入内容
							此处插入内容 此处插入内容 此处插入内容 此处插入内容 此处插入内容
							此处插入内容 此处插入内容 此处插入内容 此处插入内容 此处插入内容
						</p>
					</div>
				</div>
			</div>
		</div>
		
		
		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：引入公共头部
        -->
		<div id="swiper_footer"><#include "footerTemplate.ftl"></div>
		
		<script type="text/javascript" src="fh_static_1/js/public.js" ></script>
		<script type="text/javascript">
				$(function(){
		     getDetail();
		  })
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
	</body>
</html>

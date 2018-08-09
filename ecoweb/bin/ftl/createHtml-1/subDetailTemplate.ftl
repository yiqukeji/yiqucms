<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="X-UA-Compatible" content="IE=9*">
		<title>${TITLE}</title>
		<meta charset="utf-8">
		<meta name="keywords" content="${KEYWORDS}" />
		<meta name="description" content="${DESCRIPTION}" />
		<link href="${LOGO}" type="image/x-icon" rel="Shortcut Icon"/>
    
		<link rel="stylesheet" href="fh_static_1/css/public.css">
		<link rel="stylesheet" href="fh_static_1/css/swiper.min.css">
		<link rel="stylesheet" href="fh_static_1/css/context.css">
		<script src="fh_static_1/js/jquery-2.1.0.js"></script>
		<script src="fh_static_1/js/swiper.min.js"></script>
		<script src="fh_static_1/js/tweenmax.min.js"></script>
		<script src="fh_static_1/js/paging.js"></script>
</head>
<body>
<!--top-->
<#include "headerTemplate.ftl"> 
<!--top-->
<!--内容-->
<div class="context">
    <div class="context-center">
        <div class="context-left">
           <div class="context-left-title"></div>
        </div>
        <div class="context-right">
            <div class="context-right-location">
                你的位置: <a href="index.html">首页</a> > <a href="" class="title0"></a>
            </div>
            <div class="context-right-context">
               <div class="context-title"></div>
               <div class="context-set">
                   <p><span class="souce"></span><span class="time"></span><span class="number"></span><span class="guanbi">关闭页面</span><span class="fontsize">[字体: <em>小</em><em>中</em><em>大</em>]</span></p>
               </div>
                <div class="context-body">
                </div>
            </div>
        </div>
    </div>
</div>
<!--内容-->
<!--foter-->
<#include "footerTemplate.ftl"> 
<script src="fh_static_1/js/public.js"></script>
<script>
    //调用swiper
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        autoplay:true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
</script>
<script src="fh_static_1/js/subDetail.js"></script>
</body>
</html>
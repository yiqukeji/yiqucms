<!DOCTYPE html>
<html>

	<head>
		<title>${TITLE}</title>
		<meta charset="utf-8">
		<meta name="keywords" content="${KEYWORDS}" />
		<meta name="description" content="${DESCRIPTION}" />
		<link href="fh_static_1/img/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
		<script type="text/javascript" src="fh_static_1/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="fh_static_1/js/boot.jquery.js"></script>
		<script type="text/javascript" src="fh_static_1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="fh_static_1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="fh_static_1/css/public.css" />
		<link rel="stylesheet" href="fh_static_1/css/index.css" />

		<script type="text/javascript" src="fh_static_1/js/jquery.foucs.js"></script>
		<script type="text/javascript" src="fh_static_1/js/slide.js"></script>
		<link rel="stylesheet" href="fh_static_1/css/slide.css" />
		<link rel="stylesheet" href="fh_static_1/css/nav_slide.css" />
		<style>
		</style>

	</head>

	<body>
		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：引入公共头部
        -->
		<div id="swiper_header"><#include "headerTemplate.ftl"> </div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：轮播图
        -->
		<div id="bannerSlide">
			<div id="index_b_hero">
				<div class="hero-wrap">
					<ul class="heros clearfix">
					 <#list fieldList1 as var>
						<li class="hero">
							<a href="${var[2]}" target="_blank"><img src="${var[1]}" /></a>
						</li>
					  </#list>
					</ul>
				</div>
				<div class="helper">
					<div class="mask-left">
					</div>
					<div class="mask-right">
					</div>
					<a class="prev icon-arrow-a-left"></a>
					<a class="next icon-arrow-a-right"></a>
				</div>
			</div>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：学院新闻
        -->
		<div class="container xueyuan_news_box">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="xueyuan_news">
					<p class="title0">学院新闻</p>
					<#list fieldListeo23 as var>
					<#if var_index  = 0>
					  <a href="JavaScript:;" onclick="gotoHtml('webnew.html','0','eo23')">更多</a>
					 </#if>
					</#list>
				</div>
			</div>

			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">

				<div class="main-box1-con-wrap-left">
					<div id="slideBox" class="slideBox">
						<div class="bd">
							<ul>
							  <#list fieldListeo23 as var>
                                    <#if var[3] != "">
								<li>
									<a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','0','eo23','${var[0]}')"><img src="${var[3]}" /></a>
									<div class="text-des">${var[1]}</div>
								</li>
								 </#if>
                               </#list>
							</ul>
						</div>

						<!-- 下面是前/后按钮代码，如果不需要删除即可 -->
						<a class="prev" href="javascript:void(0)"></a>
						<a class="next" href="javascript:void(0)"></a>
					</div>
				</div>

			</div>
			<div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 new_list_group_box">
				<ul class="list-group">
				 <#if fieldListeo23?size gt 5>
				  <#list fieldListeo23[0..5] as var>
					<li class="list-group-item">
						<a href="JavaScript:;" title="${var[1]}">${var[1]}</a>
						<span>${var[4]?substring(0,10)}</span>
					</li>
				  </#list>
				  <#elseif fieldListeo23?size lte 5>
                   <#list fieldListeo23 as var>
					<li class="list-group-item">
						<a href="JavaScript:;" title="${var[1]}">${var[1]}</a>
						<span>${var[4]?substring(0,10)}</span>
					</li>
					 </#list>
                     </#if>
				</ul>
			</div>
		</div>

		<div class="container tzgg_box">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="xueyuan_news">
					<p class="title1" >通知公告</p>
					<a href="JavaScript:;" onclick="gotoHtml('webnew.html','1','eo24')">更多</a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 tzgg_listbox">
			 <#if fieldListeo24?size gt 4>
			<#list fieldListeo24[0..5] as var>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<div class="tzgg_time">
							<p>${var[4]?substring(8,10)}</p>
							<span>${var[4]?substring(0,7)}</span>
						</div>
					</div>
					<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
						<div class="tzgg_list">
							<a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','1','eo24','${var[0]}')">${var[1]}</a>
						</div>
					</div>
					<div class="hr"></div>
				</div>
		       </#list>
		       <#elseif fieldListeo24?size lte 5> 
		       <#list fieldListeo24 as var>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<div class="tzgg_time">
							<p>${var[4]?substring(8,10)}</p>
							<span>${var[4]?substring(0,7)}</span>
						</div>
					</div>
					<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
						<div class="tzgg_list">
							<a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','1','eo24','${var[0]}')">${var[1]}</a>
						</div>
					</div>
					<div class="hr"></div>
				</div>
		       </#list> 
		       </#if>
				
			</div>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：党建团学
        -->
		<div class="container djtx_box">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="xueyuan_news">
						<p class="title2">党建团学</p>
						<a href="JavaScript:;" onclick="gotoHtml('webnew.html','2','eo37')">更多</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 list_group_box">
					<ul class="list-group">
					<#if fieldListeo37?size gt 4>
					<#list fieldListeo37[0..4] as var>
						<li class="list-group-item">
							<a title="${var[1]}" href="JavaScript:;" onclick="gotoDetail('webdetail.html','2','eo37','${var[0]}')">${var[1]}</a>
							<span>${var[4]?substring(0,10)}</span>
						</li>
						</#list>
						<#elseif fieldListeo37?size lte 5> 
						<li class="list-group-item">
							<a title="${var[1]}" href="JavaScript:;" onclick="gotoDetail('webdetail.html','2','eo37','${var[0]}')">${var[1]}</a>
							<span>${var[4]?substring(0,10)}</span>
						</li>
						</#if>
					</ul>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="xueyuan_news">
						<p>教学科研</p>
						<a href="../child/jxky.html">更多</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 list_group_box">
					<ul class="list-group">
					<#if fieldListeo38?size gt 4>
					<#list fieldListeo38[0..4] as var>
						<li class="list-group-item">
							<a title="${var[1]}" href="JavaScript:;" onclick="gotoDetail('webdetail.html','3','eo38','${var[0]}')">${var[1]}</a>
							<span>${var[4]?substring(0,10)}</span>
						</li>
						</#list>
						<#elseif fieldListeo38?size lte 5>
						<#list fieldListeo38 as var>
						 <li class="list-group-item">
							<a title="${var[1]}" href="JavaScript:;" onclick="gotoDetail('webdetail.html','3','eo38','${var[0]}')">${var[1]}</a>
							<span>${var[4]?substring(0,10)}</span>
						</li>
					</#list>
					</#if>
					</ul>
				</div>
			</div>
		</div>

		<div class="container ztdh_box">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="xueyuan_news">
					<p>专题导航</p>
					<a href="javaScript:;">更多</a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 lianjie_box">
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<img src="fh_static_1/img/link05.png" />
					<a href="../child/ztdh.html">习近平新时代中国特色社会主义思想研究中心</a>
				</div>
				<div class="col-xs-6 col-sm-2 col-md-2 col-lg-2">
					<img src="fh_static_1/img/link01.png" />
					<a href="../child/pwdx.html">品味大学</a>
				</div>
				<div class="col-xs-6 col-sm-2 col-md-2 col-lg-2">
					<img src="fh_static_1/img/link02.png" />
					<a href="../child/hswc.html">红色文才</a>
				</div>
				<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
					<img src="fh_static_1/img/link03.png" />
					<a href="../child/yjsxslt.html">研究生学术论坛</a>
				</div>
				<div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
					<img src="fh_static_1/img/link04.png" />
					<a href="../child/bksdsglxt.html">本科生导师管理系统</a>
				</div>
			</div>
		</div>

		<!--
        	作者：270068451@qq.com
        	时间：2018-08-06
        	描述：引入公共头部
        -->
		<div id="swiper_footer"> <#include "footerTemplate.ftl"> </div>

		<script type="text/javascript" src="fh_static_1/js/public.js"></script>
		<script src="fh_static_1/js/toList.js"></script>

		<script>
			$(function() {
				$('#myCarousel').carousel({
					interval: 3000
				})
			})
			$("#slideBox").slide({
				mainCell: ".bd ul",
				effect: "leftLoop",
				autoPlay: true,
				interTime: 4000
			});
			$.foucs({
				direction: 'left'
			});
		</script>
	</body>

</html>
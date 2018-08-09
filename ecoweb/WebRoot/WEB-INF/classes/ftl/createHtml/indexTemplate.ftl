<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${KEYWORDS}" />
    <meta name="yjs" content="yjs" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title>${TITLE}</title>
    <link rel="stylesheet" href="fh_static_1/css/public.css">
    <link rel="stylesheet" href="fh_static_1/css/index.css">
    <link rel="stylesheet" href="fh_static_1/css/lrtk.css">
    <script src="fh_static_1/js/jquery-2.1.0.js"></script>
    <script src="fh_static_1/js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="fh_static_1/js/jquery.foucs.js"></script>
</head>
<body>
<!--公共头部-->
<#include "headerTemplate.ftl"> 
<!--公共头部-->
<!--轮播开始-->
<div id="bannerSlide">
    <div id="index_b_hero">
        <div class="hero-wrap">
            <ul class="heros clearfix">
                 <#list fieldList1 as var>
						<li class="hero">
							<a href="${var[2]}" target="_blank"><img src="${var[1]}" /></a>
							<div class="text">${var[0]}</div>
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
<script type="text/javascript">
    $.foucs({
        direction: 'left'
    });
</script>
<!--结束-->
<!--lun bo 2-->
<!--main-->
    <div class="main">
        <div class="main-box1">
            <div class="main-box1-con">
                <div class="main-box1-con-bt">
                    <h3>学院新闻</h3>
                    <div class="more">
                        <a href="webNews.html">更多</a>
                    </div>
                </div>
            </div>
            <!--main-1标题结束 内容部分开始-->
            <div class="main-box1-con-wrap">
                <div class="center-show">
                    <div class="main-box1-con-wrap-left">
                        <div id="slideBox" class="slideBox">
                            <div class="bd">
                                <ul>
                                <#if fieldListxyxw?size gt 5>
                                    <#list fieldListxyxw[0..4] as var>
                                    <li>
                                        <a href="webdetail.html?CONTENTS_ID=${var[0]}" target="_blank"><img src="${var[3]}" /></a>
                                        <div class="text-des">${var[1]}</div>
                                    </li>
                                    </#list>
                                  <#elseif fieldListxyxw?size lte 5>
                                  <#list fieldListxyxw as var>
                                    <li>
                                        <a href="webdetail.html?CONTENTS_ID=${var[0]}" target="_blank"><img src="${var[3]}" /></a>
                                        <div class="text-des">${var[1]}</div>
                                    </li>
                                    </#list>
                                 </#if>
                                </ul>
                            </div>

                            <!-- 下面是前/后按钮代码，如果不需要删除即可 -->
                            <a class="prev" href="javascript:void(0)"></a>
                            <a class="next" href="javascript:void(0)"></a>
                        </div>
                        <script>
                            jQuery(".slideBox").slide({mainCell:".bd ul",effect:"leftLoop",autoPlay:true,interTime:4000});
                        </script>
                    </div>
                    <div class="main-box1-con-wrap-right">
                        <ul>
                         <#list fieldListxyxw as var>
                           <li> <a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a><span>${var[4]}</span></li>
                         </#list>
                        </ul>
                        
                    </div>
                </div>
            </div>
        </div>
        <!--main1结束-->
        <div class="main-box2">
            <div class="main-box2-con">
                <div class="main-box2-con-left">
                    <div class="slideGroup">
                        <div class="parHd">
                            <ul>
                                <li><a href="">通知公告</a></li>
                            </ul>
                            <div class="more-my">
                                <a href="webNotice.html">更多</a>
                            </div>
                        </div>
                        <div class="tempWrap">
                        <div class="ul">
                         <#list fieldListtzgg as var>
                            <div class="li">
                                <div class="li-left">
                                    <span class="time1">${var[4][8..9]}</span>
                                    <span class="time2">${var[4][0..6]}</span>
                                </div>
                                <div class="li-right">
                                    <a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a>
                                </div>
                            </div>
                          </#list>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!--main2结束-->
        <div class="main-box3-con">
            <div class="main-box3-con-left">
                <div class="slideTxtBox">
                    <div class="hd2">
                        <ul>
                           <li>党建团学</li>
                        </ul>
                    </div>
                    <div class="bd2">
                        <ul>
                            <div class="more"><a href="webdj.html">更多</a></div>
                            <#list fieldListdj as var>
                            <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a><span>${var[4]}</span></li>
                            </#list>
                             <#list fieldListsz as var>
                            <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a><span>${var[4]}</span></li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
            <!--right-->
            <div class="main-box3-con-right">
                <div class="slideTxtBox">
                    <div class="hd1">
                        <ul>
                             <li>教学科研</li>
                        </ul>
                    </div>
                    <div class="bd1">
                        <ul>
                            <div class="more"><a href="webjx.html">更多</a></div>
                             <#list fieldListjx as var>
                            <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a><span>${var[4]}</span></li>
                            </#list>
                            <#list fieldListky as var>
                            <li><a href="webdetail.html?CONTENTS_ID=${var[0]}">${var[1]}</a><span>${var[4]}</span></li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--main4-->
        <div class="main-box4">
            <div class="main-box4-con">
                <div class="main-box4-con-right-bt">
                    <h3>专题导航</h3>
                    <div class="more">
                        <a href="">更多</a>
                    </div>
                </div>
                <div class="main-box4-con-right-wrap">
                    <ul>
                        <li class="ww"><a href="weblist_1.html"><img src="fh_static_1/imgs/link05.png" alt="">习近平新时代中国特色社会主义思想研究中心</a></li>
                        <li><a href="weblist_2.html"><img src="fh_static_1/imgs/link01.png" alt="">品味大学</a></li>
                        <li ><a href="weblist_3.html" ><img src="fh_static_1/imgs/link02.png" alt="">红色文才</a></li>
                        <li class="ww2"><a href="weblist_4.html"><img src="fh_static_1/imgs/link03.png" alt="">研究生学术论坛</a></li>
                        <#list fieldListbksglxt as var>
                        <li class="ww2"><a href="${var[5]}" target="_blank"><img src="fh_static_1/imgs/link04.png" alt="">本科生导师管理系统</a></li>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
        <!--main4-->
    </div>
<!--main-->
<!--footer-->
   <#include "footerTemplate.ftl"> 
<!--footer-->
<script src="fh_static_1/js/slide.js"></script>
<script src="fh_static_1/js/public.js"></script>
<script src="fh_static_1/js/index.js"></script>
</body>
</html>
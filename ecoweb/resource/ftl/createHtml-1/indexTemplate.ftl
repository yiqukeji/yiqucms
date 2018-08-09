<!DOCTYPE html>
<html lang="en">
<head>

    <meta name="renderer" content="webkit" /> 
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>${TITLE}</title>
	<meta charset="utf-8">
	
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link href="fh_static_1/imgs/favicon.ico" type="image/x-icon" rel="Shortcut Icon"/>
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
                    <a href="#" target="_blank"><img src="${var[1]}" /></a>
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
                    <h3 class="title0">学院新闻</h3>
                    <div class="more">
                    <#list fieldListeo23 as var>
                      <#if var_index  = 0>
                        <a href="JavaScript:;" onclick="gotoHtml('webnew.html','0','eo23')">更多</a>
                        </#if>
			         </#list>
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
                        <script>
                            jQuery(".slideBox").slide({mainCell:".bd ul",effect:"leftLoop",autoPlay:true,interTime:4000});
                        </script>
                    </div>
                    <div class="main-box1-con-wrap-right">
                        <ul>
                        
                         <#if fieldListeo23?size gt 5>
                         <#list fieldListeo23[0..5] as var>
                            <#if var_index =0>
                            <li style="font-weight:700;"><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','0','eo23','${var[0]}')">${var[1]}</a><span>${var[4]?substring(0,10)}</span></li>
                            <#else>
                            <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','0','eo23','${var[0]}')">${var[1]}</a><span>${var[4]?substring(0,10)}</span></li>
                            </#if>
                         </#list>
                          <#elseif fieldListeo23?size lte 5>
                          <#list fieldListeo23 as var>
                            <#if var_index =0>
                            <li style="font-weight:700;"><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','0','eo23','${var[0]}')">${var[1]}</a><span>${var[4]?substring(0,10)}</span></li>
                            <#else>
                            <li><a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','0','eo23','${var[0]}')">${var[1]}</a><span>${var[4]?substring(0,10)}</span></li>
                            </#if>
                         </#list>
                         </#if>
                         
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
                                <li><a href="#" class="title1">通知公告</a></li>
                            </ul>
                            <div class="more-my">
                            <#list fieldListeo24 as var>
                            <#if var_index  = 0>
                                <a href="JavaScript:;" onclick="gotoHtml('webnew.html','1','eo24')">更多</a>
                                </#if>
			               </#list>
                            </div>
                        </div>
                        <div class="tempWrap">
                        <div class="ul">
                         <#list fieldListeo24 as var>
                            <div class="li">
                                <div class="li-left">
                                    <span class="time1">${var[4]?substring(8,10)}</span>
                                    <span class="time2">${var[4]?substring(0,7)}</span>
                                </div>
                                <div class="li-right">
                                    <a href="JavaScript:;" title="${var[1]}" onclick="gotoDetail('webdetail.html','1','eo24','${var[0]}')">${var[1]}</a>
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
                             <div class="more">
                            <a href="JavaScript:;" onclick="gotoHtml('webnew.html','2','eo37')">更多</a>
                            </div>
                            <li class="title2">党建学团</li>
                        </ul>
                    </div>
                    <div class="bd2">
                        <ul>
                            <#list fieldListeo37 as var>
                            <li><a title="${var[1]}" href="JavaScript:;" onclick="gotoDetail('webdetail.html','2','eo37','${var[0]}')">${var[1]}</a><span>${var[4]?substring(0,10)}</span></li>
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
                            <li class="title3">教学科研</li>
                        </ul>
                    </div>
                    <div class="bd1">
                        <ul>
                            <div class="more">
                            <#list fieldListeo38 as var>
                            <#if var_index  = 0>
                            <a href="JavaScript:;" onclick="gotoHtml('webnew.html','3','eo38')">更多</a>
                            </#if>
			               </#list>
                            </div>
                            <#list fieldListeo38 as var>
                            <li><a title="${var[1]}" href="JavaScript:;" onclick="gotoDetail('webdetail.html','3','eo38','${var[0]}')">${var[1]}</a><span>${var[4]?substring(0,10)}</span></li>
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
                        <li class="ww"><a href="JavaScript:;" onclick="gotoHtml('webnew.html','4','eo25')" ><img src="fh_static_1/imgs/link05.png" alt="" ><span class="title4">习近平新时代中国特色社会主义思想研究中心</span></a></li>
                        <li><a href="JavaScript:;" onclick="gotoHtml('webnew.html','5','eo26')"><img src="fh_static_1/imgs/link01.png" alt="" /><span class="title5">品味大学</span></a></li>
                        <li ><a href="JavaScript:;" onclick="gotoHtml('webnew.html','6','eo27')" ><img src="fh_static_1/imgs/link02.png" alt=""/> <span class="title6">红色文才</span></a></li>
                        <li class="ww2"><a href="JavaScript:;" onclick="gotoHtml('webnew.html','7','eo28')"><img src="fh_static_1/imgs/link03.png" alt="" ><span class="title7">研究生学术论坛</span></a></li>
                        <li class="ww2"><a href="http://cas.gzife.edu.cn/cas/login?service=http%3A%2F%2Fi.gufe.edu.cn%2Fdcp%2Findex.jsp"  target="_blank"><img src="fh_static_1/imgs/link04.png" alt=""><span class="title8">本科生导师管理系统</span></a></li>
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
<script src="fh_static_1/js/toList.js"></script>
</body>
</html>
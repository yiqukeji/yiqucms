<link rel="stylesheet" href="fh_static_1/css/myAlert.min.css" />
 <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">   
<script type="text/javascript" src="fh_static_1/js/myAlert.min.js" ></script>
<div class="top">
    <div class="center-show">
        <p class="riqi-time-p">今天是:<span class="yyr" id="yyr"></span> <span class="xinqi" id="xinqi"></span></p>
        <ul>
            <li><a href="http://www.gufe.edu.cn/www/" target="_blank">学校首页</a></li>
            <li>|</li>
            <li><a href="http://portal.gzife.edu.cn/yjsgzb/" target="_blank">旧版回顾</a></li>
            <li>|</li>
            <li><a href="" target="_blank">招生信息</a></li>
            <li>|</li>
            <li><a href="" target="_blank">就业信息</a></li>
        </ul>
    </div>
</div>
<!--top-->
<!--header-->
<div class="header">
    <div class="center-show">
        <div class="header-con-logo">
            <a href=""><img src="fh_static_1/imgs/logo.png" alt="经济学院logo"></a>
        </div>
        <div class="header-form">
            <form id="search_form" method="post" action=""  name="Form">
                <input type="text" placeholder="请输入你要搜索的内容" class="test" id="key">
                <input type="image" src="fh_static_1/imgs/search.png" onclick="search()">
            </form>
            <input name="keywords" class="keywords" type="hidden" value=""/>
        </div>
    </div>
</div>
<!--header-->
<!--nav-->
<div class="nav">
    <div class="center-1200">
        <div class="shouji"></div>
        <ul class="hover">
            <li><a href="index.html">首页</a></li>
            <li><a href="webnews1.html" class="eo01_menu">学院概况</a>
                <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo01">
                            <li><a href="webnews1.html">学院简介<span hidden="hidden">|</span></a></li>
                            <li><a href="webindex.html" class="ons" >现任领导<span hidden="hidden">|</span></a></li>
                            <li><a href="webnews2.html">组织机构<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo04',this,'eo04')" class="eo04_menu">本科生教育</a>
                <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo04">
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo04',this,'eo04')" class="" id="eo04">专业介绍<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo05',this,'eo04')" class="">培养方案<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo06',this,'eo04')" class="">规章制度<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo07',this,'eo07')" class="eo07_menu">研究生教育</a>
                <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo07">
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo07',this,'eo07')" class="" id="eo07">专业介绍<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo08',this,'eo07')" class="">培养方案<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo09',this,'eo07')" class="">规章制度<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            
            
            <li><a href="webj.html">师资队伍</a>
            <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo32">
                            <li><a href="webj.html">经济系<span hidden="hidden">|</span></a></li>
                            <li><a href="webc.html">财税系<span hidden="hidden">|</span></a></li>
                            <li><a href="webg.html">国经系<span hidden="hidden">|</span></a></li>
                            <li><a href="webk.html" >科研机构<span hidden="hidden">|</span></a></li>
                            <li><a href="webx.html" >行政机构<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            
            </li>
            
            
            
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo10',this,'eo11')" class="eo11_menu">对外交流</a>
                <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo11">
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo10',this,'eo11')" class="" id="eo11">最新消息<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11',this,'eo11')" class="">国际交流<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo12',this,'eo11')" class="">学术交流<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo12',this,'eo13')" class="eo13_menu">党建工作</a>
                <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo13">
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo12',this,'eo13')" class="" id="eo13">最新消息<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo13',this,'eo13')" class="">党建中心<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo14',this,'eo13')" class="">党务工作<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo15',this,'eo13')" class="">工会之声<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo16',this,'eo13')" class="">理论学习<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo16',this,'eo17')" class="eo17_menu">科学研究</a>
                <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo17">
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo16',this,'eo17')" class="" id="eo17">最新消息<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo17',this,'eo17')" class="">学科建设<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo18',this,'eo17')" class="">科研动态<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo18',this,'eo19')" class="eo19_menu">学团工作</a>
                <div class="erji">
                    <div class="center-1200">
                        <ul class="sub-menu eo19">
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo11_eo18',this,'eo19')" class="" id="eo19">最新消息<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo19',this,'eo19')" class="">学团工作<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo20',this,'eo19')" class="">团委工作<span hidden="hidden">|</span></a></li>
                            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo21',this,'eo19')" class="">学生社团<span hidden="hidden">|</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo22',this,'eo22')" class="eo22_menu">校友风采</a></li>
            <li><a href="JavaScript:;" onclick="gotoSubHtml('websub.html','eo31',this,'eo31')" class="eo31_menu">十九大专栏</a></li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="fh_static_1/js/search.js"></script>
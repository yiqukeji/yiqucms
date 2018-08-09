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
            <div class="boxs">
                <ul>
                <#list fieldListxrld as var>
                    <li>
                        <div class="zhiwei">${var[6]}<span></span></div>
                        <div class="pic">
                            <img src="${var[3]}" alt="${var[6]}">
                        </div>
                        <div class="text">
                            <div class="tx-nr">
                                
                                <p class="text-quanli">${var[2]}</p>
                            </div>
                            <a href="webleaderDetail.html?CONTENTS_ID=${var[0]}">
                                <div class="genduo">阅读更多<img src="fh_static_1/imgs/genduo.png"></div>
                            </a>
                        </div>
                    </li>
                     </#list>
                </ul>
                <div id="page" class="page_div"></div>
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
    //分页
    $("#page").paging({
        pageNo: 10,
        totalPage:${totalPagexrld},
        totalSize: ${totalResultxrld},
        callback: function (num) {
            ajaxTest(${currentPagexrld});
        }
    })
    /*
    // 模拟ajax数据用以下方法，方便用户更好的掌握用法
    //参数为当前页 */
    ajaxTest(1);
    function ajaxTest(num) {
        $.ajax({
            url: "web/pageHtml.do",
            type: "get",
            data: {PUB_TYPE:'xrld',currentPage:num},
            dataType: "json",
            success: function(data) {
                console.log(data);
                rendering(data);//渲染数据
                //分页
                $("#page").paging({
                    pageNo: num,
                    totalPage: data.page.totalPage,
                    totalSize: data.page.totalResult,
                    callback: function(num) {
                        ajaxTest(num)
                    }
                })
            }
        })
    }
</script>
<script src="fh_static_1/js/public.js"></script>
<script src="fh_static_1/js/rendering.js"></script>
</body>
</html>
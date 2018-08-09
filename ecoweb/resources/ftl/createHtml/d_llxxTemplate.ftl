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
               党建工作
            </div>
            <ul>
                <li><a href="webzxxx_d.html">最新消息</a></li>
                 <li><a href="webdjgz_d.html">党建中心</a></li>
                <li><a href="webdwgz_d.html">党务工作</a></li>
                <li ><a href="webghzs_d.html">工会之声</a></li>
                <li class="ons"><a href="webllxx_d.html">理论学习</a></li>
            </ul>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="index.html">首页</a>&nbsp;>&nbsp;党建工作&nbsp;>&nbsp;理论学习</p>
            </div>
            <div class="list">
                <ul class="list-ul">
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

<script src="fh_static_1/js/public.js"></script>
<script>

    //分页
    $("#page").paging({
        pageNo: 10,
        totalPage:${totalPagellxx_d},
        totalSize: ${totalResultllxx_d},
        callback: function (num) {
            ajaxTest(${currentPagezyjs});
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
            data: {PUB_TYPE:'llxx_d',currentPage:num},
            dataType: "json",
            success: function(data) {
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
<script src="fh_static_1/js/rendering.js"></script>
</body>
</html>
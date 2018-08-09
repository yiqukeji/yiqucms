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
    <script src="fh_static_1/js/layer.js"></script>
</head>
<body>
<!--公共头部-->
<#include "headerTemplate.ftl">
<!--nav-->
<!--公共头部-->
<!--body部分-->
<div class="content">
    <div class="center-1200">
        <div class="cont-menu">
            <div class="cont-menu-title">
                院长信箱
            </div>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="index.html">首页</a>>院长信箱</p>
            </div>
            <div class="email">
                <div class="email-title">院长信箱</div>
                <div class="form-div">
                      <form action=""  method="post">
                        <input value="yz" hidden="hidden" name="TYPE" id="TYPE"/>
                        <div><label>姓 名 :</label><input type="text" name="NAME" id="NAME" placeholder="请输入您的姓名" required></div>
                        <div><label>电 话 :</label><input type="tel" name="TEL" id="TEL" placeholder="请输入您的电话" required maxlength="11"></div>
                        <div><label>Q&nbsp&nbspQ :</label><input name="QQ" type="text"  id="QQ" placeholder="请输入您的扣扣"></div>
                        <div><label>邮 箱 :</label><input type="text" name="EMAIL" id="EMAIL" placeholder="请输入您的邮箱" required></div>
                        <div><label>意 见 :</label><textarea id="CONTEXT" name="CONTEXT" placeholder="请输入你的意见..." required></textarea></div>
                        <div><input type="button" onclick="savaMessage()" value="提交"></div>
                        </form>
                </div>
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
        pageNo: 5,
        totalPage: 9,
        totalSize: 300,
        callback: function (num) {
            // alert(num)
        }
    })

    /*
    // 模拟ajax数据用以下方法，方便用户更好的掌握用法
    //参数为当前页
    ajaxTest(1);

    function ajaxTest(num) {
        $.ajax({
            url: "table.json",
            type: "get",
            data: {},
            dataType: "json",
            success: function(data) {
                //分页
                $("#page").paging({
                    pageNo: num,
                    totalPage: data.totalPage,
                    totalSize: data.totalSize,
                    callback: function(num) {
                        ajaxTest(num)
                    }
                })
            }
        })
    }
    */
</script>
<script src="fh_static_1/js/rendering.js"></script>
</body>
</html>
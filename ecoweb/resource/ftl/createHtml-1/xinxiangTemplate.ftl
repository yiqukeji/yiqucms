<!DOCTYPE html>
<html lang="en">
<head>
    <title>${TITLE}</title>
	<meta charset="utf-8">
	<meta name="keywords" content="${KEYWORDS}" />
	<meta name="description" content="${DESCRIPTION}" />
    <link rel="stylesheet" href="fh_static_1/css/public.css">
    <link rel="stylesheet" href="fh_static_1/css/listPage.css">
    <script src="fh_static_1/js/jquery-2.1.0.js"></script>
    <script src="fh_static_1/js/paging.js"></script>
   <script src="fh_static_1/js/layer.js"></script>
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
            </div>
        </div>
        <div class="cont-right">
            <div class="location">
                <p>你的位置:&nbsp;<a href="./index.html">首页</a>><span class="index"></span></p>
            </div>
            <div class="email">
                <div class="email-title"></div>
                <div class="form-div">
                    <form action="">
                        <div><label>姓 名 :</label><input type="text" class="NAME" name="NAME" placeholder="请输入您的姓名" required></div>
                        <div><label>电 话 :</label><input type="tel" class="TEL" name="TEL" placeholder="请输入您的电话" required maxlength="11"></div>
                        <div><label>Q Q :</label><input type="text" class="QQ" name="QQ" placeholder="请输入您的扣扣"></div>
                        <div><label>邮 箱 :</label><input type="text" class="EMAIL" name="EMAIL" placeholder="请输入您的邮箱" required></div>
                        <div><label>意 见 :</label><textarea name="CONTEXT" class="CONTEXT" placeholder="请输入你的意见..." required></textarea></div>
                        <input class="type"  name="TYPE" type="hidden" value=""/>
                        <div><input type="button"  value="提交" onclick="qj()"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--body部分-->
<!--footer-->
<script src="fh_static_1/js/public.js"></script>
<!--footer-->
<script>
    window.onload=function (ev) {
       var url = ((window.location+"").split('name='))[1];
       var name = unescape(url.split("&")[0]);
       var type = url.split("&")[1].split("type=")[1];
       $(".cont-menu-title").html(name);
       $(".index").html(name);
       $(".email-title").html(name);
       $(".type").val(type);
    }
     function qj(){
         var NAME = $(".NAME").val();
         var TEL = $(".TEL").val();
         var QQ = $(".QQ").val();
         var EMAIL = $(".EMAIL").val();
         var CONTEXT = $(".CONTEXT").val();
         var TYPE = $(".type").val();
         var jsonStr = {"NAME":NAME,"TEL":TEL,"QQ":QQ,"EMAIL":EMAIL,"CONTEXT":CONTEXT,"TYPE":TYPE}
         $.ajax({
            url: "web/savaMessage.do",
	        type: "post",
	        data: jsonStr,
	        dataType: "json",
	        success: function(data) {
	         layer.alert('提交成功');
	         }
         })
       }

</script>
<script src="fh_static_1/js/toList.js"></script>
</body>
</html>
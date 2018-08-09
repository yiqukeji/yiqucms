//解决hover样式在手机端的二次点击
// document.body.addEventListener('touchstart',function (ev) {  });

//

var flag=true;
$('.shouji').click(function () {
    if(flag){
        $('.nav').css('overflow','visible');
        flag=false;
    }else if (!flag){
        $('.nav').css('overflow','hide');
        flag=true;
    }else {
        return false;
    }
})



// top时间显示
var datas = new Date;
var years = datas.getFullYear();
var months = datas.getMonth()+1;
var days = datas.getDate()
var xinqi = datas.getDay();

var yyrs = document.getElementById('yyr').innerHTML= years+'年'+months+'月'+days+'日';
var shuzu = new Array;
shuzu = ['星期天','星期一','星期二','星期三','星期四','星期五','星期六']
var xinqis = document.getElementById('xinqi').innerHTML=shuzu[xinqi];


$('.nav ul li').hover(function () {
    $(this).children('.erji').stop().slideDown();
},function () {
    $(this).children('.erji').stop().slideUp();
})
////实现内容详情数据的读取
//	$(function(){
//		alert(1);
//			getById();
//		});
//		function getById(){
//			var n1 = loc.length;//地址的总长度
//			var n2 = loc.indexOf("=");//取得=号的位置
//			var str = decodeURI(loc.substr(n2+1, n1-n2));//从=号后面的内容
//			var strHtml = str.substr(0,9)+'.html';
//			var strName = str.substr(15,str.indexOf("&")-5);
//			var strId = str.substr(str.indexOf("CONTENTS_ID=")+12)
//			$(".context-left-title").html(strName);
//			$(".title0").html(strName);
//			$(".title0").attr("href",strHtml);
//			$.ajax({
//				type: "POST",
//				url: 'web/getNewDetail.do',
//		    	data: {CONTENTS_ID:strId},
//				dataType:'json',
//				cache: false,
//				success: function(data){
//				alert(JSON.stringify(data));
//				}
//			});
//		}

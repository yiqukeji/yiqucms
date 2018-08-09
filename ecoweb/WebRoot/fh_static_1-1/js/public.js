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

$(".hover a").hover(function(){
	$(this).css("color","red");
},function(){
	$(this).css("color","white");
})



$(".video_box").hover(function(){
	$("video").attr("controls","controls");
},function(){
	$("video").removeAttr("controls");
})

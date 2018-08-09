// banner切换
jQuery(".focusBox").slide({ titCell:".num li", mainCell:".pic",effect:"fold", autoPlay:true,trigger:"click",interTime:5000,delayTime:400,
    startFun:function(i){
        jQuery(".focusBox .txt li").eq(i).animate({"bottom":0},400).siblings().animate({"bottom":-70},400);
    }
});


$('.tempWrap').eq(0).show();
$('.parHd ul li').eq(0).addClass('on');
//2个菜单切换
$('.parHd ul li').hover(function () {
    var index =$(this).index();
    $(this).addClass('on').siblings().removeClass('on');
    $('.tempWrap').eq(index).show().siblings('.tempWrap').hide();
})


//3个菜单的切换
$('.hd2 ul li').eq(0).addClass('actives');
$('.slideTxtBox .bd2 ul').eq(0).show()
$('.hd2 ul li').hover(function () {
    var index = $(this).index();
    $(this).addClass('actives').siblings().removeClass('actives');
    $('.slideTxtBox .bd2 ul').eq(index).show().siblings('.slideTxtBox .bd2 ul').hide();
})

$('.hd1 ul li').eq(0).addClass('actives');
$('.slideTxtBox .bd1 ul').eq(0).show()
$('.hd1 ul li').hover(function () {
    var index = $(this).index();
    $(this).addClass('actives').siblings().removeClass('actives');
    $('.slideTxtBox .bd1 ul').eq(index).show().siblings('.slideTxtBox .bd1 ul').hide();
})
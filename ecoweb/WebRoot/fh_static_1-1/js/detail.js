$(function(){
	setDetail();
})
function setDetail(){
	var mark = ((window.location+"").split('mark='))[1];
	var arr = mark.split("&");
	var type = arr[0];
	var name = unescape(arr[1].split("=")[1]);
	var id = arr[2].split("=")[1];
	var key = unescape(arr[3].split("=")[1]);
	if(type=="eo10"){
		$(".name0").html("经济系>");
		$(".name0").attr("href","webj.html");
	}else if(type=="eo33"){
		$(".name0").html("财税系>");
		$(".name0").attr("href","webc.html");
	}else if(type=="eo34"){
		$(".name0").html("国经系>");
		$(".name0").attr("href","webg.html");
	}else if(type=="eo35"){
		$(".name0").html("科研机构>");
		$(".name0").attr("href","webk.html");
	}else if(type=="eo36"){
		$(".name0").html("行政机构>");
		$(".name0").attr("href","webx.html");
	}
	$(".name").html(name);
	$(".keywords").val(key);
	if(type=='eo25'||type=='eo29'){
		$(".cont-menu div").removeClass("cont-menu-title");
		$(".cont-menu div").addClass("cont-menu-title2");
		$(".cont-menu-title2").html(name);
	}else{
		$(".cont-menu-title").html(name);
	}
	$(".type").val(type);
	getDetail(id,type);
}
function getDetail(CONTENTS_ID,type){
	$.ajax({
		type: "POST",
		url: 'web/getNewDetail.do',
    	data: {CONTENTS_ID:CONTENTS_ID},
		dataType:'json',
		cache: false,
		success: function(data){
		$(".details-title").html(data.data.TITLE);
		$(".time").html(data.data.PUB_TIME);
		$(".number").html(data.data.NUMBER+"次");
		$(".source").html(data.data.PUB_SOURCE);
		$(".contents").html(data.data.CONTENT);
		$(".bj").html("【责任编辑："+data.data.PUBLISHER+"】");
		}
	});
}
//加载详情页面跳转回来
function toSubHtml(){
	var name = $(".name").html();
	var type = $(".type").val();
	var key = $(".keywords").val();
	name = escape(name);
	if(type=="eo10"||type=="eo33"||type=="eo34"||type=="eo35"||type=="eo36"){
    window.location.href ="webj.html";	
	}else if(key!='undefined'&&key!=""){
	window.location.href ="webseach.html?keywords="+key;	
	}else{
	window.location.href ="webnew.html?mark="+type+"&name="+name;	
	}
	
}

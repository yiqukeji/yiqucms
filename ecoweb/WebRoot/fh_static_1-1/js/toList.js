function gotoHtml(html,type,mark){
	var name="";
	if(type=='0'){
	name = $(".title0").html();//学院新闻
	}else if(type=='1'){
	name = $(".title1").html();//通知公告
	}else if(type=='2'){
	name = $(".title2").html();//党建团学
	}else if(type=='3'){
	name = $(".title3").html();//教学科研
	}else if(type=='4'){
    name = $(".title4").html();//习近平新时代中国特色社会主义思想研究中心
	}else if(type=='5'){
	name = $(".title5").html();//品味大学	
	}else if(type=='6'){
	name = $(".title6").html();//红色文才	
	}else if(type=='7'){
	name = $(".title7").html();//研究生学术论坛	
	}else if(type=='8'){
	name = $(".title8").html();//本科生导师管理系统	
	}else if(type=="30"){//讲习宣传团
	name = $(".title9").html();	
	}
	name = escape(name);
	window.location.href =html+"?mark="+mark+"&name="+name;
}

function gotoDetail(html,type,mark,id){
	var key = $(".keywords").val();
	var name="";
	if(type=='0'){
	name = $(".title0").html();//学院新闻
	}else if(type=='1'){
	name = $(".title1").html();//通知公告
	}else if(type=='2'){
	name = $(".title2").html();//党建团学
	}else if(type=='3'){
	name = $(".title3").html();//教学科研
	}else if(type=="eo10"||type=="eo33"||type=="eo34"||type=="eo35"||type=="eo36"){
    name = $(".eo10").html();//师之队伍	
	}else{
		name = type;
	}
	name = escape(name);
	key  = escape(key);
	window.location.href =html+"?mark="+mark+"&name="+name+"&id="+id+"&key="+key;
}

//跳转到二级菜单页面
function gotoSubHtml(html,mark,obj,cls){
	var name = '';
	var ch ="\."+cls+" li a";//获取二级菜单的数据内容
	var ch0 = "\."+cls+"_menu"//获取一级菜单名选择器
	var strList =$(ch).text();
	//合理获取菜单对应的内容
	var bs = $(obj).attr('class').split("_");
	if(strList!=''&&bs[1]=='menu'){
	var id ="#"+bs[0];
	name = $(id).text().split("|")[0];
	}else{
	name = obj.innerText;	
	}
	//判断没有子菜单的页面
	if(strList==''){
	strList =$(ch0).html()
	}else{
	strList =$(ch0).html()+"|"+strList;
	}
	name = escape(name);
	strList = escape(strList);
	window.location.href =html+"?mark="+mark+"&name="+name+"&strList="+strList+"&cls="+cls;
}
//领导详情
function gotoLeaderDetail(html,type,mark,id){
	name = escape(type);
	window.location.href =html+"?mark="+mark+"&name="+name+"&id="+id+"&key="+key;
}
//信箱数据
function xx(name,type){
	var name = escape(name);
	window.location.href ="webxx.html?name="+name+"&type="+type;
}

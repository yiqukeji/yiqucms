$(function(){
	var mark = ((window.location+"").split('mark='))[1];
	var arr = mark.split("&");
	var type = arr[0];//获取后台数据值类型
	//渲染子菜单列表
	var strList = unescape(arr[2].split("=")[1]);
	var cls0 = unescape(arr[3].split("=")[1]);
	var index = parseInt(cls0.substring(2,4));
	var subName =  strList.split("|");
	var name = unescape(arr[1].split("=")[1]);//首页>XXX>name
	var flag = true;//对外交流最新消息
	//渲染左边的数据列表
	for(var i=1;i<subName.length-1;i++){
		var str="<li class='eo0"
			str+=i
			str+="'><a class='' href='JavaScript:;' "
			str+="onclick=gotoSubHtml('websub.html','"
			if(index>9){
		    //判断不同最新消息标识
			if(index=='11'&&flag||index=='13'&&flag||index=='17'&&flag||index=='19'&&flag){
				flag = false
				str+="eo11_"
			}
			if(index=='11'&&!flag||index=='13'&&!flag||index=='17'&&!flag||index=='19'&&!flag){
				str+="eo"     //根据前台传过来的值进行动态的配置
				str+=index+i-2	
			}
			if(index!='11'&&index!='13'&&index!='17'&&index!='19'){
				str+="eo"     //根据前台传过来的值进行动态的配置
				str+=index+i-1	
			}
			}else{//小于10的情况
		     str+="eo0"
		     str+=index+i-1
			}
			str+="',"
			str+="this"
			str+=",'"
			str+=cls0//这里不需要变化，直接传过来就行
			str+="'"
			str+=")"
			str+=">"
			str+=strList.split("|")[i]
			str+="</a></li>"
		 $(".subMenu").append(str);
	}
	//追加列表数据
	setMenuDateList(1,type,name);
	//判断一级菜单中的type追加相应的类
	xuanran(type);
	//追加子标签的名称
    var	menu = strList.split("|")[0]
    $(".menu").html(menu);
	$(".name").html(name);
	$(".type").val(type);
	$(".cont-menu-title").html(menu);//最左边栏目名称
	
})
//样式渲染
function xuanran(type){
	if(type=="eo01"){
	$(".eo01").addClass("ons");
	}else if(type=="eo02"){
		$(".eo02").addClass("ons");
	}else if(type=="eo03"){
		$(".eo03").addClass("ons");
	}else if(type=="eo04"){
		$(".eo01").addClass("ons");
	}else if(type=="eo05"){
		$(".eo02").addClass("ons");
	}else if(type=="eo06"){
		$(".eo03").addClass("ons");
	}else if(type=="eo07"){
		$(".eo01").addClass("ons");
	}else if(type=="eo08"){
		$(".eo02").addClass("ons");
	}else if(type=="eo09"){
		$(".eo03").addClass("ons");
	}else if(type=="eo11_eo10"){
		$(".eo01").addClass("ons");
	}else if(type=="eo11"){
		$(".eo02").addClass("ons");
	}else if(type=="eo12"){
		$(".eo03").addClass("ons");
	}else if(type=="eo11_eo12"){
		$(".eo01").addClass("ons");
	}else if(type=="eo13"){
		$(".eo02").addClass("ons");
	}else if(type=="eo14"){
		$(".eo03").addClass("ons");
	}else if(type=="eo15"){
		$(".eo04").addClass("ons");
	}else if(type=="eo16"){
		$(".eo05").addClass("ons");
	}else if(type=="eo11_eo16"){
		$(".eo01").addClass("ons");
	}else if(type=="eo17"){
		$(".eo02").addClass("ons");
	}else if(type=="eo18"){
		$(".eo03").addClass("ons");
	}else if(type=="eo11_eo18"){
		$(".eo01").addClass("ons");
	}else if(type=="eo19"){
		$(".eo02").addClass("ons");
	}else if(type=="eo20"){
		$(".eo03").addClass("ons");
	}else if(type=="eo21"){
		$(".eo04").addClass("ons");
	}
}
//加载列表数据
function setMenuDateList(val,type,name){
	$.ajax({
		type: "POST",
		url: 'web/pageHtml.do',
    	data: {PUB_TYPE:type,currentPage:val},
		dataType:'json',
		cache: false,
		success: function(data){
			rending(data,type,name);
			page(data);
		}
	});
}
//数据渲染
function rending(data,type,name){
	$(".list-ul").empty();
	for(var i=0;i<data.list.length;i++){
		var str="<li><a href='JavaScript:;' title='"
			str+=data.list[i].TITLE
			str+="'"
			str+=" onclick=gotoDetail('webdetail.html','"
			str+=name
			str+="','"
			str+=type
			str+="','"
			str+=data.list[i].CONTENTS_ID
			str+="'"
			str+=")"
			str+=">"
			str+=data.list[i].TITLE
			str+="</a><span>"
			str+=data.list[i].PUB_TIME.substring(0,10);
			str+="</span></li>"
		$(".list-ul").append(str);
	}
};
//分页数据
function page(data){
	var type = $(".type").val();
	//假如是学院概况的话不显示分页数据
	if(type!='eo01'&&type!='eo03'){
	$("#page").paging({
	    pageNo: data.page.currentPage,//当前页
	    totalPage: data.page.totalPage,//总页数
	    totalSize: data.page.totalResult,//数据总条数
	    callback: function (num) {
	    	setDateList(num);
	    }
	})
	}else{
		
	}
}


//加载列表数据
function setDateList(val){
	var type = $(".type").val();
	var name = $(".name").html();
	$.ajax({
		type: "POST",
		url: 'web/pageHtml.do',
    	data: {PUB_TYPE:type,currentPage:val},
		dataType:'json',
		cache: false,
		success: function(data){
			rending(data,type,name);
			page(data);
		}
	});
}
window.onload =function(){
	setTitle();
}
function setTitle(){
	var mark = ((window.location+"").split('mark='))[1];
	var arr = mark.split("&");
	var type = arr[0];
	var name = unescape(arr[1].split("=")[1]);
	$(".name").html(name);
	//因为在专题导航栏目中，两个字数的大小没做限制，所以在这里进行统一
	if(type=='eo25'||type=='eo29'){
		$(".cont-menu div").removeClass("cont-menu-title");
		$(".cont-menu div").addClass("cont-menu-title2");
		$(".cont-menu-title2").html(name);
	}else{
		$(".cont-menu-title").html(name);
	}
	$(".type").val(type);//设置
	setDateList("1");//加载数据列表
}
//加载列表数据
function setDateList(val){
	var type = $(".type").val();
	$.ajax({
		type: "POST",
		url: 'web/pageHtml.do',
    	data: {PUB_TYPE:type,currentPage:val},
		dataType:'json',
		cache: false,
		success: function(data){
			rending(data);
			page(data);
		}
	});
}
//数据渲染
function rending(data){
	$(".list-ul").empty();
	var name = $(".name").html();
	var type = $(".type").val();
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
}
//分页数据
function page(data){
	$("#page").paging({
	    pageNo: data.page.currentPage,//当前页
	    totalPage: data.page.totalPage,//总页数
	    totalSize: data.page.totalResult,//数据总条数
	    callback: function (num) {
	    	setDateList(num);
	    }
	})
}

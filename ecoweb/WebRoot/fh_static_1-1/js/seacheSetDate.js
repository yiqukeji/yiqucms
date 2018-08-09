$(function (){
ajaxTest(1)
})
//加载列表数据
function ajaxTest(val){
	var keywords = ((window.location+"").split('keywords='))[1];
	var keywords = decodeURI(keywords);
	$(".keywords").val(keywords);
	var nowDate = new Date().getTime();
	$.ajax({
		type: "POST",
		url: 'web/list.do',
    	data: {keywords:keywords,currentPage:val},
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
//	var type = $(".type").val();
	var key = $(".keywords").val();
	for(var i=0;i<data.list.length;i++){
		var str="<li><a href='JavaScript:;' title='"
			str+=data.list[i].TITLE
			str+="'"
			str+=" onclick=gotoDetail('webdetail.html','"
			str+=name
			str+="','"
			str+="seach"
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
	    	ajaxTest(num);
	    }
	})
}
function search(){
    var searchStr = $("#key").val();
    document.getElementById("search_form").action="websearch.html?keywords="+searchStr;
}
function ajaxTest(num){
	var keywords = ((window.location+"").split('keywords='))[1];
	var keywords = decodeURI(keywords);
	var nowDate = new Date().getTime();
	$.ajax({
		type: "POST",
		url: 'web/list.do',
    	data: {keywords:keywords,currentPage:num},
		dataType:'json',
		cache: false,
		success: function(data){
			getSearchDate(data,keywords);
			  $("#page").paging({
                  pageNo: num,
                  totalPage: data.page.totalPage,
                  totalSize: data.page.totalResult,
                  callback: function(num) {
                	  ajaxTest(num)
                  }
              })
		}
	});
	
};

//分页开始
ajaxTest(1)
//分页结束
//数据渲染
function getSearchDate(data,keywords){
	$(".list-ul").empty();
	if(data.list.length>0){
		for(var i=0;i<data.list.length;i++){
			var str = "<li><a href='webdetail.html?CONTENTS_ID="
				str+=data.list[i].CONTENTS_ID
				str+="'>"
				str+=data.list[i].TITLE
				str+="</a><span class='date'>"
				str+=data.list[i].PUB_TIME
				str+="</span></li>"
				$(".list-ul").append(str);
		}
			
	}
}
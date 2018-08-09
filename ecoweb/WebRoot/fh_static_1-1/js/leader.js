window.onload =function(){
	setDateList(1)
}

//数据渲染
function setDateList(val){
	var type = $(".type").val();
	$.ajax({
		type: "POST",
		url: 'web/pageHtml.do',
    	data: {PUB_TYPE:"eo02",currentPage:val},
		dataType:'json',
		cache: false,
		success: function(data){
			rending(data);
			page(data);
		}
	});
}
//数据填写
function rending(data){
	$(".boxs ul").empty();
	var name = $(".name").html();
    for(var i=0;i<data.list.length;i++){
    	var str =" <li>"
    		str+="<div class='zhiwei'>"
    		str+=data.list[i].DESCRIPTION
    		str+="<span></span></div>"
    		str+="<div class='pic'>"
    		str+="<img src='"
    		str+=data.list[i].THUMNAIL
    		str+="'>"
    		str+="</div>"
    		str+="<div class='text'>"
    	    str+="<div class='tx-nr'>"
    	    str+=" <p class='text-name'>"
    	    str+=data.list[i].TITLE
    	    str+="</p>"
    	    str+="<p class='text-quanli' id='text-quanli'>"
    	    str+=data.list[i].CONTENT.replace(/<[^>]+>/g,"").substring(0,56)+"..."
    	    str+="</p>"
    	    str+="</div>"
    	    str+=" <a href='JavaScript:;'"
	    	str+=" onclick=gotoLeaderDetail('webleaderdetail.html','"
			str+=name
			str+="','"
			str+="eo02"
			str+="','"
			str+=data.list[i].CONTENTS_ID
			str+="'"
			str+=")"
			str+=">" 	
    	    str+=" <div class='genduo'>阅读更多<img src='fh_static_1/imgs/genduo.png'></div>"
    	    str+=" </a>"
    		str+="</div>"
    		str+="</li>"
    	$(".boxs ul").append(str)
    		
    }
}
//分页显示
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
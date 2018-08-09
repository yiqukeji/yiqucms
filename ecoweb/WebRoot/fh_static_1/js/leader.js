window.onload = function() {
	setDateList(1)
}

// 数据渲染
function setDateList(val) {
	$.ajax({
		type : "POST",
		url : 'web/pageHtml.do',
		data : {
			PUB_TYPE : "eo02",
			currentPage : val
		},
		dataType : 'json',
		cache : false,
		success : function(data) {
			rending(data);
			page(data);
		}
	});
}
// 数据填写
function rending(data) {
	$(".list_box").empty();
	var name = $(".name").html();
	for (var i = 0; i < data.list.length; i++) {
		var str = "<div class='col-xs-12 col-sm-4 col-md-4 col-lg-4'>"

		str += "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 jianjie_content'>"

		str += "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12 jianjie_title'>"
		str += "<p>" + data.list[i].DESCRIPTION + "</p>"
		str += "</div>"

		str += "<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6 jianjie_img'>"
		str += "<img src='" + data.list[i].THUMNAIL + "' />"
		str += "</div>"

		str += "<div class='jianjie_datils'>"
		str += "<h3>" + data.list[i].TITLE + "</h3>"
		str += "<p>"
				+ data.list[i].CONTENT.replace(/<[^>]+>/g, "")+ "</p>"
		str += "<a href='JavaScript:;'"
		str += " onclick=gotoLeaderDetail('webleaderdetail.html','"
		str += name
		str += "','"
		str += "eo02"
		str += "','"
		str += data.list[i].CONTENTS_ID
		str += "'"
		str += ")"
		str += ">"
		str += "阅读更多>></a>"
		str += "</div>"
		str += "</div>"

		str += "</div>"

		$(".list_box").append(str)

	}
}
// 分页显示
// 分页数据
function page(data) {
	$("#page").paging({
		pageNo : data.page.currentPage,// 当前页
		totalPage : data.page.totalPage,// 总页数
		totalSize : data.page.totalResult,// 数据总条数
		callback : function(num) {
			setDateList(num);
		}
	})
}
//领导详情
function gotoLeaderDetail(html,type,mark,id){
	name = escape(type);
	window.location.href =html+"?mark="+mark+"&name="+name+"&id="+id;
}
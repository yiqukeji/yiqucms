function rendering(data){
   $(".list-ul").empty();
   for(var i=0;i<data.list.length;i++){
      var str=" <li><a href='webdetail.html?CONTENTS_ID="
      str+=data.list[i].CONTENTS_ID
      str+="'>"
      str+=data.list[i].TITLE
      str+="</a><span>"
      str+=data.list[i].PUB_TIME
      str+="</span></li>"
      $(".list-ul").append(str);
   }
   }

//保存意见反馈
function savaMessage(){
	 var  gloab = true;
	 var  TYPE = $("#TYPE").val();
	 var  TITLE = $("#TITLE").val();
	 var  NAME = $("#NAME").val();
	 var  TEL = $("#TEL").val();
	 var EMAIL = $("#EMAIL").val();
	 var CONTEXT = $("#CONTEXT").val();
	getJson = {TITLE:TITLE,NAME:NAME,TEL:TEL,EMAIL:EMAIL,CONTEXT:CONTEXT,TYPE:TYPE};
	if(checkSubmitMobil()&&checkSubmitEmail()){
	$.ajax({
		type: "POST",
		url: 'web/savaMessage.do',
    	data: getJson,
		dataType:'json',
		cache: false,
		success: function(data){
		if(data.result=="success"){
			layer.alert('提交成功')
			empty();
		}
		}
	});
}
	
}
//清除数据
function empty(){
	var  TITLE = $("#TITLE").val("");
	var  QQ = $("#QQ").val("");
	var  NAME = $("#NAME").val("");
	var  TEL = $("#TEL").val("");
	var  EMAIL = $("#EMAIL").val("");
	var  CONTEXT = $("#CONTEXT").val("");
}

//jquery验证邮箱
function checkSubmitEmail(){
   if($("#EMAIL").val()==""){
	$(".ft").remove();
    $("#EMAIL").after("<front  class='ft' style='color:red;' >邮箱地址不能为空！</front>");
    $("#EMAIL").focus();
    return false;
   }
   if(!$("#EMAIL").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
   $("#EMAIL").after("<front  class='ft' style='color:red;'>邮箱格式不正确！</front>");
    $("#EMAIL").focus();
    return false;
   }
   return true;
}
//jquery验证手机号码
function checkSubmitMobil(){
$(".ft").remove();
if($("#TEL").val()==""){
$("#TEL").after("<font class='ft' color='red'>手机号码不能为空！</font>");
$("#TEL").focus();
return false;
}
if(!$("#TEL").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)){
$("#TEL").after("<font  class='ft' color='red'>手机号码格式不正确！</font>");
$("#TEL").focus();
return false;
}
return true;
}
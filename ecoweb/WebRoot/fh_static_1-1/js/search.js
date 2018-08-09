function search(){
    var searchStr = $("#key").val();
    if(searchStr==""||searchStr==null){
    	alert("请输入要搜索的内容");
    }else{
    	document.getElementById("search_form").action="webseach.html?keywords="+searchStr;
    }
}






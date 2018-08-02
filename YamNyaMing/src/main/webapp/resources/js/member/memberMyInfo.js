//TAB!!
function openTab(event, tabName){
	var i, x, tablinks;
	$('#storeInfoType').val(tabName);
	x = document.getElementsByClassName("tabInfo");
	for (i=0; i<x.length; i++){
		x[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablink");
	for(i=0; i<x.length; i++){
		tablinks[i].className = tablinks[i].className.replace(" click", "");
	}
	document.getElementById(tabName).style.display="block";
	event.currentTarget.className += " click";
}


//기본정보 변경
function pwChange(){
	var element = document.getElementById("pwChange");
	var title = document.getElementById("pwName");
	if(element.style.display === "none"){
		element.style.display = "block";
		title.innerHTML = "변경취소";
	}else{
		element.style.display = "none";
		title.innerHTML = "변경하기";
	}
}
function nickChange(){
	var element = document.getElementById("nickChange");
	var title = document.getElementById("nickName");
	if(element.style.display === "none"){
		element.style.display = "block";
		title.innerHTML = "변경취소";
	}else{
		element.style.display = "none";
		title.innerHTML = "변경하기";
	}
}
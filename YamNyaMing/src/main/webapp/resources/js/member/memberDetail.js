function openTab(event, tabName){
	var i, x, tablinks;
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


var sel_files=[];
var html;
$(document).ready(function(){
	$("#input_reviewPhoto").on("change",reviewPhotoSelect);
});

function reviewPhotoSelect(e){
	
	var files=e.target.files;
	var filesArr=Array.prototype.slice.call(files);
	
	var index=files.length;
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_files.push(f);
		
		var reader=new FileReader();
		reader.onload=function(e){
			html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\" style='width:92px; height:92px;display:inline-block;'><div style='width:100%; height:100%; background-image:url(\""+e.target.result+"\"); background-repeat:no-repeat; background-size:cover; background-position:center;' data-file='"+f.name+"' class='selProductFile' title='Click to remove'></div></a>";
			$(".imgs_wrap").append(html);
			index++;
		}
		reader.readAsDataURL(f);
	});
	
}
function deleteImageAction(index){
	sel_files.splice(index,1);
	var img_id="#img_id_"+index;
	$(img_id).remove();
}
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



//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}



function openModal(event, tabName){
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
var sel_file;
var html;
$(document).ready(function(){
	$("#input_avatarPhoto").on("change",avatarPhotoSelect);
});


function avatarPhotoSelect(e){
	var files=e.target.files;
	var filesArr=Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지확장자만");
			return;
		}
		sel_file=f;
		var reader=new FileReader();
		reader.onload=function(e){
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function deleteImageAction(){
	$('#img').remove();
	
	var img = document.createElement("img");
	img.id="img";
	var div=document.getElementById("profile-img");
	div.appendChild(img);
	
}

function imgUpdate(){

	var form = $('form')[0];
    var formData = new FormData(form);
        $.ajax({
           url: '/updateMemberPhoto.do',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           success: function(result){
               alert("업로드 성공!!");
           }
       });

}


function favorite(memberEntireNo,owStoreInfoPk){
	var favoriteImg=document.getElementById(owStoreInfoPk);
	$.ajax({
		url : "/favoriteInsert.do",
		data : {memberEntireNo : memberEntireNo,owStoreInfoNo:owStoreInfoPk},
		success : function(data){
			if(data==1){
				favoriteImg.innerHTML="";
				favoriteImg.insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/heart.png'>");		
			}else if(data==2){
				favoriteImg.innerHTML="";
				favoriteImg.insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/heart-click.png'>");
			}else{
				alert("실패");
			}	
		}
	});	
}

function nomember(){
	alert("로그인후 이용해주세요");
}

 

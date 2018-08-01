
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


function like(storeReviewNo,memberEntireNo,pId){
	var name=document.getElementsByName(pId);
	console.log(name[0]);
	$.ajax({
			url : "/likeInsert.do",
			data : {memberEntireNo : memberEntireNo,storeReviewNo:storeReviewNo},
			dataType:'json',
			success : function(data){
				if(data==1){
					var like=document.getElementById(pId).innerHTML;
					var result=parseInt(like)-1;
					document.getElementById(pId).innerHTML=result;
					name[0].style.backgroundColor="white";
					name[0].style.border="1px solid #fb0";
					name[1].innerHTML="";
					name[1].insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/like.png'>");
					name[2].style.color="#fb0";
					name[3].style.color="#fb0";
					
				}else if(data==2){
					var like=document.getElementById(pId).innerHTML;
					var result=parseInt(like)+1;
					document.getElementById(pId).innerHTML=result;
					name[0].style.backgroundColor="#fb0";
					name[1].innerHTML="";
					name[1].insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/like-white.png'>");
					name[2].style.color="white";
					name[3].style.color="white";
					
				}else{
					alert("실패");
				}	
			}
		});	
	
}
function jjim(storeReviewNo,memberEntireNo,pId,jjimName){
	var name=document.getElementsByName(jjimName);
	console.log(name[4]);
	$.ajax({
		url : "/jjimInsert.do",
		data : {memberEntireNo : memberEntireNo,storeReviewNo:storeReviewNo},
		dataType:'json',
		success : function(data){
			if(data==1){
				alert("찜 해제");
				var jjim=document.getElementById(pId).innerHTML;
				var result=parseInt(jjim)-1;
				document.getElementById(pId).innerHTML=result;
				
				name[4].style.backgroundColor="white";
				name[4].style.border="1px solid #fb0";
				name[5].innerHTML="";
				name[5].insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/heart-yellow.png'>");
				name[6].style.color="#fb0";
				name[7].style.color="#fb0";
				
			}else if(data==2){
				alert("찜 했다");
				var jjim=document.getElementById(pId).innerHTML;
				var result=parseInt(jjim)+1;
				document.getElementById(pId).innerHTML=result;
				name[4].style.backgroundColor="#fb0";
				name[5].innerHTML="";
				name[5].insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/heart.png'>");
				name[6].style.color="white";
				name[7].style.color="white";
				
			}else{
				alert("실패");
			}
		}
	});	
}

function follow(memberEntireNo,userMemberEntireNo,btnName){
	console.log(memberEntireNo);
	console.log(userMemberEntireNo);

	$.ajax({
		url : "/followInsert.do",
		data : {memberEntireNo : memberEntireNo,userMemberEntireNo:userMemberEntireNo},
		dataType:'json',
		success : function(data){
			if(data==1){
				alert("팔로우 해제");
				var follow=document.getElementsByName(btnName);
				for(var i=0; i<follow.length; i++){
				follow[i].style.backgroundColor="white";
				follow[i].style.color="#fb0";
				follow[i].style.border="1px solid #fb0";
				}
				
			}else if(data==2){
				var follow=document.getElementsByName(btnName);
				for(var i=0; i<follow.length; i++){
				follow[i].style.backgroundColor="#fb0";
				follow[i].style.color="white";
				}
				
			}else{
				alert("실패");
			}
		}
	});	
}

function nomember(){
	alert("로그인후 이용해주세요");
}
function sameMember(){
	alert("나쁜놈");
}

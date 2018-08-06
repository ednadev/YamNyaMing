
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

function follow(memberEntireNo,userMemberEntireNo,btnName,labelName){


	$.ajax({
		url : "/followInsert.do",
		data : {memberEntireNo : memberEntireNo,userMemberEntireNo:userMemberEntireNo},
		dataType:'json',
		success : function(data){
			if(data==1){
				alert("팔로우 해제");
				var follow=document.getElementsByName(btnName);
				var followNum=document.getElementsByName(labelName);
				var result=parseInt(followNum[0].innerHTML)-1;
				var followlabel=document.getElementsByName(labelName);
				for(var i=0; i<followlabel.length; i++){
					followlabel[i].innerHTML=result;
				}
				
				for(var i=0; i<follow.length; i++){
				follow[i].style.backgroundColor="white";
				follow[i].style.color="#fb0";
				follow[i].style.border="1px solid #fb0";
				}
				
				
			}else if(data==2){
				var follow=document.getElementsByName(btnName);
				var followNum=document.getElementsByName(labelName);
				var result=parseInt(followNum[0].innerHTML)+1;
				var followlabel=document.getElementsByName(labelName);
				for(var i=0; i<followlabel.length; i++){
					followlabel[i].innerHTML=result;
				}
				
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
function sameMember(){
	alert("나쁜놈");
}


function closemodal(){
	var modal = document.getElementById('myModal');
	modal.style.display = "none";
}
function closeimagemodal(){
	var modal = document.getElementById('imageModal');
	modal.style.display = "none";
}
window.onclick = function(event) {
	var modal = document.getElementById('myModal');
	   if (event.target == modal) {
	        modal.style.display = "none";
	    }
}
window.onclick = function(event) {
	var modal = document.getElementById('imageModal');
	   if (event.target == modal) {
	        modal.style.display = "none";
	    }
}

//별점
var starCheck=false;
var locked=0;
$(document).click(function() {
    $("#reviewInsert").attr('disabled', true);
        if(starCheck==true) {
            $("#reviewInsert").attr('disabled' , false);
        }else{
            $("#reviewInsert").attr('disabled' , true);

        }
});
$(document).keyup(function() {
    $("#reviewInsert").attr('disabled', true);
        if(starCheck==true) {
            $("#reviewInsert").attr('disabled' , false);
        }else{
            $("#reviewInsert").attr('disabled' , true);

        }
});
	function show(star){
	if(locked)
		return;
	var image;
	var el;
	var e=document.getElementById('startext');
	var stateMsg;
	
	for(var i=0; i<star; i++){
		image='image' +i;
		var image2=document.getElementById(image);
        image2.src="/resources/image/member/search/star-full.png";
	}
	switch(star){
	case 1:
		stateMsg="실망이에요. 집에서 먹는게 나을 뻔 했어요.";
		break;
	case 2:
		stateMsg="평균이하! 이정도 레스토랑은 어디에나 있죠.";
		break;
	case 3:
		stateMsg="보통이에요. 이정도면 괜찮네요.";
		break;
	case 4:
		stateMsg="인상적이네요.꼭 추천하고 싶어요.";
		break;
	case 5:
		stateMsg="완벽 그 자체!! 환상적이에요.";
		break;
	default:
		stateMsg="";
	}
	e.innerHTML=stateMsg;
	
} 
function noshow(star){
	if(locked)
		return;
	var image;
	var el;
	for(var i=0; i<star; i++);{
		image='image'+i;
		el=document.getElementById(image);
		el.src="/resources/image/member/search/star.png";
	}
}
var chk=false;
function lock(star){
	if(chk=false){
	show(star);
	locked=1;
	chk=true;
	}else{
	locked=0;
	}
}
function starPoint(star){
	lock(star);
	document.reviewform.reviewStar.value=star;
	starCheck=true;
	
}


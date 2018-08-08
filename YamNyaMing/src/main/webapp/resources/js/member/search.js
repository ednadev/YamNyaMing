
function favorite(memberEntireNo,owStoreInfoPk){
	var favoriteImg=document.getElementById(owStoreInfoPk);
	$.ajax({
		url : "/favoriteInsert.do",
		data : {memberEntireNo : memberEntireNo,owStoreInfoNo:owStoreInfoPk},
		success : function(data){
			if(data==1){
				favoriteImg.innerHTML="";
				favoriteImg.insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/heart.png'>");
				var favorite=document.getElementById("stroeFavoriteNum").innerHTML;
				var result=parseInt(favorite)-1;
				document.getElementById("stroeFavoriteNum").innerHTML=" "+result;
			}else if(data==2){
				favoriteImg.innerHTML="";
				favoriteImg.insertAdjacentHTML('beforeend', "<img style=width:100%;height:100%; src='resources/image/member/search/heart-click.png'>");
				var favorite=document.getElementById("stroeFavoriteNum").innerHTML;
				var result=parseInt(favorite)+1;
				document.getElementById("stroeFavoriteNum").innerHTML=" "+result;
			}else{
				alert("실패");
			}	
		}
	});	
}

function nomember(){
	alert("로그인후 이용해주세요");
}

 
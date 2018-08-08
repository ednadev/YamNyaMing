var storeIndexArr=[];


function storeIndex(stIndex)
{	

	storeIndexArr.push(stIndex);
	
}
function loadWaitList()
{
	setInterval(function(){
		bookCheckInterval();
	}, 3000);
}
function bookCheckInterval()
{	
	for(var i=0; i<storeIndexArr.length; i++)
	{
		
			waitRefresh(storeIndexArr[i]);
		
	}
}

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

//Reservation Tab
function openReservationTab(event, tabName){
	var i, x, tablinks;
	x = document.getElementsByClassName("tabInfo-reservation");
	for (i=0; i<x.length; i++){
		x[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablink-reservation");
	for(i=0; i<x.length; i++){
		tablinks[i].className = tablinks[i].className.replace(" click", "");
	}
	document.getElementById(tabName).style.display="block";
	event.currentTarget.className += " click";
}

//Coupon Tab
function openCouponTab(event, tabName){
	var i, x, tablinks;
	x = document.getElementsByClassName("tabInfo-coupon");
	for (i=0; i<x.length; i++){
		x[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablink-coupon");
	for(i=0; i<x.length; i++){
		tablinks[i].className = tablinks[i].className.replace(" click", "");
	}
	document.getElementById(tabName).style.display="block";
	event.currentTarget.className += " click";
}

//Review Tab
function openReviewTab(event, tabName){
	var i, x, tablinks;
	x = document.getElementsByClassName("tabInfo-review");
	for (i=0; i<x.length; i++){
		x[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablink-review");
	for(i=0; i<x.length; i++){
		tablinks[i].className = tablinks[i].className.replace(" click", "");
	}
	document.getElementById(tabName).style.display="block";
	event.currentTarget.className += " click";
}

//Other Tab
function openOtherTab(event, tabName){
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


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function followClose()
{

	var modal = document.getElementById('myModal');
	modal.style.display = "none";
}

function followModal(){
	var modal = document.getElementById('myModal');
	modal.style.display = "block";
}

function waitclosemodal()
{

	var modal = document.getElementById('waitNumModal');
	modal.style.display = "none";
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
	img.setAttribute('src', 'resources/image/member/profile.png');
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
var nickNameBool=false;
var nowpas=false;
var pwBool=false;
var pw2Bool=false;
function nowPwCheck(memberId){
	var nowPw=$("#nowPw").val();
	
	
	$.ajax({
			url : "/pwCheck.do",
			data : {memberId : memberId,memberPw:nowPw},
			success : function(data){
				if(data==1){
					nowpas=true;
				}
			}
		});	
	
}
function pwCheck(memberId){
	console.log(nowpas);
	var pwCheckBool=true;
	var regExp;
	var memberId=memberId;
	var memberPw=$('#memberPw').val();
	
    if (memberPw == "") {
    	pwCheckBool = false;   
    	pwBool=false;
    	$('#pw_check').html("<span style='color:red;'>비밀번호를 입력 안했습니다.</span>"); 
        return false;
    }
    
    if (memberPw.length<6 || memberPw.length>14) {
    	pwCheckBool = false;   
    	pwBool=false;
    	$('#pw_check').html("<span style='color:red;'>비밀번호를 6~14자로 입력해주세요</span>"); 
        return false;
    }
    
		var num = memberPw.search(/[0-9]/g);
		var eng = memberPw.search(/[a-z]/ig);
	    var spe = memberPw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(num < 0 || eng < 0 || spe < 0 ){
	
			$('#pw_check').html("<span style='color:red;'>숫자와 영문자 특수문자를 혼용해야 합니다.</span>");
			pwCheckBool=false;
			pwBool=false;
			return false;

		}

		if(/(\w)\1\1\1/.test(memberPw)){

			$('#pw_check').html("<span style='color:red;'>같은문자를 3번 반복할 수 없습니다.</span>");
			pwCheckBool=false;
			pwBool=false;
			return false;
		}
		
		if(memberPw.search(memberId) > -1){

			$('#pw_check').html("<span style='color:red;'>아이디를 포함 할 수 없습니다.</span>");
			pwCheckBool=false;
			pwBool=false;
			return false;
		}
	
		if(pwCheckBool){
			$('#pw_check').html("<span style='color:#26a69a;'>사용 가능한 비밀번호 입니다.</span>");
			pwBool=true;
		}

	
}

function pwreCheck(){
	var memberPw=$('#memberPw').val();
	var memberPw2=$('#memberPw2').val();
	var pwCheckBool=true;
	
	if(memberPw!=memberPw2){
		$('#pw_check').html("<span style='color:red;'>비밀번호가 일치하지 않습니다</span>");
		pw2Bool=false;
		pwCheckBool=false;
	}
	if(pwCheckBool==true && memberPw!=""){
		$('#pw_check').html("<span style='color:#26a69a;'>사용 가능한 비밀번호 입니다.</span>");
		pw2Bool=true;
	}
}


$(document).keyup(function() {
    $("#newPwChange").attr('disabled', true);
        if(nowpas==true && pw2Bool==true && pwBool==true) {
            $("#newPwChange").attr('disabled' , false);
        }else{
            $("#newPwChange").attr('disabled' , true);

        }
});

$(document).click(function() {
    $("#newPwChange").attr('disabled', true);
        if(nowpas==true && pw2Bool==true && pwBool==true) {
            $("#newPwChange").attr('disabled' , false);
        }else{
            $("#newPwChange").attr('disabled' , true);

        }
});


function nickCheck(){
	var regExp;
	var resultChk;
	var nRegExp;
	var nResultChk;
	var memberNickName = $('#memberNickName').val();
	
	regExp = /^[가-힣|a-z|A-Z|0-9|\*]+$/
	resultChk = regExp.test(memberNickName);
	console.log(resultChk);
	
	
	if(resultChk==false){
		$('#nick_check').html("<span style='color:red;'>영어,한글,숫자만 입력가능합니다.</span>");
		nickNameBool=false;
		
	}else{
		$.ajax({
 			url : "/nickCheck.do",
 			data : {memberNickName : memberNickName},
 			dataType:'json',
 			success : function(data){
 				console.log(data);
 				if(data==1){
 					$('#nick_check').html("<span style='color:red;'>이미 사용중인 닉네임 입니다.</span>");
 					nickNameBool=false;
 				} else{
 					$('#nick_check').html("<span style='color:#26a69a;'>사용 가능한 닉네임입니다.</span>");
 					nickNameBool=true;
 				}
 		
 			}
 		});	
	}
}

$(document).click(function() {
    $("#newNick").attr('disabled', true);
        if(nickNameBool==true) {
            $("#newNick").attr('disabled' , false);
        }else{
            $("#newNick").attr('disabled' , true);

        }
});
$(document).keyup(function() {
    $("#newNick").attr('disabled', true);
        if(nickNameBool==true) {
            $("#newNick").attr('disabled' , false);
        }else{
            $("#newNick").attr('disabled' , true);

        }
});

	function setting(){
		var pushRadio=document.getElementsByName('push');
		var likeRadio=document.getElementsByName('like');
		var commentRadio=document.getElementsByName('comment');
		var jjimRadio=document.getElementsByName('jjim');
		var followRadio=document.getElementsByName('follow')
		var agreeRadio=document.getElementsByName('agree');
		var smsRadio=document.getElementsByName('sms');
		var emailRadio=document.getElementsByName('email');
		var reviewOpenRadio=document.getElementsByName('reviewOpen');
		var ReviewJjimRadio=document.getElementsByName('ReviewJjim');
		var StoreJjimRadio=document.getElementsByName('StoreJjim');
		var push;
		var like;
		var comment;
		var jjim;
		var follow;
		var agree;
		var sms;
		var email;
		var reviewOpen;
		var ReviewJjim;
		var StoreJjim;
		for(var i=0; i<2; i++){
			if(pushRadio[i].checked==true){
				push=pushRadio[i].value;
			}
			if(likeRadio[i].checked==true){
				like=likeRadio[i].value;
			}
			if(commentRadio[i].checked==true){
				comment=commentRadio[i].value;
			}
			if(jjimRadio[i].checked==true){
				jjim=jjimRadio[i].value;
			}
			if(followRadio[i].checked==true){
				follow=followRadio[i].value;
			}
			if(agreeRadio[i].checked==true){
				agree=agreeRadio[i].value;
			}
			if(smsRadio[i].checked==true){
				sms=smsRadio[i].value;
			}
			if(emailRadio[i].checked==true){
				email=emailRadio[i].value;
			}
			if(reviewOpenRadio[i].checked==true){
				reviewOpen=reviewOpenRadio[i].value;
			}
			if(followRadio[i].checked==true){
				follow=followRadio[i].value;
			}
			if(ReviewJjimRadio[i].checked==true){
				ReviewJjim=ReviewJjimRadio[i].value;
			}
			if(StoreJjimRadio[i].checked==true){
				StoreJjim=StoreJjimRadio[i].value;
			}
		}
		console.log(StoreJjim);
		$.ajax({
			url:"/setting.do",
			data : {
				themePushUpdate:push,alarmPushReviewLike:like,alarmPushReviewComment:comment,alarmPushReviewJjim:jjim,alarmPushFollow:follow,
				myinfoAgree:agree,alarmEventSms:sms,alarmEventEmail:email,myinfoReviewOpen:reviewOpen,myinfoReviewJjim:ReviewJjim,myinfoStoreJjim:StoreJjim
				   },
			type : "post",
			success : function(data){	
				if(data=="success"){
					alert("상태 변경 성공");
				}else{
					alert("상태 변경 실패");
				}
			},
			error : function(){
				
			}
		});
		
	}
	function deleteMember(){
		if(confirm("정말로 탈퇴 하시겠습니까?")){
			var memberPw=prompt("비밀번호를 입력해주세요");
			if(memberPw!=null){
			$.ajax({
				url:"/pwCheck.do",
				data : {
					memberPw:memberPw
					   },
				type : "post",
				success : function(data){	
					if(data==1){
						location.href="/signOutMember.do?memberPw="+memberPw;
						alert("회원탈퇴 되었습니다.");
					}else{
						alert("비밀번호가 일치하지 않습니다.");
					
					}
				},
				error : function(){
					
				}
			});
			}
		}
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
	
	
	function closemodal(){
		var modal = document.getElementById('likeModal');
		modal.style.display = "none";
	}
	function closeimagemodal(){
		var modal = document.getElementById('imageModal');
		modal.style.display = "none";
	}
	window.onclick = function(event) {
		var modal = document.getElementById('likeModal');
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
	window.onclick = function(event) {
		var modal = document.getElementById('waitNumModal');
		   if (event.target == modal) {
		        modal.style.display = "none";
		    }
	}
	
	
	
function nomember()
{
	alert("로그인후 이용해주세요");
}
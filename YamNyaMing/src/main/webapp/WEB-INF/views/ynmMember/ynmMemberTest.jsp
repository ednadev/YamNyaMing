<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery.min.js"></script>
<title>Insert title here</title>
</head>


<style>
	.img_wrap{
		width:300px;
	}
	.img_wrap img{
		max-width:100%;
	}
</style>

<script>
	
	var sel_files=[];
	var html;
	$(document).ready(function(){
		$("#input_reviewPhoto").on("change",reviewPhotoSelect);
	});
	
	function reviewFilesUpload(){
		$("#input_reviewPhoto").trigger('click');
	}
	
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
				html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
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

	
	
</script>

<body>
	<!-- 회원가입 -->
	<form action="/signUpMember.do" method="post" enctype="multipart/form-data">
		
		<a href="javascript:" onclick="avatarFilesUpload();">파일업로드</a>
		<input type="file"  style="display:none;" id="input_avatarPhoto" name="avatarPhoto"/>
		<div>
			<div class="img_wrap">
				<img id="img" />
			</div>
		</div>
		
		<input type="submit" value="가입">
	</form>
	<form action="/login.do" method="post">
	<input type="text" name="memberId" placeholder="아이디 입력"/>
		<input type="text" name="memberPw" placeholder="PW 입력"/>
	<input type="submit" value="로그인">
	</form>
	<form action="/logout.do">
		<input type="submit" value="로그아웃">
	</form>
	<hr>
	회원 탈퇴
	<form action="signOutMember.do">
		<input type="text" name="memberPw">
		<input type="submit" value="탈퇴">
		
 	</form>
 	
 	<hr>
 	
 	<form action="memberInfo.do">
 	내정보 보기
 	<input type="text" name="memberPw" value="비밀번호 입력">
 	<input type="submit" value="보기">
	</form>
	
		
		<hr>
		
	<form action="bookInsert.do">
		<input type="text" name="bookOrderCount">
		<input type="text" name="bookPartyCount">
		<input type="text" name="bookType">
		<input type="text" name="bookOption">
		<input type="text" name="bookDeposit">
		<input type="submit" value="예약">
	</form>
	
	 <form action="bookselect.do">
 	예약 정보 보기
 	<input type="submit" value="보기">
	</form>
	<hr>
		<form id="fileForm" action="/storeReviewInsert.do" enctype="multipart/form-data" method="post">
		<input type="text" id="ownerStoreEntireNo" name="ownerStoreEntireNo">
		<input type="text" id="reviewContent" name="reviewContent">
		<input type="text" id="reviewStar" name="reviewStar">
			
			<a href="javascript:" onclick="reviewFilesUpload();">파일업로드</a>
			<input type="file" style="display:none;" id="input_reviewPhoto" name="reviewImgList" multiple/>
		<div>
			<div class="imgs_wrap">
				<img id="img" />
			</div>
		</div>
		<input type="submit" value="댓글등록">
		</form>
		<hr>
		<form action="/reviewCheck.do">
			<input type="hidden" value="1" name="OwnerStoreEntireNo" >
			<input type="submit" value="가게 보기">
		</form>
		
		
		<hr>
		아이디 찾기
		<form action="/idSearch.do">
		이메일:<input type="text" name="memberEmail">
		이름:<input type="text" name="memberName">
		<input type="submit" value="찾기">
		</form>
		<hr>
		비밀번호 찾기
		<form action="/pwSearch.do">
		아이디:<input type="text" name="memberId">
		이메일:<input type="text" name="memberEmail">
		<input type="submit" value="찾기">
		</form>
		<hr>
		<form action="/settingInfo.do">
			<input type="submit" value="사용자 설정 정보">
		</form>
		
		<form action="/ptest.do">
		<input type="submit" value="페이징">
		</form>
		<form action="/logins.do">
		<input type="submit" value="네이버">
		</form>
	
</body>
</html>
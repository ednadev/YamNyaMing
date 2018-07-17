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
function idCheck(){
	var regExp;
	var resultChk;
	var memberId = $('#memberId').val();
	regExp = /^[a-z0-9]{0,12}$/;
	resultChk = regExp.test(memberId);
	if(resultChk == false){
		$('#id_check').html("<span style='color:red;'>5~12자의 영문 소문자와 숫자만 사용 가능합니다.</span>");
	}else{
		$.ajax({
 			url : "/idCheck.do",
 			data : {memberId : memberId},
 			dataType:'json',
 			success : function(data){
 				console.log(data);
 				if(data==1){
 					$('#id_check').html("<span style='color:red;'>이미 사용중이거나 탈퇴한 아이디입니다.</span>");
 				} else{
 					$('#id_check').html("<span style='color:#26a69a;'>사용할 수 있는 아이디입니다.</span>");
 				}
 		
 			}
 		});	
	}
}

function pwCheck(){
	var pwCheckBool=true;
	var regExp;
	var memberId=$('#memberId').val();
	var memberPw=$('#memberPw').val();
	
    if (memberPw == "") {
    	pwCheckBool = false;   
    	$('#pw_check').html("<span style='color:red;'>비밀번호를 입력 안했습니다.</span>"); 
        return false;
    }
    
    if (memberPw.length<6 || memberPw.length>14) {
    	pwCheckBool = false;   
    	$('#pw_check').html("<span style='color:red;'>비밀번호를 6~14자로 입력해주세요</span>"); 
        return false;
    }
    
	
		var num = memberPw.search(/[0-9]/g);
		var eng = memberPw.search(/[a-z]/ig);
	    var spe = memberPw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	   

	    
		if(num < 0 || eng < 0 || spe < 0 ){

			$('#pw_check').html("<span style='color:red;'>숫자와 영문자 특수문자를 혼용해야 합니다.</span>");
			pwCheckBool=false;
			return false;

		}

		if(/(\w)\1\1\1/.test(memberPw)){

			$('#pw_check').html("<span style='color:red;'>같은문자를 3번 반복할 수 없습니다.</span>");
			pwCheckBool=false;
			return false;
		}
		
		if(memberPw.search(memberId) > -1){

			$('#pw_check').html("<span style='color:red;'>아이디를 포함 할 수 없습니다.</span>");
			pwCheckBool=false;
			return false;
		}
		
		if(pwCheckBool){
			$('#pw_check').html("<span style='color:#26a69a;'>사용 가능한 비밀번호 입니다.</span>");
		}

	
}

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
		}else{
			$.ajax({
	 			url : "/nickCheck.do",
	 			data : {memberNickName : memberNickName},
	 			dataType:'json',
	 			success : function(data){
	 				console.log(data);
	 				if(data==1){
	 					$('#nick_check').html("<span style='color:red;'>이미 사용중인 닉네임 입니다.</span>");
	 				} else{
	 					$('#nick_check').html("<span style='color:#26a69a;'>사용할 가능한 닉네임입니다.</span>");
	 				}
	 		
	 			}
	 		});	
		}
	}
	
	
	var sel_file;
	$(document).ready(function(){
		$("#input_avatar").on("change",avatarSelect);
	});
	
	function avatarSelect(e){
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
	
</script>

<body>
	<form action="/signUpMember.do" method="post" enctype="multipart/form-data">
		<input type="text" id="memberId" name="memberId" placeholder="가입할 아이디 입력" onChange="idCheck();"/>

		<span id="id_check">5~12자의 영문 소문자와 숫자만 사용 가능합니다.</span>
		
		<input type="text" id="memberPw" name="memberPw" placeholder="가입할 PW 입력" "/>
		<span id="pw_check">영어 대소문자 ,특수문자 포함 하여야 합니다.</span>
		
		<input type="text" name="memberName" placeholder="가입할 name 입력"/>
		
		
		<input type="text" id="memberNickName" name="memberNickName" placeholder="가입할 nickname 입력" onChange="nickCheck();"/>
		<span id="nick_check">영어 대소문자 ,특수문자 포함 하여야 합니다.</span>
		
		<input type="text" name="memberGender" placeholder="가입할 gender 입력"/>
		<input type="text" name="memberBirth" placeholder="가입할 birth 입력"/>
		<input type="text" name="memberEmail" placeholder="가입할 email 입력"/>
		<input type="text" name="memberPhone" placeholder="가입할 phone 입력"/>
		
		<input type="file" id="input_avatar" name="avatar"/>
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
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css?ver=1">
<script src="${pageContext.request.contextPath}/resources/js/member/member.js"></script>
</head>

<script>

var timer = 180;
window.onload = function()
{
	startAlert = function() {
		  $('#emailConfirmInput').attr('readonly', false);
		  playAlert = setInterval(function() {
			  timer-=1;
			  var minute = Math.floor(timer/60);
			  var second = Math.floor(timer%60);
			  
			  if(minute<=0 && second <=0)
			  {
				 clearInterval(playAlert); 
				 timer = 180;
				 $('#emailChkTimer').text("인증번호 재발급");
			  }else{
				  $('#emailChkTimer').text( (minute>9?minute:"0"+minute) +":"+ (second>9?second:"0"+second) );
				  $('#emailConfirmInput').show();
			  }
		  }, 1000);
	};
}

function emailConfirm()
{
	var insertEmail  = $('#memberEmail').val(); // 이메일 입력 결과
	if(timer==180){
		$.ajax({
			url:"/emailConCheck.do",
			data : {
				emailConfirm:insertEmail,
				   },
			type : "post",
			success : function(data){	
				console.log("이메일 결과" + data);
			},
			error : function(){
				
			},
		});
		timer = 180;
		startAlert();
	}
}

function emailKeyMatchCheck()
{
	var emailConfirmInput = $('#emailConfirmInput').val();
	$.ajax({
		url:"/emailAccessKey.do",
		type : "post",
		success : function(data){	
			if(emailConfirmInput==data){
				$('#email_check').html("이메일 인증 완료");
				$('#emailConfirmInput').attr('readonly', true);
				timer = 180;
				clearInterval(playAlert); 
				emailChkBool=true;
			}
		},
		error : function(){
			
		},
	});
}


var phoneBool=false;
var idBool=false;
var pwBool=false;
var pw2Bool=false;
var nameBool=false;
var nickNameBool=false;
var genderBool=false;
var birthYearBool=false;
var birthMonthBool=false;
var birthDayBool=false;
var emailBool=false;
var emailChkBool=false;
var check1Bool=false;
var check2Bool=false;
var check3Bool=false;

function idCheck(){
	var regExp;
	var resultChk;
	var memberId = $('#memberId').val();
	regExp = /^[a-z0-9]{5,12}$/;
	resultChk = regExp.test(memberId);
	var idCheckBool=true;
	

	
	if(resultChk == false){
		if(memberId==""){
				$('#id_check').html("<span style='color:red;'>아이디를 입력해주세요</span>");
				idCheckBool=false;
				idBool=false;
			}else{
		$('#id_check').html("<span style='color:red;'>5~12자의 영문 소문자와 숫자만 사용 가능합니다.</span>");
				idBool=false;
			}
	}else{
		$.ajax({
 			url : "/idCheck.do",
 			data : {memberId : memberId},
 			dataType:'json',
 			success : function(data){
 				if(data==1){
 					$('#id_check').html("<span style='color:red;'>이미 사용중이거나 탈퇴한 아이디입니다.</span>");
 					idBool=false;
 				} else{
 					if(idCheckBool){
 					$('#id_check').html("<span style='color:#26a69a;'>사용할 수 있는 아이디입니다.</span>");
 					idBool=true;
 					}
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

function memberNameChk()
{	
	var insertName  = $("#memberName").val();
	var nameCheckBool = true;
	var familyNameStr = "김,이,박,최,정,강,조,윤,장,임,한,오,서,신,권,황,안,송,전,홍,류,고,문,양,손,배,조,백,허,유,남,심,노,정,하,곽,성,차,주,우,구,신,임,전,민,유,류,나,진,지,엄,채,원,천,방,공,강,현,함,변,염,양,변,여,추,노,도,소,신,석,선,설,마,길,주,연,방,위,표,명,기,반,라,왕,금,옥,육,인,맹,제,모,장,남궁,탁,국,여,진,어,은,편"
    var nameArr = familyNameStr.split(",");
		
	if(insertName == "") {
		nameCheckBool = false;
    	$('#name_Check').html("<span style='color:red;'>이름을 입력하지 않았습니다.</span>");
    	nameBool=false;
        return false;
    }
    if(insertName.length<2){
    	nameCheckBool = false;
    	$('#name_Check').html("<span style='color:red;'>이름을 2자 이상 입력해주십시오.</span>");
    	nameBool=false;
        return false;
    }
    for(var i = 0; i<nameArr.length;i++)
	{
    	if(insertName.charAt(0)==nameArr[i]){
    		nameCheckBool = true;

    		break;
    	}
    	else
		{
    		nameCheckBool = false;
		}
	}

    if(nameCheckBool)
    {
    	$('#name_Check').html("<span style='color:red;'>확인</span>");	
    	nameBool=true;
    }
    else {
    	$('#name_Check').html("<span style='color:red;'>존재하지 않는 성씨입니다.</span>");
    	nameBool=false;
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
	
	function genderCheck(){
		genderBool=true;
		
	}
	
	function birthYearCheck(){
		var mbBirthYear=$('#mbBirthYear').val();
		
		var yearChk=/^[0-9]{4}$/.test(mbBirthYear);
		
		if(yearChk ==false){
			$('#birth_check').html("<span style='color:red;'>형식에 맞게 작성해주세요</span>");
			birthYearBool=false;
		}else{
			$('#birth_check').html("생년월일을 입력해주세요.");
			birthYearBool=true;
		}	
	}
	function birthMonthCheck(){
		var mbBirthMonth=$('#mbBirthMonth').val();
		var monthChk=/^[0-9]{2}$/.test(mbBirthMonth);
		
		if(monthChk ==false){
			$('#birth_check').html("<span style='color:red;'>형식에 맞게 작성해주세요</span>");
			birthMonthBool=false;
		}else{
			$('#birth_check').html("생년월일을 입력해주세요.");
			birthMonthBool=true;
		}	
	}
	function birthDayCheck(){
		var mbBirthDay=$('#mbBirthDay').val();
		var dayChk=/^[0-9]{2}$/.test(mbBirthDay);
		
		if(dayChk ==false){
			$('#birth_check').html("<span style='color:red;'>형식에 맞게 작성해주세요</span>");
			birthDayBool=false;
		}else{
			$('#birth_check').html("생년월일을 입력해주세요.");
			birthDayBool=true;
		}	
		
	}
	function emailCheck()
	{
		var insertEmail  = $("#memberEmail").val(); // 이름 입력 결과
		var emailCheckResult = $('#email_check');
		var rightFormChk = true;
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		
		if (insertEmail.match(regExp) == null) {
			rightFormChk = false;
			emailCheckResult.html("<span style='color:red;'>이메일 형식에 맞게 작성해주세요.</span>");
			emailBool=false;
		}	
		else{
			$.ajax({
	 			url : "/emailCheck.do",
	 			data : {memberEmail : insertEmail},
	 			dataType:'json',
	 			success : function(data){
	 				if(data==1){
	 					emailCheckResult.html("<span style='color:red;'>이미 사용중인 이메일 입니다.</span>");
	 					rightFormChk=false;
	 					emailBool=false;
	 				} else{
	 					if(rightFormChk){
	 					emailCheckResult.html("이메일 인증 대기상태<button id='emailChkTimer' type='button' style='background-color:black;color:white;border:none;cursor:pointer;padding:10px 30px;display:inline;margin-left:5px;' onclick='emailConfirm();'>인증 메일 보내기</button>");
	 					emailBool=true;		
	 					
	 				} 
	 				}
	 			}
	 		});	
			
		}
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
				$("#avatarImg").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	function deleteImageAction(){
		$('#avatarImg').remove();
		
		var img = document.createElement("img");
		img.id="avatarImg";
		var div=document.getElementById("profile-img");
		div.appendChild(img);
		
	}
	
	function checkService1(chk){
		check1Bool=false;
		if(chk.checked){
			check1Bool=true;
		}

		
	}
	function checkService2(chk){
		check2Bool=false;
		if(chk.checked){
			check2Bool=true;
		}
	}
	function checkService3(chk){
		check3Bool=false;
		if(chk.checked){
			check3Bool=true;
		}
	}
	var allCheckedChk = true;
	function allCheckService()
		{
			if(allCheckedChk==true){
			var obj = document.getElementsByName("service");
			for( var i=0; i< obj.length; i++) {
				obj[i].checked = true;
				check1Bool=true;
				check2Bool=true;
				check3Bool=true;
				allCheckedChk=false;
			}
			
			
		}else{
			var obj = document.getElementsByName("service");
			for( var i=0; i< obj.length; i++) {
				obj[i].checked = false;
				check1Bool=false;
				check2Bool=false;
				check3Bool=false;
				allCheckedChk=true;
			}
		}
	
	}
	$(document).keyup(function() {
	    $('input[type="submit"]').attr('disabled', true);
	        if(idBool==true && pwBool==true && pw2Bool==true && nameBool==true && nickNameBool==true && genderBool==true && birthYearBool==true && 
	        		birthMonthBool==true && birthDayBool==true && emailBool==true && check1Bool==true && check2Bool==true && check3Bool==true &&emailChkBool==true) {
	            $('input[type="submit"]').attr('disabled' , false);
	        }else{
	            $('input[type="submit"]').attr('disabled' , true);

	        }
	});
	
	$(document).click(function() {
	
	    $('input[type="submit"]').attr('disabled', true);
	        if(idBool==true && pwBool==true && pw2Bool==true && nameBool==true && nickNameBool==true && genderBool==true && birthYearBool==true && 
	        		birthMonthBool==true && birthDayBool==true && emailBool==true && check1Bool==true && check2Bool==true && check3Bool==true) {
	            $('input[type="submit"]').attr('disabled' , false);
	        }else{
	            $('input[type="submit"]').attr('disabled' , true);

	        }
	});
</script>


<body>
	<header id="member-signUp-header">
		<h1><a href="/index.jsp">YamNyaMing</a></h1>
	</header>
	<section id="member-signUp-section">
		<form action="signUpMember.do" method="post" enctype="multipart/form-data">
			<h2>회원가입</h2>
			<div class="signUp-table">
				<div>휴대전화인증</div>
				<div>
					<input type="tel" name="memberPhone" placeholder="휴대폰 번호">
					<button>휴대전화인증</button>
					<p>회원님의 보안 강화 및 편리한 서비스를 제공해 드리기 위해 휴대전화 인증을 하고 있습니다.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>아이디</div>
				<div>
					<input type="text" id="memberId" name="memberId" placeholder="아이디" onChange="idCheck();">
					<p id="id_check">얌냐밍에서 이용하실 아이디를 입력해주세요. 5~20자의 영문,숫자만 가능합니다.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>비밀번호</div>
				<div>
					<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호" onChange="pwCheck();">
					<input type="password" id="memberPw2" placeholder="비밀번호 확인" onChange="pwreCheck();">
					<p id="pw_check">특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>이름</div>
				<div>
					<input type="text" id="memberName" name="memberName" placeholder="이름" onChange="memberNameChk();">
					<p id="name_Check">얌냐밍에서 회원정보로 등록하실 이름을 입력해주세요. 한글2자 이상 입력해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>닉네임</div>
				<div>
					<input type="text" id="memberNickName" name="memberNickName" onChange="nickCheck();" placeholder="닉네임">
					<p id="nick_check">얌냐밍에서 이용하실 닉네임을 입력해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>성별</div>
				<div id="genderStyle">
					<div class="genderRadio">
						<input type="radio" id="male" name="memberGender" value="M" onclick="genderCheck();"> 
						<label for="male">남자</label>
					</div>
					<div class="genderRadio">
						<input type="radio" id="female" name="memberGender" value="F" onclick="genderCheck();">
						<label for="female">여자</label>
					</div>	
				</div>			
			</div>
			
			<div class="signUp-table">
				<div>생년월일</div>
				<div id="birthStyle">
					<input type="text" id="mbBirthYear" name="mbBirthYear" placeholder="생년 (4자) ex)2018" maxlength="4" onChange="birthYearCheck();">
					<input type="text" id="mbBirthMonth" name="mbBirthMonth" placeholder="월 ex)01" maxlength="2" onChange="birthMonthCheck();">
					<input type="text" id="mbBirthDay" name="mbBirthDay" placeholder="일 ex)01" maxlength="2" onChange="birthDayCheck();">
					<p id="birth_check">생년월일을 입력해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>이메일</div>
				<div>
					<input type="email" id="memberEmail" name="memberEmail" placeholder="이메일" onChange="emailCheck();">
						<br>
						<input type="text" id="emailConfirmInput" placeholder="인증번호 입력" onchange="emailKeyMatchCheck();" onkeydown="emailKeyMatchCheck();" style="display:none"/>
					<p id="email_check">얌냐밍에서 이용하실 이메일을 입력해주세요.</p>
				</div>
			</div>
			
			<div class="signUp-table" id="table-bottom">
				<div>프로필 사진</div>
				<div>
					<div id="profileStyle">
						 <div id="profile-img" onclick="deleteImageAction();">
						 	<img id="avatarImg"/>
						 </div>
						<div>						
							
							<label for="input_avatarPhoto">찾아보기</label>
							<input type="file" id="input_avatarPhoto" name="avatarPhoto" value="C:/Users/user1/git/YamNyaMing/YamNyaMing/src/main/webapp/resources/image/profile.png">
						</div>
					</div>
					<p id="profileText">얌냐밍의 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.</p>
				</div>
			</div>
			
			<h2>이용약관</h2>
			<div id="check-table">
				<div class="check" onclick="openCheck1()">
					<input type="checkbox" id="check1" name="service" onclick="checkService1(this);" />
					<label for="check1">이용약관</label>
				</div>
				<div id="checkText1">
					<h3>서비스 이용약관</h3>
					<br>
					<h4>제1조 목적</h4>
					<p>이 약관은 (주)얌냠컴퍼니(이하 "회사")에서 제공하는 얌냐밍 및 얌냐밍에서 제공하는 제반 서비스(이하 "서비스")에 접속과 사용자에 의해서 업로드 및 다운로드 되어 표시되는 모든 정보, 
					텍스트, 이미지 및 기타 자료를 이용하는 이용자(이하 "회원")와 서비스 이용에 관한 권리 및 의무와 책임사항, 기타 필요한 사항을 규정하는 것을 목적으로 합니다.</p>
					<br>
					<h4>제2조 약관의 게시와 효력, 개정</h4>
					<p>① 회사는 서비스의 가입 과정에 본 약관을 게시합니다.<br>
					② 회사는 관련법에 위배되지 않는 범위에서 본 약관을 변경할 수 있습니다.<br>
					③ 회원은 회사가 전항에 따라 변경하는 약관에 동의하지 않을 권리가 있으며, 이 경우 회원은 회사에서 제공하는 서비스 이용 중단 및 탈퇴 의사를 표시하고 서비스 이용 종료를 요청할 수 있습니다. 
					다만, 회사가 회원에게 변경된 약관의 내용을 통보하면서 회원에게 "7일 이내 의사 표시를 하지 않을 경우 의사 표시가 표명된 것으로 본다는 뜻"을 명확히 통지하였음에도 불구하고, 
					거부의 의사표시를 하지 아니한 경우 회원이 변경된 약관에 동의하는 것으로 봅니다. 만약 변경되는 약관의 내용이 회원에게 불리한 것으로 판단되는 경우 최소 30일 이전에 변경 사항을 통지합니다.</p>
					<br>
					<h4>제3조 약관의 해석과 예외 준칙</h4>
					<p>① 회사는 제공하는 개별 서비스에 대해서 별도의 이용약관 및 정책을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우 개별 서비스의 이용약관을 우선하여 적용합니다.<br>
					② 본 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.</p>
					<br>
					<h4>제4조 용어의 정의</h4>
					<p>① 서비스: 개인용 컴퓨터 (PC), TV, 휴대형 단말기, 전기통신설비 등 포함 각종 유무선 장치와 같이 구현되는 단말기와 상관없이 회원이 이용할 수 있는 얌냐밍 및 얌냐밍 관련 제반 서비스를 
					의미합니다. 제반 서비스에는 개발자 및 서비스 제공자가 얌냐밍 Open Application Programming Interface 서비스와 이를 이용하여 개발한 API 응용 애플리케이션 또는 웹서비스도 
					포함됩니다.<br>
					② 회원: 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 모든 사용자를 의미합니다.<br>
					③ 아이디: 회원의 식별 및 서비스 이용을 위하여 회원이 선정하고 회사가 부여한 문자 및 숫자의 조합을 의미합니다.<br>
					④ 비밀번호: 회원의 개인 정보 및 확인을 위해서 회원이 정한 문자 또는 숫자의 조합을 의미합니다.<br>
					⑤ 게시물: 회원이 서비스를 이용함에 있어 회원이 서비스에 게시한 문자, 문서, 그림, 음성, 링크, 파일 혹은 이들의 조합으로 이루어진 정보 등 모든 정보나 자료를 의미합니다.</p>
					<br>
					<h4>제5조 이용계약의 체결</h4>
					<p>① 이용계약은 회원이 얌냐밍 서비스 및 제반 서비스에서 제공하는 회원 가입 페이지에서 서비스 이용약관에 동의한 후 이용신청을 하고 신청한 내용에 대해서 회사가 승낙함으로써 체결됩니다.<br>
					② 회사는 이용약관에 동의한 후 이용신청한 사용자에 대해서 원칙적으로 접수 순서에 따라 서비스 이용을 승낙함을 원칙으로 합니다. 
					다만 업무 수행상 또는 기술상 지장이 있을 경우 일정시간 가입승인을 유보할 수 있습니다.<br>
					③ 회사는 다음 각 호에 해당하는 신청에 대해서 승낙하지 않거나 사후에 이용계약을 해지할 수 있습니다.<br>
					- 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우<br>
					- 제3자의 전자우편 주소를 이용하여 신청한 경우<br>
					- 허위의 정보를 기재하거나, 회사가 필수적으로 입력을 요청한 부분을 기재하지 않은 경우<br>
					- 부정한 용도로 서비스를 사용하고자 하는 경우<br>
					- 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우<br>
					- 회사의 정책에 적합하지 않는 회원으로 판단되는 경우나 서비스 제공이 곤란한 경우<br>
					- 회원의 이용 목적이나 서비스 이용 방법이 회사의 재산권이나 영업권을 침해하거나 침해할 우려가 있는 경우<br>
					- 비정상적인 방법을 통하여 아이디 및 도메인을 대량으로 생성하는 행위<br>
					④ 회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.<br>
					⑤ 회원은 회사에 언제든지 회원 탈퇴를 요청하여 이용계약을 해지할 수 있습니다.<br>
					⑥ 회원은 회원 가입 시 기재한 개인정보의 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. 변경의 지체로 인하여 발생한 회원의 손해에 대해 회사는 책임을 지지 않습니다.<br>
					⑦ 회사는 관련 법률 및 회사의 개인정보처리방침에서 정한 바에 따라 회원에게 요청하는 회원정보 및 기타정보 항목을 추가, 삭제 등 변경하여 수집 및 이용할 수 있습니다.</p>
					<br>
					<h4>제6조 개인정보보호 의무</h4>
					<p>① 회사는 정보통신망법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 개인정보처리방침이 적용됩니다. 
					다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보취급방침이 적용되지 않습니다.<br>
					② 회사는 서비스를 중단하거나 회원이 개인정보 제공 동의를 철회한 경우에는 신속하게 회원의 개인정보를 파기합니다. 
					단, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법률에서 정하는 바에 따라 일정 정보는 보관할 수 있습니다.<br>
					③ 회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 관계 법령에서 정하는 바에 따라 추가적인 개인정보를 수집할 수 있습니다.<br>
					④ 회사는 법률에 특별한 규정이 있는 경우를 제외하고는 회원의 별도 동의 없이 회원의 계정정보를 포함한 일체의 개인정보를 제3자에게 공개하거나 제공하지 아니합니다.<br>
					⑤ 회사는 향후 제공하는 서비스에서 회원의 편의를 위해서 회원의 계정 정보를 사용할 수 있도록 링크 및 기타 방법을 제공할 수 있습니다.</p>
					<br>
					<h4>제7조 회원의 아이디 및 비밀번호</h4>
					<p>① 회원은 아이디와 비빌번호에 관해서 관리책임이 있습니다.<br>
					② 회원은 아이디 및 비멀번호를 제3자가 이용하도록 제공하여서는 안됩니다.<br>
					③ 회사는 회원이 아이디 및 비밀번호를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 회사의 고의 또는 중대한 과실이 없는 제3자의 부정이용 등으로 인한 손해에 대해 책임을 지지 않습니다.<br>
					④ 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.</p>
					<br>
					<h4>제8조 회사의 의무</h4>
					<p>① 회사는 계속적이고 안정적인 서비스의 제공을 위하여 최선을 다하여 노력합니다.<br>
					② 회사는 회원이 안전하게 서비스를 이용할 수 있도록 현재 인터넷 보안기술의 발전수준과 회사가 제공하는 서비스의 성격에 적합한 보안시스템을 갖추고 운영해야 합니다.<br>
					③ 회사는 서비스를 이용하는 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우를 이를 처리하여야하 합니다. 이때 처리과정에 대해서 고객에게 메일 및 게시판 등의 방법으로 전달합니다.<br>
					④ 회사는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다.</p>
					<br>
					<h4>제9조 회원의 의무</h4>
					<p>① 회원은 다음 각호에 해당하는 행위를 해서는 안됩니다.<br>
					- 이용 신청 또는 회원정보 변경 시 허위내용 등록<br>
					- 타인의 정보 도용<br>
					- 회사의 운영자, 임직원, 회사를 사칭하거나 관련 정보를 도용<br>
					- 회사가 게시한 정보의 변경<br>
					- 회사와 기타 제3자의 저작권, 영업비밀, 특허권 등 지적재산권에 대한 침해<br>
					- 회사와 다른 회원 및 기타 제3자를 희롱하거나, 위협하거나 명예를 손상시키는 행위<br>
					- 외설, 폭력적인 메시지, 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위<br>
					- 해킹을 통해서 다른 사용자의 정보를 취득하는 행위<br>
					- 기타 현행 법령에 위반되는 불법적인 행위<br>
					② 회사는 회원이 전항에서 금지한 행위를 하는 경우, 위반 행위의 경중에 따라 서비스의 이용정지/계약의 해지 등 서비스 이용 제한, 수사 기관에의 고발 조치 등 합당한 조치를 취할 수 있습니다.<br>
					③ 회원은 회사의 명시적 사전 동의가 없는 한 서비스의 이용권한 및 기타 이용계약상의 지위를 제3자에게 양도, 증여, 대여할 수 없으며 이를 담보로 제공할 수 없습니다.<br>
					④ 회원은 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안 됩니다.<br>
					⑤ 회원은 회사의 사전 허락 없이 회사가 정한 이용 목적과 방법에 반하여 영업/광고활동 등을 할 수 없고, 회원의 서비스 이용이 회사의 재산권, 영업권 또는 비즈니스 모델을 침해하여서는 안됩니다.</p>
					<br>
					<h4>제10조 서비스의 제공 및 변경</h4>
					<p>① 회사는 회원에게 아래와 같은 서비스를 제공합니다.<br>
					- 얌냐밍 및 얌냐밍 통합계정 서비스<br>
					- 기타 회사가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 회원에게 제공하는 일체의 서비스<br>
					② 회사는 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 
					이 경우 회사는 회원에게 공지사항 게시판 및 메일 등의 방법으로 통지합니다. 다만, 회사가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.<br>
					③ 회사는 회원과 별도로 서면 계약을 체결하여 얌냐밍 서비스 및 제반 서비스의 브랜드 특성을 이용할 수 있는 명시적인 권리를 부여하지 아니하는 한, 
					회원에게 회사 또는 서비스의 상호, 상표, 서비스표, 로고, 도메인 네임 및 기타 식별력 있는 브랜드 특성을 이용할 수 있는 권리를 부여하지 않습니다.<br>
					④ 회사가 제공하는 서비스의 형태와 기능, 디자인 등 필요한 경우 수시로 변경되거나, 중단될 수 있습니다. 회사는 이 경우 개별적인 변경에 대해서 회원에게 사전 통지하지 않습니다. 
					다만, 회원에게 불리한 것으로 판단되는 경우 전자우편으로 통하여 이를 공지합니다.<br>
					⑤ 전항에 의해서 제공되는 서비스가 변경 및 중단될 경우 무료로 제공되는 서비스에 대해서는 회원에게 별도로 보상하지 않습니다.</p>
					<br>
					<h4>제11조 광고의 게제</h4>
					<p>① 회사는 서비스 운영과 관련하여 회원정보, 고객이 입력한 정보를 활용하여 광고를 게재할 수 있습니다. 회원은 서비스 이용 시 노출되는 맞춤 광고 게재에 대해 동의합니다.<br>
					② 회사는 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.</p>
					<br>
					<h4>제12조 전자우편을 통한 정보의 제공</h4>
					<p>① 회사는 회원이 서비스 이용에 필요하다고 인정되는 다양한 정보를 회원이 제공한 전자우편 주소로 제공할 수 있습니다.<br>
					② 회사는 서비스 운영을 위해 회원정보를 활용하여 영리목적의 광고성 전자우편을 전송할 수 있습니다. 
					회원이 이를 원하지 않는 경우에는 언제든지 서비스 홈페이지 또는 서비스 내부 설정페이지 등을 통하여 수신거부를 할 수 있습니다.<br>
					③ 회사는 다음 각호에 해당하는 경우 회원의 동의여부와 상관없이 전자우편으로 발송할 수 있습니다.<br>
					- 이용 신청에서 입력한 전자우편 주소의 소유를 확인하기 위해서 인증메일을 발송하는 경우<br>
					- 회원의 정보가 변경되어 확인하기 위해서 인증메일을 발송하는 경우<br>
					- 기타 서비스를 제공함에 있어 회원이 반드시 알아야 하는 중대한 정보라고 회사가 판단하는 경우</p>
					<br>
					<h4>제13조 서비스 이용의 제한</h4>
					<p>① 회사는 천재지변이나 국가비상사태, 
					해결이 곤란한 기술적 결함 또는 서비스 운영의 심각한 변화 등 불가항력적인 경우가 발생 또는 발생이 예상될 때는 서비스의 전부 또는 일부를 예고 없이 제한하거나 중지할 수 있습니다.<br>
					② 서비스를 이용하게 됨으로써 서비스 영역에서 발생하는 회원 사이의 문제에 대해 회사는 책임을 지지 않습니다.<br>
					③ 회원의 관리 소홀로 인하여 ID 및 비밀번호의 유출로 인해 회원에게 서비스 이용상의 손해가 발생하거나 제3자에 의한 
					부정이용 등으로 회원의 의무조항을 위반한 경우 ID및 해당 도메인의 이용이 제한될 수 있습니다.<br>
					④ 회사가 본 약관 제9조의 위반 행위를 조사하는 과정에서 당해 회원 ID 및 도메인이 특정 위반행위에 직접적으로 관련되어 있는 경우 등 
					다른 회원의 권익 보호 및 서비스의 질서유지를 위해 불가피할 경우에는 해당 ID 및 도메인의 이용을 일시적으로 정지할 수 있습니다. 
					이에 대해 회원은 서비스 홈페이지 또는 전자 우편 등을 통해 이의신청을 할 수 있습니다.</p>
					<br>
					<h4>제14조 게시물의 권리와 책임</h4>
					<p>① 회원이 서비스 내에 작성한 텍스트, 이미지, 동영상, 링크 등의 기타 정보(이하 "게시물")에 대한 책임 및 권리는 게시물을 등록한 회원에게 있습니다.<br>
					② 회사는 회원이 작성한 컨텐츠에 대해서 감시 및 관리할 수 없으며 이에 대해서 책임지지 않습니다. 
					회사는 회원이 등록하는 게시물의 신뢰성, 진실성, 정확성 등에 대해서 책임지지 않으며 보증하지 않습니다.<br>
					③ 서비스에 대한 저작권 및 지적재산권, 회사가 작성한 게시물의 저작권은 회사에 귀속됩니다. 단, 회원이 단독 또는 공동으로 작성한 게시물 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.<br>
					④ 회원은 자신이 서비스 내에 게시한 게시물을 회사가 국내ㆍ외에서 다음 목적으로 사용하는 것을 허락합니다. <br>
					- 서비스(제3자가 운영하는 사이트 또는 미디어의 일정 영역 내에 입점하여 서비스가 제공되는 경우를 포함합니다)내에서 게시물을 사용하기 위하여 게시물의 크기를 변환하거나 단순화하는 등의 방식으로 
					수정하는 것<br>
					- 회사에서 운영하는 다른 사이트 또는 다른 회사가 운영하는 사이트에 게시물을 복제ㆍ전송ㆍ전시하는 것<br>
					- 회사의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에게 게시물의 내용을 보도, 방영하게 하는 것. 
					단, 이 경우 회사는 회원의 개별 동의없이 미디어, 통신사 등에게 게시물 또는 회원정보를 제공하지 않습니다.<br>
					⑤ 회원이 회원탈퇴를 한 경우에는 문의사항, 쪽지 등 개인적으로 기록된 저작물 일체는 삭제됩니다.(평가, 좋아요 등 타게시물에 연관된 게시물 제외) 
					단, 회원은 언제든지 삭제 기능을 통하여 모든 개인 게시물을 삭제할 수 있으며, 회원탈퇴 이후에도 본인이 작성한 모든 게시물 삭제를 회사에 요구할 수 있습니다. 
					이 경우 회사는 즉시 해당 게시물을 삭제하여야 합니다. 
					단, 제3자에 의하여 보관되거나 무단복제 등을 통하여 복제됨으로써 해당 저작물이 삭제되지 않고 재 게시된 경우에 대하여 회사는 책임을 지지 않습니다. 
					또한, 본 약관 및 관계 법령을 위반한 회원의 경우 다른 회원을 보호하고, 법원, 
					수사기관 또는 관련 기관의 요청에 따른 증거자료로 활용하기 위해 회원탈퇴 후에도 관계 법령이 허용하는 한도에서 회원의 아이디 및 회원정보를 보관할 수 있습니다.<br>
					⑥ 회원의 게시물 또는 저작물이 회사 또는 제3자의 저작권 등 지적재산권을 침해함으로써 발생하는 민?형사상의 책임은 전적으로 회원이 부담하여야 합니다.</p>
					<br>
					<h4>제15조 게시물의 관리</h4>
					<p>① 회원의 게시물이 정보통신망법 및 저작권법등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 
					회사는 관련법에 따라 조치를 취하여야 합니다.<br>
					② 회사는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 본 약관 및 기타 회사 정책, 
					관련법에 위반되는 경우에는 관련법에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다.<br>
					③ 회원이 비공개로 설정한 게시물에 대해서는 회사를 포함한 다른 사람이 열람할 수 없습니다. 
					단, 법원, 수사기관이나 기타 행정기관으로부터 정보제공을 요청 받은 경우나 기타 법률에 의해 요구되는 경우에는 회사를 포함한 다른 사람이 해당 게시물을 열람할 수 있습니다.</p>
					<br>
					<h4>제16조 서비스 이용의 중지 및 해지</h4>
					<p>① 회원은 회사에 언제든지 회원 탈퇴를 요청할 수 있으며, 회사는 이와 같은 요청을 받았을 경우, 회사가 별도로 고지한 방법에 따라 신속하게 처리합니다.<br>
					② 회원이 서비스의 이용중지를 원하는 경우에는 회사가 제공하는 서비스 페이지 또는 전자우편 등의 방법으로 회사에 중지신청을 할 수 있습니다. 
					회사는 이와 같은 요청을 받았을 경우, 회사가 별도로 고지한 방법에 따라 신속하게 처리합니다.<br>
					③ 회사는 회원이 본 약관 제9조의 이용자의 의무를 위반한 경우 및 서비스의 정상적인 운영을 방해한 경우에는 사전 통보 후 회원 자격을 제한, 
					이용계약을 해지하거나 또는 기간을 정하여 서비스의 이용을 중지할 수 있습니다.<br>
					④ 회사는 전항에도 불구하고, 저작권법 및 컴퓨터프로그램보호법을 위반한 불법프로그램의 제공 및 운영방해, 정보통신망법을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 
					접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다.<br>
					⑤ 회사는 회원이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.<br>
					⑥ 회원은 본 조에 따른 이용제한 등에 대해 회사가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.</p>
					<br>
					<h4>제17조 책임제한</h4>
					<p>① 회사는 회원의 약관, 서비스 이용 방법 및 이용 기준을 준수하지 않는 등 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.<br>
					② 회사는 서비스를 통하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 보증하지 않습니다.<br>
					③ 회사는 회원 간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.<br>
					④ 회사는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.<br>
					⑤ 회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지, 제3자가 제공하는 오픈아이디의 인증 장애, 
					해결이 곤란한 기술적 결함 기타 불가항력으로 인하여 서비스를 제공할 수 없는 경우 책임이 면제됩니다.<br>
					⑥ 회사는 사전에 공지된 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 서비스가 중지되거나 장애가 발생한 경우에 대하서는 책임이 면제됩니다.<br>
					⑦ 회원은 자신의 결정에 의하여 회사의 서비스를 사용하여 특정 프로그램이나 정보 등을 다운받거나 접근함으로써 입게 되는 컴퓨터 시스템상의 손해나 데이터, 정보의 상실에 대한 책임을 집니다.<br>
					⑧ 회사는 기간통신사업자가 전기통신서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우에는 책임이 면제됩니다.<br>
					⑨ 회원의 컴퓨터 오류, 신상정보 및 전자우편 주소의 부정확한 기재, 비밀번호 관리의 소홀 등 회원의 귀책사유로 인해 손해가 발생한 경우 회사는 책임을 지지 않습니다.<br>
					⑩ 회사는 회원의 컴퓨터 환경이나 회사의 관리 범위에 있지 아니한 보안 문제로 인하여 발생하는 제반 문제 또는 현재의 보안기술 수준으로 방어가 
					곤란한 네트워크 해킹 등 회사의 귀책사유 없이 발생하는 문제에 대해서 책임을 지지 않습니다.<br>
					⑪ 회사는 서비스가 제공한 내용에 대한 중요 정보의 정확성, 내용, 완전성, 적법성, 신뢰성 등에 대하여 보증하거나 책임을 지지 않으며, 사이트의 삭제, 저장실패, 잘못된 인도, 
					정보에 대한 제공에 대한 궁극적인 책임을 지지 않습니다. 또한, 회사는 회원이 서비스 내 또는 웹사이트상에 게시 또는 전송한 정보, 자료, 사실의 신뢰도, 정확성, 완결성, 
					품질 등 내용에 대해서는 책임을 지지 않습니다.<br>
					⑫ 회사는 회원 상호간 또는 회원과 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.<br>
					⑬ 회사는 회원이 서비스를 이용하여 기대하는 효용을 얻지 못한 것에 대하여 책임을 지지 않으며 서비스에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
					⑭ 회사는 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 않습니다.</p>
					<br>
					<h4>제18조 준거법 및 재판관할</h4>
					<p>① 회사와 회원 간 제기된 소송에는 대한민국법을 준거법으로 합니다.<br>
					② 회사와 회원간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.</p>
				</div>
				<div class="check" onclick="openCheck2()">
					<input type="checkbox" id="check2" name="service" onclick="checkService2(this);">
					<label for="check2">개인정보 취급방침</label>
				</div>
				<div id="checkText2">
					<h3>개인정보처리방침</h3>
					<br>
					<p>얌냠컴퍼니(이하 ‘당사’라함)가 소유하고 운영하는 얌냐밍 어플리케이션과 이와 관련된 웹사이트들(이하 ‘얌냐밍’라 함)은 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 
					개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br>
					<br>당사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p>
					<br>
					<h4>1. 개인정보의 처리 목적</h4>
					<p>당사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.<br>
					가. 홈페이지 회원가입 및 관리<br>
					회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 각종 고지·통지, 
					고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.<br>
					나. 민원사무 처리<br>
					민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.<br>
					다. 재화 또는 서비스 제공<br>
					서비스 제공, 콘텐츠 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.<br>
					라. 마케팅 및 광고에의 활용<br>
					신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 서비스의 유효성 확인, 
					접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.<br>
					마. 개인영상정보<br>
					범죄의 예방 및 수사, 교통단속, 교통정보의 수집·분석 및 제공 등을 목적으로 개인정보를 처리합니다.</p>
					<br>
					<h4>2. 개인정보 파일 현황</h4>
					<p>당사가 개인정보 보호법 제32조에 따라 등록/공개하는 개인정보파일의 처리목적은 다음과 같습니다.<br>
					가. 개인정보 파일명 : 개인정보파일<br>
					- 개인정보 수집항목<br>
					회원가입시(필수) : 이메일, 비밀번호, 이름, 태어난해, 성별, 전화번호<br>
					- 수집방법 : 서면양식, 홈페이지<br>
					- 보존 근거 : 서비스 제공을 위해 필요함<br>
					- 보존 기간 : 준영구<br>
					- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년, 
					계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월<br>
					나. 쿠키 운영 여부(개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항) <br>
					회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 
					쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.<br>
					1) 쿠키의 사용 목적 : 얌냐밍의 각 서비스와 방문형태 및 좋아요한맛집 등을 파악하여 이용자에게 최적화된 정보 제공을 위하여 사용합니다.<br>
					2) 쿠키의 설치/운영 및 거부<br>
					- 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 
					아니면 모든 쿠키의 저장을 거부할 수도 있습니다.<br>
					- 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 얌냐밍의 일부 서비스 이용에 어려움이 있을 수 있습니다. <br>
					- 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우) <br>
					① [도구] 메뉴에서 [인터넷 옵션]을 선택합니다. <br>
					② [개인정보 탭]을 클릭합니다. <br>
					③ [개인정보취급 수준]을 설정하시면 됩니다.</p>
					<br>
					<h4>3. 개인정보의 처리 및 보유 기간</h4>
					<p>당사는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다. 
					각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>
					1) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
					2) 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
					3) 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
					4) 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
					5) 표시/광고에 관한 기록 : 6개월 (전자상거래등에서의 소비자보호에 관한 법률)</p>
					<br>
					<h4>4. 개인정보의 제3자 제공에 관한 사항</h4>
					<p>가. 당사는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
					<p>나. 당사는 현재 개인정보를 제3자에게 제공하지 않고 있습니다.</p>
					<br>
					<h4>5. 개인정보처리 위탁</h4>
					<p>가. 원활한 개인정보 업무처리를 위하여 개인정보 처리업무를 위탁할수 있습니다. 
					현재는 위탁하고 있는 업무처리가 없으며 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
					<h4>6. 정보주체의 권리, 의무 및 그 행사방법</h4>
					<p>이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.<br>
					① 정보주체는 당사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br>
					1) 개인정보 열람요구<br>
					2) 오류 등이 있을 경우 정정 요구<br>
					3) 삭제요구<br>
					4) 처리정지 요구<br>
					② 제1항에 따른 권리 행사는 당사에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 당사는 이에 대해 지체 없이 조치하겠습니다.<br>
					③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 당사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br>
					④ 얌냐밍은 법정 대리인의 동의가 필요한 만14세 미만 아동의 회원가입은 받고 있지 않습니다. 이에 따라 별도의 법정대리인의 권리와 취급 방침은 두고 있지 않습니다.<br>
					⑤ 제1항에 따른 권리 행사는 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p>
					<br>
					<h4>7. 처리하는 개인정보의 항목 작성</h4>
					<p>당사는 다음의 개인정보 항목을 처리하고 있습니다.<br>
					- 홈페이지 회원가입 및 관리에 필수적인 항목 : 개인정보의 처리 목적, 개인정보파일 현황, 개인정보의 처리 및 보유 기간, 정보주체의 권리·의무 및 그 행사방법에 관한 사항, 
					처리하는 개인정보의 항목, 개인정보의 파기에 관한 사항, 개인정보 보호책임자에 관한 사항, 개인정보 처리방침의 변경에 관한 사항, 개인정보의 안전성 확보조치에 관한 사항<br>
					- 선택항목 : 정보주체의 권익침해에 대한 구제방법</p>
					<br>
					<h4>8. 개인정보의 파기</h4>
					<p>당사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br>
					- 파기절차<br>
					이 용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 
					이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br>
					- 파기기한<br>
					이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 
					사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br>
					- 파기방법<br>
					전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</p>
					<br>
					<h4>9. 개인정보의 안전성 확보 조치</h4>
					<p>당사는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.<br>
					가. 개인정보 취급 직원의 최소화 및 교육<br>
					개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br>
					나. 정기적인 자체 감사 실시<br>
					개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br>
					다. 내부관리계획의 수립 및 시행<br>
					개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.<br>
					라. 개인정보의 암호화<br>
					이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 
					본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br>
					마. 해킹 등에 대비한 기술적 대책<br>
					당사는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 
					기술적/물리적으로 감시 및 차단하고 있습니다.<br>
					바. 개인정보에 대한 접근 제한<br>
					개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,
					말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br>
					사. 접속기록의 보관 및 위변조 방지<br>
					개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.<br>
					아. 문서보안을 위한 잠금장치 사용<br>
					개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.<br>사. 비인가자에 대한 출입 통제<br>
					개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</p>
					<br>
					<h4>10. 개인정보 보호책임자 작성</h4>
					<p>① 당사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>
					- 전화번호 : 010-9612-0530<br>
					- 이메일 : minimelodi@naver.com <br>
					- 개인정보관리책임자 성명 : 김미경<br>
					② 정보주체께서는 당사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다.
					당사는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p>
					<br>
					<h4>11. 개인정보 처리방침 변경</h4>
					<p>이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
				</div>
				<div class="check" onclick="openCheck3()">
					<input type="checkbox" id="check3" name="service" onclick="checkService3(this);">
					<label for="check3">위치기반 서비스 이용약관</label>
				</div>
				<div id="checkText3">
					<h3>위치기반서비스 이용약관</h3>
					<br>
					<h4>제 1 조 (목적)</h4>
					<p>본 약관은 회원(얌냐밍(YamNyaMing)서비스 약관에 동의한 자를 말합니다. 이하 “회원”이라고 합니다.)이 주식회사 얌냠컴퍼니(이하 “회사”라고 합니다.)가 제공하는 얌냐밍(YamNyaMing) 
					서비스(이하 “서비스”라고 합니다)를 이용함에 있어 회사와 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</p>
					<br>
					<h4>제 2 조 (이용약관의 효력 및 변경)</h4>
					<p>①본 약관은 서비스를 신청한 고객 또는 개인위치정보주체가 본 약관에 동의하고 회사가 정한 소정의 절차에 따라 서비스의 이용자로 등록함으로써 효력이 발생합니다.<br>
					②회원이 온라인에서 본 약관의 "동의하기" 버튼을 클릭하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다.<br>
					③회사는 위치정보의 보호 및 이용 등에 관한 법률, 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 
					소비자기본법 약관의 규제에 관한 법률 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.<br>
					④회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 10일 전부터 적용일 이후 상당한 기간 동안 공지만을 하고, 
					개정 내용이 회원에게 불리한 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 게시하거나 회원에게 전자적 형태(전자우편, SMS 등)로 약관 개정 사실을 발송하여 
					고지합니다. <br>
					⑤회사가 전항에 따라 회원에게 통지하면서 공지 또는 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 이용약관에 승인한 것으로 봅니다. 
					회원이 개정약관에 동의하지 않을 경우 회원은 이용계약을 해지할 수 있습니다.</p>
					<br>
					<h4>제 3 조 (관계법령의 적용)</h4>
					<p>본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 또는 상관례에 따릅니다.</p>
					<br>
					<h4>제 4 조 (서비스의 내용)</h4>
					<p>회사가 제공하는 서비스는 아래와 같습니다.<br>
					①서비스명 : 얌냐밍(YamNyaMing)<br>
					②서비스내용 : 맛집검색 기능, 위치정보를 이용한 맛집 검색 기능</p>
					<br>
					<h4>제 5 조 (서비스 이용요금) </h4>
					<p>①회사가 제공하는 서비스는 기본적으로 무료입니다.<br>
					②무선 서비스 이용 시 발생하는 데이터 통신료는 별도이며 가입한 각 이동통신사의 정책에 따릅니다.<br>
					③MMS 등으로 게시물을 등록할 경우 발생하는 요금은 이동통신사의 정책에 따릅니다.</p>
					<br>
					<h4>제 6 조 (서비스내용변경 통지 등)</h4>
					<p>①회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 회원의 등록된 전자우편 주소로 이메일을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다.<br>
					②①항의 경우 불특정 다수인을 상대로 통지를 함에 있어서는 웹사이트 등 기타 회사의 공지사항을 통하여 회원들에게 통지할 수 있습니다.</p>
					<br>
					<h4>제 7 조 (서비스이용의 제한 및 중지)</h4>
					<p>①회사는 아래 각 호의 1에 해당하는 사유가 발생한 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다.<br>
					1. 회원이 회사 서비스의 운영을 고의 또는 중과실로 방해하는 경우<br>
					2. 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우<br>
					3. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우<br>
					4. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때<br>
					5. 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우<br>
					②회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 회원에게 알려야 합니다.</p>
					<br>
					<h4>제 8 조 (개인위치정보의 이용 또는 제공)</h4>
					<p>①회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.<br>
					②회원 및 법정대리인의 권리와 그 행사방법은 제소 당시의 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 
					다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>
					③회사는 타사업자 또는 이용 고객과의 요금정산 및 민원처리를 위해 위치정보 이용·제공․사실 확인자료를 자동 기록·보존하며, 해당 자료는 1년간 보관합니다.<br>
					④회사는 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 매회 회원에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 
					단, 아래 각 호의 1에 해당하는 경우에는 회원이 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보합니다.<br>
					1. 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우<br>
					2. 회원이 온라인 게시 등의 방법으로 통보할 것을 미리 요청한 경우</p>
					<br>
					<h4>제 9 조 (개인위치정보주체의 권리)</h4>
					<p>①회원은 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 
					이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.<br>
					②회원은 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있으며, 회사는 이를 거절할 수 없고 이를 위한 기술적 수단을 갖추고 있습니다.<br>
					③회원은 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 
					이 경우 회사는 정당한 사유 없이 회원의 요구를 거절할 수 없습니다.<br>
					1. 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료<br>
					2. 본인의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제3자에게 제공된 이유 및 내용<br>
					④회원은 제1호 내지 제3호의 권리행사를 위해 회사의 소정의 절차를 통해 요구할 수 있습니다.</p>
					<br>
					<h4>제 10 조 (법정대리인의 권리)</h4> 
					<p>①회사는 14세 미만의 회원에 대해서는 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의를 당해 회원과 당해 회원의 법정대리인으로부터 동의를 받아야 합니다. 
					이 경우 법정대리인은 제9조에 의한 회원의 권리를 모두 가집니다.<br>
					②회사는 14세 미만의 아동의 개인위치정보 또는 위치정보 이용․
					제공사실 확인자료를 이용약관에 명시 또는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우에는 14세미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 단, 아래의 경우는 제외합니다.<br>
					1. 위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우<br>
					2. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우</p>
					<br>
					<h4>제 11 조 (8세 이하의 아동 등의 보호의무자의 권리) </h4>
					<p>①회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동”등이라 한다)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 
					본인의 동의가 있는 것으로 봅니다.<br>
					1. 8세 이하의 아동<br>
					2. 금치산자<br>
					3. 장애인복지법제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서장애인고용촉진및직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자
					(장애인복지법 제29조의 규정에 의하여 장애인등록을 한 자에 한한다)<br>
					②8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.<br>
					③보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.</p>
					<br>
					<h4>제 12 조 (위치정보관리책임자의 지정)</h4>
					<p>①회사는 위치정보를 적절히 관리․보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리책임자로 지정해 운영합니다. <br>
					②위치정보관리책임자는 위치기반서비스를 제공하는 부서의 부서장으로서 구체적인 사항은 본 약관의 부칙에 따릅니다.</p>
					<br>
					<h4>제 13 조 (손해배상)</h4>
					<p>①회사가 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 제26조의 규정을 위반한 행위로 회원에게 손해가 발생한 경우 회원은 회사에 대하여 손해배상 청구를 할 수 있습니다. 
					이 경우 회사는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.<br>
					②회원이 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회사는 회원에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회원은 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.</p>
					<br>
					<h4>제 14 조 (면책)</h4>
					<p>①회사는 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.<br>
					1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우<br>
					2. 서비스 제공을 위하여 회사와 서비스 제휴계약을 체결한 제3자의 고의적인 서비스 방해가 있는 경우<br>
					3. 회원의 귀책사유로 서비스 이용에 장애가 있는 경우<br>
					4. 제1호 내지 제3호를 제외한 기타 회사의 고의∙과실이 없는 사유로 인한 경우<br>
					②회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에 대하여는 책임을 부담하지 아니합니다.</p>
					<br>
					<h4>제 15 조 (규정의 준용) </h4>
					<p>①본 약관은 대한민국법령에 의하여 규정되고 이행됩니다.<br>
					②본 약관에 규정되지 않은 사항에 대해서는 관련법령 및 상관습에 의합니다.</p>
					<br>
					<h4>제 16 조 (분쟁의 조정 및 기타) </h4>
					<p>①회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 위치정보의보호및이용 등에관한 법률 제28조의 규정에 의한 방송통신위원회에 
					재정을 신청할 수 있습니다.<br>
					②회사 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 
					개인정보보호법 제43조의 규정에 의한 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.</p>
					<br>
					<h4>제 17 조 (회사의 연락처) 회사의 상호 및 주소 등은 다음과 같습니다.</h4>
					<p>1. 상 호 : 주식회사 얌냠컴퍼니<br>
					2. 대 표 자 : 김 미 경<br>
					3. 주 소 : 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원<br>
					4. 대표전화 : 010-9612-0530</p>
				</div>
			</div>
			<div class="all-check">
				<input type="checkbox" id="allCheck" onclick="allCheckService();">
				<label for="allCheck">전체동의</label>
			</div>
			<input type="submit" value="회원가입하기">
		</form>
	
	</section>
	<footer id="member-main-footer">
		<div>
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
		</div>
		<a href="/enrollOwner.do">점장 가입하기</a>
	</footer>
</div>
</body>
</html>
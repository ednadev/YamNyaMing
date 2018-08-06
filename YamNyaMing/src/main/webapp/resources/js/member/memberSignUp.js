// 이용약관
function openCheck1(){
	var element = document.getElementById("checkText1");
	element.classList.toggle("open");
}
function openCheck2(){
	var element = document.getElementById("checkText2");
	element.classList.toggle("open");
}
function openCheck3(){
	var element = document.getElementById("checkText3");
	element.classList.toggle("open");
}
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
		idCheckBool==false;
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
    	$('#name_Check').html("<span style='color:#26a69a;'>확인</span>");	
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
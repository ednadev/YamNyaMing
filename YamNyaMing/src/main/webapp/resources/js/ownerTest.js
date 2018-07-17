/**
 * 
 */


function resultStyleChk(resultChk,chk)
{
	if(!chk)resultChk.css('color','red');
	else resultChk.css('color','lightgreen');
}
// 아이디 체크
function ownerIdChk()
{
	var idCheckResult = $('#ownerIdChk');
	var insertId  = $("input[name=owId]").val(); // 아이디 입력 결과
	
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	var rightFormChk  = true;
	console.log("아이디 중복 체크");
	$.ajax({
			url:"/ownerIdChk.do",
			data : {
						ownerId:insertId,
				   },
			type : "post",
			success : function(data){					 
				if(data=='y') {
					rightFormChk = false;					
					idCheckResult.html("이미 사용하고 있는 아이디 입니다.");
				}
				else{
					 //아이디 입력여부 검사
				    if (insertId == "") {
				    	rightFormChk = false;	
				        idCheckResult.html("아이디를 입력하지 않았습니다.");	
				        return false;
				    }
				    
				    //숫자로 시작하면 안됨
				    if( insertId.charAt(0)>='0' && insertId.charAt(0)<='9')
			    	{
				    	rightFormChk = false;	
				        idCheckResult.html("아이디는 숫자로 시작 할 수 없습니다.");
			    	}
				    
				    //아이디 유효성 검사 (영문소문자, 숫자만 허용)
				    for (i = 0; i < insertId.length; i++) {
				        ch = insertId.charAt(i)
				        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
				        	rightFormChk = false;	
				        	idCheckResult.html("아이디는 영어 대소문자, 숫자만 입력가능합니다.");	
				            return false;
				        }
				    }
				    //아이디에 공백 사용하지 않기
				    if (insertId.indexOf(" ") >= 0) {
				    	rightFormChk = false;	
				    	idCheckResult.html("아이디에 공백을 사용할 수 없습니다.");	
				        return false;
				    }
				    //아이디 길이 체크 (4~12자)
				    if (insertId.length<4 || insertId.length>12) {
				    	rightFormChk = false;	
				    	idCheckResult.html("아이디를 4~12자까지 입력해주세요.");	
				        return false;
				    }
				}
				
				if(rightFormChk)idCheckResult.html("사용할 수 있는 아이디 입니다.");	
				resultStyleChk(idCheckResult,rightFormChk);
			},
		error : function(){
			console.log("실패");	
		}
	});
}

// 비밀번호 체크

function ownerPwChk()
{
	var pwCheckResult = $('#ownerPwChk');
	var insertPw  = $("input[name=owPw]").val(); // 아이디 입력 결과
	
	var rightFormChk  = true;
	//비밀번호 입력여부 체크
    if (insertPw == "") {
        rightFormChk = false;	
        pwCheckResult.html("비밀번호를 입력하지 않았습니다.");	
        return false;
    }
    
    if ($("input[name=owId]").val().length>0 && insertPw.match($("input[name=owId]").val())) {
        rightFormChk = false;	
        pwCheckResult.html("비밀번호에 아이디를 포함할수 없습니다.");	
        return false;
    }
    //비밀번호 길이 체크(8~12자 까지 허용)
    if (insertPw.length<8 || insertPw.length>16) {
        rightFormChk = false;	
        pwCheckResult.html("비밀번호를 8~16자까지 입력해주세요.");	
        return false;
    }
    
    var num = insertPw.search(/[0-9]/g);

    var eng = insertPw.search(/[a-z]/ig);

    var spe = insertPw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    if(num < 0 || eng < 0 || spe < 0 ){
	  	rightFormChk = false;	
	    pwCheckResult.html("영문,숫자, 특수문자를 혼합하여 입력해주세요.");	
  	  	return false;
	 }
    
    if(rightFormChk)pwCheckResult.html("사용할 수 있는 비밀번호 입니다.");	
	resultStyleChk(pwCheckResult,rightFormChk);
}	


function ownerPwReChk()
{
	var insertPw =  $("input[name=owPw]").val();
	var insertRePw  = $("input[name=owPwRe]").val(); // 아이디 입력 결과
	var pwCheckReResult = $('#ownerPwReChk');
	var rightFormChk  = true;
	
	//비밀번호 입력여부 체크
    if (insertRePw == "") {
        rightFormChk = false;	
        pwCheckReResult.html("비밀번호를 입력하지 않았습니다.");	
        return false;
    }
    
    // 위에 입력한 비밀번호와 체크
    if (insertPw != insertRePw) {
        rightFormChk = false;	
        pwCheckReResult.html("입력한 비밀번호가 일치하지 않습니다.");	
        return false;
    }
    if(rightFormChk)pwCheckReResult.html("비밀번호가 일치합니다.");	
	resultStyleChk(pwCheckReResult,rightFormChk);
}

function ownerNameChk()
{	
	var insertName  = $("input[name=owName]").val(); // 이름 입력 결과
	var nameCheckResult = $('#ownerNameChk');
	var rightFormChk = true;
	var familyNameStr = "김,이,박,최,정,강,조,윤,장,임,한,오,서,신,권,황,안,송,전,홍,류,고,문,양,손,배,조,백,허,유,남,심,노,정,하,곽,성,차,주,우,구,신,임,전,민,유,류,나,진,지,엄,채,원,천,방,공,강,현,함,변,염,양,변,여,추,노,도,소,신,석,선,설,마,길,주,연,방,위,표,명,기,반,라,왕,금,옥,육,인,맹,제,모,장,남궁,탁,국,여,진,어,은,편"
    var nameArr = familyNameStr.split(",");
		
	if(insertName == "") {
    	rightFormChk = false;
    	nameCheckResult.html("이름을 입력하지 않았습니다.");
        return false;
    }
    if(insertName.length<2){
    	rightFormChk = false;
    	nameCheckResult.html("이름을 2자 이상 입력해주십시오.");
        return false;
    }
    for(var i = 0; i<nameArr.length;i++)
	{
    	if(insertName.charAt(0)==nameArr[i]){
    		rightFormChk = true;
    		break;
    	}
    	else
		{
    		rightFormChk = false;
		}
	}

    if(rightFormChk)nameCheckResult.html("확인");	
    else nameCheckResult.html("존재하지 않는 성씨입니다.");
	resultStyleChk(nameCheckResult,rightFormChk);
}

// 이메일 체크
function ownerEmailChk()
{
	var insertEmail  = $("input[name=owEmail]").val(); // 이름 입력 결과
	var emailCheckResult = $('#ownerEmailChk');
	var rightFormChk = true;
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	if (insertEmail.match(regExp) == null) {
		rightFormChk = false;
		emailCheckResult.html("이메일 형식이 아닙니다.");
	}	
	
	if(rightFormChk){
		emailCheckResult.html("이메일 인증 대기상태<button onclick='emailConfirm();'>인증 메일 보내기<button>");
	}
	resultStyleChk(emailCheckResult,rightFormChk);
}

function emailConfirm()
{
	var insertEmail  = $("input[name=owEmail]").val(); // 이름 입력 결과
	$.ajax({
		url:"/emailConCheck.do",
		data : {
					ownerEmail:insertEmail,
			   },
		type : "post",
		success : function(data){	
			console.log("이메일 결과" + data);
		},
		error : function(){
			
		},
	});
}



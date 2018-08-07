var idcheck = false;
var pwcheck = false;
function idCheck(){
    var regExp;
    var resultChk;
    var ad_id = $('#ad_id').val();
    regExp = /^[a-z0-9]{5,12}$/;
    resultChk = regExp.test(ad_id);
    if(resultChk == false){
    	document.getElementById('idch').style.color = "red";
        document.getElementById('idch').innerHTML = "5~12자의 영문 소문자와 숫자만 사용 가능합니다.";
        document.getElementById('subbtn').disabled;
        idcheck = false;
    }else{
        $.ajax({
             url : "/adminIdCheck.do",
             data : {ad_id : ad_id},
             dataType:'json',
             success : function(data){
                 console.log(data);
                 if(data>0){
                    document.getElementById('idch').style.color = "red";
                    document.getElementById('idch').innerHTML = "이미 존재하는 아이디.";
                    document.getElementById('subbtn').disabled;
                   idcheck = false; 
                 } else{
                    document.getElementById('idch').style.color = "blue";
                    document.getElementById('idch').innerHTML = "사용 가능한 아이디.";
                    idck = 1;      
                    idcheck = true;  
                 }   
             }
         });    
    }
}
function pwCheck(){   //비밀번호 조건문
	  var f1 = document.forms[0];       
	  var pw1 = f1.ad_password.value; //비밀번호 입력값
	  var pw2 = f1.pwd_check.value;   //비밀번호 확인 입력값 
	  var num = pw1.search(/[0-9]/g);
	  var eng = pw1.search(/[a-z]/ig);
	  var spe = pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	  if(pw1!=pw2)
	  {
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
	   pwcheck = false;
	  }
	  else if(pw1 == "") 
	  {
	  document.getElementById('checkPwd').style.color = "red";
	  document.getElementById('checkPwd').innerHTML = "비밀번호를 입력하세요.";
	  pwcheck = false; 
	  }
	  else if (pw1.length<8 || pw1.length>16) {
	  document.getElementById('checkPwd').style.color = "red";
	  document.getElementById('checkPwd').innerHTML = "8~12글자로 입력하세요.";
	  pwcheck = false;

	  }
	  else if(num < 0 || eng < 0 || spe < 0 ){
	  document.getElementById('checkPwd').style.color = "red";
	  document.getElementById('checkPwd').innerHTML = "영문,숫자,특수문자 합쳐서 ";
	  pwcheck = false;
	  }
	  else
	  {
	   document.getElementById('checkPwd').style.color = "blue";
	   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";   
	   pwcheck = true;
	  } 
	 }



function signUpValidChk()
{
	console.log(idcheck&&pwcheck);
	return idcheck&&pwcheck;
}
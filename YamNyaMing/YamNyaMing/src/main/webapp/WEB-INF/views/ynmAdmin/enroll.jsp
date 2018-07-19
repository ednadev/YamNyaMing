<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>하아..</title>
<style type="text/css">
body {
	 font-family: 'Sunflower';
}
span{
  font-size: 15px;
}
#idch{
  font-size: 12px;
}
#checkPwd{
  color : red;
  font-size: 12px;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<script type="text/javascript" src="httpRequest.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<% boolean allcheck = false;%>
<script type="text/javascript">  //아이디 체크여부 확인 
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
                    return false;
                 } else{
                    document.getElementById('idch').style.color = "blue";
                    document.getElementById('idch').innerHTML = "사용 가능한 아이디.";
                    idck = 1;      
                    return true;
                 }   
             }
         });    
    }
}
</script>
<script type="text/javascript">//비밀번호 조건문
 function check(){
  var f1 = document.forms[0];
  var pw1 = f1.ad_password.value;
  var pw2 = f1.pwd_check.value;
  var num = pw1.search(/[0-9]/g);
  var eng = pw1.search(/[a-z]/ig);
  var spe = pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
  if(pw1!=pw2)
  {
   document.getElementById('checkPwd').style.color = "red";
   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
   return false;
  }
  else if(pw1 == "") 
  {
  document.getElementById('checkPwd').style.color = "red";
  document.getElementById('checkPwd').innerHTML = "비밀번호를 입력하세요.";
  return false;
  }
  else if (pw1.length<8 || pw1.length>16) {
  document.getElementById('checkPwd').style.color = "red";
  document.getElementById('checkPwd').innerHTML = "8~12글자로 입력하세요.";
  return false;
  }

  else if(num < 0 || eng < 0 || spe < 0 ){
  document.getElementById('checkPwd').style.color = "red";
  document.getElementById('checkPwd').innerHTML = "영문,숫자,특수문자 합쳐서 ";
  return false;
  }
  
  
  
  
  
  

  else
  {
   document.getElementById('checkPwd').style.color = "blue";
   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";   
   return true;
  } 
 }
 
 function allcheck(){
	 var check = allcheck;
 }
</script>
</head>
<body>
<form name="search" onsubmit="return allcheck()" action="/enrollAdmin2.do" method="post">
<div>
  <h4>관리자 가입</h4>
</div>
<table border="1">
  <tr>
     <td align="center"><span>아이디</span></td>
     <td>
        <input type="text" name="ad_id" id="ad_id" required/>
        <input type="button" name="idck" id="idck" value="췍" onclick="return idCheck()"/>  
        <div id="idch">아이디를 입력하세요.</div>
          <input type="hidden" value="0" name="use"/>
     </td>
  </tr>
  <tr>
     <td align="center"><span>암호 </span></td>
     <td><input type="password" name="ad_password" required ></input></td>
  </tr>
  <tr>
    <td align="center"><span>암호확인</span>
    </td>
     <td>
        <input type="password" name="pwd_check" onkeyup="check()" required ></input>
        <div id="checkPwd">암호를 입력하세요.</div>
     </td>
  </tr>
   <tr>
    <td align="center"><span>닉네임</span>
    </td>
     <td>
        <input type="text" name="ad_nickname" required />
     </td>
  </tr>
  
 <tr>
 <th>이메일</th>
 <td>
  <input type="email" name="email" id="email" required/>
 </td>
   <tr>
    <td align="center"><span>권한</span>
    </td>
     <td>
	<SELECT name="combo" id="ad_grade">
    <OPTION value="1">슈퍼관리자</OPTION>
    <OPTION value="2">일반관리자</OPTION>
</SELECT>
     </td>
  </tr>
  <tr>
  		<td colspan="2" align="right"><input type="submit" value="가입하기" id="subbtn"></input></td>
  </tr>
</table>
</form>
</body>
</html>
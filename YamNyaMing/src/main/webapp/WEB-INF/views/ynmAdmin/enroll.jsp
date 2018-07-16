<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ajax 중복ID체크</title>
<style type="text/css">
body {
	 font-family: 'Sunflower';
}
span{
  font-size: 15px;
}
#checkMsg{
  font-size: 12px;
}
#checkPwd{
  color : red;
  font-size: 12px;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript">
 var checkFirst = false;
 var lastKeyword = '';
 var loopSendKeyword = false;
 
 function checkId() {
  if (checkFirst == false) {
   //0.5초 후에 sendKeyword()함수 실행
   setTimeout("sendId();", 500);
   loopSendKeyword = true;
  }
  checkFirst = true;
 }
 
 function checkPwd(){
  var f1 = document.forms[0];
  var pw1 = f1.ad_password.value;
  var pw2 = f1.pwd_check.value;
  if(pw1!=pw2){
   document.getElementById('checkPwd').style.color = "red";
   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
  }else{
   document.getElementById('checkPwd').style.color = "black";
   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
   
  }
  
 }
 
 
 function sendId() {
  if (loopSendKeyword == false) return;
  
  var keyword = document.search.u_id.value;
  if (keyword == '') {
   lastKeyword = '';
   document.getElementById('checkMsg').style.color = "black";
   document.getElementById('checkMsg').innerHTML = "아이디를 입력하세요.";
  } else if (keyword != lastKeyword) {
   lastKeyword = keyword;
   
   if (keyword != '') {
    var params = "id="+encodeURIComponent(keyword);
    sendRequest("/adminIdCheck.do", params, displayResult, 'POST');
   } else {
   }
  }
  setTimeout("sendId();", 500);
 }
 
 
 function displayResult() {
  if (httpRequest.readyState == 4) {
   if (httpRequest.status == 200) {
    var resultText = httpRequest.responseText;
    var listView = document.getElementById('checkMsg');
    if(resultText==0){
     listView.innerHTML = "사용 할 수 있는 ID 입니다";
     listView.style.color = "blue";
    }else{
     listView.innerHTML = "이미 등록된 ID 입니다";
     listView.style.color = "red";
    }
   } else {
    alert("에러 발생: "+httpRequest.status);
   }
  }
 }
</script>
</head>
<body>
<form name="search" action="/enrollAdmin2.do" method="post">
<div>
  <h4>관리자 가입</h4>
</div>
<table border="1">
  <tr>
     <td align="center"><span>아이디</span></td>
     <td>
        <input type="text" name="ad_id" id="u_id" onkeydown="checkId()" />  
        <div id="checkMsg">아이디를 입력하세요.</div>
     </td>
  </tr>
  
  <tr>
     <td align="center"><span>암호 </span></td>
     <td><input type="password" name="ad_password"></input></td>
  </tr>
  <tr>
    <td align="center"><span>암호확인</span>
    </td>
     <td>
        <input type="password" name="pwd_check" onkeyup="checkPwd()"></input>
        <div id="checkPwd">동일한 암호를 입력하세요.</div>
     </td>
  </tr>
   <tr>
    <td align="center"><span>닉네임</span>
    </td>
     <td>
        <input type="text" name="ad_nickname"/>
     </td>
  </tr>
  
  <tr>
    <td align="center"><span>권한</span>
    </td>
     <td>
		<SELECT name="combo" id="ad_grade">
    <OPTION value="1">모두접근</OPTION>
    <OPTION value="2">그냥넣음</OPTION>

		</SELECT>
     </td>
  </tr>
  
  <tr>
     <td colspan="2" align="right"><input type="submit" value="가입하기"></input></td>
  </tr>
 
  
</table>

 

</form>

</body>
</html>
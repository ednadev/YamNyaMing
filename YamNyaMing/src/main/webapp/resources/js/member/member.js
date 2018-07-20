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

function radioLoginType(radioInput)
{
	var radioChk = radioInput.value;
	if(radioChk=="member") document.getElementById('loginForm').action = '/login.do';
	else  document.getElementById('loginForm').action = '/ownerLogin.do';
}
	
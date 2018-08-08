/**
 * 
 */


function loginCheck(myLoginInfo)
{
	if(typeof Android !=="undefined" && Android !== null){
		Android.loadLoginInfo(myLoginInfo);
	}
}

function sendBookInfo(bookState)
{
	if(typeof Android !=="undefined" && Android !== null){
		Android.bookCheck("안녕?? 예약 체크");
	}
}

function bookCheck(memberIndex)
{
	console.log("멤버 인덱스 " + memberIndex);
	$.ajax({
		url:"/bookCheck.do",
		data : {
			memberIndex:memberIndex
	   },
		type : "post",
		success : function(data){
			console.log(data);
			sendBookInfo(data);
		},
		error : function(){
			console.log("실패");	
		}
	});
}


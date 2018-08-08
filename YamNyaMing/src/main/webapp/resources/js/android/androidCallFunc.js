/**
 * 
 */


function loginCheck(myLoginInfo)
{
	if(typeof Android !=="undefined" && Android !== null){
		Android.loadLoginInfo(myLoginInfo);
	}else{
		alert("Not viewing in webView!!");
	}
}

function sendBookInfo(bookState)
{
	if(typeof Android !=="undefined" && Android !== null){
		Android.bookCheck(bookState);
	}else{
		alert("Not viewing in webView!!");
	}
}

function bookCheck(memberIndex)
{
	
	$.ajax({
		url:"/bookCheck.do",
		data : {
			memberIndex:memberIndex
	   },
		type : "post",
		success : function(data){	
			sendBookInfo(data);
		},
		error : function(){
			console.log("실패");	
		}
	});
}


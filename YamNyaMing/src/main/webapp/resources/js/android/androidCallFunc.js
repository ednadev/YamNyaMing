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
		Android.bookCheck(bookState);
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
			var result = "";
			
			for(var i = 0; i<data.length;i++)
			{
				result+= data[i].storeName+",";
				result+= data[i].bookOrderCount+",";
				result+= data[i].memberName+" ";
			}
			console.log(result);
			if(data[0].memberName!=null){
				sendBookInfo(result);
			}
		},
		error : function(){
			console.log("실패");	
		}
	});
}


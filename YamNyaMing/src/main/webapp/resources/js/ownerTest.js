/**
 * 
 */

window.onload = function()
{

}

function ownerIdChk()
{
	var idCheckResult = $("#ownerIdChk");
	var insertId  = $("input[name=owId]").val(); // 아이디 입력 결과
	$.ajax({
			url:"/ownerIdChk.do",
			data : {
						ownerId:insertId,
				   },
			type : "post",
			success : function(data){					 
				console.log("아이디 체크 결과" + data);
			},
		error : function(){
			console.log("실패");	
		}
	});
}
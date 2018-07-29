/**
 * 
 */
window.onload = function()
{
}

function couponNameCheck()
{
	var nameInsert = $('#owCouponName').val();
	var nameResult = $('#couponNameResult');
	if(nameInsert.length>0)
	{
		nameResult.html("쿠폰 이름 입력 확인");
		return true;
	}else{
		nameResult.html("쿠폰 이름을 입력해야합니다.");
	}
	return false;
}

function couponCountCheck()
{
	var countInsert = $('#couponCountId').val();
	var countResult = $('#couponCheckResult');

	if(countInsert.length>0){
		if(countInsert>=-1)
		{
			countResult.html("쿠폰 갯수 입력 확인");
			return true;
		}else{
			countResult.html("쿠폰 갯수는 -1 보다 아래로 내릴 수 없습니다.");
		}
	}else{
		countResult.html("쿠폰 갯수입력해주세요");
	}
	return false;

}

function dateCheck()
{
	var startDate = $('#couponStartDateId').val();
	var endDate = $('#couponEndDateId').val();
	var dateResult = $('#dateResultCheck');

	if(startDate=='') dateResult.html("쿠폰 기간 시작 날짜를 입력해주세요");
	if(endDate=='') dateResult.html("쿠폰 기간 만료 날짜를 입력해주세요");
	else{
		dateResult.html("쿠폰 기간 입력 완료");
		return true;
	}
	return false;
}

function couponEnroll()
{
	if(couponNameCheck() && couponCountCheck() && dateCheck()){
		var couponName = $('#owCouponName').val();
		var couponCount =  $('#couponCountId').val();
		var couponStartData =  $('#couponStartDateId').val();
		var couponExpireDate =  $('#couponEndDateId').val();
		var couponExplain = $('#couponDetail').val();
		$.ajax({
			url:"/couponEnroll.do",
			data : {
					couponName : couponName,
					couponCount: couponCount,
					couponStartData: couponStartData,
					couponExpireDate: couponExpireDate,
					couponExplain : couponExplain
				   },
			type : "post",
			success : function(data){	
				
			},
			error : function(){
				console.log("실패");	
			}
		});
	}
}

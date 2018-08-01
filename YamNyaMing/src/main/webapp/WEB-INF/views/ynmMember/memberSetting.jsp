<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function(){
	'${setting.themePushUpdate}'=='y' ? document.getElementsByName('push')[0].checked=true :document.getElementsByName('push')[1].checked=true;
	'${setting.alarmPushReviewLike}'=='y' ? document.getElementsByName('like')[0].checked=true :document.getElementsByName('like')[1].checked=true;
	'${setting.alarmPushReviewComment}'=='y' ? document.getElementsByName('comment')[0].checked=true :document.getElementsByName('comment')[1].checked=true;
	'${setting.alarmPushReviewJjim}'=='y' ? document.getElementsByName('jjim')[0].checked=true :document.getElementsByName('jjim')[1].checked=true;
	'${setting.alarmPushFollow}'=='y' ? document.getElementsByName('follow')[0].checked=true :document.getElementsByName('follow')[1].checked=true;
	'${setting.myinfoAgree}'=='y' ? document.getElementsByName('agree')[0].checked=true :document.getElementsByName('agree')[1].checked=true;
	'${setting.alarmEventEmail}'=='y' ? document.getElementsByName('sms')[0].checked=true :document.getElementsByName('sms')[1].checked=true;
	'${setting.alarmEventSms}'=='y' ? document.getElementsByName('email')[0].checked=true :document.getElementsByName('email')[1].checked=true;
	'${setting.myinfoReviewOpen}'=='y' ? document.getElementsByName('reviewOpen')[0].checked=true :document.getElementsByName('reviewOpen')[1].checked=true;
	'${setting.myinfoReviewJjim}'=='y' ? document.getElementsByName('ReviewJjim')[0].checked=true :document.getElementsByName('ReviewJjim')[1].checked=true;
	'${setting.myinfoStoreJjim}'=='y' ? document.getElementsByName('StoreJjim')[0].checked=true :document.getElementsByName('StoreJjim')[1].checked=true;
});
	function setting(){
		var pushRadio=document.getElementsByName('push');
		var likeRadio=document.getElementsByName('like');
		var commentRadio=document.getElementsByName('comment');
		var jjimRadio=document.getElementsByName('jjim');
		var followRadio=document.getElementsByName('follow')
		var agreeRadio=document.getElementsByName('agree');
		var smsRadio=document.getElementsByName('sms');
		var emailRadio=document.getElementsByName('email');
		var reviewOpenRadio=document.getElementsByName('reviewOpen');
		var ReviewJjimRadio=document.getElementsByName('ReviewJjim');
		var StoreJjimRadio=document.getElementsByName('StoreJjim');
		var push;
		var like;
		var comment;
		var jjim;
		var follow;
		var agree;
		var sms;
		var email;
		var reviewOpen;
		var ReviewJjim;
		var StoreJjim;
		for(var i=0; i<2; i++){
			if(pushRadio[i].checked==true){
				push=pushRadio[i].value;
			}
			if(likeRadio[i].checked==true){
				like=likeRadio[i].value;
			}
			if(commentRadio[i].checked==true){
				comment=commentRadio[i].value;
			}
			if(jjimRadio[i].checked==true){
				jjim=jjimRadio[i].value;
			}
			if(followRadio[i].checked==true){
				follow=followRadio[i].value;
			}
			if(agreeRadio[i].checked==true){
				agree=agreeRadio[i].value;
			}
			if(smsRadio[i].checked==true){
				sms=smsRadio[i].value;
			}
			if(emailRadio[i].checked==true){
				email=emailRadio[i].value;
			}
			if(reviewOpenRadio[i].checked==true){
				reviewOpen=reviewOpenRadio[i].value;
			}
			if(followRadio[i].checked==true){
				follow=followRadio[i].value;
			}
			if(ReviewJjimRadio[i].checked==true){
				ReviewJjim=ReviewJjimRadio[i].value;
			}
			if(StoreJjimRadio[i].checked==true){
				StoreJjim=StoreJjimRadio[i].value;
			}
		}
		console.log(StoreJjim);
		$.ajax({
			url:"/setting.do",
			data : {
				themePushUpdate:push,alarmPushReviewLike:like,alarmPushReviewComment:comment,alarmPushReviewJjim:jjim,alarmPushFollow:follow,
				myinfoAgree:agree,alarmEventSms:sms,alarmEventEmail:email,myinfoReviewOpen:reviewOpen,myinfoReviewJjim:ReviewJjim,myinfoStoreJjim:StoreJjim
				   },
			type : "post",
			success : function(data){	
				if(data=="success"){
					alert("상태 변경 성공");
				}else{
					alert("상태 변경 실패");
				}
			},
			error : function(){
				
			}
		});
		
		
		
	}
</script>

		사용자 설정 정보<br>
		푸시 수신동의<input type="radio" name="push" value="y">On<input type="radio" name="push" value="n">Off<br>
		리뷰 좋아요:<input type="radio" name="like" value="y">On<input type="radio" name="like" value="n">Off<br>
		리뷰 코멘트:<input type="radio" name="comment" value="y">On<input type="radio" name="comment" value="n">Off<br>
		리뷰 찜하기:<input type="radio" name="jjim" value="y">On<input type="radio" name="jjim" value="n">Off<br>
		리뷰 팔로우:<input type="radio" name="follow" value="y">On<input type="radio" name="follow" value="n">Off<br>
		
		제3자 마케팅 동의<input type="radio" name="agree" value="y">On<input type="radio" name="agree" value="n">Off<br>
		SMS수신 동의:<input type="radio" name="sms" value="y">On<input type="radio" name="sms" value="n">Off<br>
		이메일 수신동의:<input type="radio" name="email" value="y">On<input type="radio" name="email" value="n">Off<br>
		
		내리뷰 공개여부:<input type="radio" name="reviewOpen" value="y">On<input type="radio" name="reviewOpen" value="n">Off<br>
		찜한 리뷰 공개여부:<input type="radio" name="ReviewJjim" value="y">On<input type="radio" name="ReviewJjim" value="n">Off<br>
		찜한 매장 공개여부:<input type="radio" name="StoreJjim" value="y">On<input type="radio" name="StoreJjim" value="n">Off<br>
		<button onclick="setting();">저장</button>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/reservation.css?ver=3">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
</script>
</head>
<body>
	
	<c:if test="${reservationResult==null}">
		<div id="title">
			<h1>${reservation.owStoreName }</h1>
			<p>${reservation.owStoreAddrFirst } > ${reservation.owStoreAddrFinal } ㆍ ${reservation.storeCateMainName }</p>
		</div>
		
		<form action="/bookInsert.do" method="post">
			<input type="hidden" name="bookOrderCount" value="1">
			<%-- <input type="text" name="storeEntireNo" value="${reservation.owStoreAddrFirst}"> --%>
			<input type="hidden" name="storeEntireNo" value="${reservation.owStoreInfoPk}">
			<div class="check">
				<input type="radio" name="bookType" value="s" id="personal"><label for="personal">일반</label>
				<input type="radio" name="bookType" value="g" id="group"><label for="group">단체</label>
			</div>
			<div class="date-time">
				<label for="datePicker">날짜</label>
				<input type="date" max="2018-08-16" min="2018-08-09" id="datePicker">
			</div>
			<div class="date-time">
				<label for="timePicker">시간</label>
				<input type='time' value='now'>
			</div>	
			<div class="quantity">
				<label for="personPicker">인원</label>
				<input type="number" min="1" max="100" step="1" value="1" id="personPicker" name="bookPartyCount">
			</div>
			<div class="name-tel">
				<input type="text" placeholder="성함을 입력해주세요">
				<input type="tel" placeholder="전화번호 입력해주세요">
				<input type="button" value="번호 인증하기">
			</div>	
			<div class="tel-confirm">
				<input type="text" placeholder="인증번호">
				<input type="button" value="확인">
			</div>
			<div class="text" style="clear:both;">
				<textarea name="bookOption">
					
				</textarea>
			</div>
			<input type="submit" value="예약 접수">		
			<script>
		    jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
		    jQuery('.quantity').each(function() {
		      var spinner = jQuery(this),
		        input = spinner.find('input[type="number"]'),
		        btnUp = spinner.find('.quantity-up'),
		        btnDown = spinner.find('.quantity-down'),
		        min = input.attr('min'),
		        max = input.attr('max');
	
		      btnUp.click(function() {
		        var oldValue = parseFloat(input.val());
		        if (oldValue >= max) {
		          var newVal = oldValue;
		        } else {
		          var newVal = oldValue + 1;
		        }
		        spinner.find("input").val(newVal);
		        spinner.find("input").trigger("change");
		      });
	
		      btnDown.click(function() {
		        var oldValue = parseFloat(input.val());
		        if (oldValue <= min) {
		          var newVal = oldValue;
		        } else {
		          var newVal = oldValue - 1;
		        }
		        spinner.find("input").val(newVal);
		        spinner.find("input").trigger("change");
		      });
	
		    });
		    
		    document.getElementById('datePicker').valueAsDate = new Date();
		    
		    $(function(){     
		    	  var d = new Date(),        
		    	      h = d.getHours(),
		    	      m = d.getMinutes();
		    	  if(h < 10) h = '0' + h; 
		    	  if(m < 10) m = '0' + m; 
		    	  $('input[type="time"][value="now"]').each(function(){ 
		    	    $(this).attr({'value': h + ':' + m});
		    	  });
		    	});
			</script>
		</form>
	</c:if>
	<c:if test="${reservationResult!=null}">
		<c:if test="${reservationResult>0}">
			<button onclick="self.close()"> 예약을 완료했습니다.</button>
		</c:if>
		<c:if test="${reservationResult==0}">
			<button onclick="self.close()"> 예약 실패했습니다.</button>
		</c:if>
	</c:if>
</body>
</html>
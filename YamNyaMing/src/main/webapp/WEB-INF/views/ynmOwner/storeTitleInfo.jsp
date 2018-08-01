<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="search-result">
	<div class="search-result-img">
		<div>
			<center><h2>${param.storeName}</h2></center>
	 		<img src="${param.storePhoto}" >
	 		<center><h2>${param.storeTip}</h2></center>
		</div>
	</div>
	<div class="search-result-text">
		<div>
			<span class="star"></span>
			<span class="star"></span>
			<span class="star"></span>
			<span class="star"></span>
			<span class="star"></span>
			<p class="star-result">${param.storeStarPoint}점</p>
		</div>
	</div>
</div>
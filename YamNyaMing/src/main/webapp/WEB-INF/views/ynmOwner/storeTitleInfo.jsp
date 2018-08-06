<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.search-result>.search-result-img>div{
	background-size:cover;
	background-position:center;
	width:304px;
	height:304px;
}
</style>
<div class="search-result">
	<div class="search-result-img">
		<div style="background-image:url('${pageContext.request.contextPath}${param.storePhoto}');">
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
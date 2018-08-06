<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="search-result">
	<div class="search-result-img"
		style="background-image:url('${pageContext.request.contextPath}/${search.owPhotoRoute}');">
		<form action="/detailPage.do" method="get">
			<input type="hidden" name="owStoreInfoPk"
				value="${search.owStoreInfoPk}"> <input type="submit"
				value="">
		</form>
		<div>
			<p>대기인원 0 추천${search.favoriteTotal}</p>
			<c:if test="${search.favoriteChk==1}">
				<div class="heart" id="${search.owStoreInfoPk}"
					onclick="favorite('${sessionScope.member.memberEntireNo}','${search.owStoreInfoPk}');">
					<img style="width: 100%; height: 100%; cursor: pointer;"
						src='${pageContext.request.contextPath}/resources/image/member/search/heart-click.png'>
				</div>
			</c:if>
			<c:if test="${search.favoriteChk!=1}">
				<div class="heart" id="${search.owStoreInfoPk}"
					onclick="favorite('${sessionScope.member.memberEntireNo}','${search.owStoreInfoPk}');">
					<img style="width: 100%; height: 100%; cursor: pointer;"
						src='${pageContext.request.contextPath}/resources/image/member/search/heart.png'>
				</div>
			</c:if>
		</div>
		<div>
			<h5>${search.owStoreName }</h5>
			<p>${search.owStoreAddrFirst}> ${search.owStoreAddrFinal} ㆍ
				${search.storeCateDetailName}</p>
		</div>
	</div>
	<div class="search-result-text">
		<div>
			<c:choose>
				<c:when test="${search.starAvg>=1}">
					<span class="star-full"></span>
				</c:when>
				<c:otherwise>
					<span class="star"></span>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${search.starAvg>=2}">
					<span class="star-full"></span>
				</c:when>
				<c:otherwise>
					<span class="star"></span>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${search.starAvg>=3}">
					<span class="star-full"></span>
				</c:when>
				<c:otherwise>
					<span class="star"></span>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${search.starAvg>=4}">
					<span class="star-full"></span>
				</c:when>
				<c:otherwise>
					<span class="star"></span>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${search.starAvg>=5}">
					<span class="star-full"></span>
				</c:when>
				<c:otherwise>
					<span class="star"></span>
				</c:otherwise>
			</c:choose>
			<p class="star-result">${search.starAvg}</p>
		</div>
		<div>${search.owStoreComment}</div>
	</div>


	<form action="reservation.do" method="get" name="reserve">
		<input type="button" onclick="popupPost(${search.owStoreInfoPk})"
			value="예약하기">
	</form>
	<button id="myBtn"
		onclick="modalPopup('${search.owStoreName}','${search.owStoreAddrFirst}');">예약하기</button>
	<button>리뷰쓰기</button>
</div>
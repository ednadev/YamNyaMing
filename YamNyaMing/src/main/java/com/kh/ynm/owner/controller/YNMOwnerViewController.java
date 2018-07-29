package com.kh.ynm.owner.controller;

public interface YNMOwnerViewController {
	// 점주 쿼리 테스트용 페이지.
	public String ynmOwnerTest();
	
	// 점주 회원가입.
	public String enrollOwner() ;
	
	// 점주 회원가입 2
	public String signUpOwner();
	
	// 점주 가게 등록
	public String storeEnrollOwner();
	
	// 점주 마이페이지
	public String ownerMyPage();
	
	// 마이페이지 - 정보관리
	public String ownerInfoPage();
	
	// 마이페이지 - 음식점관리
	public String storeMngPage();
	
	// 마이페이지 - 예약 관리
	public String bookMngPage();
	
	// 마이페이지 - 쿠폰 관리
//	public String couponMngPage();
	
	// 마이페이지 - 게시판 관리
	public String boardMngPage();
	
	// 마이페이지 - 통계분석관리
	public String analysisMngPage();

}

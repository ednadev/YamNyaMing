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
}

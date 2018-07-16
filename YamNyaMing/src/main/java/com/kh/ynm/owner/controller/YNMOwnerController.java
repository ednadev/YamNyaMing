package com.kh.ynm.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.ynm.owner.model.vo.YNMOwner;

public interface YNMOwnerController {
	
	// 점주 회원가입
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner);
	
	// 점주 회원탈퇴
	public String ynmOwnerSignOut(HttpSession session);
	
	
	// 점주 선택( 로그인, 아이디 체크, 점주 정보 가져오기)
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response);
	
	// 점주 쿠폰 추가 기능
	
	// 가게 등록
	public String addStore(HttpSession session );
}

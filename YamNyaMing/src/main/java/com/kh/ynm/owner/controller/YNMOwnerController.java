package com.kh.ynm.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.ynm.owner.model.vo.YNMOwner;

public interface YNMOwnerController {
	// 점주 테스트 페이지
	public String ynmOwnerTest();
	// 점주 회원 가입
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner);
	
	// 점주 정보 불러오기, 로그인
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response);
	// 상점 추가하기
	public String addStore(HttpSession session );
}

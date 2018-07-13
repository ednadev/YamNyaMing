package com.kh.ynm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface YNMMemberController {
	public String testMemberQueryTest();// 테스트 쿼리
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response);// 회원 검색
	public String signUpMember(HttpSession session);// 회원가입
	public String signOutMember(HttpSession session);// 회원탈퇴
}

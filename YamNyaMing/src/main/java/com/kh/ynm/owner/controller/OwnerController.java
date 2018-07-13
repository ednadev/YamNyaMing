package com.kh.ynm.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface OwnerController {
	// 점주 정보 불러오기, 로그인
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response);
	// 상점 추가하기
	public String addStore(HttpSession session );
	// 
}

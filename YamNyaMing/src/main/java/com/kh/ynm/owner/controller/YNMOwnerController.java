package com.kh.ynm.owner.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

public interface YNMOwnerController {
	
	// 점주 회원 가입
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner);
	
	// 점주 회원 탈퇴
	public String ynmOwnerSignOut(HttpSession session,@RequestParam String userId, @RequestParam String userPw);
	
	// 아이디 체크
	public String idCheck(HttpServletRequest request, HttpServletResponse response)  throws IOException;
	
	// 점주 선택
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response, HttpSession session);
	
	// 가게 추가
	public String addStore(@RequestParam("mainImgFile") MultipartHttpServletRequest mainImgFile,@RequestParam("menuImageFile") MultipartHttpServletRequest menuImgFile, HttpSession session, HttpServletRequest request);
	
	// 로그아웃
	public String ynmOwnerLogout(HttpSession session);
	
}

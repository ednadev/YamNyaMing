package com.kh.ynm.admin.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;

public interface YNMAdminController {
	//관리자 페이지로
	public String insertAdmin(HttpSession session,YNMAdmin vo);
	//관리자 가입
	public String insertMember(HttpServletRequest request, HttpSession session,YNMAdmin vo);
	//회원가입 아이디 체크
	public String adminIdCheck(HttpServletRequest request, HttpServletResponse response,YNMAdmin vo);
	//점주 검색
	public Object OwnerSearch(HttpServletRequest request, HttpSession session);
	//멤버 검색
	public Object MemberSearch(HttpServletRequest request, HttpSession session);
	//로그인 페이지로 이동
	public String adminLogin(HttpSession session,YNMAdmin vo);
	//로그인
	public String adminLogin2(HttpServletRequest request,HttpSession session,YNMAdmin vo,
			@RequestParam String ad_id,@RequestParam String ad_pw);
	//통계
	public Object statAdmin(HttpSession session,AdminStatistics vo);
	//관리자 정보
	public String adminInfo(HttpSession session,YNMAdmin vo);
	//관리자 강등
	public Object dounGrade(HttpSession session,HttpServletRequest request);
	//관리자 수락
	public Object upGrade(HttpSession session ,HttpServletRequest request);
	//관리자 로그아웃
	public Object logoutAdmin(HttpSession session ,HttpServletRequest request);
	//공지사항 글쓰기
	public Object noticeView(HttpSession session ,HttpServletRequest request,Notice vo);
	//공지사항 글쓰기 수정페이지로 이동
	public Object adminBoardFix(HttpSession session ,HttpServletRequest request,Notice vo);
	//공지사항 글수정
	public Object adminBoardFix2(HttpSession session ,HttpServletRequest request,Notice vo);
	//공지사항 글삭제
	public Object adminBoardDelete(HttpSession session ,HttpServletRequest request,Notice vo);
	//공지사항 글쓰기 권한 
	public Object noticeWrite(HttpSession session ,HttpServletRequest request,YNMAdmin vo);
	//공지사항 글쓰기
	public Object adminNoticeWrite(HttpSession session ,HttpServletRequest request,Notice vo);
	//관리자 전체보기
	public Object adminList(HttpSession session,HttpServletRequest request);
	//공지사항
	public Object boardAdmin(HttpSession session,HttpServletRequest request) throws Exception;
	//일반회원 전체보기
	public Object allMemberView(HttpSession session,HttpServletRequest request);
	//점주 전체보기
	public Object allOwnerView(HttpSession session, HttpServletRequest request);
	//점주 가게현황
	public ModelAndView ownerStoreList(HttpSession session ,HttpServletRequest request,StoreInfoPageData vo);
	//가게(강등)
	public Object storeNo(HttpSession session,HttpServletRequest request);
	//가게(수락)
	public Object storeYes(HttpSession session ,HttpServletRequest request);
	
	
}

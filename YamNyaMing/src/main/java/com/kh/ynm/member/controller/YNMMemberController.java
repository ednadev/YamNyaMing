package com.kh.ynm.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberSetting;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMStoreUnderReview;

public interface YNMMemberController {
	public String testMemberQueryTest();// �׽�Ʈ ����
	
	//회원 table
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response);// ȸ�� �˻�
	public String indexPage(HttpServletRequest request, HttpServletResponse response);
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session);
	public String signUpMember(MultipartFile file,HttpServletRequest request, HttpServletResponse response);// ȸ������
	public String signOutMember(HttpSession session,HttpServletRequest request, HttpServletResponse response);// ȸ��Ż��
	public Object memberInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public ModelAndView updateMemberPhoto(MultipartFile file, HttpSession session, HttpServletRequest request,
			HttpServletResponse response);
	public String idCheck(HttpServletRequest request, HttpServletResponse response, Model model);
	public String nickCheck(HttpServletRequest request, HttpServletResponse response, Model model);
	public String emailCheck(HttpServletRequest request, HttpServletResponse response, Model model);
	public String passwordUpdateMember(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public ModelAndView pwChange(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public ModelAndView nickNameChange(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public ModelAndView idSearch(HttpServletRequest request, HttpServletResponse response);
	public ModelAndView pwSearch(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String setting(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String pwCheck(HttpServletRequest request, HttpServletResponse response, Model model);
	//예약 table
	
	public ModelAndView bookInsert(YNMBook yb, HttpSession session);
	public Object bookselect(HttpSession session, HttpServletRequest request, HttpServletResponse response);

	//리뷰 table
	public ModelAndView storeReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multi) throws IOException;
	public ModelAndView reviewCheck(HttpServletRequest request, HttpServletResponse response);
	public String reviewDetail(HttpServletRequest request, HttpSession session);
	//대댓글 table
	public String storeUnderReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			YNMStoreUnderReview ysur);
	//좋아요 table
	public String likeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	//찜하기 table
	public String jjimInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	//팔로우 table
	public String followInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	//즐겨찾기 table
	public String favoriteInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response);




	













	

	
	

}

package com.kh.ynm.member.controller;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.YNMMember;

@Controller
public class YNMMemberControllerImpl implements YNMMemberController{

	@Autowired
	@Qualifier(value="ynmMemberService")
	private YNMMemberServiceImpl ynmMemberServiceImpl;
	

	@Override
	@RequestMapping(value="/ynmMemberTest.do")
	public String testMemberQueryTest() {
		return "ynmMember/ynmMemberTest";
	}
	
	@Override
	@RequestMapping(value="/login.do")
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}
	
	//mb_id 프라이머리키 설정
	//DAO수정
	//생일에 대하여 생각해보아야함....
	
//	@Override
//	@RequestMapping(value="/signUpMember.do")
//	public String signUpMember(YNMMember ym) {
//		ynmMemberServiceImpl.signUpMember(ym);
//		return null;
//	}
	
	@Override
	@RequestMapping(value="/signUpMember.do")
	public String signUpMember(HttpServletRequest request, HttpServletResponse response) {
		YNMMember ym=new YNMMember();
		ym.setMemberId(request.getParameter("memberId"));
		ym.setMemberPw(request.getParameter("memberPw"));
		ym.setMemberName(request.getParameter("memberName"));
		ym.setMemberNickName(request.getParameter("memberNickName"));
		ym.setMemberGender(request.getParameter("memberGender"));
		//yyyy-mm-dd 형태로 받아야함
		String memberBirth=request.getParameter("memberBirth"); 
		java.sql.Date birth = java.sql.Date.valueOf(memberBirth);
		ym.setMemberBirth(birth);
		
		ym.setMemberEmail(request.getParameter("memberEmail"));
		ym.setMemberPhone(request.getParameter("memberPhone"));
		ym.setMemberAvatar(request.getParameter("memberAvatar"));
		ynmMemberServiceImpl.signUpMember(ym);
		return null;
	}

	@Override
	public String signOutMember(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}


}

package com.kh.ynm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ynm.member.model.service.YNMMemberServiceImpl;

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
		// TODO Auto-generated method stub
		return null;
	}
	
	

	@Override
	public String signUpMember(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String signOutMember(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//사용자 : 회원가입 페이지로 이동
	@Override
	@RequestMapping(value="/enrollMember.do")
	public String enrollMember() {
		return "ynmMember/signUpMember";
	}	
	
	//점장 : 입점신청 약관동의 페이지로 이동
	@RequestMapping(value="/enrollOwner.do")
	public String enrollOwner() {
		return "ynmOwner/enrollOwner";
	}
	
	//점장 : 입점신청 계정정보입력 페이지로 이동
	@RequestMapping(value="/signUpOwner.do")
	public String signUpOwner() {
		return "ynmOwner/signUpOwner";
	}
	
	//점장 : 입점신청 음식점정보입력 페이지로 이동
	@RequestMapping(value="/signUpOwner2.do")
	public String signUpOwner2() {
		return "ynmOwner/signUpOwner2";
	}
}

package com.kh.ynm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YNMMemberViewControllerImpl implements YNMMemberViewController{

	
	//메인 : 로그인 페이지 이동
	@RequestMapping(value="/loginMember.do")
	public String signUpOwner() {
		return "ynmMember/loginMember";
	}
	
	//메인 :회원 가입 페이지로 이동
	@RequestMapping(value="/enrollMember.do")
	public String enrollOwner() {
		return "ynmMember/signUpMember";
	}
	

}
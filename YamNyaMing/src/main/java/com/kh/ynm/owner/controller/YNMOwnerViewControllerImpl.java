package com.kh.ynm.owner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YNMOwnerViewControllerImpl implements YNMOwnerViewController{

	@Override
	@RequestMapping(value="/ynmOwnerTest.do")
	public String ynmOwnerTest() {
		return "ynmOwner/ynmOwnerTest";
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
	@RequestMapping(value="/storeEnrollOwner.do")
	public String storeEnrollOwner() {
		return "ynmOwner/storeEnrollOwner";
	}	
}

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

	@Override
	@RequestMapping(value="/ownerMyPage.do")
	public String ownerMyPage() {
		return "ynmOwner/ownerMyPage";
	}	
	
	//점장 : 점장 메인 페이지로 이동
	@RequestMapping(value="/mainOwner.do")
	public String mainOwner() {
		return "ynmOwner/mainOwner";
	}

	// 점장 가게 관리 페이지
	@Override
	@RequestMapping(value="/storeManage.do")
	public String storeMngPage() {
		return "ynmOwner/storeManagePage";
	}
	
	// 점장 예약 관리 페이지
	@Override
	@RequestMapping(value="/reservationManage.do")
	public String bookMngPage() {
		return "ynmOwner/bookManagePage";
	}
	
	// 점장 쿠폰 관리 페이지
	@Override
	@RequestMapping(value="/couponManage.do")
	public String couponMngPage() {
		return "ynmOwner/couponManagePage";
	}
	
	// 점장 게시판 관리 페이지
	@Override
	@RequestMapping(value="/boardOwner.do")
	public String boardMngPage() {
		return "ynmOwner/boardManagePage";
	}

	// 점장 통계 분석 관리 페이지
	@Override
	@RequestMapping(value="/analysisOwner.do")
	public String analysisMngPage() {
		return "ynmOwner/analysisManagePage";
	}

	@Override
	@RequestMapping(value="/ownerInfo.do")
	public String ownerInfoPage() {
		return "ynmOwner/ownerInfo";
	}
}

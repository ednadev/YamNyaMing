package com.kh.ynm.owner.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

public interface YNMOwnerController {
	
	// 점주 회원 가입
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner);
	
	// 점주 정보 업데이트
	public String ownerInfoUpdate(HttpSession session, YNMOwner owner);
	
	// 점주 회원 탈퇴
	public String ynmOwnerSignOut(HttpSession session,@RequestParam String userId, @RequestParam String userPw);
	
	// 아이디 체크
	public String idCheck(HttpServletRequest request, HttpServletResponse response)  throws IOException;
	
	// 아이디와 비밀번호가 맞는지 체크
	public String ownerIdPassCheck(HttpSession session,HttpServletRequest request);
	
	// 점주 선택
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response, HttpSession session);
	
	// 가게 추가
	public String addStore(@RequestParam("mainImgFile") MultipartHttpServletRequest mainImgFile,@RequestParam("menuImageFile") MultipartHttpServletRequest menuImgFile, HttpSession session, HttpServletRequest request);
	
	// 로그아웃
	public String ynmOwnerLogout(HttpSession session);
	
	// 쿠폰 등록
	public Object couponAdd(HttpSession session, HttpServletRequest request);

	// 쿠폰 리스트 가져오기
	public ModelAndView couponShowList(HttpSession session, HttpServletRequest request);
	
	// 가게 관리 페이지
	public ModelAndView storeList(HttpSession session, HttpServletRequest request);

	// 선택한 가게 인덱스를 가진 상세정보를 불러오기
	public ModelAndView storeDetailInfo(HttpSession session, HttpServletRequest request);

	// 가게 정보 업데이트
	public ModelAndView storeInfoEdit(HttpSession session, HttpServletRequest request );

	// 가게 페이지 로드
	public ModelAndView storePageTypeLoad(HttpSession session, HttpServletRequest request);

	// 사진 삭제하기
	public String storeHeadPhotoDelete(HttpSession session, HttpServletRequest request);

	// 메인 사진 리스트 불러오는곳.
	public ArrayList<OwnerUploadPhoto> storeHeadPhotoList(int storeInfoIndex);

	// 메뉴 정보 불러오기
	public ArrayList<MenuInfo> storeMenuInfoList(int storeInfoIndex);
	
}
